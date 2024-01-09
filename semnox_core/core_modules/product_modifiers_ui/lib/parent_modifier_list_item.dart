import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:product_modifiers_ui/models/modifier_dto.dart';
import 'package:themes_library/themes_library.dart';
import 'package:widgets_library/utils/size_config.dart';

class ParentModifierListItem extends StatelessWidget {
  final ModifierDTO _transactionLineDTO;

  const ParentModifierListItem(this._transactionLineDTO, {super.key});

  @override
  Widget build(BuildContext context) {
    SemnoxTheme theme = Theme.of(context).extension<SemnoxTheme>()!;
    SizeConfig.init(context);
    return SizedBox(
      child: Card(
        shadowColor: CupertinoColors.label,
        color: (_transactionLineDTO.quantity == 0) ? theme.button1BG1 : theme.secondaryColor,
        child: Padding(
          padding:  EdgeInsets.all(SizeConfig.getSize(4)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 1,
                child: Text(
                  _transactionLineDTO.productName,
                  style: TextStyle(
                    fontSize:SizeConfig.getFontSize(18),
                    fontWeight: FontWeight.bold,
                    color: (_transactionLineDTO.isDisabled)
                        ? theme.dividerColor
                        : (_transactionLineDTO.quantity == 0)
                            ? theme.secondaryColor
                            : theme.primaryColor,
                  ),
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
