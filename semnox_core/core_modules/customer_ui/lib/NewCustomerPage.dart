import 'package:customer_data/builder.dart';
import 'package:customer_data/models/address_dto.dart';
import 'package:customer_data/models/contact_dto.dart';
import 'package:customer_data/models/customer_data.dart';
import 'package:customer_ui/providers/SelectedCustomerProvider.dart';
import 'package:customer_ui/utils/AppStyle.dart';
import 'package:customer_ui/utils/extensions.dart';
import 'package:customer_ui/widgets/CustomerButtonWidget.dart';
import 'package:customer_ui/widgets/CustomerDatePicker.dart';
import 'package:customer_ui/widgets/CustomerFormWidget.dart';
import 'package:customer_ui/widgets/IdProofWidget.dart';
import 'package:customer_ui/widgets/NewCustomerTitle.dart';
import 'package:dio/dio.dart';
import 'package:execution_context/builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:logs_data/logger.dart';
import 'package:messages_data/builder.dart';
import 'package:provider/provider.dart';
import 'package:themes_library/themes_library.dart';
import 'package:image_picker/image_picker.dart';
import 'widgets/ContactWidget.dart';
import 'widgets/VerfiedCheckBox.dart';

class NewCustomerPage extends StatefulWidget {
  final Function(CustomerData?)? onNewCustomerCreated;
  final Function()? onCancelTapped;
  final bool isShowHeader;

  const NewCustomerPage(
      {super.key, this.onNewCustomerCreated, this.onCancelTapped, required this.isShowHeader});

  @override
  State<NewCustomerPage> createState() => _NewCustomerPageState();
}

class _NewCustomerPageState extends State<NewCustomerPage> {
  final _firstNameCtr = TextEditingController();
  final _middleNameCtr = TextEditingController();
  final _lastNameCtr = TextEditingController();
  final _dobNameCtr = TextEditingController();
  final _membershipCtr = TextEditingController();
  final List<String> _phoneList = [
    "",
  ];
  final List<String> _emailList = [""];
  final List<String> _addressList = [""];
  List<TextEditingController>? _phoneCtr;
  List<TextEditingController>? _emailCtr;
  List<TextEditingController>? _addressCtr;
  bool _isLoading = false;
  final _formKey = GlobalKey<FormState>();

  ImagePicker picker = ImagePicker();
  XFile? image;

  @override
  void initState() {
    super.initState();
    image = null;
    _phoneCtr = List.generate(_phoneList.length, (i) => TextEditingController());
    _emailCtr = List.generate(_emailList.length, (i) => TextEditingController());
    _addressCtr = List.generate(_addressList.length, (i) => TextEditingController());
  }

  @override
  Widget build(BuildContext context) {
    SemnoxTheme theme = Theme.of(context).extension<SemnoxTheme>()!;
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: theme.backGroundColor,
        appBar:widget.isShowHeader? AppBar(
          backgroundColor: theme.button1BG1,
          elevation: 0,
          leading: Container(
            color: Colors.black,
            padding: const EdgeInsets.all(8.0),
            margin: const EdgeInsets.only(right: 10.0),
            child: IconButton(
              icon: Image.asset('assets/back_arrow_white.png'),
              iconSize: 20.0,
              onPressed: () {
                Navigator.pop(context);
                widget.onCancelTapped!();
              },
            ),
          ),
        ):PreferredSize(preferredSize:const Size(0.0, 0.0),child: Container(),),
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                NewCustomerTitle(MessagesProvider.get("Primary Details")),
                Container(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            CustomerFormWidget(
                              title: MessagesProvider.get("*") +
                                  MessagesProvider.get("First Name"),
                              hint: MessagesProvider.get("Enter") +
                                  MessagesProvider.get("First Name"),
                              controller: _firstNameCtr,
                              enable: true,
                              validation: MessagesProvider.get("Enter") +
                                  MessagesProvider.get("First Name"),
                              maxLength: 50,
                            ),
                            CustomerFormWidget(
                              title: MessagesProvider.get("Last Name"),
                              hint: MessagesProvider.get("Enter") +
                                  MessagesProvider.get("Last Name"),
                              controller: _lastNameCtr,
                              enable: true,
                              maxLength: 50,
                            ),
                            CustomerFormWidget(
                              title: MessagesProvider.get("Membership"),
                              hint: MessagesProvider.get("Membership"),
                              controller: _membershipCtr,
                              enable: false,
                              maxLength: 50,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 8.0,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomerFormWidget(
                              title: MessagesProvider.get("Middle Name"),
                              hint: MessagesProvider.get("enter") +
                                  MessagesProvider.get("Middle Name"),
                              controller: _middleNameCtr,
                              enable: true,
                              maxLength: 50,
                            ),
                            CustomerDatePicker(
                                title : MessagesProvider.get("Birth Date"),
                                hint : MessagesProvider.get("DD-MM-YYYY"),
                                controller : _dobNameCtr,
                                isBrithDate : true),
                            VerifiedCheckBox(
                              title: MessagesProvider.get("Verified"),
                              enable: false,
                              onCheck: (value) {
                                //_isChecked = value;
                              },
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 8.0,
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            IdProofWidget(
                                title : MessagesProvider.get("Id Proof"),
                                image: image.toString(),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                NewCustomerTitle(MessagesProvider.get("Contact")),
                Container(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                          child: ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              physics: const ScrollPhysics(),
                              itemCount: _phoneList.length,
                              key: UniqueKey(),
                              itemBuilder: (BuildContext context, int index) {
                                return ContactWidget(
                                  title: MessagesProvider.get("Phone"),
                                  hint: MessagesProvider.get(
                                      "Enter Phone (Mandatory)"),
                                  validationText: MessagesProvider.get(
                                      "Enter Phone (Mandatory)"),
                                  keyboardType: TextInputType.number,
                                  maxLength: 13,
                                  inputFormatter:
                                      FilteringTextInputFormatter.allow(
                                          RegExp("[-0-9+().]")),
                                  controller: _phoneCtr?[index],
                                  onAdd: () {
                                    setState(() {
                                      _phoneList
                                          .add(MessagesProvider.get("Phone"));
                                      _phoneCtr = List.generate(
                                          _phoneList.length,
                                          (i) => TextEditingController());
                                    });
                                  },
                                  onRemove: () {
                                    setState(() {
                                      if (_phoneList.length > 1) {
                                        _phoneList.removeAt(index);
                                      }
                                      _phoneCtr = List.generate(
                                          _phoneList.length,
                                          (i) => TextEditingController());
                                    });
                                  },
                                );
                              })),
                      const SizedBox(
                        width: 8.0,
                      ),
                      Expanded(
                        child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            physics: const ScrollPhysics(),
                            itemCount: _emailList.length,
                            key: UniqueKey(),
                            itemBuilder: (BuildContext context, int index) {
                              return ContactWidget(
                                title: MessagesProvider.get("Email"),
                                hint: MessagesProvider.get(
                                    "Enter Email(Mandatory)"),
                                validationText: MessagesProvider.get(
                                    "Enter Email(Mandatory)"),
                                controller: _emailCtr?[index],
                                onAdd: () {
                                  setState(() {
                                    _emailList
                                        .add(MessagesProvider.get("Email"));
                                    _emailCtr = List.generate(_emailList.length,
                                        (i) => TextEditingController());
                                  });
                                },
                                onRemove: () {
                                  setState(() {
                                    if (_emailList.length > 1) {
                                      _emailList.removeAt(index);
                                    }
                                    _emailCtr = List.generate(_emailList.length,
                                        (i) => TextEditingController());
                                  });
                                },
                              );
                            }),
                      ),
                    ],
                  ),
                ),
                NewCustomerTitle(MessagesProvider.get("Address")),
                Container(
                  padding: const EdgeInsets.all(10.0),
                  child: SingleChildScrollView(
                      child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          physics: const ScrollPhysics(),
                          itemCount: _addressList.length,
                          key: UniqueKey(),
                          itemBuilder: (BuildContext context, int index) {
                            return ContactWidget(
                              title: MessagesProvider.get("PostalCode"),
                              hint: MessagesProvider.get("Enter") +
                                  MessagesProvider.get("PostalCode"),
                              controller: _addressCtr?[index],
                              onAdd: () {
                                setState(() {
                                  _addressList
                                      .add(MessagesProvider.get("PostalCode"));
                                  _addressCtr = List.generate(
                                      _addressList.length,
                                      (i) => TextEditingController());
                                });
                              },
                              onRemove: () {
                                setState(() {
                                  if (_addressList.length > 1) {
                                    _addressList.removeAt(index);
                                  }
                                  _addressCtr = List.generate(
                                      _addressList.length,
                                      (i) => TextEditingController());
                                });
                              },
                            );
                          })),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustomerButtonWidget(
                      text: MessagesProvider.get("Save"),
                      onPress: () {
                        if (_formKey.currentState!.validate()) {
                          _save();
                        }
                        FocusScope.of(context).requestFocus(FocusNode());
                      },
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ).withLoader(isLoading: _isLoading, theme: theme),
    );
  }

  void _save() async {
    _setLoadingStatus(true);
    final execContextBL = await ExecutionContextBuilder.build();
    final executionContextDTO = execContextBL.getExecutionContext();
    final customerSearchBL =
        await CustomerDataBuilder.build(executionContextDTO!);

    DateFormat dateFormat = DateFormat('dd-MM-yyyy');
    DateTime tempDate = dateFormat.parse(_dobNameCtr.text);
    String dob = DateFormat("yyyy-MM-ddTHH:mm:ss").format(tempDate);

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
          line1: "",
          line2: "",
          city: "",
          stateId: -1,
          postalCode: _addressCtr?[index].text.toString(),
          countryId: -1,
          isActive: true,
          contactDTOList: [],
          creationDate: "",
          isChanged: false,
          isDefault: true,
          isChangedRecursive: false,
          lastUpdateDate: "",
          lastUpdatedBy: "",
          masterEntityId: -1,
          siteId: -1,
          synchStatus: false);
      addressList.add(address);
    });

    try {
      Log.printMethodStart('registerCustomer()', 'New Customer Screen','Save');
      var response = await customerSearchBL.registerCustomer(
          title : "Mr",
          firstName: _firstNameCtr.text,
          middleName: _middleNameCtr.text,
          lastName: _lastNameCtr.text,
          dob: dob,
          policyTermsAccepted: false,
          contactList: contactList,
          addressList: addressList);
      Log.printMethodEnd('registerCustomer()', 'New Customer Screen','Save');
      if (response.exception == null) {
        Log.printMethodReturn('registerCustomer() - Register Customer done!', 'New Customer Screen','Save');
        _setLoadingStatus(false);
        context.read<SelectedCustomer>().updateData(response.data);
        Navigator.pop(context);
        widget.onNewCustomerCreated!(response.data);
      }
    } on DioError catch (error) {
      _setLoadingStatus(false);
      var errorString = error.response?.data['data'] as String?;
      Future.microtask(
          () => _showErrorDialog(context, 'Error', errorString ?? ''));
    }
  }

  void _setLoadingStatus(bool status) {
    setState(() {
      _isLoading = status;
    });
  }

  _showErrorDialog(BuildContext context, String title, String message) {
    showDialog(
        context: context,
        builder: (_) => CupertinoAlertDialog(
              title: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  title,
                  style: AppStyle.titleStyle,
                ),
              ),
              content: Text(
                message,
                style: AppStyle.titleStyle,
              ),
              actions: [
                CupertinoDialogAction(
                  child: Text(
                    MessagesProvider.get("OK"),
                    style: AppStyle.titleStyle,
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
}
