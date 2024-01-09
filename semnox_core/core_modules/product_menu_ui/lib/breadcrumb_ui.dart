import 'package:flutter/material.dart';
import 'package:flutter_breadcrumb/flutter_breadcrumb.dart';
import 'package:logs_data/logger.dart';
import 'package:widgets_library/utils/size_config.dart';

import 'breadcrumb_item.dart';
import 'models/product_grid_item.dart';

class BreadcrumbUI extends StatefulWidget {
  final List<GridItem> _breadCrumbsList = [];

  late _BreadcrumbState _breadcrumbState;

  Function(GridItem productMenuItemModel) onBreadcrumbClicked;

  BreadcrumbUI(this.onBreadcrumbClicked, {super.key}) {
    _breadcrumbState = _BreadcrumbState();
    // breadCrumbsList.add(ProductMenuItemModel("Menu", false, null));
  }

  @override
  State<StatefulWidget> createState() {
    return _breadcrumbState;
  }

  void addBreadCrumb(GridItem productMenuItemModel) {
    _breadCrumbsList.add(productMenuItemModel);
    _breadcrumbState.refreshUI();
  }

  void resetBreadCrumb() {
    _breadCrumbsList.removeRange(1, _breadCrumbsList.length);
    GridItem productMenuItemModel = _breadCrumbsList[0];
    onBreadcrumbClicked(productMenuItemModel);
    _breadcrumbState.refreshUI();
  }
}

class _BreadcrumbState extends State<BreadcrumbUI> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scrollbar(
      thumbVisibility: true,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
             Icon(Icons.arrow_right, size: SizeConfig.getSize(30),),
            BreadCrumb.builder(
              itemCount: widget._breadCrumbsList.length,
              builder: (index) {
                GridItem productMenuItemModel =
                    widget._breadCrumbsList[index];
                return BreadCrumbItem(
                    content: GestureDetector(
                        onTap: () {
                          Log.v("breadcrumb clicked");
                          if (index != widget._breadCrumbsList.length - 1) {
                            widget.onBreadcrumbClicked(productMenuItemModel);
                            widget._breadCrumbsList.removeRange(
                                index + 1, widget._breadCrumbsList.length);
                            Future.microtask(() => refreshUI());
                          }
                        },
                        child: BreadCrumbItemWidget(productMenuItemModel)));
              },
              divider:  Icon(Icons.arrow_right,  size: SizeConfig.getSize(30),),
              overflow: ScrollableOverflow(
                keepLastDivider: false,
                reverse: false,
                direction: Axis.horizontal,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void refreshUI() {
    try {
      setState(() {});
    } catch (e) {
      // Log.v(e);
    }
  }
}
