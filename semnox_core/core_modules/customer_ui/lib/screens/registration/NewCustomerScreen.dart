import 'package:customer_data/builder.dart';
import 'package:customer_data/models/address_dto.dart';
import 'package:customer_data/models/contact_dto.dart';
import 'package:customer_data/models/country_container/country_container_dto.dart';
import 'package:customer_data/models/country_container/country_container_response.dart';
import 'package:customer_data/models/country_container/state_container_dto.dart';
import 'package:customer_data/models/customer_data.dart';
import 'package:customer_ui/providers/SelectedCustomerProvider.dart';
import 'package:customer_ui/utils/extensions.dart';
import 'package:customer_ui/widgets/CustomerDialogButton.dart';
import 'package:customer_ui/widgets/registration/NewAddressWidget.dart';
import 'package:customer_ui/widgets/registration/NewContactWidget.dart';
import 'package:customer_ui/widgets/registration/PrimaryDetails.dart';
import 'package:customer_ui/widgets/registration/SocialMediaWidget.dart';
import 'package:execution_context/builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:master_data/builder.dart';
import 'package:messages_data/builder.dart';
import 'package:orders_ui/OrdersPage.dart';
import 'package:orders_ui/utils/NotificationMessage.dart';
import 'package:themes_library/themes_library.dart';
import 'package:widgets_library/scroller.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:intl/intl.dart';
import 'package:dio/dio.dart';
import 'package:provider/provider.dart';
import '../../utils/size_config.dart';
import '../../widgets/registration/TopBar.dart';

ValueNotifier<String> imageUploadedValue = ValueNotifier('');
ValueNotifier<String> imageUploadedFileName = ValueNotifier('');

class NewCustomerScreen extends StatefulWidget{

  final Function(CustomerData?)? onNewCustomerCreated;
  final Function()? onCancelTapped;
   bool isShowHeader;

   NewCustomerScreen({super.key, this.onNewCustomerCreated, this.onCancelTapped,required this.isShowHeader});

  @override
  State<NewCustomerScreen> createState() => _NewCustomerScreenState();
}

class _NewCustomerScreenState extends State<NewCustomerScreen> {
  final _pageController = ScrollController();
  final _formKey = GlobalKey<FormState>();
  final bool isShowHeader = false;

  String? _title ;
  final _firstNameCtr = TextEditingController();
  final _middleNameCtr = TextEditingController();
  final _lastNameCtr = TextEditingController();
  final _dobNameCtr = TextEditingController();
  final _anniversaryCtr = TextEditingController();
  final _membershipCtr = TextEditingController();
  final _nickNameCtr = TextEditingController();
  final _uniqueIdentifierCtr = TextEditingController();
  final _companyCtr = TextEditingController();
  final _designationCtr = TextEditingController();
  final _taxCodeCtr = TextEditingController();
  final _notesCtr = TextEditingController();
  final _externalSysRefCtr = TextEditingController();
  final _channelCtr = TextEditingController();
  final _userNameCtr = TextEditingController();
  final List<String> _phoneList = ["",];
  final List<String> _emailList = [""];
  final List<String> _fbList = ["",];
  final List<String> _twitterList = [""];
  final List<String> _wechatList = ["",];
  final List<String> _contactList = [""];
  final List<String> _addressList = [""];

  List<TextEditingController>? _phoneCtr;
  List<TextEditingController>? _emailCtr;
  List<TextEditingController>? _fbCtr;
  List<TextEditingController>? _twitterCtr;
  List<TextEditingController>? _wechatCtr;
  List<TextEditingController>? _fbTokenCtr;
  List<TextEditingController>? _twitterCodeCtr;
  List<TextEditingController>? _line1Ctr;
  List<TextEditingController>? _line2Ctr;
  List<TextEditingController>? _line3Ctr;
  List<TextEditingController>? _cityCtr;
  List<TextEditingController>? _postalCodeCtr;
  List<TextEditingController>? _addressCtr;
  List<CountryContainerDTO>?  _country;
  List<StateContainerDTO>?  _state;
  final List<bool>? _isDefaultPhone = [false];
  final List<bool>? _isDefaultMail = [false];
  final List<bool>? _isDefaultAddress = [false];
  List<int>? _contactTypePhone ;
  List<int>? _contactTypeMail ;
  List<String>? _countryCode ;
  String showTermsAndConditions = 'N';
  var _execContextBL;
  var _execContext;
  var _masterDataBl;

  bool _policyTermsAccepted = false;
  String? _gender;
  String? _type;
  bool _rightHanded = false;
  bool _teamUser = false;
  bool _verified = false;

  bool _isLoading = false;
  bool _isAgreed = false;
  final _countries = <DropdownMenuItem<CountryContainerDTO>>[];
  var _selectCountry;
  final _states = <DropdownMenuItem<StateContainerDTO>>[];
  final ValueNotifier<bool> _checkboxState = ValueNotifier<bool>(false);


  String? _titleView;
  String? _firstNameView;
  String? _idProofView;
  String? _lastNameView;
  String? _middleNameView;
  String? _nickNameView;
  String? _genderView;
  String? _birthdateView;
  String? _anniversaryView;
  String? _uniqueIdView;
  String? _rightHandView;
  String? _teamUserView;
  String? _companyView;
  String? _designationView;
  String? _taxCodeView;
  String? _notesView ;
  String? _extSysView ;
  String? _channelView ;
  String? _typeView ;
  String? _usernameView ;
  String? _address1View;
  String? _address2View;
  String? _address3View;
  String? _cityView;
  String? _stateView;
  String? _countryView;
  String? _pinView;
  String? _phone1View;
  String? _phone2View;
  String? _countryCodeView;
  String? _contactSubTypeView;
  String? _emailView;
  String? _fbuserIdView;
  String? _fbAccessTokenView;
  String? _twAccessTokenView;
  String? _twsecretView;
  String? _weChatTokenView;
  String? _ignoreBirthYear;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      SemnoxTheme theme = Theme.of(context).extension<SemnoxTheme>()!;
      _getCountries(theme);
      _isFieldEnabled();
      setNotification.value = NotificationMessage(message: '');
    });
    imageUploadedValue = ValueNotifier('');
    imageUploadedFileName = ValueNotifier('');
    _phoneCtr = List.generate(_phoneList.length, (i) => TextEditingController());
    _emailCtr = List.generate(_emailList.length, (i) => TextEditingController());
    _fbCtr = List.generate(_fbList.length, (i) => TextEditingController());
    _fbTokenCtr = List.generate(_fbList.length, (i) => TextEditingController());
    _twitterCtr = List.generate(_twitterList.length, (i) => TextEditingController());
    _twitterCodeCtr = List.generate(_twitterList.length, (i) => TextEditingController());
    _wechatCtr = List.generate(_wechatList.length, (i) => TextEditingController());
    _line1Ctr = List.generate(_addressList.length, (i) => TextEditingController());
    _line2Ctr = List.generate(_addressList.length, (i) => TextEditingController());
    _line3Ctr = List.generate(_addressList.length, (i) => TextEditingController());
    _cityCtr = List.generate(_addressList.length, (i) => TextEditingController());
    _postalCodeCtr = List.generate(_addressList.length, (i) => TextEditingController());
    _addressCtr = List.generate(_addressList.length, (i) => TextEditingController());
    _state = List.generate(_addressList.length, (index) => StateContainerDTO(stateId: -1, state: "", description: "", countryId: -1));
    _country = List.generate(_addressList.length, (index) => CountryContainerDTO(countryId: -1, countryName: "", countryCode: "", isActive: true, stateContainerDTOList: []));
    _initFunctions();
  }

  _initFunctions() async {
    _execContextBL = await ExecutionContextBuilder.build();
    _execContext = _execContextBL.getExecutionContext();
    _masterDataBl = await MasterDataBuilder.build(_execContext!);
    showTermsAndConditions = await _masterDataBl.getDefaultValuesByName(defaultValueName: "TERMS_AND_CONDITIONS");
  }

  @override
  Widget build(BuildContext context) {
    SemnoxTheme theme = Theme.of(context).extension<SemnoxTheme>()!;
    SizeConfig.init(context);
    return Scaffold(
      backgroundColor: theme.backGroundColor,
      body: Scroller(
        controller: _pageController,
        child: SingleChildScrollView(
          controller: _pageController,
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.only(left : 8.0 ,right: 26.0,  bottom : 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //Topbar(isShowHeader: widget.isShowHeader,),
                  const SizedBox(height: 10.0,),
                  Text(MessagesProvider.get("Primary Details"),style : theme.heading4?.copyWith(fontSize: SizeConfig.getFontSize(22))),
                  const SizedBox(height: 8.0,),
                  PrimaryDetails(
                    onChange: (value){
                      _title = value;
                    },
                    onImageClick: (){

                    },
                    onChangeGender: (value){
                      _gender = value;
                    },
                    onChangeType: (value){
                      _type = value;
                    },
                    onChaneRightHanded: (value){
                      _rightHanded = value;
                    },
                    onChangeTeamUser: (value){
                      _teamUser = value;
                    },
                    ignoreBirthYear: _ignoreBirthYear,
                    rightHanded: _rightHanded,
                    teamUser: _teamUser,
                    firstNameCtr: _firstNameCtr,
                    middleNameCtr: _middleNameCtr,
                    lastNameCtr: _lastNameCtr,
                    dobNameCtr: _dobNameCtr,
                    anniversaryCtr: _anniversaryCtr,
                    membershipCtr: _membershipCtr,
                    nickNameCtr: _nickNameCtr,
                    uniqueIdentifierCtr: _uniqueIdentifierCtr,
                    companyCtr: _companyCtr,
                    designationCtr: _designationCtr,
                    taxCodeCtr: _taxCodeCtr,
                    notesCtr: _notesCtr,
                    externalSystemReferenceCtr: _externalSysRefCtr,
                    channelCtr: _channelCtr,
                    userNameCtr: _userNameCtr,
                    idProofView: _idProofView,
                    titleView: _titleView,
                    firstNameView: _firstNameView,
                    middleNameView: _middleNameView,
                    lastNameView: _lastNameView,
                    nickNameView: _nickNameView,
                    genderView: _genderView,
                    birthdateView: _birthdateView,
                    anniversaryView : _anniversaryView,
                    uniqueIdView:  _uniqueIdView,
                    rightHandView: _rightHandView,
                    teamUserView: _teamUserView,
                    companyView: _companyView,
                    designationView: _designationView,
                    taxCodeView: _taxCodeView,
                    notesView :_notesView ,
                    extSysView:  _extSysView ,
                    channelView: _channelView ,
                    typeView: _typeView ,
                    usernameView: _usernameView ,
                  ),
                  const SizedBox(height: 8.0,),
                  Text(MessagesProvider.get("Contact"),style : theme.heading4),
                  const SizedBox(height: 8.0,),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 24),
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 1,
                        color: theme.dialogFooterInnerShadow!,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child:
                    Column(
                      children: [
                        GridView.count(
                            shrinkWrap: true,
                            primary: false,
                            padding: EdgeInsets. zero,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 0,
                            crossAxisCount: 2,
                            childAspectRatio: 1.3,
                            children:[
                              for(int i = 0; i< _phoneList.length; i++)
                                Column(
                                  children: [
                                    NewContactWidget(
                                    title: MessagesProvider.get("Phone"),
                                    hint : MessagesProvider.get("Enter Phone (Mandatory)"),
                                    validationText: MessagesProvider.get("Enter Phone (Mandatory)"),
                                    keyboardType: TextInputType.number,
                                    maxLength: 13,
                                    inputFormatter:  FilteringTextInputFormatter.allow(RegExp("[-0-9+().]")),
                                    controller: _phoneCtr?[i],
                                    phone1View: _phone1View,
                                    phone2View: _phone2View,
                                    contactSubTypeView: _contactSubTypeView,
                                    countryCodeView: _countryCodeView,
                                    isDefault: _isDefaultPhone?[i] ?? false,
                                    contactType: _contactTypePhone?[i] ?? 1,
                                    countryCode: _countryCode?[i] ?? '+1',
                                    onChangeDefault: (value){
                                      _isDefaultPhone?[i] = value;
                                    },
                                    onAdd: (){
                                      setState(() {
                                        _phoneList.add(MessagesProvider.get("Phone"));
                                        _isDefaultPhone?.add(false);
                                        _phoneCtr?.add(TextEditingController());
                                        //_phoneCtr = List.generate(_phoneList.length, (i) => TextEditingController());
                                      });
                                    },
                                    onRemove: (){
                                      setState(() {
                                        if(_phoneList.length > 1) {
                                          _phoneList.removeAt(i);
                                          _isDefaultPhone?.removeAt(i);
                                          _phoneCtr?.removeAt(i);
                                        }
                                        //_phoneCtr = List.generate(_phoneList.length, (i) => TextEditingController());
                                      });
                                    },),
                                    const SizedBox(height: 16.0,)
                                  ],
                                ),
                              for(int i = 0; i< _emailList.length; i++)
                                Column(
                                  children:[
                                    NewContactWidget(
                                      title: MessagesProvider.get("Email"),
                                      hint :MessagesProvider.get("Enter Email  (Mandatory)"),
                                    validationText: MessagesProvider.get("Enter Email  (Mandatory)"),
                                    controller: _emailCtr?[i],
                                    emailView: _emailView,
                                    contactSubTypeView: _contactSubTypeView,
                                      isDefault: _isDefaultMail?[i] ?? false,
                                      contactType: _contactTypeMail?[i] ?? 1,
                                      onChangeDefault: (value){
                                        print("onchange value $value");
                                        setState(() {
                                          _isDefaultMail?[i] = value;
                                        });
                                      },
                                      onAdd: (){
                                      setState(() {
                                        _emailList.add(MessagesProvider.get("Phone"));
                                        _isDefaultMail?.add(false);
                                        _emailCtr?.add(TextEditingController());
                                        //_emailCtr = List.generate(_emailList.length, (i) => TextEditingController());
                                      });
                                    },
                                    onRemove: (){
                                      setState(() {
                                        if(_emailList.length > 1) {
                                          _emailList.removeAt(i);
                                          _emailCtr?.removeAt(i);
                                          _isDefaultMail?.removeAt(i);
                                        }
                                        //_emailCtr = List.generate(_emailList.length, (i) => TextEditingController());
                                      });
                                    },
                                  )],
                                ),
                              for(int i = 0; i< _fbList.length; i++)
                                if((_fbuserIdView == 'M' || _fbuserIdView == 'O') && (_fbAccessTokenView == 'M' || _fbAccessTokenView == 'O'))
                                Column(
                                  children: [
                                    SocialMediaWidget(
                                      title: MessagesProvider.get("Facebook"),
                                      title1 : MessagesProvider.get("FB Id"),
                                      hint1 : MessagesProvider.get("Enter FB Id (Mandatory)"),
                                      validationText1: MessagesProvider.get("Enter FB Id (Mandatory)"),
                                      title2 : MessagesProvider.get("Token"),
                                      hint2 : MessagesProvider.get("Enter Token (Mandatory)"),
                                      validationText2: MessagesProvider.get("Enter Token (Mandatory)"),
                                      idController: _fbCtr?[i],
                                      tokenController : _fbTokenCtr?[i],
                                      fbAccessTokenView: _fbAccessTokenView,
                                      fbuserIdView: _fbuserIdView,
                                      onAdd: (){
                                        setState(() {
                                          _fbList.add(MessagesProvider.get("Phone"));
                                          _fbCtr?.add(TextEditingController());
                                          _fbTokenCtr?.add(TextEditingController());
                                          //_phoneCtr = List.generate(_fbList.length, (i) => TextEditingController());
                                        });
                                      },
                                      onRemove: (){
                                        setState(() {
                                          if(_fbList.length > 1) {
                                            _fbList.removeAt(i);
                                            _fbCtr?.removeAt(i);
                                            _fbTokenCtr?.removeAt(i);
                                          }
                                          //_phoneCtr = List.generate(_phoneList.length, (i) => TextEditingController());
                                        });
                                      },),
                                    const SizedBox(height: 16.0,)
                                  ],
                                ),
                              for(int i = 0; i< _twitterList.length; i++)
                                if((_twAccessTokenView == 'M' || _twAccessTokenView == 'O') && (_twsecretView == 'M' || _twsecretView == 'O'))
                                Column(
                                  children: [
                                    SocialMediaWidget(
                                      title: MessagesProvider.get("Twitter"),
                                      title1 : MessagesProvider.get("Token"),
                                      hint1 : MessagesProvider.get("Enter Token  (Mandatory)"),
                                      validationText1: MessagesProvider.get("Enter Twitter Id (Mandatory)"),
                                      title2 : MessagesProvider.get("Code"),
                                      hint2 : MessagesProvider.get("Enter Code (Mandatory)"),
                                      validationText2: MessagesProvider.get("Enter Code (Mandatory)"),
                                      idController: _twitterCtr?[i],
                                      tokenController : _twitterCodeCtr?[i],
                                      twAccessTokenView: _twAccessTokenView,
                                      twsecretView: _twsecretView,
                                      onAdd: (){
                                        setState(() {
                                          _twitterList.add(MessagesProvider.get("Phone"));
                                          _twitterCtr?.add(TextEditingController());
                                          _twitterCodeCtr?.add(TextEditingController());
                                          //_phoneCtr = List.generate(_fbList.length, (i) => TextEditingController());
                                        });
                                      },
                                      onRemove: (){
                                        setState(() {
                                          if(_twitterList.length > 1) {
                                            _twitterList.removeAt(i);
                                            _twitterCtr?.removeAt(i);
                                            _twitterCodeCtr?.removeAt(i);
                                          }
                                          //_phoneCtr = List.generate(_phoneList.length, (i) => TextEditingController());
                                        });
                                      },),
                                    const SizedBox(height: 16.0,)
                                  ],
                                ),
                              for(int i = 0; i< _wechatList.length; i++)
                                if(_weChatTokenView == 'M' || _weChatTokenView == 'O')
                                Column(
                                  children: [
                                    SocialMediaWidget(
                                      title: MessagesProvider.get("WeChat"),
                                      title1 : MessagesProvider.get("Id"),
                                      hint1 : MessagesProvider.get("Enter Id (Mandatory)"),
                                      validationText1: MessagesProvider.get("Enter Id (Mandatory)"),
                                      idController: _wechatCtr?[i],
                                      weChatTokenView: _weChatTokenView,
                                      onAdd: (){
                                        setState(() {
                                          _wechatList.add(MessagesProvider.get("Phone"));
                                          _wechatCtr?.add(TextEditingController());
                                          //_phoneCtr = List.generate(_fbList.length, (i) => TextEditingController());
                                        });
                                      },
                                      onRemove: (){
                                        setState(() {
                                          if(_wechatList.length > 1) {
                                            _wechatList.removeAt(i);
                                            _wechatCtr?.removeAt(i);
                                          }
                                          //_phoneCtr = List.generate(_phoneList.length, (i) => TextEditingController());
                                        });
                                      },),
                                    const SizedBox(height: 16.0,)
                                  ],
                                ),
                            ]),
                      /*  Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(child: ListView.builder(
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                physics: const ScrollPhysics(),
                                itemCount: _phoneList.length,
                                key: UniqueKey(),
                                itemBuilder: (BuildContext context, int index) {
                                  return Column(
                                    children: [
                                      NewContactWidget(title: MessagesProvider.get("Phone"), hint : MessagesProvider.get("Enter Phone Mandatory"),
                                        validationText: MessagesProvider.get("Enter Phone Mandatory"),
                                        keyboardType: TextInputType.number,
                                        maxLength: 13,
                                        inputFormatter:  FilteringTextInputFormatter.allow(RegExp("[-0-9+().]")),
                                        controller: _phoneCtr?[index],
                                        onAdd: (){
                                          setState(() {
                                            _phoneList.add(MessagesProvider.get("Phone"));
                                            _phoneCtr?.add(TextEditingController());
                                            //_phoneCtr = List.generate(_phoneList.length, (i) => TextEditingController());
                                          });
                                        },
                                        onRemove: (){
                                          setState(() {
                                            if(_phoneList.length > 1)
                                               _phoneList.removeAt(index);
                                            _phoneCtr?.removeAt(index);
                                              //_phoneCtr = List.generate(_phoneList.length, (i) => TextEditingController());
                                          });
                                        },),
                                      const SizedBox(height: 16.0,)
                                    ],
                                  );
                                })),
                            const SizedBox(width: 8.0,),
                            Expanded(child: ListView.builder(
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                physics: const ScrollPhysics(),
                                itemCount: _emailList.length,
                                key: UniqueKey(),
                                itemBuilder: (BuildContext context, int index) {
                                  return Column(
                                    children: [
                                      NewContactWidget(title: MessagesProvider.get("Email"), hint :MessagesProvider.get("Enter Email  Mandatory"),
                                        validationText: MessagesProvider.get("Enter Email  Mandatory"),
                                        controller: _emailCtr?[index],
                                        onAdd: (){
                                          setState(() {
                                            _emailList.add(MessagesProvider.get("Phone"));
                                            _emailCtr?.add(TextEditingController());
                                           //_emailCtr = List.generate(_emailList.length, (i) => TextEditingController());
                                          });
                                        },
                                        onRemove: (){
                                          setState(() {
                                            if(_emailList.length > 1)
                                              _emailList.removeAt(index);
                                            _emailCtr?.removeAt(index);
                                            //_emailCtr = List.generate(_emailList.length, (i) => TextEditingController());
                                          });
                                        },
                                      ),
                                      const SizedBox(height: 16.0,)
                                    ],
                                  );
                                })),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                                child: ListView.builder(
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                physics: const ScrollPhysics(),
                                itemCount: _fbList.length,
                                key: UniqueKey(),
                                itemBuilder: (BuildContext context, int index) {
                                  return Column(
                                    children: [
                                      SocialMediaWidget(
                                        title: MessagesProvider.get("Facebook"),
                                        title1 : MessagesProvider.get("FB Id"),
                                        hint1 : MessagesProvider.get("Enter FB Id Mandatory"),
                                        validationText1: MessagesProvider.get("Enter FB Id Mandatory"),
                                        title2 : MessagesProvider.get("Token"),
                                        hint2 : MessagesProvider.get("Enter Token Mandatory"),
                                        validationText2: MessagesProvider.get("Enter Token Mandatory"),
                                        idController: _fbCtr?[index],
                                        tokenController : _fbTokenCtr?[index],
                                        onAdd: (){
                                          setState(() {
                                            _fbList.add(MessagesProvider.get("Phone"));
                                            _fbCtr?.add(TextEditingController());
                                            _fbTokenCtr?.add(TextEditingController());
                                            //_phoneCtr = List.generate(_fbList.length, (i) => TextEditingController());
                                          });
                                        },
                                        onRemove: (){
                                          setState(() {
                                            if(_fbList.length > 1)
                                              _fbList.removeAt(index);
                                            _fbCtr?.removeAt(index);
                                            _fbTokenCtr?.removeAt(index);
                                            //_phoneCtr = List.generate(_phoneList.length, (i) => TextEditingController());
                                          });
                                        },),
                                      const SizedBox(height: 16.0,)
                                    ],
                                  );
                                })),
                            const SizedBox(width: 8.0,),
                            Expanded(child: ListView.builder(
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                physics: const ScrollPhysics(),
                                itemCount: _twitterList.length,
                                key: UniqueKey(),
                                itemBuilder: (BuildContext context, int index) {
                                  return Column(
                                    children: [
                                      SocialMediaWidget(
                                        title: MessagesProvider.get("Twitter"),
                                        title1 : MessagesProvider.get("Twitter Id"),
                                        hint1 : MessagesProvider.get("Enter Twitter Id Mandatory"),
                                        validationText1: MessagesProvider.get("Enter Twitter Id Mandatory"),
                                        title2 : MessagesProvider.get("Code"),
                                        hint2 : MessagesProvider.get("Enter Code Mandatory"),
                                        validationText2: MessagesProvider.get("Enter Code Mandatory"),
                                        idController: _twitterCtr?[index],
                                        tokenController : _twitterCodeCtr?[index],
                                        onAdd: (){
                                          setState(() {
                                            _twitterList.add(MessagesProvider.get("Phone"));
                                            _twitterCtr?.add(TextEditingController());
                                            _twitterCodeCtr?.add(TextEditingController());
                                            //_phoneCtr = List.generate(_fbList.length, (i) => TextEditingController());
                                          });
                                        },
                                        onRemove: (){
                                          setState(() {
                                            if(_twitterList.length > 1)
                                              _twitterList.removeAt(index);
                                            _twitterCtr?.removeAt(index);
                                            _twitterCodeCtr?.removeAt(index);
                                            //_phoneCtr = List.generate(_phoneList.length, (i) => TextEditingController());
                                          });
                                        },),
                                      const SizedBox(height: 16.0,)
                                    ],
                                  );
                                })),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(child: ListView.builder(
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                physics: const ScrollPhysics(),
                                itemCount: _wechatList.length,
                                key: UniqueKey(),
                                itemBuilder: (BuildContext context, int index) {
                                  return Column(
                                    children: [
                                      SocialMediaWidget(
                                        title: MessagesProvider.get("WeChat"),
                                        title1 : MessagesProvider.get("WeChat Id"),
                                        hint1 : MessagesProvider.get("Enter WeChat Id Mandatory"),
                                        validationText1: MessagesProvider.get("Enter WeChat Id Mandatory"),
                                        idController: _wechatCtr?[index],
                                        onAdd: (){
                                          setState(() {
                                            _wechatList.add(MessagesProvider.get("Phone"));
                                            _wechatCtr?.add(TextEditingController());
                                            //_phoneCtr = List.generate(_fbList.length, (i) => TextEditingController());
                                          });
                                        },
                                        onRemove: (){
                                          setState(() {
                                            if(_fbList.length > 1)
                                              _fbList.removeAt(index);
                                            _wechatCtr?.removeAt(index);
                                            //_phoneCtr = List.generate(_phoneList.length, (i) => TextEditingController());
                                          });
                                        },),
                                      const SizedBox(height: 16.0,)
                                    ],
                                  );
                                })),
                            const SizedBox(width: 8.0,),
                            Expanded(child: Container()),
                          ],
                        ),*/
                      ],
                    ),
                  ),
                  const SizedBox(height: 8.0,),
                  Text(MessagesProvider.get("Address"),style : theme.heading4),
                  const SizedBox(height: 8.0,),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 24),
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 1,
                        color: theme.dialogFooterInnerShadow!,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child:
                    Column(
                      children: [
                    for(int index = 0; index < _addressList.length ; index++)
                        Column(
                          children: [
                            NewAddress(
                              isDefault: _isDefaultAddress?[index] ?? false,
                              countries :_countries,
                              countryValue: _selectCountry,
                              states: _states,
                              line1Ctr: _line1Ctr?[index],
                              line2Ctr: _line2Ctr?[index],
                              line3Ctr: _line3Ctr?[index],
                              cityCtr: _cityCtr?[index],
                              postalCodeCtr: _postalCodeCtr?[index],
                              address1View: _address1View,
                              address2View: _address2View,
                              address3View: _address3View,
                              cityView: _cityView,
                              stateView: _stateView,
                              countryView: _countryView,
                              pinView: _pinView,
                              onChangeDefault: (value){
                                _isDefaultAddress?[index] = value;
                              },
                              onChangeCountry: (value){
                                _country?[index] = value;
                              },
                              onChangeState: (value){
                                _state?[index] = value;
                              },
                              onAdd: (){
                                setState(() {
                                  _addressList.add(MessagesProvider.get("Postal Code"));
                                  _isDefaultAddress?.add(false);
                                  _line1Ctr?.add(TextEditingController());
                                  _line2Ctr?.add(TextEditingController());
                                  _line3Ctr?.add(TextEditingController());
                                  _cityCtr?.add(TextEditingController());
                                  _postalCodeCtr?.add(TextEditingController());
                                  _state?.add(StateContainerDTO(stateId: -1, state: "", description: "", countryId: -1));
                                  _country?.add(CountryContainerDTO(countryId: -1, countryName: "", countryCode: "", isActive: true, stateContainerDTOList: []));
                                });
                              },onRemove: (){
                              setState(() {
                                if(_addressList.length > 1) {
                                  _addressList.removeAt(index);
                                  _line1Ctr?.removeAt(index);
                                  _line2Ctr?.removeAt(index);
                                  _line3Ctr?.removeAt(index);
                                  _cityCtr?.removeAt(index);
                                  _postalCodeCtr?.removeAt(index);
                                  _country?.removeAt(index);
                                  _state?.removeAt(index);
                                  _isDefaultAddress?.removeAt(index);
                                }
                              });
                            },),
                            const SizedBox(height: 16.0,)
                          ],
                        ),
                      ],
                    )
                    /* ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        physics: const ScrollPhysics(),
                        itemCount: _addressList.length,
                        key: UniqueKey(),
                        itemBuilder: (BuildContext context, int index) {
                          return Column(
                            children: [
                              NewAddress(
                                countries :_countries,
                                states: _states,
                                line1Ctr: _line1Ctr?[index],
                                line2Ctr: _line2Ctr?[index],
                                line3Ctr: _line3Ctr?[index],
                                cityCtr: _cityCtr?[index],
                                postalCodeCtr: _postalCodeCtr?[index],
                                address1View: _address1View,
                                address2View: _address2View,
                                address3View: _address3View,
                                cityView: _cityView,
                                stateView: _stateView,
                                countryView: _countryView,
                                pinView: _pinView,
                                onChangeCountry: (value){
                                  _country?[index] = value;
                                },
                                onChangeState: (value){
                                  _state?[index] = value;
                                },
                                onAdd: (){
                                  setState(() {
                                    _addressList.add(MessagesProvider.get("Postal Code"));
                                    _line1Ctr?.add(TextEditingController());
                                    _line2Ctr?.add(TextEditingController());
                                    _line3Ctr?.add(TextEditingController());
                                    _cityCtr?.add(TextEditingController());
                                    _postalCodeCtr?.add(TextEditingController());
                                    _state?.add(StateContainerDTO(stateId: -1, state: "", description: "", countryId: -1));
                                    _country?.add(CountryContainerDTO(countryId: -1, countryName: "", countryCode: "", isActive: true, stateContainerDTOList: []));
                                  });
                                },onRemove: (){
                                  setState(() {
                                    if(_addressList.length > 1) {
                                      _addressList.removeAt(index);
                                      _line1Ctr?.removeAt(index);
                                      _line2Ctr?.removeAt(index);
                                      _line3Ctr?.removeAt(index);
                                      _cityCtr?.removeAt(index);
                                      _postalCodeCtr?.removeAt(index);
                                      _country?.removeAt(index);
                                      _state?.removeAt(index);
                                    }
                                  });
                                },),
                              const SizedBox(height: 16.0,)
                            ],
                          );
                        }),*/
                  ),
                /*  Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CustomerButtonWidget(text: MessagesProvider.get("Save"),onPress: (){
                        if (_formKey.currentState!.validate()) {
                          //_save();
                        }
                        FocusScope.of(context).requestFocus(FocusNode());
                      },),
                    ),
                  )*/
                ],
              ),
            ),
          ),
        ),
      ),
      persistentFooterButtons:[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            showTermsAndConditions== 'Y'? Row(
              children: [
                ValueListenableBuilder(
                  valueListenable: _checkboxState,
                  builder: (BuildContext context, bool value, Widget? child) {
                    return  Transform.scale(
                      scale: 1.5,
                      child: Checkbox(
                        checkColor: theme.secondaryColor,
                        activeColor: theme.primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        side: MaterialStateBorderSide.resolveWith(
                              (states) => BorderSide(width: 1.0, color: theme.secondaryColor!),
                        ),
                        //fillColor: MaterialStateProperty.resolveWith(Colors.black),
                        value: _isAgreed,
                        onChanged:(bool? value) {
                          _isAgreed = value!;
                          _checkboxState.value = value;
                        } ,
                      ),
                    );
                  },
                ),
                Text(MessagesProvider.get("Click here to agree to Terms and Conditions"),style: theme.heading6?.copyWith(fontSize: SizeConfig.getFontSize(20)),overflow: TextOverflow.ellipsis,),
              ],
            ): Container(),
            ValueListenableBuilder(
              valueListenable: imageUploadedValue,
              builder: (BuildContext context, value, Widget? child) {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  //print("retrive data $value");
                  //widget.onTransactionRetrieve!(value);
                });
                return ValueListenableBuilder(
                  valueListenable: imageUploadedFileName,
                  builder: (BuildContext context, value, Widget? child) {
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      //print("retrive data $value");
                      //widget.onTransactionRetrieve!(value);
                    });
                    return Align(
                      alignment: Alignment.bottomRight,
                      child: CustomerDialogButton(text: MessagesProvider.get("Save").toUpperCase(),onPress: (){
                        print("imageUploadedValue : "+imageUploadedValue.value.toString());
                        print("imageUploadedFileName : "+imageUploadedFileName.value.toString());
                        if (_formKey.currentState!.validate()) {
                          if(_isAgreed && showTermsAndConditions == 'Y') {
                            setNotification.value = NotificationMessage(message:  MessagesProvider.get(''),color: theme.footerBG2);
                            _save();
                          }else{
                            setNotification.value = NotificationMessage(message:  MessagesProvider.get('Terms and Conditions is mandatory. Please enter a value.'),color: theme.footerBG3);
                          }
                        }else if((_titleView == 'M') && (_title == null)){
                          setNotification.value = NotificationMessage(message:  MessagesProvider.get('Title is mandatory.Please enter a value.'),color: theme.footerBG3);
                        }else if(_firstNameCtr.text.isEmpty){
                          setNotification.value = NotificationMessage(message:  MessagesProvider.get('First Name is mandatory.Please enter a value.'),color: theme.footerBG3);
                        }else if(_middleNameCtr.text.isEmpty){
                          setNotification.value = NotificationMessage(message:  MessagesProvider.get('Middle Name is mandatory.Please enter a value.'),color: theme.footerBG3);
                        }else if(_phoneList.length > 0){
                          for(int i = 0; i < _phoneList.length ; i++){
                            if( _phoneCtr![i].text.isEmpty){
                              setNotification.value = NotificationMessage(message:  MessagesProvider.get('Phone is mandatory.Please enter a value.'),color: theme.footerBG3);
                            }
                          }
                        }else if(_emailList.isNotEmpty){
                          for(int i = 0; i < _phoneList.length ; i++){
                            if( _emailCtr![i].text.isEmpty){
                              setNotification.value = NotificationMessage(message:  MessagesProvider.get('Email is mandatory.Please enter a value.'),color: theme.footerBG3);
                            }
                          }
                        }else if(_addressList.length > 0){
                          for(int i = 0; i < _addressList.length ; i++){
                            if( _line1Ctr![i].text.isEmpty){
                              setNotification.value = NotificationMessage(message:  MessagesProvider.get('Line1 is mandatory.Please enter a value.'),color: theme.footerBG3);
                            }else if( _cityCtr![i].text.isEmpty){
                              setNotification.value = NotificationMessage(message:  MessagesProvider.get('City is mandatory.Please enter a value.'),color: theme.footerBG3);
                            }if( _country![i].countryId.toString().isEmpty){
                              setNotification.value = NotificationMessage(message:  MessagesProvider.get('Line1 is mandatory.Please enter a value.'),color: theme.footerBG3);
                            }
                          }
                        }
                        //FocusScope.of(context).requestFocus(FocusNode());
                      },),
                    );
                  },
                );
              },
            ),
          ],
        )
      ],
    ).withLoader(isLoading: _isLoading,theme: theme);
  }

  _getCountries(SemnoxTheme theme) async{
    final execContextBL = await ExecutionContextBuilder.build();
    final executionContextDTO = execContextBL.getExecutionContext();
    final customerSearchBL = await CustomerDataBuilder.build(executionContextDTO!);
    CountryContainerResponse? countryResponse = await customerSearchBL.getCountryContainer();
    List<CountryContainerDTO>? countryList = countryResponse?.data?.countryContainerDTOList;
    countryList?.forEach((element) {
      _countries.add(DropdownMenuItem(
          value: element,
          child: AutoSizeText(element.countryName ?? "", style: theme.textFieldStyle?.copyWith(fontSize: SizeConfig.getFontSize(18)))));
      element.stateContainerDTOList.forEach((stateElement) {
        _states.add(DropdownMenuItem(
            value: stateElement,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: theme.tableRow1
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  AutoSizeText(stateElement.description ?? "", style: theme.textFieldStyle?.copyWith(fontSize: SizeConfig.getFontSize(18))),
                  const SizedBox(width: 8.0,),
                  AutoSizeText(stateElement.state ?? "", style: theme.textFieldStyle)
                ],
              ),
            )));
      });
    });
    if((countryList?.length ?? 0) > 0){
      _selectCountry = _countries[0].value;
    }
    setState(() {

    });
  }

  void _setLoadingStatus(bool status) {
    setState(() {
      _isLoading = status;
    });
  }

  void _save() async {
    SemnoxTheme theme = Theme.of(context).extension<SemnoxTheme>()!;
    _setLoadingStatus(true);
    final execContextBL = await ExecutionContextBuilder.build();
    final executionContextDTO = execContextBL.getExecutionContext();
    final customerSearchBL =
    await CustomerDataBuilder.build(executionContextDTO!);

    String dob = "";
    String anniversary = "";
    if(_dobNameCtr.text != "") {
      String dd = _ignoreBirthYear == "Y"? _dobNameCtr.text+"-1904" : _dobNameCtr.text;
      DateFormat dateFormat = DateFormat('dd-MM-yyyy');
      DateTime tempDate = dateFormat.parse(dd);
      dob = DateFormat("yyyy-MM-ddTHH:mm:ss").format(tempDate);
    }
    if(_anniversaryCtr.text != "") {
      String dd = _ignoreBirthYear == "Y"? _anniversaryCtr.text+"-2023" : _anniversaryCtr.text;
      DateFormat dateFormat = DateFormat('dd-MM-yyyy');
      DateTime tempDate = dateFormat.parse(dd);
      anniversary = DateFormat("yyyy-MM-ddTHH:mm:ss").format(tempDate);
    }

    List<AddressDTO> addressList = [];
    List<ContactDTO> contactList = [];

    _phoneList.asMap().forEach((index, value) {
      var contact = ContactDTO(
          id: -1,
          profileId: -1,
          addressId: -1,
          attribute1: _phoneCtr?[index].text.toString() ?? "",
          attribute2: "",
          contactSubType: -1,
          contactTypeId: 1,
          contactType: 2,
          isActive: true,
          countryId: -1,
          uuid: "",
          contactSubTypeId: -1,
          createdBy: "",
          creationDate: "",
          guid: "",
          isChanged: false,
          isDefault: _isDefaultPhone?[index] ?? true,
          lastUpdateDate: "",
          isVerified: false,
          lastUpdatedBy: "",
          masterEntityId: -1,
          siteId: -1,
          synchStatus: false,
          whatsAppEnabled: false);
      contactList.add(contact);
    });

    _emailList.asMap().forEach((index, value) {
      var contact = ContactDTO(
          id: -1,
          profileId: -1,
          addressId: -1,
          attribute1: _emailCtr?[index].text.toString() ?? "",
          attribute2: "",
          contactSubType: -1,
          contactTypeId: 2,
          contactType: 1,
          isActive: true,
          countryId: -1,
          uuid: "",
          contactSubTypeId: -1,
          createdBy: "",
          creationDate: "",
          guid: "",
          isChanged: false,
          isDefault: _isDefaultMail?[index] ?? true,
          lastUpdateDate: "",
          isVerified: false,
          lastUpdatedBy: "",
          masterEntityId: -1,
          siteId: -1,
          synchStatus: false,
          whatsAppEnabled: false);
      contactList.add(contact);
    });

    _fbList.asMap().forEach((key, value) {
      var contact = ContactDTO(
          id: -1,
          profileId: -1,
          addressId: -1,
          attribute1: _fbCtr?[key].text.toString() ?? "",
          attribute2: _fbTokenCtr?[key].text.toString() ?? "",
          contactSubType: -1,
          contactTypeId: -1,
          contactType: 3,
          isActive: true,
          countryId: -1,
          uuid: "",
          contactSubTypeId: -1,
          createdBy: "",
          creationDate: "",
          guid: "",
          isChanged: false,
          isDefault: true,
          lastUpdateDate: "",
          isVerified: false,
          lastUpdatedBy: "",
          masterEntityId: -1,
          siteId: -1,
          synchStatus: false,
          whatsAppEnabled: false);
      contactList.add(contact);
    });

    _twitterList.asMap().forEach((key, value) {
      var contact = ContactDTO(
          id: -1,
          profileId: -1,
          addressId: -1,
          attribute1: _twitterCtr?[key].text.toString() ?? "",
          attribute2: _twitterCodeCtr?[key].text.toString() ?? "",
          contactSubType: -1,
          contactTypeId: -1,
          contactType: 4,
          isActive: true,
          countryId: -1,
          uuid: "",
          contactSubTypeId: -1,
          createdBy: "",
          creationDate: "",
          guid: "",
          isChanged: false,
          isDefault: true,
          lastUpdateDate: "",
          isVerified: false,
          lastUpdatedBy: "",
          masterEntityId: -1,
          siteId: -1,
          synchStatus: false,
          whatsAppEnabled: false);
      contactList.add(contact);
    });

    _wechatList.asMap().forEach((key, value) {
      var contact = ContactDTO(
          id: -1,
          profileId: -1,
          addressId: -1,
          attribute1: _wechatCtr?[key].text.toString() ?? "",
          attribute2:  "",
          contactSubType: -1,
          contactTypeId: -1,
          contactType: 5,
          isActive: true,
          countryId: -1,
          uuid: "",
          contactSubTypeId: -1,
          createdBy: "",
          creationDate: "",
          guid: "",
          isChanged: false,
          isDefault: true,
          lastUpdateDate: "",
          isVerified: false,
          lastUpdatedBy: "",
          masterEntityId: -1,
          siteId: -1,
          synchStatus: false,
          whatsAppEnabled: false);
      contactList.add(contact);
    });

    _addressList.asMap().forEach((index, value) {
      var address = AddressDTO(
          id: -1,
          profileId: -1,
          addressTypeId: 1,
          addressType: -1,
          line1: _line1Ctr?[index].text.toString(),
          line2: _line2Ctr?[index].text.toString(),
          line3: _line3Ctr?[index].text.toString(),
          city:  _cityCtr?[index].text.toString(),
          stateId: _state?[index].stateId ?? -1,
          postalCode: _postalCodeCtr?[index].text.toString(),
          countryId: _country?[index].countryId ?? -1,
          stateCode: _state?[index].state,
          stateName: _state?[index].description,
          countryName: _country?[index].countryName,
          isActive: true,
          contactDTOList: [],
          creationDate: "",
          isChanged: false,
          isDefault: _isDefaultAddress?[index] ?? false,
          isChangedRecursive: false,
          lastUpdateDate: "",
          lastUpdatedBy: "",
          masterEntityId: -1,
          siteId: -1,
          synchStatus: false);
      addressList.add(address);
    });

    try {
      var response = await customerSearchBL.registerCustomer(
          title : _title ?? "Mr.",
          firstName: _firstNameCtr.text,
          middleName: _middleNameCtr.text,
          lastName: _lastNameCtr.text,
          dob: dob,
          idProofUrl: imageUploadedValue.value == 'true' ? "${imageUploadedFileName.value}" : "",
          nickName : _nickNameCtr.text,
          gender : _gender,
          anniversary : anniversary,
          uniqueIdentifier : _uniqueIdentifierCtr.text,
          rightHanded  : _rightHanded,
          teamUser : _teamUser,
          company : _companyCtr.text,
          designation : _designationCtr.text,
          taxCode : _taxCodeCtr.text,
          notes : _notesCtr.text,
          externalSystemReference : _externalSysRefCtr.text,
          channel : _channelCtr.text.toString(),
          type : _type,
          userName : _userNameCtr.text,
          membership : _membershipCtr.text,
          verified : _verified,
          policyTermsAccepted :_isAgreed,
          contactList: contactList,
          addressList: addressList);

      if (response.exception == null) {
        setNotification.value = NotificationMessage(message:  MessagesProvider.get('Customer Saved'),color: theme.footerBG4);
        _setLoadingStatus(false);
        context.read<SelectedCustomer>().updateData(response.data);
        //Navigator.pop(context);
        widget.onNewCustomerCreated!(response.data);
        clearScreen();
      }
    } on DioError catch (error) {
      _setLoadingStatus(false);
      var errorString = error.response?.data['data'] as String?;
      Future.microtask(() => _showErrorDialog(context, 'Error', errorString ?? ''));
    }
  }


  _showErrorDialog(BuildContext context, String title, String message) {
    SemnoxTheme theme = Theme.of(context).extension<SemnoxTheme>()!;
    showDialog(
        context: context,
        builder: (_) => CupertinoAlertDialog(
          title: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              title,
              style: theme.heading5,
            ),
          ),
          content: Text(
            message,
            style: theme.heading5,
          ),
          actions: [
            CupertinoDialogAction(
              child: Text(
                MessagesProvider.get("OK"),
                style: theme.heading5,
              ),
              onPressed: () {
                Navigator.pop(context);
                widget.onCancelTapped!();
              },
            ),
          ],
        ),
        barrierDismissible: true);
  }

  _isFieldEnabled() async {
    final execContextBL = await ExecutionContextBuilder.build();
    final execContextDTO = execContextBL.getExecutionContext();
    final masterDataBL = await MasterDataBuilder.build(execContextDTO!);
    _titleView = await masterDataBL.getDefaultValuesByName(defaultValueName: 'TITLE');
    _idProofView = await masterDataBL.getDefaultValuesByName(defaultValueName: 'CUSTOMER_PHOTO');
    _middleNameView = await masterDataBL.getDefaultValuesByName(defaultValueName: 'MIDDLE_NAME');
    _lastNameView = await masterDataBL.getDefaultValuesByName(defaultValueName: 'LAST_NAME');
    _nickNameView = await masterDataBL.getDefaultValuesByName(defaultValueName: 'NICKNAME');
    _genderView = await masterDataBL.getDefaultValuesByName(defaultValueName: 'GENDER');
    _birthdateView = await masterDataBL.getDefaultValuesByName(defaultValueName: 'BIRTH_DATE');
    _anniversaryView = await masterDataBL.getDefaultValuesByName(defaultValueName: 'ANNIVERSARY');
    _uniqueIdView = await masterDataBL.getDefaultValuesByName(defaultValueName: 'UNIQUE_ID');
    _rightHandView = await masterDataBL.getDefaultValuesByName(defaultValueName: 'RIGHTHANDED');
    _teamUserView = await masterDataBL.getDefaultValuesByName(defaultValueName: 'TEAMUSER');
    _companyView = await masterDataBL.getDefaultValuesByName(defaultValueName: 'COMPANY');
    _designationView = await masterDataBL.getDefaultValuesByName(defaultValueName: 'DESIGNATION');
    _taxCodeView = await masterDataBL.getDefaultValuesByName(defaultValueName: 'TAXCODE');
    _notesView = await masterDataBL.getDefaultValuesByName(defaultValueName: 'NOTES');
    _extSysView = await masterDataBL.getDefaultValuesByName(defaultValueName: 'EXTERNALSYSTEMREF');
    _channelView = await masterDataBL.getDefaultValuesByName(defaultValueName: 'CHANNEL');
    _typeView = await masterDataBL.getDefaultValuesByName(defaultValueName: 'CUSTOMERTYPE');
    _usernameView = await masterDataBL.getDefaultValuesByName(defaultValueName: 'USERNAME');
    _address1View = await masterDataBL.getDefaultValuesByName(defaultValueName: 'ADDRESS1');
    _address2View = await masterDataBL.getDefaultValuesByName(defaultValueName: 'ADDRESS2');
    _address3View = await masterDataBL.getDefaultValuesByName(defaultValueName: 'ADDRESS3');
    _cityView = await masterDataBL.getDefaultValuesByName(defaultValueName: 'CITY');
    _stateView = await masterDataBL.getDefaultValuesByName(defaultValueName: 'STATE');
    _countryView = await masterDataBL.getDefaultValuesByName(defaultValueName: 'COUNTRY');
    _pinView = await masterDataBL.getDefaultValuesByName(defaultValueName: 'PIN');
    _phone1View = await masterDataBL.getDefaultValuesByName(defaultValueName: 'CONTACT_PHONE');
    _phone2View = await masterDataBL.getDefaultValuesByName(defaultValueName: 'CONTACT_PHONE2');
    _countryCodeView = await masterDataBL.getDefaultValuesByName(defaultValueName: 'COUNTRY_CODE');
    _contactSubTypeView = await masterDataBL.getDefaultValuesByName(defaultValueName: 'PHONE_SUBTYPE');
    _emailView = await masterDataBL.getDefaultValuesByName(defaultValueName: 'EMAIL');
    _fbuserIdView = await masterDataBL.getDefaultValuesByName(defaultValueName: 'FBUSERID');
    _fbAccessTokenView = await masterDataBL.getDefaultValuesByName(defaultValueName: 'FBACCESSTOKEN');
    _twAccessTokenView = await masterDataBL.getDefaultValuesByName(defaultValueName: 'TWACCESSTOKEN');
    _twsecretView = await masterDataBL.getDefaultValuesByName(defaultValueName: 'TWACCESSSECRET');
    _weChatTokenView = await masterDataBL.getDefaultValuesByName(defaultValueName: 'WECHAT_ACCESS_TOKEN');
    _ignoreBirthYear = await masterDataBL.getDefaultValuesByName(defaultValueName: 'IGNORE_CUSTOMER_BIRTH_YEAR');

  }

  void clearScreen() {

    setState(() {
    _firstNameCtr.text = "";
    _middleNameCtr.text = "";
    _lastNameCtr.text = "";
    _dobNameCtr.text = "";
    _anniversaryCtr.text = "";
    _membershipCtr.text = "";
    _nickNameCtr.text = "";
    _uniqueIdentifierCtr.text = "";
    _companyCtr.text = "";
    _designationCtr.text = "";
    _taxCodeCtr.text = "";
    _notesCtr.text = "";
    _externalSysRefCtr.text = "";
    _channelCtr.text = "";
    _userNameCtr.text = "";

    _rightHanded = false;
    _teamUser = false;
    _verified = false;
    
    for(int i = 0 ; i < _phoneList.length ; i++){
      _phoneCtr?[i].text = "";
      _isDefaultPhone?[i] = false;
    }
    for(int i = 0 ; i < _emailList.length ; i++){
      _emailCtr?[i].text = "";
      _isDefaultMail?[i] = false;
    }
    for(int i = 0 ; i < _fbList.length ; i++){
      _fbCtr?[i].text = "";
      _fbTokenCtr?[i].text = "";
    }
    for(int i = 0 ; i < _twitterList.length ; i++){
      _twitterCtr?[i].text = "";
      _twitterCodeCtr?[i].text = "";
    }
    for(int i = 0 ; i < _wechatList.length ; i++){
      _wechatCtr?[i].text = "";
    }
    for(int i = 0 ; i < _addressList.length ; i++){
      _emailCtr?[i].text = "";
      _line1Ctr?[i].text = "";
      _line2Ctr?[i].text = "";
      _line3Ctr?[i].text = "";
      _cityCtr?[i].text = "";
      _postalCodeCtr?[i].text = "";
    }

    });
  }
}