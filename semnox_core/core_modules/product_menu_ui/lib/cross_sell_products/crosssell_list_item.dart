import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:themes_library/themes_library.dart';
import 'package:widgets_library/utils/size_config.dart';

import 'crosssell_product_model.dart';

class CrossSellListItem extends StatelessWidget {
  final CrossSellProductModel _crossSellProductModel;

  const CrossSellListItem(this._crossSellProductModel, {super.key});

  @override
  Widget build(BuildContext context) {
    SemnoxTheme theme = Theme.of(context).extension<SemnoxTheme>()!;
    return SizedBox(
      child: Card(
        shadowColor: CupertinoColors.label,
        color: (_crossSellProductModel.isSelected) ? theme.button2BG1 : theme.button1BG1,
        child: Padding(
          padding:  EdgeInsets.symmetric(vertical: SizeConfig.getSize(4), horizontal: SizeConfig.getSize(8)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 1,
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    "${_crossSellProductModel.productContainerDTO.productName} ${_crossSellProductModel.crossSellProductsContainerDTO.offerMessage}",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: SizeConfig.getFontSize(18),
                      color: (_crossSellProductModel.isSelected) ? Colors.white : theme.secondaryColor,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
