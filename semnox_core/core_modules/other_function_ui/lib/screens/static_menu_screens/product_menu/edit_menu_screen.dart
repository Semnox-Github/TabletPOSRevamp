import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:notificationbar_ui/NotificationBar.dart';
import 'package:other_function_data/model/menu/menu_data.dart';
import 'package:other_function_ui/bloc/cubits/product_menu/edit_product_menu/edit_product_menu_cubit.dart';
import 'package:other_function_ui/bloc/cubits/product_menu/edit_product_menu/edit_product_menu_state.dart';
import 'package:messages_data/builder.dart';
import 'package:themes_library/themes_library.dart';
import 'package:widgets_library/error_alert_dialog.dart';
import 'package:widgets_library/scroller.dart';
import '../../../utils/constants.dart';
import '../../../widgets/colors.dart';
import '../../widgets/primary_dark_button.dart';
import '../../widgets/primary_light_button.dart';
import 'package:widgets_library/utils/size_config.dart';

class EditProductMenuDialog extends StatelessWidget {
  const EditProductMenuDialog({Key? key, required this.isNew, this.menuDto, this.onSuccess, required this.dateFormat})
      : super(key: key);
  final bool isNew;
  final MenuDto? menuDto;
  final Function? onSuccess;
  final String? dateFormat;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(

        providers: [
          BlocProvider<EditProductMenuCubit>(
              create:(context) =>EditProductMenuCubit()
          ),
        ],
        child: EditProductMenuDialogSection(isNew: isNew,menuDto: menuDto,onSuccess:onSuccess, dateFormat:dateFormat));
  }
}

class EditProductMenuDialogSection extends StatefulWidget {
  const EditProductMenuDialogSection({Key? key, required this.isNew, this.menuDto, this.onSuccess, required this.dateFormat})
      : super(key: key);
  final bool isNew;
  final MenuDto? menuDto;
  final Function? onSuccess;
  final String? dateFormat;


  @override
  State<EditProductMenuDialogSection> createState() => _EditProductMenuDialogSectionState();
}

class _EditProductMenuDialogSectionState extends State<EditProductMenuDialogSection> {
  Size _screenSize = const Size(0, 0);
  double _screenWidth = 0.0;
  double _screenHeight = 0.0;
  NotificationBar? _notificationBar;
  ScrollController _scrollController = ScrollController();
  TextEditingController _descriptionController = TextEditingController();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _startDateController = TextEditingController();
  TextEditingController _endDateController = TextEditingController();
  List<String> _panelTypeList = ["Order Sale", "Reservation", "Redemption"];
  String _selectedOrderType = 'Order Sale';
  DateTime _startDateTime = DateTime.now();
  DateTime _endDateTime = DateTime.now();
  MenuDto? _menuDto;
  late SemnoxTheme _theme;

  MenuDto _defaultMenuDto = const MenuDto(
      menuId: -1,
      name: "",
      description: "",
      type: "",
      startDate: null,
      endDate: null,
      isActive: true,
      createdBy: '',
      creationDate: "0001-01-01T00:00:00",
      lastUpdatedBy: '',
      lastUpdateDate: "0001-01-01T00:00:00",
      siteId: -1,
      masterEntityId: -1,
      synchStatus: false,
      guid: '',
      productMenuPanelMappingDtoList: [],
      isChanged: true,
      isChangedRecursive: true);

  String _getMenuType(String selectedDropDown) {
    switch (selectedDropDown) {
      case "Order Sale":
        return "O";
      case "Reservation":
        return "B";
      case "Redemption":
        return "R";
      default:
        return "O";
    }
  }

  Future<void> _selectStartDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        builder: (context, child) {
          return Theme(
            data: Theme.of(context).copyWith(
              colorScheme:  ColorScheme.light(
                primary: KColor.primaryBlack, // <-- SEE HERE
                // onPrimary: KColor.primaryBlack, // <-- SEE HERE
                // onSurface:  KColor.primaryBlack, // <-- SEE HERE
              ),
              textButtonTheme: TextButtonThemeData(
                style: TextButton.styleFrom(
                  foregroundColor: KColor.primaryBlack, // button text color
                ),
              ),
            ),
            child: child!,
          );
        },
        context: context,
        initialDate: _startDateTime,
        firstDate: DateTime(2000),
        lastDate: DateTime(2101));
    if (picked != null && picked != _startDateTime) {
      setState(() {
        _startDateTime = picked;
        _startDateController.text =
            '${_getDateWithProperFormat(_startDateTime)}';
      });
    }
  }

  Future<void> _selectEndDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        builder: (context, child) {
          return Theme(
            data: Theme.of(context).copyWith(
              colorScheme:  ColorScheme.light(
                primary: KColor.primaryBlack, // <-- SEE HERE
                // onPrimary: KColor.primaryBlack, // <-- SEE HERE
                // onSurface:  KColor.primaryBlack, // <-- SEE HERE
              ),
              textButtonTheme: TextButtonThemeData(
                style: TextButton.styleFrom(
                  foregroundColor: KColor.primaryBlack, // button text color// button text color
                ),
              ),
            ),
            child: child!,
          );
        },
        context: context,
        initialDate: _startDateTime,
        firstDate: _startDateTime,
        lastDate: DateTime(2101));
    if (picked != null && picked != _endDateTime) {
      setState(() {
        _endDateTime = picked;
        _endDateController.text =
            '${_getDateWithProperFormat(_endDateTime)}';
      });
    }
  }

  String _getDateWithProperFormat(DateTime dateTime){
   return  DateFormat(widget.dateFormat).format(dateTime);
  }

  @override
  void initState() {
    _notificationBar = NotificationBar(showHideSideBar: false);
    context.read<EditProductMenuCubit>().setInitialValues(isActive: widget.isNew?false: widget.menuDto?.isActive);
    if (!widget.isNew) {
      _nameController.text = widget.menuDto?.name ?? '';
      _descriptionController.text = widget.menuDto?.description ?? '';
      try {
        print("startDate ${widget.menuDto?.startDate}");
        if (widget.menuDto?.startDate != null ||
            (widget.menuDto?.startDate ?? '').isNotEmpty) {
          _startDateTime = DateTime.tryParse(widget.menuDto?.startDate ?? '') ??
              DateTime.now();
          _startDateController.text = (widget.menuDto?.startDate ?? '')
              .split("T")[0]
              .split("-")
              .reversed
              .join("-");
        }
      } catch (err) {}
      try {
        print("endDate ${widget.menuDto?.endDate}");
        if (widget.menuDto?.endDate != null ||
            (widget.menuDto?.endDate ?? '').isNotEmpty) {
          _endDateTime = DateTime.tryParse(widget.menuDto?.endDate ?? '') ??
              DateTime.now();
          _endDateController.text = (widget.menuDto?.endDate ?? '')
              .split("T")[0]
              .split("-")
              .reversed
              .join("-");
        }
      } catch (err) {}
      // _startDateTime = DateTime(year);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _screenSize = MediaQuery.of(context).size;
    _screenWidth = _screenSize.width;
    _screenHeight = _screenSize.height;
    _theme = Theme.of(context).extension<SemnoxTheme>()!;
    SizeConfig.init(context);
    return Material(
      color: _theme.transparentColor,
      child: Stack(
        children: [
          Scaffold(
            bottomNavigationBar: SizedBox(
              width: _screenWidth,
              child: Container(
                child: _notificationBar,
              ),
            ),
            backgroundColor: KColor.transparentColor,
            resizeToAvoidBottomInset: false,
            body: Column(
              children: [
                Padding(
                  padding:  EdgeInsets.only(top: SizeConfig.getSize(8), right: SizeConfig.getSize(8), left: SizeConfig.getSize(8)),
                  child: Container(
                    decoration:  BoxDecoration(
                      color:_theme.backGroundColor,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(SizeConfig.getSize(8)), topLeft: Radius.circular(SizeConfig.getSize(8))),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 0.1,
                                    blurRadius: .1,
                                    offset: const Offset(
                                        0, 2), // changes position of shadow
                                  ),
                                ],
                                color: _theme.button2InnerShadow1,
                                borderRadius:  BorderRadius.only(
                                    bottomRight: Radius.circular(SizeConfig.getSize(8)),
                                    topLeft: Radius.circular(SizeConfig.getSize(8)))),
                            height: SizeConfig.getSize(64),
                            // width:5,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                 SizedBox(
                                  width: SizeConfig.getSize(10),
                                ),
                                 Icon(
                                  Icons.arrow_back_ios,
                                  color: _theme.light1,
                                  size: SizeConfig.getSize(25),
                                ),
                                 SizedBox(
                                  width: SizeConfig.getSize(8),
                                ),
                                Text(
                                  widget.isNew
                                      ? MessagesProvider.get('Create New Product Menu')
                                          .toUpperCase()
                                      : MessagesProvider.get(
                                              'Edit Product Menu Details')
                                          .toUpperCase(),
                                  style: _theme.headingLight2!.copyWith(color:_theme.light1, fontSize:SizeConfig.getFontSize(26)),
                                ),
                                 SizedBox(
                                  width: SizeConfig.getSize(8),
                                ),
                              ],
                            ),
                          ),
                        ),
                         SizedBox(
                          width: SizeConfig.getSize(8),
                        ),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 0.2,
                                    blurRadius: .2,
                                    offset: const Offset(
                                        0, 2), // changes position of shadow
                                  ),
                                ],
                                color: _theme.button1BG1,
                                borderRadius:  BorderRadius.only(
                                    bottomLeft: Radius.circular(8),
                                    topRight: Radius.circular(8))),
                            height:SizeConfig.getSize(64),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: CustomScrollView(
                    //Instead of ListView or SingleChildScrollView put CustomScrollVIew to use Expanded or spacer
                    scrollDirection: Axis.vertical,
                    physics: const NeverScrollableScrollPhysics(),
                    slivers: [
                      SliverFillRemaining(
                        hasScrollBody: true,
                        child: Padding(
                          padding:
                               EdgeInsets.only(left: SizeConfig.getSize(8), right: SizeConfig.getSize(8), bottom: 0),
                          child: Container(
                            decoration:  BoxDecoration(
                              color: _theme.backGroundColor,
                            ),
                            child: Scroller(
                              controller: _scrollController,
                              child: SingleChildScrollView(
                                controller: _scrollController,
                                child: Padding(
                                  padding:  EdgeInsets.fromLTRB(SizeConfig.getSize(24), SizeConfig.getSize(16), 30, SizeConfig.getSize(8)),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      SizedBox(
                                        child: IntrinsicHeight(
                                          child: Row(
                                            children: [
                                              Expanded(
                                                  child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "*${MessagesProvider.get('Name')}",
                                                    style: _theme.heading5!.copyWith(fontSize:SizeConfig.getFontSize(18)),
                                                  ),
                                                   SizedBox(
                                                    height: SizeConfig.getSize(8),
                                                  ),
                                                  Expanded(
                                                    child: SizedBox(
                                                      height: SizeConfig.getSize(52),
                                                      child: TextFormField(
                                                        controller: _nameController,
                                                        inputFormatters: [
                                                          LengthLimitingTextInputFormatter(
                                                              51)
                                                        ],
                                                        keyboardType:
                                                            TextInputType.text,
                                                        style: _theme.subtitle1!.copyWith(fontSize:SizeConfig.getFontSize(18)),
                                                        readOnly: false,
                                                        decoration: AppDecorations
                                                            .textFieldInputDecoration
                                                            .copyWith(
                                                          hintText: MessagesProvider.get('Enter Text'), filled: true,
                                                          fillColor: _theme.primaryColor,
                                                          contentPadding: EdgeInsets.only(
                                                            top: 0,
                                                            bottom: 0,
                                                            right: SizeConfig.getSize(10),
                                                            left: SizeConfig.getSize(10),
                                                          ),
                                                          border: OutlineInputBorder(
                                                              borderRadius: BorderRadius.all(
                                                                  Radius.circular(SizeConfig.getSize(8))),
                                                              borderSide: BorderSide(
                                                                  color: _theme.secondaryColor!)),
                                                          focusedBorder: OutlineInputBorder(
                                                              borderRadius: BorderRadius.all(
                                                                  Radius.circular(SizeConfig.getSize(8))),
                                                              borderSide: BorderSide(
                                                                  color: _theme.secondaryColor!)),
                                                          enabledBorder: OutlineInputBorder(
                                                              borderRadius: BorderRadius.all(
                                                                  Radius.circular(SizeConfig.getSize(8))),
                                                              borderSide: BorderSide(
                                                                  color: _theme.secondaryColor!)),
                                                          hintStyle: _theme.textFieldHintStyle!.copyWith(
                                                              fontSize: SizeConfig.getFontSize(18)),
                                                        ),
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              )),
                                               SizedBox(
                                                width: SizeConfig.getSize(10),
                                              ),
                                              Expanded(
                                                  child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    MessagesProvider.get(
                                                        'Description'),
                                                    style: _theme.heading5!.copyWith(fontSize:SizeConfig.getFontSize(18)),
                                                  ),
                                                   SizedBox(
                                                    height: SizeConfig.getSize(8),
                                                  ),
                                                  Expanded(

                                                    child: SizedBox(
                                                      height: SizeConfig.getSize(52),
                                                      child: TextFormField(
                                                        controller:
                                                            _descriptionController,
                                                        inputFormatters: [
                                                          LengthLimitingTextInputFormatter(
                                                              51)
                                                          // FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}'))
                                                        ],
                                                        keyboardType:
                                                            TextInputType.text,
                                                        style:_theme.subtitle1!.copyWith(fontSize:SizeConfig.getFontSize(18)),
                                                        readOnly: false,
                                                        decoration: AppDecorations
                                                            .textFieldInputDecoration
                                                            .copyWith(
                                                          hintText: MessagesProvider.get('Enter Text'), filled: true,
                                                          fillColor: _theme.primaryColor,
                                                          contentPadding: EdgeInsets.only(
                                                            top: 0,
                                                            bottom: 0,
                                                            right: SizeConfig.getSize(10),
                                                            left: SizeConfig.getSize(10),
                                                          ),
                                                          border: OutlineInputBorder(
                                                              borderRadius: BorderRadius.all(
                                                                  Radius.circular(SizeConfig.getSize(8))),
                                                              borderSide: BorderSide(
                                                                  color: _theme.secondaryColor!)),
                                                          focusedBorder: OutlineInputBorder(
                                                              borderRadius: BorderRadius.all(
                                                                  Radius.circular(SizeConfig.getSize(8))),
                                                              borderSide: BorderSide(
                                                                  color: _theme.secondaryColor!)),
                                                          enabledBorder: OutlineInputBorder(
                                                              borderRadius: BorderRadius.all(
                                                                  Radius.circular(SizeConfig.getSize(8))),
                                                              borderSide: BorderSide(
                                                                  color: _theme.secondaryColor!)),
                                                          hintStyle: _theme.textFieldHintStyle!.copyWith(
                                                              fontSize: SizeConfig.getFontSize(18)),
                                                        ),
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ))
                                            ],
                                          ),
                                        ),
                                      ),
                                       SizedBox(
                                        height: SizeConfig.getSize(24),
                                      ),
                                      SizedBox(
                                        child: IntrinsicHeight(
                                          child: Row(
                                            children: [
                                              Expanded(
                                                  child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    MessagesProvider.get('Panel Type'),
                                                    style: _theme.heading5!.copyWith(fontSize:SizeConfig.getFontSize(18)),
                                                  ),
                                                   SizedBox(
                                                    height: SizeConfig.getSize(8),
                                                  ),
                                                  SizedBox(
                                                    height: SizeConfig.getSize(52),
                                                    child: DropdownButtonFormField(
                                                      onChanged: (v){},
                                                      items: _panelTypeList.map<
                                                              DropdownMenuItem<String>>(
                                                          (String value) {
                                                        return DropdownMenuItem<String>(
                                                          value: value,
                                                          child: Padding(
                                                            padding:
                                                                 EdgeInsets.only(
                                                                    left: SizeConfig.getSize(8)),
                                                            child: Text(value),
                                                          ),
                                                        );
                                                      }).toList(),
                                                      value: _selectedOrderType,
                                                      hint: Text(
                                                        MessagesProvider.get('Type'),
                                                        style: _theme.textFieldHintStyle!.copyWith(
                                                            fontSize: SizeConfig.getFontSize(18))
                                                      ),
                                                      style:_theme.subtitle1!.copyWith(fontSize:SizeConfig.getFontSize(18)),
                                                      isDense: true,
                                                      decoration: AppDecorations
                                                          .textFieldInputDecoration
                                                          .copyWith(
                                                        hintText: MessagesProvider.get('Enter Text'), filled: true,
                                                        fillColor: _theme.primaryColor,
                                                        contentPadding: EdgeInsets.only(
                                                          top: 0,
                                                          bottom: 0,
                                                          right: SizeConfig.getSize(10),
                                                          left: SizeConfig.getSize(10),
                                                        ),
                                                        border: OutlineInputBorder(
                                                            borderRadius: BorderRadius.all(
                                                                Radius.circular(SizeConfig.getSize(8))),
                                                            borderSide: BorderSide(
                                                                color: _theme.secondaryColor!)),
                                                        focusedBorder: OutlineInputBorder(
                                                            borderRadius: BorderRadius.all(
                                                                Radius.circular(SizeConfig.getSize(8))),
                                                            borderSide: BorderSide(
                                                                color: _theme.secondaryColor!)),
                                                        enabledBorder: OutlineInputBorder(
                                                            borderRadius: BorderRadius.all(
                                                                Radius.circular(SizeConfig.getSize(8))),
                                                            borderSide: BorderSide(
                                                                color: _theme.secondaryColor!)),
                                                        hintStyle: _theme.textFieldHintStyle!.copyWith(
                                                            fontSize: SizeConfig.getFontSize(18)),),
                                                      icon: SizedBox(
                                                        height:SizeConfig.getSize(30),
                                                        width:SizeConfig.getSize(30),
                                                        child: Image.asset(
                                                            'assets/down_arrow_white.png',
                                                            color: _theme.secondaryColor),
                                                      ),
                                                      // isExpanded: true,
                                                    ),
                                                  ),
                                                ],
                                              )),
                                               SizedBox(
                                                width: SizeConfig.getSize(12),
                                              ),
                                              Expanded(
                                                  child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    MessagesProvider.get('Start Date'),
                                                    style:_theme.heading5!.copyWith(fontSize:SizeConfig.getFontSize(18)),
                                                  ),
                                                   SizedBox(
                                                    height: SizeConfig.getSize(8),
                                                  ),
                                                  Expanded(
                                                    child: SizedBox(
                                                      height:SizeConfig.getSize(52),
                                                      child: TextFormField(
                                                        controller:
                                                            _startDateController,
                                                        inputFormatters: [
                                                          LengthLimitingTextInputFormatter(
                                                              51)
                                                          // FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}'))
                                                        ],
                                                        onTap: () {
                                                          _selectStartDate(context);
                                                        },
                                                        keyboardType:
                                                            TextInputType.text,
                                                        style:_theme.subtitle1!.copyWith(fontSize:SizeConfig.getFontSize(18)),
                                                        readOnly: true,
                                                        decoration: AppDecorations
                                                            .textFieldInputDecoration
                                                            .copyWith(
                                                          filled: true,
                                                          fillColor: _theme.primaryColor,
                                                          hintText: MessagesProvider.get(
                                                              'Enter Start Date',
                                                            ),
                                                          contentPadding: EdgeInsets.only(
                                                            top: 0,
                                                            bottom: 0,
                                                            right: SizeConfig.getSize(10),
                                                            left: SizeConfig.getSize(10),
                                                          ),
                                                          border: OutlineInputBorder(
                                                              borderRadius: BorderRadius.all(
                                                                  Radius.circular(SizeConfig.getSize(8))),
                                                              borderSide: BorderSide(
                                                                  color: _theme.secondaryColor!)),
                                                          focusedBorder: OutlineInputBorder(
                                                              borderRadius: BorderRadius.all(
                                                                  Radius.circular(SizeConfig.getSize(8))),
                                                              borderSide: BorderSide(
                                                                  color: _theme.secondaryColor!)),
                                                          enabledBorder: OutlineInputBorder(
                                                              borderRadius: BorderRadius.all(
                                                                  Radius.circular(SizeConfig.getSize(8))),
                                                              borderSide: BorderSide(
                                                                  color: _theme.secondaryColor!)),
                                                          hintStyle: _theme.textFieldHintStyle!.copyWith(
                                                              fontSize: SizeConfig.getFontSize(18)),

                                                          suffixIcon: SizedBox(
                                                            height:SizeConfig.getSize(30),
                                                            width:SizeConfig.getSize(30),
                                                            child: Image.asset(
                                                                "assets/ic_date.png",
                                                                color: _theme.secondaryColor),
                                                          ),
                                                        ),


                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ))
                                            ],
                                          ),
                                        ),
                                      ),
                                       SizedBox(
                                        height: SizeConfig.getSize(24),
                                      ),
                                      SizedBox(
                                        child: IntrinsicHeight(
                                          child: Row(
                                            children: [
                                              Expanded(
                                                  child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    MessagesProvider.get('End Date'),
                                                    style: _theme.heading5!.copyWith(fontSize:SizeConfig.getFontSize(18)),
                                                  ),
                                                   SizedBox(
                                                    height: SizeConfig.getSize(8),
                                                  ),
                                                  Expanded(
                                                    child: SizedBox(height:SizeConfig.getSize(52),
                                                      child: TextFormField(
                                                        controller: _endDateController,
                                                        inputFormatters: [
                                                          LengthLimitingTextInputFormatter(
                                                              51)
                                                          // FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}'))
                                                        ],
                                                        onTap: () {
                                                          _selectEndDate(context);
                                                        },
                                                        keyboardType:
                                                            TextInputType.text,
                                                        style:_theme.subtitle1!.copyWith(fontSize:SizeConfig.getFontSize(18)),
                                                        readOnly: true,
                                                        decoration: AppDecorations
                                                            .textFieldInputDecoration
                                                            .copyWith(filled: true,
                                                          fillColor: _theme.primaryColor,
                                                          contentPadding: EdgeInsets.only(
                                                            top: 0,
                                                            bottom: 0,
                                                            right: SizeConfig.getSize(10),
                                                            left: SizeConfig.getSize(10),
                                                          ),
                                                          border: OutlineInputBorder(
                                                              borderRadius: BorderRadius.all(
                                                                  Radius.circular(SizeConfig.getSize(8))),
                                                              borderSide: BorderSide(
                                                                  color: _theme.secondaryColor!)),
                                                          focusedBorder: OutlineInputBorder(
                                                              borderRadius: BorderRadius.all(
                                                                  Radius.circular(SizeConfig.getSize(8))),
                                                              borderSide: BorderSide(
                                                                  color: _theme.secondaryColor!)),
                                                          enabledBorder: OutlineInputBorder(
                                                              borderRadius: BorderRadius.all(
                                                                  Radius.circular(SizeConfig.getSize(8))),
                                                              borderSide: BorderSide(
                                                                  color: _theme.secondaryColor!)),
                                                          hintStyle: _theme.textFieldHintStyle!.copyWith(
                                                              fontSize: SizeConfig.getFontSize(18)),
                                                          hintText: MessagesProvider.get(
                                                              'Enter End Date'),
                                                          suffixIcon: SizedBox(
                                                            height:SizeConfig.getSize(30),
                                                            width:SizeConfig.getSize(30),
                                                            child: Image.asset(
                                                                "assets/ic_date.png",
                                                                color: _theme.secondaryColor),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              )),
                                               SizedBox(
                                                width: SizeConfig.getSize(12),
                                              ),
                                              Expanded(
                                                  child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    '${MessagesProvider.get('Active')}?',
                                                    style: _theme.heading5!.copyWith(fontSize:SizeConfig.getFontSize(18)),
                                                  ),
                                                   SizedBox(
                                                    height: SizeConfig.getSize(8),
                                                  ),
                                                  BlocConsumer<EditProductMenuCubit,
                                                          EditProductMenuState>(
                                                      listener: (context, state) {},
                                                      builder: (context, menuState) {
                                                        return Align(
                                                          alignment:
                                                              Alignment.bottomLeft,
                                                          child: InkWell(
                                                            onTap: () {
                                                              context.read<EditProductMenuCubit>().onClickActiveButton();
                                                            },
                                                            child: Container(
                                                              width: SizeConfig.getSize(52),
                                                              height: SizeConfig.getSize(52),
                                                              decoration: BoxDecoration(
                                                                  borderRadius:
                                                                       BorderRadius
                                                                              .all(
                                                                          Radius
                                                                              .circular(
                                                                              SizeConfig.getSize(8))),
                                                                  border: Border.all(
                                                                      color: _theme.secondaryColor!)),
                                                              child: Center(
                                                                  child: menuState
                                                                          .isActive
                                                                      ?  Icon(
                                                                          Icons.check,
                                                                          size: SizeConfig.getSize(30),
                                                                          color: _theme.secondaryColor,
                                                                        )
                                                                      : const SizedBox()),
                                                            ),
                                                          ),
                                                        );
                                                      }),
                                                ],
                                              ))
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:  EdgeInsets.only(bottom: SizeConfig.getSize(8), right: SizeConfig.getSize(8), left: SizeConfig.getSize(8)),
                  child: Container(
                    decoration:  BoxDecoration(
                        color: _theme.backGroundColor,
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(SizeConfig.getSize(8)),
                            bottomLeft: Radius.circular(SizeConfig.getSize(8)))),
                    child: Padding(
                      padding:  EdgeInsets.only(bottom: SizeConfig.getSize(4), top: SizeConfig.getSize(4)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          PrimaryLightButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              title: MessagesProvider.get('Cancel').toUpperCase()),
                           SizedBox(
                            width: SizeConfig.getSize(8),
                          ),
                          BlocConsumer<EditProductMenuCubit, EditProductMenuState>(
                              listener: (context, state) {},
                              builder: (context, menuState) {
                                return PrimaryDarkButton(
                                    onPressed: () {
                                      if (FocusScope.of(context).hasFocus) {
                                        FocusScope.of(context).unfocus();
                                      }
                                      if (_validateTextField()) {
                                        if(_startDateTime.compareTo(_endDateTime) < 0){
                                          if (widget.isNew) {
                                            _menuDto = _defaultMenuDto?.copyWith(
                                                name: _nameController.text,
                                                description:
                                                _descriptionController.text,
                                                startDate:
                                                _startDateTime.toIso8601String(),
                                                endDate: _endDateTime.toIso8601String(),
                                                isActive: menuState.isActive,
                                                type: _getMenuType(_selectedOrderType));
                                          } else {
                                            // print("startDate${ _startDateTime.toIso8601String()}");
                                            // print("endDate${ _endDateTime.toIso8601String()}");
                                            _menuDto = widget.menuDto?.copyWith(
                                                name: _nameController.text,
                                                description:
                                                _descriptionController.text,
                                                startDate:
                                                _startDateTime.toIso8601String(),
                                                endDate: _endDateTime.toIso8601String(),
                                                isActive: menuState.isActive,
                                                type: _getMenuType(_selectedOrderType));
                                          }
                                          context
                                              .read<EditProductMenuCubit>()
                                              .saveProductMenuData(
                                              isNew: widget.isNew,
                                              menuDto: _menuDto!).then((value) {
                                            if(value){
                                              widget.onSuccess!();
                                              Navigator.pop(context);
                                            }
                                          });
                                        }else{
                                         _notificationBar?.showMessage(MessagesProvider.get("Start Date should not be greater than End Date"), _theme.footerBG3!);
                                        }

                                      }
                                    },
                                    title: MessagesProvider.get('OK').toUpperCase());
                              })
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          BlocConsumer<EditProductMenuCubit, EditProductMenuState>(
              listener: (context, state) {
                if (state.isError) {
                  _notificationBar?.showMessage(state.statusMessage.toString(),
                      _theme.footerBG3!);
                  _resetLoaderStatus();
                } else if (state.isSuccess) {
                  _notificationBar?.showMessage(state.statusMessage.toString(),
                      _theme.footerBG4!);
                  _resetLoaderStatus();
                }
              },
              builder: (context, state) {
                if (state.isLoading) {
                  return Positioned(
                      bottom: 0,
                      left: 0,
                      child: Container(
                        width: _screenWidth,
                        height: _screenHeight,
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(.4),
                        ),
                        child: Center(
                          child: Container(
                            decoration:  BoxDecoration(
                                color:_theme.backGroundColor,
                                borderRadius:
                                const BorderRadius.all(Radius.circular(6))),
                            width: SizeConfig.screenWidth * .40,
                            child: Padding(
                              padding:  EdgeInsets.all(SizeConfig.getSize(25)),
                              child: Row(children: [
                                SizedBox(width: SizeConfig.getSize(10)),
                                const CircularProgressIndicator(),
                                SizedBox(width: SizeConfig.getSize(36)),
                                Expanded(
                                  child: Text(
                                    state.loaderMessage ?? '',
                                    maxLines: 2,
                                    style:_theme.title1!.copyWith(fontSize:SizeConfig.getFontSize(26)),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ]),
                            ),
                          ),
                        ),
                      ));
                }
                return const SizedBox();
              }),
        ],
      ),
    );
  }
  void _resetLoaderStatus(){
    context.read<EditProductMenuCubit>().resetLoaderStatus();
  }

  bool _validateTextField(){
    if ( _nameController.text.isEmpty) {
      _showErrorDialog(MessagesProvider.get(
          "Name is required"));
      return false;
    }
    if ( (_nameController.text.trim() != '')&&_nameController.text.length > 50) {
      _showErrorDialog(MessagesProvider.get(
          "Name must be less than 50 characters"));
      return false;
    } else if ((_nameController.text.trim() != '')&&!AppConstants
        .alphanumericRegExpWithSpecialChar
        .hasMatch(
        _nameController.text ?? '')) {
      _showErrorDialog(MessagesProvider.get(
          "Name should not contain any special character"));
      return false;
    } else if (_nameController.text
        .isNotEmpty &&
        _nameController.text.trim() == '') {
      _showErrorDialog( MessagesProvider.get(
          "Empty spaces are not allowed!"));
      return false;
    }
    if ((_descriptionController.text.trim() != '') &&_descriptionController.text.length > 50) {
      _showErrorDialog(MessagesProvider.get(
          "Description must be less than 50 characters"));
      return false;
    } else if ((_descriptionController.text.trim() != '') &&!AppConstants
        .alphanumericRegExpWithSpecialChar
        .hasMatch(
        _descriptionController.text ?? '')) {
      _showErrorDialog(MessagesProvider.get(
          "Description should not contain any special character"));
      return false;
    } else if (_descriptionController.text
        .isNotEmpty &&
        _descriptionController.text.trim() == '') {
      _showErrorDialog(MessagesProvider.get(
          "Empty spaces are not allowed!"));
      return false;
    }else{
      return true;
    }
  }


  _showErrorDialog(String message){
    showDialog(
        barrierDismissible: true,
        context: context,
        builder: (BuildContext newContext) {
          return ErrorAlertDialog(title: 'Error',message:message ,
          );
        });
  }
}
