import 'package:execution_context/builder.dart';
import 'package:execution_context/execution_context_bl.dart';
import 'package:execution_context/models/execution_context_dto.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:master_data/builder.dart';
import 'package:messages_data/builder.dart';
import 'package:notificationbar_ui/NotificationBar.dart';
import 'package:other_function_data/model/menu_panel/menu_panels_data.dart';
import 'package:other_function_data/model/menu_panel/product_menu_panel_content_dto.dart';
import 'package:other_function_ui/screens/static_menu_screens/panels/choose_panels_dialog.dart';
import 'package:other_function_ui/screens/static_menu_screens/panels/widgets/edit_panels_config_widget.dart';
import 'package:other_function_ui/screens/widgets/primary_dark_button.dart';
import 'package:widgets_library/utils/size_config.dart';
import 'package:product_menu_data/models/product_menu_panel_content_container_dto.dart';
import 'package:product_menu_data/models/products_container/product_container_dto.dart';
import 'package:themes_library/themes_library.dart';
import 'package:widgets_library/scroller.dart';
import '../../../bloc/cubits/panels/edit_panels/edit_panels_cubit.dart';
import '../../../bloc/cubits/panels/edit_panels/edit_panels_state.dart';
import '../../../model/FontData.dart';
import 'choose_product_dialog.dart';

class EditPanelScreen extends StatefulWidget {
  const EditPanelScreen({Key? key, this.menuPanelsDto, required this.isNew, this.refreshData})
      : super(key: key);
  final MenuPanelsDto? menuPanelsDto;
  final bool isNew;
  final Function? refreshData;

  @override
  State<EditPanelScreen> createState() => _EditPanelScreenState();
}

class _EditPanelScreenState extends State<EditPanelScreen> {
  Size _screenSize = const Size(0, 0);
  double _screenWidth = 0.0;
  double _screenHeight = 0.0;
  NotificationBar? _notificationBar;
  Map<int, ProductContainerDTO>? _productContainerMap;
  late FontData _fontObj;
  List<String> _split1 = [];
  List<String> _part1  = [];
  List<String> _part2 = [];
  ExecutionContextBLContract? _execContextBL;
  ExecutionContextDTO? _execContext;
  var _masterDataBl;
  List<ProductContainerDTO> _productCotainerList = [];
  List<ProductContainerDTO> _filteredProductContainerList = [];
  List<MenuPanelsDto> _menuPanelsLists = [];
  late SemnoxTheme _theme;
  final _verticalScrollController = ScrollController();
  final _horizontalScrollController = ScrollController();
  double _defaultButtonHeight = 68;
  double _defaultButtonWidth = 138;
  List<ProductContainerDTO> _productList = [];
  List<ProductContainerDTO> _filteredProductList = [];
  List<MenuPanelsDto> _menuPanelsDtoLists = [];
  List<String> _mergedButtons = [];
  List<ProductMenuPanelContentDto>
  _filteredMenuPanelContentListForIndex = [];
  List<ProductMenuPanelContentDto> _filteredMenuPanelContentList = [];


  @override
  void initState() {
    _notificationBar = NotificationBar(showHideSideBar: false);
    context.read<EditPanelsCubit>().initialState();
    super.initState();
  }

  _onBackPressed(){
    if(context.read<EditPanelsCubit>().state.isSaveCLicked){
      context.read<EditPanelsCubit>().initialState();
      widget.refreshData!();
      Navigator.pop(context);
    }else{
      Navigator.pop(context);
    }

  }

  @override
  Widget build(BuildContext context) {
    _screenSize = MediaQuery.of(context).size;
    _screenWidth = _screenSize.width;
    _screenHeight = _screenSize.height;
    _theme = Theme.of(context).extension<SemnoxTheme>()!;
    return Material(
      color: _theme.backGroundColor,
      child: WillPopScope(
        onWillPop:() async => false,
        child: Stack(
          children: [
            Scaffold(
              bottomNavigationBar: SizedBox(
                width: SizeConfig.screenWidth,
                child: Container(
                  child: _notificationBar,
                ),
              ),
              body: SafeArea(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: () {
                           _onBackPressed();
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: _theme.secondaryColor!.withOpacity(0.3),
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
                                  MessagesProvider.get('Edit Panel').toUpperCase(),
                                  style: _theme.headingLight2!.copyWith(color:_theme.light1, fontSize: SizeConfig.getFontSize(26))
                                ),
                                 SizedBox(
                                  width: SizeConfig.getSize(10),
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
                                    color: _theme.secondaryColor!.withOpacity(0.3),
                                    spreadRadius: 0.2,
                                    blurRadius: .2,
                                    offset: const Offset(
                                        0, 2), // changes position of shadow
                                  ),
                                ],
                                color: _theme.button1BG1,
                                borderRadius:  BorderRadius.only(
                                    bottomLeft: Radius.circular(SizeConfig.getSize(8)),
                                    topRight: Radius.circular(SizeConfig.getSize(8)))),
                            height: SizeConfig.getSize(64),
                          ),
                        )
                      ],
                    ),
                    Expanded(
                      child: IntrinsicHeight(
                        child: Row(
                          children: [
                            Expanded(
                              flex: 6,
                              child: SizedBox(
                                width: SizeConfig.screenWidth,
                                height: SizeConfig.screenHeight,
                                child: _editGridViewBuilder()
                                // :customGridViewBuilder()
                              ),
                            ),
                            Expanded(
                                flex: 4,
                                child: SizedBox(
                                  width: SizeConfig.screenWidth,
                                  height: SizeConfig.screenHeight,
                                  child: const EditPanelConfigWidget(
                                      isEdit: false, isGridViewMode: false),
                                )),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      height: 1,
                      width: _screenWidth,
                      color: _theme.dialogFooterInnerShadow,
                    ),
                    BlocConsumer<EditPanelsCubit, EditPanelsState>(
                        listener: (context, state) {},
                        builder: (context, panelsState) {
                          List<ProductMenuPanelContentDto> menuPanelContentList = panelsState
                              .modifiedMenuPanelsDto?.productMenuPanelContentDTOList ??
                              [];

                         bool _isEnabledEditPanel(){
                           bool isEnabled = false;
                           for (ProductMenuPanelContentDto element in menuPanelContentList) {
                             if(element.rowIndex ==panelsState.selectedRowIndex && element.columnIndex == panelsState.selectedColumnIndex){
                               if(element.objectType == "PRODUCT_MENU_PANEL"){
                                 isEnabled = true;
                               }
                             }
                           }
                           return isEnabled;
                         }
                          return Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Row(
                              children: [
                                PrimaryDarkButton(
                                    onPressed: () {
                                      if(FocusScope.of(context).hasFocus) {
                                        FocusScope.of(context).unfocus();
                                      }
                                      context.read<EditPanelsCubit>().saveMenuPanelsData();
                                    },
                                    title: MessagesProvider.get('Save').toUpperCase()),
                                const SizedBox(
                                  width: 8,
                                ),
                                PrimaryDarkButton(
                                    onPressed:
                                        panelsState.isButtonTappedMode && _isEnabledEditPanel() ? () {
                                          context.read<EditPanelsCubit>().onSelectEditPanelButton();
                                        } : null,
                                    title: MessagesProvider.get('Edit Panel')
                                        .toUpperCase()),
                                const SizedBox(
                                  width: 8,
                                ),
                                PrimaryDarkButton(
                                    onPressed: panelsState.isButtonTappedMode
                                        ? () {
                                            showDialog(
                                                context: context,
                                                builder: (BuildContext newContext) {
                                                  final editPanelCubit = context
                                                      .read<EditPanelsCubit>();
                                                  // print(
                                                  //     "context.read<EditPanelsCubit>().state.productContainerDtosMaps:${context.read<EditPanelsCubit>().state.productContainerDtosMaps}");
                                                  return ChooseProductDialog(
                                                      sellableProducts:
                                                      editPanelCubit.state
                                                          .productContainerDtoList,
                                                      redeemableProducts:
                                                      editPanelCubit.state
                                                          .redeemProductContainerDtoList,
                                                      allProducts:
                                                      editPanelCubit.state
                                                          .allProductsContainerDtoList,
                                                  onConfirm: (value){
                                                    editPanelCubit.onSelectProduct(guidId: value,productType: "PRODUCTS");
                                                    _notificationBar?.showMessage(
                                                        "${MessagesProvider.get("Please click 'Save' to add '&1'.",['${_getProductName(value??'', panelsState)}'])}", _theme.footerBG4!);
                                                  },
                                                  categoryContainerList:editPanelCubit.state.categoryContainerDtoList,
                                                      productTypeContainerList: editPanelCubit.state.productTypeContainerList);
                                                });
                                          }
                                        : null,
                                    title: MessagesProvider.get('Choose Product')
                                        .toUpperCase()),
                                const SizedBox(
                                  width: 8,
                                ),
                                PrimaryDarkButton(
                                    onPressed: panelsState.isButtonTappedMode
                                        ? () {
                                            showDialog(
                                                context: context,
                                                builder: (BuildContext newContext) {
                                                 return ChoosePanelDialog(
                                                    menuPanelDtoList: context
                                                        .read<EditPanelsCubit>()
                                                        .state
                                                        .menuPanelsDtoList ??
                                                        [],
                                                   onSelectView:(String guidId){
                                                      print("onSelectEdit");
                                                     context.read<EditPanelsCubit>().onViewEditPanel(guidId);
                                                     List<MenuPanelsDto> _menuPanleDtoList = (panelsState
                                                         .menuPanelsDtoList??[]).where((element) => element.guid.toString() ==guidId.toString()).toList();
                                                     if(_menuPanleDtoList.isNotEmpty){
                                                       Navigator.push(
                                                           context,
                                                           MaterialPageRoute(
                                                               builder: (newContext) =>
                                                               BlocProvider<
                                                                   EditPanelsCubit>.value(
                                                                 value: context.read<
                                                                     EditPanelsCubit>(),
                                                                 child:
                                                                 EditPanelScreen(
                                                                     isNew: false,
                                                                     menuPanelsDto:_menuPanleDtoList[0]
                                                                 ),
                                                               )));
                                                     }
                                                   },
                                                     onSelectNew:(MenuPanelsDto menuPanelDto){
                                                       context.read<EditPanelsCubit>().onClickNewPanel(menuPanelDto);
                                                       Navigator.push(
                                                           context,
                                                           MaterialPageRoute(
                                                               builder: (newContext) =>
                                                               BlocProvider<
                                                                   EditPanelsCubit>.value(
                                                                 value: context.read<
                                                                     EditPanelsCubit>(),
                                                                 child:
                                                                 const EditPanelScreen(
                                                                   isNew: false,
                                                                 ),
                                                               )));
                                                     },
                                                    onConfirm: (String? value){
                                                      context.read<EditPanelsCubit>().onSelectPanel(guidId: value??'', productType: "PRODUCT_MENU_PANEL");
                                                      _notificationBar?.showMessage("${MessagesProvider.get('Please click save to add')} '${_getPanelName(value??'', panelsState)}'", _theme.footerBG4!);
                                                    },);
                                                });
                                          }
                                        : null,
                                    title: MessagesProvider.get('Choose Panel')
                                        .toUpperCase()),
                                const SizedBox(
                                  width: 8,
                                ),
                                PrimaryDarkButton(
                                    onPressed:
                                        panelsState.isButtonTappedMode ? () {
                                      context.read<EditPanelsCubit>().onClickClearProduct();
                                        } : null,
                                    title: MessagesProvider.get('Clear').toUpperCase()),
                              ],
                            ),
                          );
                        })
                  ],
                ),
              ),
            ),
            BlocConsumer<EditPanelsCubit, EditPanelsState>(
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
                          width: SizeConfig.screenWidth,
                          height: SizeConfig.screenHeight,
                          decoration: BoxDecoration(
                            color: _theme.secondaryColor!.withOpacity(.4),
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
      ),
    );
  }

  void _resetLoaderStatus(){
    context.read<EditPanelsCubit>().resetLoaderStatus();
  }

  Widget _editGridViewBuilder() {
    return BlocConsumer<EditPanelsCubit, EditPanelsState>(
        listener: (context, state) {},
        builder: (context, panelsState) {
          // print("refresh");
          List<ProductMenuPanelContentDto> menuPanelContentList = panelsState
                  .modifiedMenuPanelsDto?.productMenuPanelContentDTOList ??
              [];
          List<ProductMenuPanelContentDto> _filteredProductMenuPanelContentDto =
              [];

          ProductMenuPanelContentDto? getProductMenuPanelContentDto(
              rowIndex, columnIndex) {
            _filteredProductMenuPanelContentDto = menuPanelContentList
                .where((element) =>
                    element.rowIndex == rowIndex &&
                    element.columnIndex == columnIndex)
                .toList();
            if (_filteredProductMenuPanelContentDto.isNotEmpty) {
              return _filteredProductMenuPanelContentDto[0];
            } else {
              return null;
            }
          }

           _productList = [];
           _filteredProductList = [];

          (panelsState.productContainerDtosMaps ?? {}).forEach((key, value) {
            _productList.add(value);
          });

          String getProductName(guidId) {
            _filteredProductList = _productList
                .where(
                    (element) => element.guid.toString() == guidId.toString())
                .toList();
            return _filteredProductList.isNotEmpty
                ? _filteredProductList[0].productName
                : '';
          }

           _menuPanelsDtoLists = panelsState.menuPanelsDtoList??[];
          String getPanelName(String guidId){
            String panelName = '';
            for (MenuPanelsDto element  in _menuPanelsDtoLists) {
              if(element.guid == guidId){
                panelName =  element.name??'';
              }
            }
            return panelName;
          }
           _mergedButtons = [];

          for (ProductMenuPanelContentDto element in menuPanelContentList) {
            if (element.buttonType == "N") {
              _mergedButtons.add(
                  '${(element.rowIndex ?? 0)}-${(element.columnIndex ?? 0) + 1}');
            } else if (element.buttonType == "L") {
              _mergedButtons.add(
                  '${(element.rowIndex ?? 0)}-${(element.columnIndex ?? 0) + 1}');
              _mergedButtons.add(
                  '${(element.rowIndex ?? 0) + 1}-${(element.columnIndex ?? 0) + 0}');
              _mergedButtons.add(
                  '${(element.rowIndex ?? 0) + 1}-${(element.columnIndex ?? 0) + 1}');
            }
          }


              _filteredMenuPanelContentListForIndex = [];
          _filteredMenuPanelContentList = [];

          int? filteredIndex;

          String getMenuRelatedData(int columnIndex, int rowIndex) {
            for (var i = 0; i < menuPanelContentList.length; i++) {
              if (menuPanelContentList[i].rowIndex == rowIndex &&
                  menuPanelContentList[i].columnIndex == columnIndex) {
                _filteredMenuPanelContentList.add(menuPanelContentList[i]);
                filteredIndex = i;
              }
            }
            _filteredMenuPanelContentList = menuPanelContentList
                .where((element) =>
                    element.rowIndex == rowIndex &&
                    element.columnIndex == columnIndex)
                .toList();
            if (_filteredMenuPanelContentList.isNotEmpty) {
              return "yes";
            } else {
              return "no";
            }
          }

          int getMenuRelatedIndex(rowIndex, columnIndex) {
            for (var i = 0; i < menuPanelContentList.length; i++) {
              if (menuPanelContentList[i].rowIndex == columnIndex &&
                  menuPanelContentList[i].columnIndex == rowIndex) {
                _filteredMenuPanelContentListForIndex
                    .add(menuPanelContentList[i]);
                filteredIndex = i;
              }
            }
            _filteredMenuPanelContentListForIndex = menuPanelContentList
                .where((element) =>
                    element.rowIndex == columnIndex &&
                    element.columnIndex == rowIndex)
                .toList();
            if (_filteredMenuPanelContentListForIndex.isNotEmpty) {
              return filteredIndex ?? -1;
            } else {
              return -1;
            }
          }
          double getGridWidth(){
            return (double.parse((panelsState.modifiedMenuPanelsDto?.cellMarginLeft??'2').toString())+double.parse((panelsState.modifiedMenuPanelsDto?.cellMarginRight??'2').toString()));
          }
          double getGridHeight(){
            return   (double.parse((panelsState.modifiedMenuPanelsDto?.cellMarginTop??'2').toString())+double.parse((panelsState.modifiedMenuPanelsDto?.cellMarginBottom??'2').toString()));
          }

          _defaultButtonHeight = panelsState.defaultButtonHeight;
          _defaultButtonWidth = panelsState.defaultButtonWidth;
          return LayoutBuilder(builder: (context, constraints){
            return Padding(
              padding:  EdgeInsets.only(left:SizeConfig.getSize(8), right: SizeConfig.getSize(8), top: SizeConfig.getSize(5), bottom: SizeConfig.getSize(5)),
              child: Scroller(
                controller:_verticalScrollController,
                child: SingleChildScrollView(
                  controller: _verticalScrollController,
                  child: Scroller(
                    controller:_horizontalScrollController,
                    child: SingleChildScrollView(
                        controller: _horizontalScrollController,
                        scrollDirection: Axis.horizontal,
                        child: SizedBox(
                          height:(panelsState.modifiedMenuPanelsDto?.rowCount ?? 0) * (SizeConfig.getSize(_defaultButtonHeight+35)+getGridHeight())>constraints.maxHeight? (panelsState.modifiedMenuPanelsDto?.rowCount ?? 0) * (SizeConfig.getSize(_defaultButtonHeight+10))+getGridHeight():constraints.maxHeight-SizeConfig.getSize(15),
                          width:
                         SizeConfig.getSize ((panelsState.modifiedMenuPanelsDto?.columnCount ?? 0) *(_defaultButtonWidth+10+ getGridWidth())),
                          child: Stack(
                            children: List.generate(
                                (panelsState.modifiedMenuPanelsDto?.columnCount ?? 0),
                                    (columnIndex) {
                                  return Positioned(
                                    top: 0,
                                    left: SizeConfig.getSize(columnIndex * (_defaultButtonWidth+getGridWidth())),
                                    child: SizedBox(
                                      height:SizeConfig.getSize(
                                      (panelsState.modifiedMenuPanelsDto?.rowCount ?? 0) *
                                          (_defaultButtonHeight+20+getGridHeight())),
                                      width: SizeConfig.getSize(_defaultButtonWidth*2+getGridWidth()),
                                      child: Stack(
                                          children: List.generate(
                                              (panelsState.modifiedMenuPanelsDto?.rowCount ??
                                                  0), (rowIndex) {
                                            return Positioned(
                                              top:  SizeConfig.getSize(rowIndex *((_defaultButtonHeight)+getGridHeight())),
                                              left: 0,
                                              child: InkWell(
                                                onTap: () {
                                                  context
                                                      .read<EditPanelsCubit>()
                                                      .onButtonTappedChangeMode(rowIndex: rowIndex,columnIndex: columnIndex);
                                                },
                                                child: Padding(
                                                  padding:  EdgeInsets.only(left: SizeConfig.getSize(2),right:SizeConfig.getSize(2)),
                                                  child: getMenuRelatedData(
                                                      columnIndex, rowIndex) ==
                                                      "no"
                                                      ? _mergedButtons
                                                      .contains('$rowIndex-$columnIndex')
                                                      ? const SizedBox()
                                                      : Container(
                                                    height: SizeConfig.getSize(_defaultButtonHeight),
                                                    width: SizeConfig.getSize(_defaultButtonWidth),
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                         BorderRadius.all(
                                                            Radius.circular(SizeConfig.getSize(8))),
                                                        boxShadow: [
                                                          BoxShadow(
                                                            color: _theme.secondaryColor!
                                                                .withOpacity(0.3),
                                                            spreadRadius:SizeConfig.getSize(0.2),
                                                            blurRadius: SizeConfig.getSize(0.2),
                                                            offset:  Offset(0,
                                                                SizeConfig.getSize(2)), // changes position of shadow
                                                          ),
                                                        ],
                                                        color:getProductMenuPanelContentDto(
                                                            rowIndex,
                                                            columnIndex) != null? _getColor(
                                                            getProductMenuPanelContentDto(
                                                                rowIndex,
                                                                columnIndex)
                                                                ?.backColor ??
                                                                '231,233,241'): _theme.button1BG1,
                                                        border: Border.all(
                                                            color:panelsState.selectedRowIndex ==
                                                                rowIndex &&
                                                                panelsState.selectedColumnIndex ==
                                                                    columnIndex &&
                                                                panelsState
                                                                    .isButtonTappedMode
                                                                ? _theme.secondaryColor!
                                                                : _theme.transparentColor!)),
                                                  )
                                                      : Container(
                                                    height: menuPanelContentList[
                                                    getMenuRelatedIndex(
                                                        columnIndex,
                                                        rowIndex)]
                                                        .buttonType ==
                                                        'S' ||
                                                        menuPanelContentList?[
                                                        getMenuRelatedIndex(
                                                            columnIndex,
                                                            rowIndex)]
                                                            .buttonType ==
                                                            'N'
                                                        ? SizeConfig.getSize(_defaultButtonHeight)
                                                        : SizeConfig.getSize((_defaultButtonHeight*2)+getGridHeight()),
                                                    width:  SizeConfig.getSize((menuPanelContentList[
                                                    getMenuRelatedIndex(
                                                        columnIndex,
                                                        rowIndex)]
                                                        .buttonType ==
                                                        'S'
                                                        ? _defaultButtonWidth
                                                        :(_defaultButtonWidth*2)+getGridWidth())),
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                         BorderRadius.all(
                                                            Radius.circular(SizeConfig.getSize(8))),
                                                        boxShadow: [
                                                          BoxShadow(
                                                            color: _theme.secondaryColor!
                                                                .withOpacity(0.3),
                                                            spreadRadius:SizeConfig.getSize(0.2),
                                                            blurRadius: SizeConfig.getSize(0.2),
                                                            offset:  Offset(0,
                                                                SizeConfig.getSize(2)), // changes position of shadow
                                                          ),
                                                        ],
                                                        color: _getColor(
                                                            getProductMenuPanelContentDto(
                                                                rowIndex,
                                                                columnIndex)
                                                                ?.backColor ??
                                                                '231,233,241'),
                                                        border: Border.all(
                                                            color: panelsState.selectedRowIndex ==
                                                                rowIndex &&
                                                                panelsState.selectedColumnIndex ==
                                                                    columnIndex &&
                                                                panelsState
                                                                    .isButtonTappedMode
                                                                ? _theme.secondaryColor! //(getProductMenuPanelContentDto(rowIndex, columnIndex)?.imageURL??'')
                                                                : _theme.transparentColor!)),
                                                    child: Center(
                                                      child: Flex(
                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                        direction:menuPanelContentList?[
                                                        getMenuRelatedIndex(
                                                            columnIndex,
                                                            rowIndex)]
                                                            .buttonType ==
                                                            'N'?Axis.horizontal: Axis.vertical,
                                                        children: [
                                                          SizedBox(
                                                            width:SizeConfig.getSize(menuPanelContentList?[
                                                            getMenuRelatedIndex(
                                                                columnIndex,
                                                                rowIndex)]
                                                                .buttonType == "L"?_defaultButtonWidth*2: _defaultButtonWidth-2),
                                                            height: SizeConfig.getSize((getProductMenuPanelContentDto(rowIndex, columnIndex)?.imageURL??'').isNotEmpty? (menuPanelContentList?[
                                                            getMenuRelatedIndex(
                                                                columnIndex,
                                                                rowIndex)]
                                                                .buttonType == "L")? _defaultButtonHeight-2:(_defaultButtonHeight/2)-4:_defaultButtonHeight-4),
                                                            child: Center(
                                                              child: Text(
                                                                (getProductMenuPanelContentDto(rowIndex, columnIndex)?.objectType ?? 'PRODUCTS')  == 'PRODUCT_MENU_PANEL'?getPanelName(menuPanelContentList?[getMenuRelatedIndex(columnIndex, rowIndex)].objectGuid??''): getProductName(menuPanelContentList?[getMenuRelatedIndex(columnIndex, rowIndex)].objectGuid),
                                                                style: _getTextStyle(
                                                                    getProductMenuPanelContentDto(
                                                                        rowIndex, columnIndex)),
                                                                textAlign: TextAlign.center,
                                                                maxLines: (getProductMenuPanelContentDto(rowIndex, columnIndex)?.imageURL??'').isNotEmpty?(menuPanelContentList?[
                                                                getMenuRelatedIndex(
                                                                    columnIndex,
                                                                    rowIndex)]
                                                                    .buttonType == "L")?2:1:2,
                                                                overflow: TextOverflow.ellipsis,
                                                              ),
                                                            ),
                                                          ),
                                                          (getProductMenuPanelContentDto(rowIndex, columnIndex)?.imageURL??'').isNotEmpty ? SizedBox(
                                                              height:SizeConfig.getSize(menuPanelContentList?[
                                                              getMenuRelatedIndex(
                                                                  columnIndex,
                                                                  rowIndex)]
                                                                  .buttonType ==
                                                                  'S'?_defaultButtonHeight/2: _defaultButtonHeight+(getGridHeight()-2)),
                                                              width:SizeConfig.getSize(menuPanelContentList?[
                                                              getMenuRelatedIndex(
                                                                  columnIndex,
                                                                  rowIndex)]
                                                                  .buttonType == "N"?_defaultButtonWidth+(getGridWidth()-2):menuPanelContentList?[
                                                              getMenuRelatedIndex(
                                                                  columnIndex,
                                                                  rowIndex)]
                                                                  .buttonType == "L"? (_defaultButtonWidth+(getGridWidth()-2))*2:_defaultButtonWidth-2),
                                                              child: _getImage(getProductMenuPanelContentDto(rowIndex, columnIndex)?.imageURL??'', getProductMenuPanelContentDto(rowIndex, columnIndex)?.buttonType??'S')): const SizedBox(),

                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            );
                                          })),
                                    ),
                                  );
                                }),
                          ),
                        )),
                  ),
                ),
              ),
            );
          });
        });
  }


  Widget _getImage(String? imgUrl, String? buttonType) {
    try {
      if(imgUrl !=null|| (imgUrl??'').isNotEmpty ){
        return FutureBuilder(
          future: _getImgData(imgUrl),
          builder: (BuildContext context, AsyncSnapshot<Uint8List> snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.data!.isNotEmpty) {
                return ClipRRect(
                    borderRadius: buttonType == "N"? BorderRadius.only(topRight:Radius.circular(SizeConfig.getSize(8)), bottomRight: Radius.circular(SizeConfig.getSize(8))): BorderRadius.only(bottomLeft:Radius.circular(SizeConfig.getSize(8)), bottomRight: Radius.circular(SizeConfig.getSize(8))),
                    child: Image.memory(snapshot.data!, fit: BoxFit.cover,));
              } else {
                return const SizedBox();
              }
            } else {
              return const SizedBox();
            }
          },
        );
      }
      else{
        return const SizedBox();
      }
    } catch (err) {
      return const SizedBox();
    }
  }





  String _getProductName(guidId, editPanelsState) {
    (editPanelsState.productContainerDtosMaps ?? {}).forEach((key, value) {
      _productCotainerList.add(value);
    });
    _filteredProductContainerList = _productCotainerList
        .where(
            (element) => element.guid.toString() == guidId.toString())
        .toList();
    // print("_filteredProductList: ${_filteredProductList.length}");
    return _filteredProductContainerList.isNotEmpty
        ? _filteredProductContainerList[0].productName
        : '';
  }

  String _getPanelName(String guidId,EditPanelsState editPanelState){
    _menuPanelsLists =  editPanelState.menuPanelsDtoList??[];
    String panelName = '';
    for (MenuPanelsDto element  in _menuPanelsLists) {
      if(element.guid == guidId){
        panelName =  element.name??'';
      }
    }
    return panelName;
  }

  Future<Uint8List> _getImgData(imgUrl) async {
    _execContextBL = await ExecutionContextBuilder.build();
    _execContext = _execContextBL!.getExecutionContext();
    _masterDataBl = await MasterDataBuilder.build(_execContext!);
    Uint8List imageData = await _masterDataBl.getImageData(fileName: imgUrl);
    return imageData;
  }


  Color _getColor(String? colorString) {
  try{
    if (colorString != null && colorString.isNotEmpty) {
      return Color.fromRGBO(
          int.parse((colorString ?? '').split(",")[0]),
          int.parse((colorString ?? '').split(",")[1]),
          int.parse((colorString ?? '').split(",")[2]),
          1);
    } else {
      return _theme.button1BG1!;
    }
  }catch(e){
    return _theme.button1BG1!;
  }
  }

  Color _getTextColor(String? colorString) {
    try{
      if (colorString != null && colorString.isNotEmpty) {
        return Color.fromRGBO(
            int.parse((colorString ?? '').split(",")[0]),
            int.parse((colorString ?? '').split(",")[1]),
            int.parse((colorString ?? '').split(",")[2]),
            1);
      } else {
        return _theme.secondaryColor!;
      }
    }catch(e){
      return _theme.secondaryColor!;
    }
  }

  String _getFontFamily(String fontFamilyString) {
    if (fontFamilyString.isNotEmpty) {
      try {
        return GoogleFonts.getFont(fontFamilyString).fontFamily ??
            'RobotoCondensed';
      } catch (error) {
        return 'RobotoCondensed';
      }
    } else {
      return 'RobotoCondensed';
    }
  }

  FontWeight _getFontWeight(fontWeightString) {
    switch (fontWeightString) {
      case 'Normal':
        return FontWeight.normal;
      case 'Bold':
        return FontWeight.bold;
      default:
        return FontWeight.bold;
    }
  }

  FontStyle _getFontStyle(String fontStyleString) {
    switch (fontStyleString) {
      case 'Normal':
        return FontStyle.normal;
      case 'Italic':
        return FontStyle.italic;
      default:
        return FontStyle.normal;
    }
  }

  TextStyle _getTextStyle(
    ProductMenuPanelContentDto? data
  ) {
    try {
      _fontObj = getFontObj((data?.font ?? ''));
      if(_fontObj.fontFamily.isNotEmpty && _fontObj.fontSize>0 && _fontObj.fontStyle.isNotEmpty && _fontObj.fontWeight.isNotEmpty){
        return TextStyle(
                  fontFamily: _getFontFamily(_fontObj.fontFamily),
                  fontSize: SizeConfig.getFontSize(_fontObj.fontSize+2),
                  fontWeight: _getFontWeight(_fontObj.fontWeight),
                  fontStyle: _getFontStyle(_fontObj.fontStyle),
                  color: _getTextColor(data?.textColor)
              );
      }else{
        return _theme.subtitle3!;
      }
    } catch (err) {
      // print("err $err");
      return  _theme.subtitle3!;
    }
  }



  FontData getFontObj(String data){
    _fontObj =  FontData(fontFamily:"Roboto",fontSize:14.00,fontStyle:"Normal",fontWeight:"Bold");
    _split1 = data.split("=");
    _part1 = _split1[0].split(", ");
    _part2 = [];
    if(_split1.length>1){
      _part2 = _split1[1].split(", ");
    }
    if(_part1.length>1){
      _fontObj  = _fontObj.copyWith(fontFamily:_part1[0],fontSize:double.parse(_part1[1].replaceAll(',', '')));
      if(_part2.length>=1){
        if(_part2.contains("Italic")){
          _fontObj  = _fontObj.copyWith(fontStyle:"Italic");
        }
        if(_part2.contains("Normal") ){
          _fontObj  = _fontObj.copyWith(fontWeight:"Normal");
        }
        if(_part2.contains("Bold") && _part2.length>1){
          _fontObj  = _fontObj.copyWith(fontWeight:"Bold");
        }
      }
    }

    return _fontObj;
  }

  String getFont(ProductMenuPanelContentContainerDTO? data) {
    if (data?.font != null && (data?.font ?? '').isNotEmpty) {
      try {
        String font = (data?.font ?? '').split(",")[0];
        return GoogleFonts.getFont(font).fontFamily ?? 'RobotoCondensed';
      } catch (error) {
        return 'RobotoCondensed';
      }
    } else {
      return 'RobotoCondensed';
    }
  }

  Widget _gridViewBuilder() {
    return BlocConsumer<EditPanelsCubit, EditPanelsState>(
        listener: (context, state) {},
        builder: (context, panelsState) {
          int count = -1;
          return SingleChildScrollView(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: List.generate(panelsState.rowsCount, (columnIndex) {
                  // count++;
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children:
                        List.generate(panelsState.columnsCount, (rowIndex) {
                      count++;
                      return columnIndex == 3 && rowIndex == 3
                          ? Padding(
                              padding: EdgeInsets.fromLTRB(
                                  double.parse(
                                      panelsState.cellMarginLeft.toString() ??
                                          '0'),
                                  double.parse(
                                      panelsState.cellMarginTop.toString() ??
                                          '0'),
                                  double.parse(
                                      panelsState.cellMarginRight.toString() ??
                                          '0'),
                                  double.parse(
                                      panelsState.cellMarginBottom.toString() ??
                                          '0')),
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    minimumSize: const Size(90, 43),
                                    maximumSize: const Size(90, 43),
                                    backgroundColor: _theme.button1BG1,
                                  ),
                                  onPressed: () {},
                                  child: Text(
                                    "",
                                    style:
                                    _theme.subtitle3!,
                                  )),
                            )
                          : Padding(
                              padding: EdgeInsets.fromLTRB(
                                  double.parse(
                                      panelsState.cellMarginLeft.toString() ??
                                          '0'),
                                  double.parse(
                                      panelsState.cellMarginTop.toString() ??
                                          '0'),
                                  double.parse(
                                      panelsState.cellMarginRight.toString() ??
                                          '0'),
                                  double.parse(
                                      panelsState.cellMarginBottom.toString() ??
                                          '0')),
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    minimumSize: const Size(90, 43),
                                    maximumSize: const Size(90, 43),
                                    backgroundColor: _theme.button1BG1,
                                  ),
                                  onPressed: () {},
                                  child: Text(
                                    "",
                                    style:
                                    _theme.subtitle3!,
                                  )),
                            );
                    }),
                  );
                }),
              ),
            ),
          );
        });
  }
}

