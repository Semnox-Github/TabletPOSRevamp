import 'dart:typed_data';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:logs_data/logger.dart';
import 'package:master_data/master_data_bl.dart';
import 'package:messages_data/builder.dart';
import 'package:product_menu_data/models/product_menu_panel_container_dto.dart';
import 'package:product_menu_data/models/product_menu_panel_content_container_dto.dart';
import 'package:product_menu_data/product_menu_bl.dart';
import 'package:product_menu_ui/product_menu_grid/product_menu_grid.dart';
import 'package:themes_library/themes_library.dart';
import 'package:widgets_library/scroller.dart';
import 'package:widgets_library/utils/size_config.dart';
import 'models/font_data.dart';
import 'models/product_grid_item.dart';

class ProductMatrixGrid extends StatefulWidget {
  List<GridItem> _dataListForGrid;
  final List<ProductMenuPanelContainerDTO> _productMenuPanelsList;
  final Function _productSelectedCallback;
  final Function _onInfoClicked;
  final ProductMenuDataBLContract _productMenuDataBL;
  final MasterDataBLContract _masterDataBl;

  ProductMatrixGrid(this._dataListForGrid,this._productMenuPanelsList, this._productSelectedCallback, this._onInfoClicked,this._productMenuDataBL,this._masterDataBl,{super.key});

  @override
  State<StatefulWidget> createState() {
    return _ProductMatrixGridState();
  }

}

class _ProductMatrixGridState extends State<ProductMatrixGrid> {
  List<GridItem> _dataListForGrid = [];
  ProductMenuPanelContainerDTO? _parentMenuContainer ;
  final ScrollController _productVerticalScroll = ScrollController();
  final ScrollController _productHorizontalScroll = ScrollController();
  late ProductMenuPanelContentContainerDTO _firstProduct;
  List<ProductMenuPanelContainerDTO> _menuPanelsDtoLists = [];
  List<ProductMenuPanelContainerDTO> _filteredMenuPanelContainer = [];
  List<ProductMenuPanelContentContainerDTO> _productsContentContainerList = [];
  List<ProductMenuPanelContentContainerDTO> _filteredProductsContentContainerList = [];
  int? filteredIndex;
  late FontData _fontObj;
  List<String> _split1 = [];
  List<String> _part1  = [];
  List<String> _part2 = [];
  SemnoxTheme? _theme;
  List<GridItem> _selectedGridItemList = [];
  List<ProductMenuPanelContainerDTO> _selectedMenuPanelList = [];
  late Uint8List _imageData ;
  double _defaultButtonWidth = 138;
  double _defaultButtonHeight =  68;
  Size _screenSize = const Size(0, 0);
  double _screenWidth = 0.0;
  double _screenHeight = 0.0;
  String _font = 'RobotoCondensed';
  ProductMenuPanelContentContainerDTO? _matrixDataByIndex ;
  List<String> _mergedButtons = [];

  @override
  void initState() {
    _initProducts();
    _dataListForGrid = widget._dataListForGrid;
    super.initState();
  }

  _initProducts()async {
   try{
     String? buttonHeight =  await widget._masterDataBl.getDefaultValuesByName(defaultValueName: "PRODUCT_MENU_BUTTON_HEIGHT");
     _defaultButtonHeight = double.parse(buttonHeight??"68");
     String? buttonWidth =  await widget._masterDataBl.getDefaultValuesByName(defaultValueName: "PRODUCT_MENU_BUTTON_WIDTH");
     _defaultButtonWidth = double.parse(buttonWidth??"138");
     setState(() {
     });
   }catch(e){
    Log.v(e);
   }
  }

  @override
  Widget build(BuildContext context) {
    _theme = Theme.of(context).extension<SemnoxTheme>()!;
    SizeConfig.init(context);
    _dataListForGrid = widget._dataListForGrid;
    _screenSize = MediaQuery.of(context).size;
    _screenWidth = _screenSize.width;
    _screenHeight = _screenSize.height;
    return _dataListForGrid.isEmpty?
     SizedBox(child: Text(MessagesProvider.get("No items.")),):
    _dataListForGrid[0] is ProductItem?
    _productGridView():
    ProductMenuGrid(dataListForGrid: _dataListForGrid,
      defaultButtonHeight: _defaultButtonHeight,
      defaultButtonWidth: _defaultButtonWidth,
        productSelectedCallback: widget._productSelectedCallback,
        masterDataBl: widget._masterDataBl
    );
  }

  Widget _productGridView(){
     _firstProduct = _dataListForGrid[0].dataObject as ProductMenuPanelContentContainerDTO;
     _filteredMenuPanelContainer = widget._productMenuPanelsList.where((element) => element.panelId == _firstProduct.panelId).toList();
    if(_filteredMenuPanelContainer.isNotEmpty){
      _parentMenuContainer= _filteredMenuPanelContainer[0];
      _productsContentContainerList = _filteredMenuPanelContainer[0].productMenuPanelContainerDTOList;
    }


     ProductMenuPanelContentContainerDTO? getProductMenuPanelContentDto(
              rowIndex, columnIndex) {
            _filteredProductsContentContainerList = _productsContentContainerList
                .where((element) =>
            element.rowIndex == rowIndex &&
                element.columnIndex == columnIndex)
                .toList();
            if (_filteredProductsContentContainerList.isNotEmpty) {
              return _filteredProductsContentContainerList[0];
            } else {
              return null;
            }
          }


        _menuPanelsDtoLists = widget._productMenuPanelsList??[];
           _mergedButtons = [];

          for (ProductMenuPanelContentContainerDTO element in _productsContentContainerList) {
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



          String getMenuRelatedData(int columnIndex, int rowIndex) {
            for (var i = 0; i < _productsContentContainerList.length; i++) {
              if (_productsContentContainerList[i].rowIndex == rowIndex &&
                  _productsContentContainerList[i].columnIndex == columnIndex) {
                _filteredProductsContentContainerList.add(_productsContentContainerList[i]);
              }
            }
            _filteredProductsContentContainerList = _productsContentContainerList
                .where((element) =>
            element.rowIndex == rowIndex &&
                element.columnIndex == columnIndex)
                .toList();
            if (_filteredProductsContentContainerList.isNotEmpty) {
              return "yes";
            } else {
              return "no";
            }
          }

          int getMenuRelatedIndex(rowIndex, columnIndex) {
            for (var i = 0; i < _productsContentContainerList.length; i++) {
              if (_productsContentContainerList[i].rowIndex == columnIndex &&
                  _productsContentContainerList[i].columnIndex == rowIndex) {
                _filteredProductsContentContainerList
                    .add(_productsContentContainerList[i]);
                filteredIndex = i;
              }
            }
            _filteredProductsContentContainerList = _productsContentContainerList
                .where((element) =>
            element.rowIndex == columnIndex &&
                element.columnIndex == rowIndex)
                .toList();
            if (_filteredProductsContentContainerList.isNotEmpty) {
              return filteredIndex ?? -1;
            } else {
              return -1;
            }
          }

          double getParentHeight(){
            return (double.parse((_parentMenuContainer?.cellMarginTop??'2').toString())+double.parse((_parentMenuContainer?.cellMarginBottom??'2').toString()));
          }

          double getParentWidth(){
           return  (double.parse((_parentMenuContainer?.cellMarginLeft??'2').toString())+double.parse((_parentMenuContainer?.cellMarginRight??'2').toString()));
          }

          return Expanded(
            child: LayoutBuilder(
              builder: (context, constraints) {
                return Scroller(
                  controller: _productVerticalScroll,
                  child: Padding(
                    padding:  EdgeInsets.only(right: 30.0, left: SizeConfig.getSize(4)),
                    child: SingleChildScrollView(
                      controller: _productVerticalScroll,
                      child: Scroller(
                        controller: _productHorizontalScroll,
                        child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                          controller: _productHorizontalScroll,
                            child: SizedBox(
                              height:(((_parentMenuContainer?.rowCount ?? 0) *(SizeConfig.getHeight(_defaultButtonHeight) + getParentHeight()) )+SizeConfig.getHeight(85))>constraints.maxHeight  ? SizeConfig.getHeight(((_parentMenuContainer?.rowCount ?? 0) *(_defaultButtonHeight + getParentHeight()) )+124):constraints.maxHeight,
                              width:SizeConfig.getSize((_defaultButtonWidth*(_parentMenuContainer?.columnCount??0)) + getParentWidth()+100) <= constraints.maxWidth?constraints.maxWidth-40:SizeConfig.getSize((_defaultButtonWidth*(_parentMenuContainer?.columnCount??0)) + getParentWidth()+100) ,
                              child: Stack(
                                children: List.generate(
                                    (_parentMenuContainer?.columnCount ?? 0),
                                        (columnIndex) {
                                      return Positioned(
                                        top: 0,
                                        left:SizeConfig.getWidth( columnIndex * ((_defaultButtonWidth)+getParentWidth())),
                                        child: SizedBox(
                                          height:
                                          SizeConfig.getHeight( (_parentMenuContainer?.rowCount ?? 0) *
                                              (_defaultButtonHeight+getParentHeight())),
                                          width: SizeConfig.getWidth((_defaultButtonWidth*2)+8+getParentWidth()),
                                          child: Stack(
                                              children: List.generate(
                                                  (_parentMenuContainer?.rowCount ??
                                                      0), (rowIndex) {
                                                _matrixDataByIndex = getProductMenuPanelContentDto(
                                                    rowIndex,
                                                    columnIndex);
                                                return Positioned(
                                                  top: SizeConfig.getHeight(rowIndex *(_defaultButtonHeight+getParentHeight())),
                                                  left: 0,
                                                  child: InkWell(
                                                    onTap: () {
                                                      if((getProductMenuPanelContentDto(
                                                          rowIndex,
                                                          columnIndex)?.childPanelId ?? -1)  >0){ // is selected item is panel
                                                      _selectedMenuPanelList = (widget._productMenuPanelsList??[]).where((element) => element.name == _productsContentContainerList[
                                                      getMenuRelatedIndex(
                                                    columnIndex,
                                                    rowIndex)].name).toList();
                                                      if(_selectedMenuPanelList.isNotEmpty){
                                                          widget._productSelectedCallback( toPanelItem(_selectedMenuPanelList[0]));
                                                        }
                                                      }else{ // if selected item is product
                                                        _selectedGridItemList =  (widget._dataListForGrid??[]).where((element) => element.id == _productsContentContainerList[
                                                        getMenuRelatedIndex(
                                                    columnIndex,
                                                    rowIndex)].productId).toList();

                                                        if(_selectedGridItemList.isNotEmpty){
                                                          widget._productSelectedCallback(_selectedGridItemList[0]);
                                                        }
                                                      }


                                                    },
                                                    child: Padding(
                                                      padding:  EdgeInsets.only(left: SizeConfig.getWidth(4),right:SizeConfig.getWidth(4)),
                                                      child: getMenuRelatedData(
                                                          columnIndex, rowIndex) ==
                                                          "no"
                                                          ? _mergedButtons
                                                          .contains('$rowIndex-$columnIndex')
                                                          ? const SizedBox()
                                                          :const SizedBox()
                                                          : Container(
                                                        height: _matrixDataByIndex?.buttonType ==
                                                            'S' ||
                                                            _matrixDataByIndex?.buttonType ==
                                                                'N'
                                                            ? SizeConfig.getHeight(_defaultButtonHeight)
                                                            : SizeConfig.getHeight((_defaultButtonHeight*2)+getParentHeight()),
                                                        width: _matrixDataByIndex?.buttonType ==
                                                            'S'
                                                            ? SizeConfig.getWidth(_defaultButtonWidth)
                                                            : SizeConfig.getWidth((_defaultButtonWidth *2)+getParentWidth()),
                                                        decoration: BoxDecoration(
                                                            borderRadius:
                                                             BorderRadius.all(
                                                                Radius.circular(SizeConfig.getSize(8))),
                                                            boxShadow: [
                                                              BoxShadow(
                                                                color: _theme!.secondaryColor!
                                                                    .withOpacity(0.3),
                                                                spreadRadius:SizeConfig.getSize(0.2),
                                                                blurRadius: SizeConfig.getSize(0.2),
                                                                offset:  Offset(0,
                                                                    SizeConfig.getSize(2)), // changes position of shadow
                                                              ),
                                                            ],
                                                            color:_matrixDataByIndex
                                                                ?.backColor != null? _getColor(
                                                                _matrixDataByIndex
                                                                    ?.backColor): _theme?.tableRow1,
                                                            border: Border.all(
                                                              color: Colors.transparent
                                                            )),
                                                        child: Center(
                                                          child: Flex(
                                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                            direction:_matrixDataByIndex?.buttonType ==
                                                                'N'?Axis.horizontal: Axis.vertical,
                                                            children: [
                                                              Row(
                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                children: [
                                                                  SizedBox(
                                                                    // color: Colors.yellow,
                                                                    width:SizeConfig.getWidth(_matrixDataByIndex?.buttonType == "L"?(_defaultButtonWidth*2)-30:_defaultButtonWidth- 30),
                                                                    height: SizeConfig.getHeight((_matrixDataByIndex?.imageURL??'').trim().isNotEmpty? (_matrixDataByIndex?.buttonType == "L")? _defaultButtonHeight-5:(_defaultButtonHeight/2)-5:(_matrixDataByIndex?.buttonType == "L")?_defaultButtonHeight*2:_defaultButtonHeight-5),
                                                                    child: Center(
                                                                      child: Padding(
                                                                        padding:  EdgeInsets.only(left: SizeConfig.getHeight(8)),
                                                                        child: Text(
                                                                          (_matrixDataByIndex?.childPanelId ?? -1)  >0 ?_getPanelName(_matrixDataByIndex?.name??''):
                                                                          _matrixDataByIndex?.name??'',
                                                                          style: _getTextStyle(
                                                                              _matrixDataByIndex),
                                                                          textAlign: TextAlign.start,
                                                                          maxLines: (_matrixDataByIndex?.imageURL??'').trim().isNotEmpty?(_matrixDataByIndex?.buttonType == "L")?2:1:2,
                                                                          overflow: TextOverflow.ellipsis,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  (_matrixDataByIndex?.childPanelId ?? -1)  >0 ?const SizedBox():   InkWell(
                                                                    onTap: (){
                                                                      if((getProductMenuPanelContentDto(
                                                                          rowIndex,
                                                                          columnIndex)?.childPanelId ?? -1)  >0){ // is selected item is panel
                                                                        _selectedMenuPanelList = (widget._productMenuPanelsList??[]).where((element) => element.name == _productsContentContainerList[
                                                                        getMenuRelatedIndex(
                                                                            columnIndex,
                                                                            rowIndex)].name).toList();
                                                                        if(_selectedMenuPanelList.isNotEmpty){
                                                                          widget._onInfoClicked( toPanelItem(_selectedMenuPanelList[0]));
                                                                        }
                                                                      }else{ // if selected item is product
                                                                        _selectedGridItemList =  (widget._dataListForGrid??[]).where((element) => element.id == _productsContentContainerList[
                                                                        getMenuRelatedIndex(
                                                                            columnIndex,
                                                                            rowIndex)].productId).toList();

                                                                        if(_selectedGridItemList.isNotEmpty){
                                                                          widget._onInfoClicked(_selectedGridItemList[0]);
                                                                        }
                                                                      }
                                                                    },
                                                                     child: Icon(Icons.info_outline, color:_theme!.secondaryColor, size: SizeConfig.getSize(25),)

                                                                  )
                                                                ],
                                                              ),
                                                              (_matrixDataByIndex?.imageURL??'').trim().isNotEmpty ? SizedBox(
                                                                  height:SizeConfig.getHeight(_matrixDataByIndex?.buttonType ==
                                                                      'S'?((_defaultButtonHeight/2)-5)+getParentHeight(): (_defaultButtonHeight -0)+getParentHeight()),
                                                                  width:SizeConfig.getWidth(_matrixDataByIndex?.buttonType == "N"?(_defaultButtonWidth-2)+getParentWidth():_matrixDataByIndex?.buttonType == "L"? (_defaultButtonWidth*2)+getParentWidth():(_defaultButtonWidth-2)+getParentWidth()),
                                                                  child: _getImage((_matrixDataByIndex?.imageURL??'').trim(), _matrixDataByIndex?.buttonType??'S')): const SizedBox(),

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
              }
            ),
          );

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


  String _getPanelName(String name,){
    _menuPanelsDtoLists =  widget._productMenuPanelsList;
    String panelName = '';
    for (ProductMenuPanelContainerDTO element  in _menuPanelsDtoLists) {
      if(element.name == name){
        panelName =  element.name??'';
      }
    }
    return panelName;
  }

  Future<Uint8List> _getImgData(imgUrl) async {
       _imageData = await widget._masterDataBl.getImageData(fileName: imgUrl);
    return _imageData;
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
        return _theme!.button1BG1!;
      }
    }catch(e){
      return _theme!.button1BG1!;
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
        return _theme!.secondaryColor!;
      }
    }catch(e){
      return _theme!.secondaryColor!;
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
      ProductMenuPanelContentContainerDTO? data
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
        return _theme!.subtitle3!;
      }
    } catch (err) {
      // print("err $err");
      return  _theme!.subtitle3!;
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
         _font = (data?.font ?? '').split(",")[0];
        return GoogleFonts.getFont(_font).fontFamily ?? 'RobotoCondensed';
      } catch (error) {
        return 'RobotoCondensed';
      }
    } else {
      return 'RobotoCondensed';
    }
  }

}
