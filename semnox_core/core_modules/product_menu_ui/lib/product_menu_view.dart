import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logs_data/logger.dart';
import 'package:master_data/master_data_bl.dart';
import 'package:product_menu_data/models/product_menu_panel_container_dto.dart';
import 'package:product_menu_data/models/product_menu_panel_content_container_dto.dart';
import 'package:product_menu_data/models/product_menu_response.dart';
import 'package:product_menu_data/models/product_price_container/product_barcode_container_dto.dart';
import 'package:product_menu_data/models/products_container/product_container_dto.dart';
import 'package:product_menu_data/product_menu_bl.dart';
import 'package:product_menu_ui/models/product_grid_item.dart';
import 'package:product_menu_ui/product_grid.dart';
import 'package:product_menu_ui/product_matrix_grid.dart';
import 'package:product_menu_ui/searchbar/searchbar.dart';
import 'package:themes_library/themes_library.dart';
import 'package:transaction_ui/cubit/transaction_cubit.dart';
import 'package:transaction_ui/cubit/transaction_cubit_state.dart';
import 'package:widgets_library/utils/size_config.dart';

import 'breadcrumb_ui.dart';

class ProductMenuView extends StatefulWidget {
  final ProductMenuResponse? _productMenuResponse;
  final Function(int productId, int quantity, String event) _productSelectCallback;
  final ProductMenuDataBLContract _productMenuDataBL;
  final MasterDataBLContract _masterDataBl;
  final Function _onSearchCompleted;
  final Function _onInfoClicked;

  const ProductMenuView(this._productMenuDataBL, ProductMenuResponse? productMenuResponse, this._productSelectCallback,
      this._masterDataBl, this._onSearchCompleted, this._onInfoClicked,{super.key, required}): _productMenuResponse = productMenuResponse;

  @override
  State<ProductMenuView> createState() => _ProductMenuViewState();
}


class _ProductMenuViewState extends State<ProductMenuView> {
  late Widget _gridContainer;
  late List<GridItem> _gridItems;
  late BreadcrumbUI breadcrumbUI;
  late TransactionCubit transactionCubit;
  final ValueNotifier<bool> _isSearchEnabledNotifier = ValueNotifier(false);
  List<ProductMenuPanelContainerDTO> panelContainer = [];

  @override
  void initState() {
    super.initState();

    transactionCubit = context.read<TransactionCubit>();
    panelContainer =
        widget._productMenuResponse?.data?.productMenuContainerSnapshotDTOList[0].productMenuPanelContainerDTOList ??
            [];
    initBreadcrumb();
  }

  void initBreadcrumb() {
    breadcrumbUI = BreadcrumbUI((productMenuItemModel) {
      Log.v("breadcrumb callback ${productMenuItemModel.title}");
      Log.v("breadcrumb type ${productMenuItemModel.runtimeType}");
      Log.v("breadcrumb dataObject type ${productMenuItemModel.dataObject.runtimeType}");
      if (productMenuItemModel.title == "Menu") {
        _gridItems = toPanelItems(panelContainer);
      } else {
        _gridItems = toProductItems(
            (productMenuItemModel.dataObject as ProductMenuPanelContainerDTO).productMenuPanelContainerDTOList);
      }
      setState(() {});
    });

    final panels = panelContainer.where((e) => e.isMainPanel == true).toList();
    if(panels.length == 1) {
      breadcrumbUI.addBreadCrumb(ProductItem(-1, panels[0].name, panels[0]));
      _gridItems = toProductItems(panels[0].productMenuPanelContainerDTOList);
    } else {
      breadcrumbUI.addBreadCrumb(PanelItem(-1, "Menu", panelContainer));
      _gridItems = toPanelItems(panelContainer);
    }
  }

  @override
  Widget build(BuildContext context) {
    SemnoxTheme theme = Theme.of(context).extension<SemnoxTheme>()!;
    SizeConfig.init(context);
    _gridContainer = ValueListenableBuilder<bool>(
        valueListenable: _isSearchEnabledNotifier,
        builder: (context, value, _) {
          if (value) {
            return ProductGrid(_gridItems, (selectedItem) => productSelectedCallback(selectedItem),
                (GridItem productMenuItem) => widget._onInfoClicked(productMenuItem));
          }
          return ProductMatrixGrid(
              _gridItems,
              panelContainer,
              (selectedItem) => productSelectedCallback(selectedItem),
              (GridItem productMenuItem) => widget._onInfoClicked(productMenuItem),
              widget._productMenuDataBL,
              widget._masterDataBl);
        });
    return Padding(
      padding: const EdgeInsets.all(0.0),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(left: SizeConfig.getSize(16)),
            child: Row(
              children: [
                ValueListenableBuilder<bool>(
                  valueListenable: _isSearchEnabledNotifier,
                  builder: (context, value, _) {
                    return Expanded(
                      child: (value) ? ProductMenuSearchBar((searchString) => filterProducts(searchString)) : breadcrumbUI,
                    );
                  },
                ),
                Material(
                  color: theme.button2BG1,
                  borderRadius: BorderRadius.circular(SizeConfig.getSize(6)),
                  child: Padding(
                    padding: EdgeInsets.all(SizeConfig.getSize(6)),
                    child: InkWell(
                      child: ValueListenableBuilder<bool>(
                        valueListenable: _isSearchEnabledNotifier,
                        builder: (context, value, _) {
                          return (value)
                              ? Icon(
                                  Icons.close,
                                  size: SizeConfig.getSize(42),
                                  color: Colors.white,
                                )
                              : Icon(Icons.search, size: SizeConfig.getSize(42), color: Colors.white);
                        },
                      ),
                      onTap: () {
                        if (_isSearchEnabledNotifier.value) {
                          initBreadcrumb();
                        } else {
                          _gridItems = []; //toPanelItems(panelContainer);
                        }
                        _isSearchEnabledNotifier.value = !_isSearchEnabledNotifier.value;
                        transactionCubit.setIsInProductSearchMode(_isSearchEnabledNotifier.value);
                        setState(() {});
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          Divider(
            thickness: 1,
            color: theme.dividerColor,
          ),
          _gridContainer,
          BlocConsumer<TransactionCubit, TransactionCubitState>(builder: (ctx, state) => const SizedBox(), listener: (ctx, state) {
            if (state.completeTransactionStatus?.status == 1) {
              breadcrumbUI.resetBreadCrumb();
            }
          })
        ],
      ),
    );
  }

  void productSelectedCallback(GridItem selectedItem) async {
    if (selectedItem is PanelItem) {
      _gridItems = getProductMenuItemModelsList(
          selectedItem.dataObject.productMenuPanelContainerDTOList, selectedItem.dataObject);
      Future.microtask(() async {
        setState(() {});
      });
      breadcrumbUI.addBreadCrumb(selectedItem);
    } else if (selectedItem is ProductItem) {
      ProductMenuPanelContentContainerDTO productMenuContentPanelContainerDTO =
          (selectedItem.dataObject as ProductMenuPanelContentContainerDTO);
      var isSubPanel = (productMenuContentPanelContainerDTO.productId == -1 &&
          productMenuContentPanelContainerDTO.childPanelId != -1);
      if (isSubPanel) {
        _gridItems = getProductMenuItemModelsList(
            selectedItem.dataObject.productMenuPanelContainerDTOList, selectedItem.dataObject);
        Future.microtask(() async {
          setState(() {});
        });
        breadcrumbUI.addBreadCrumb(selectedItem);
      } else {
        // the clicked item is a product
        //ProductContainerDTO? productContainerDTO = await widget._productMenuDataBL.getProductDetails(selectedItem.id);
        widget._productSelectCallback(productMenuContentPanelContainerDTO.productId, 1, "NORMAL");
      }
    }
  }

  List<GridItem> getProductMenuItemModelsList(List<dynamic> productMenuPanelsList,
      [ProductMenuPanelContainerDTO? productMenuPanelContainerDTO]) {
    List<GridItem> productMenuItemModels = [];

    for (var productMenuItem in productMenuPanelsList) {
      GridItem? productMenuItemModel;
      if (productMenuItem is ProductMenuPanelContainerDTO) {
        productMenuItemModel = PanelItem(-1, productMenuItem.name, productMenuItem);
      } else if (productMenuItem is ProductMenuPanelContentContainerDTO) {
        if (productMenuPanelContainerDTO != null) {
          productMenuItemModel = ProductItem(productMenuItem.productId, productMenuItem.name, productMenuItem,
              cellMarginLeft: productMenuPanelContainerDTO.cellMarginLeft,
              cellMarginRight: productMenuPanelContainerDTO.cellMarginRight,
              cellMarginTop: productMenuPanelContainerDTO.cellMarginTop,
              cellMarginBottom: productMenuPanelContainerDTO.cellMarginBottom);
        } else {
          productMenuItemModel = PanelItem(productMenuItem.productId, productMenuItem.name, productMenuItem);
        }
      }
      productMenuItemModels.add(productMenuItemModel!);
    }
    return productMenuItemModels;
  }

  void filterProducts(searchString) async {
    Log.printMethodStart("filterProducts()", "Sales Screen", "onTapTextField");
    if (FocusScope.of(context).hasFocus) {
      FocusScope.of(context).unfocus();
    }
    Log.v("searchString $searchString");
    List<ProductContainerDTO> foundItems = [];
    List<ProductMenuPanelContentContainerDTO> listItems = [];

    List<ProductContainerDTO> productContainerDTOs = await widget._productMenuDataBL.getAllProductContainerDTOs();
    for (ProductContainerDTO product in productContainerDTOs) {
      //print("----- name ${product.productName}");
      if (product.productName.toLowerCase().contains(searchString.trim().toLowerCase()) ||
          product.description.toLowerCase().contains(searchString.trim().toLowerCase()) ||
          product.hsnSacCode.toLowerCase().contains(searchString.trim().toLowerCase())) {
        // print("****** found id ${product.productId} name ${product.productName}");
        foundItems.add(product);
      }

      if ((product.inventoryItemContainerDTO?.productBarcodeContainerDtoList ?? []).isNotEmpty) {
        for (ProductBarcodeContainerDTO productBarcodeContainerDTO
            in product.inventoryItemContainerDTO?.productBarcodeContainerDtoList ?? []) {
          if (productBarcodeContainerDTO.barCode.contains(searchString.trim())) {
            // print("****** found id ${product.productId} name ${product.productName}");
            foundItems.add(product);
          }
        }
      }
    }
    // print("---------- foundItems ${foundItems.length}");

    for (ProductMenuPanelContainerDTO panel in panelContainer) {
      for (ProductMenuPanelContentContainerDTO product in panel.productMenuPanelContainerDTOList) {
        if (kDebugMode) {
          print("----- id ${product.id} name ${product.name}");
        }
        for (ProductContainerDTO item in foundItems) {
          if (product.productId == item.productId) {
            // ->>>
            if (kDebugMode) {
              print("****** found name ${product.name}");
            }
            listItems.add(product);
          }
        }
      }
    }
    if (kDebugMode) {
      print("---------- listItems ${listItems.length}");
    }
    _gridItems = toProductItems(listItems);
    Log.printMethodReturn("filterProducts() - ${_gridItems.toString()}", "Sales Screen", "onTapTextField");

    setState(() {});

    widget._onSearchCompleted();
    Log.printMethodEnd("filterProducts()", "Sales Screen", "onTapTextField");
  }
}
