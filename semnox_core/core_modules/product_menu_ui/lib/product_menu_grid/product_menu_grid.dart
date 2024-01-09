import 'package:flutter/cupertino.dart';
import 'package:master_data/master_data_bl.dart';
import 'package:messages_data/builder.dart';
import 'package:widgets_library/scroller.dart';
import 'package:widgets_library/utils/size_config.dart';

import '../extensions/grid_builder_extension.dart';
import '../models/product_grid_item.dart';
import 'menu_grid_item.dart';

class ProductMenuGrid extends StatelessWidget {
  const ProductMenuGrid({Key? key, required this.dataListForGrid, required this.defaultButtonHeight, required this.defaultButtonWidth, required this.productSelectedCallback, required this.masterDataBl}) : super(key: key);
  final List<GridItem> dataListForGrid;
  final double defaultButtonHeight;
  final double defaultButtonWidth;
  final Function productSelectedCallback;
  final MasterDataBLContract masterDataBl;

  @override
  Widget build(BuildContext context) {
    ScrollController menuVerticalScroll = ScrollController();
    SizeConfig.init(context);
    return  Expanded(
      flex: 1,
      child: LayoutBuilder(
          builder: (context, constraints) {
            return  dataListForGrid.isNotEmpty? Scroller(
              controller: menuVerticalScroll,
              child: GridView.builder(
                controller: menuVerticalScroll,
                padding: const EdgeInsets.only(left: 4.0, right:0.0),
                itemCount: dataListForGrid.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCountAndFixedHeight(
                  crossAxisCount:2,
                  crossAxisSpacing: 0,
                  mainAxisSpacing: 0,
                  height:SizeConfig.getHeight(defaultButtonHeight+4),
                  width: constraints.maxWidth>550 ?(SizeConfig.getWidth(defaultButtonWidth*2)):constraints.maxWidth*.45,
                ),
                shrinkWrap: true,
                physics: const ClampingScrollPhysics(),
                itemBuilder: (context, index) {
                  if (dataListForGrid.isNotEmpty) {
                    GridItem item = dataListForGrid[index];
                    return MenuGridItem( gridItem: item, productSelectedCallback: productSelectedCallback,masterDataBl:masterDataBl);
                  }
                  return  Text(MessagesProvider.get("No items"));
                },
              ),
            ):Text(MessagesProvider.get("No items"));
          }
      ),
    );
  }
}
