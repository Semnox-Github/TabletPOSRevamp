import 'package:flutter/material.dart';
import 'package:product_menu_data/models/product_menu_panel_container_dto.dart';
import 'package:product_menu_data/models/product_menu_panel_content_container_dto.dart';
import 'package:product_menu_ui/product_menu_item.dart';
import 'package:widgets_library/scroller.dart';

import 'models/product_grid_item.dart';

class ProductGrid extends StatefulWidget {
  List<GridItem> _dataListForGrid;
  final Function _productSelectedCallback;
  final Function _onInfoClicked;

  ProductGrid(this._dataListForGrid, this._productSelectedCallback, this._onInfoClicked, {super.key});

  @override
  State<StatefulWidget> createState() {
    return _ProductGridState();
  }
}

class _ProductGridState extends State<ProductGrid> {
  final ScrollController verticalScroll = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 1,
      child: Scroller(
        controller: verticalScroll,
        child: GridView.builder(
          controller: verticalScroll,
          padding: const EdgeInsets.only(left: 4.0, right: 24.0),
          itemCount: widget._dataListForGrid.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 2.5,
          ),
          shrinkWrap: true,
          physics: const ClampingScrollPhysics(),
          itemBuilder: (context, index) {
            if (widget._dataListForGrid.isNotEmpty) {
              GridItem item = widget._dataListForGrid[index];
              return getProductMenuItem(item);
            }
            return const Text("No items");
          },
        ),
      ),
    );
  }

  Widget getProductMenuItem(GridItem gridItem) {
    return GestureDetector(
      onTap: () {
        if (gridItem is PanelItem) {
          widget._productSelectedCallback(gridItem);
        } else if (gridItem is ProductItem) {
          ProductMenuPanelContentContainerDTO productMenuContentPanelContainerDTO =
              (gridItem.dataObject as ProductMenuPanelContentContainerDTO);
          var isSubPanel = (productMenuContentPanelContainerDTO.productId == -1 &&
              productMenuContentPanelContainerDTO.childPanelId != -1);
          if (isSubPanel) {
            widget._productSelectedCallback(gridItem);
          } else {
            // the clicked item is a product
            widget._productSelectedCallback(gridItem);
          }
        }
        setState(() {});

        //
      },
      child: ProductMenuItem(gridItem, () {
        widget._onInfoClicked(gridItem);
      }),
    );
  }

  ProductMenuPanelContainerDTO? getProductMenuPanelContainerDTO(int panelId) {
    for (var productMenuPanel in widget._dataListForGrid) {
      if (productMenuPanel is PanelItem && productMenuPanel.id == panelId) {
        return productMenuPanel.dataObject;
      }
    }
    return null;
  }
}
