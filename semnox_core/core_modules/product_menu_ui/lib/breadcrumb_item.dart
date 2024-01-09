import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:themes_library/themes_library.dart';
import 'package:widgets_library/utils/size_config.dart';

import 'models/product_grid_item.dart';

class BreadCrumbItemWidget extends StatefulWidget {
  GridItem _productMenuItemModel;

  BreadCrumbItemWidget(this._productMenuItemModel, {super.key});

  @override
  State<StatefulWidget> createState() {
    return BreadCrumb_State();
  }
}

class BreadCrumb_State extends State<BreadCrumbItemWidget> {

  @override
  Widget build(BuildContext context) {
    SemnoxTheme theme = Theme.of(context).extension<SemnoxTheme>()!;
    SizeConfig.init(context);
    return Container(
      decoration: BoxDecoration(
          color: theme.button1BG1,
          borderRadius: BorderRadius.circular(SizeConfig.getSize(6))
      ),
      child: Padding(
        padding:  EdgeInsets.all(SizeConfig.getSize(10)),
        child: Text(
          widget._productMenuItemModel.title,
          style: theme.heading2!.copyWith(fontSize:SizeConfig.getFontSize(26)),
          maxLines: 2,
          textAlign: TextAlign.center,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }


}
