import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:themes_library/themes_library.dart';
import 'package:widgets_library/utils/size_config.dart';

import 'upsell_product_model.dart';

class UpsellListItem extends StatelessWidget {
  final UpsellProductModel _upsellProductModel;

  const UpsellListItem(this._upsellProductModel, {super.key});

  @override
  Widget build(BuildContext context) {
    SemnoxTheme theme = Theme.of(context).extension<SemnoxTheme>()!;
    return SizedBox(
      child: Card(
        shadowColor: CupertinoColors.label,
        color: (_upsellProductModel.isSelected) ? theme.button2BG1 : theme.button1BG1,
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
                    "${_upsellProductModel.productContainerDTO.productName} ${_upsellProductModel.upsellOffersContainerDTO.offerMessage}",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: SizeConfig.getFontSize(16),
                      color: (_upsellProductModel.isDisabled)
                          ? const Color.fromARGB(255, 211, 211, 219)
                          : (_upsellProductModel.isSelected)
                              ? Colors.white
                              : theme.secondaryColor,
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
