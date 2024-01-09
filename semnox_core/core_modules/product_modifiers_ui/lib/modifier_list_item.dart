import 'package:flutter/material.dart';
import 'package:product_modifiers_ui/models/modifier_dto.dart';
import 'package:themes_library/themes_library.dart';
import 'package:widgets_library/utils/size_config.dart';

class ModifierListItem extends StatelessWidget {
  final ModifierDTO _transactionLineDTO;
  final Function _onInfoClicked;

  const ModifierListItem(this._transactionLineDTO, this._onInfoClicked, {super.key});

  @override
  Widget build(BuildContext context) {
    SemnoxTheme theme = Theme.of(context).extension<SemnoxTheme>()!;
    SizeConfig.init(context);
    return SizedBox(
      child: Card(
        shadowColor: theme.shadowColor,
        color: (_transactionLineDTO.quantity == 0)
            ? theme.button1BG1
            : theme.button2BG1,
        child: Padding(
          padding:  EdgeInsets.all(SizeConfig.getSize(4)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      (_transactionLineDTO.quantity == 0)
                          ? _transactionLineDTO.productName
                          : "${_transactionLineDTO.productName} (x${_transactionLineDTO.quantity.toInt()})",
                      style: (_transactionLineDTO.quantity == 0)
                          ? theme.cardTextUnselectedLight?.copyWith(color:theme.secondaryColor, fontSize:SizeConfig.getFontSize(18))
                          : theme.cardTextSelectedLight?.copyWith(fontSize:SizeConfig.getFontSize(18)),
                      maxLines: _transactionLineDTO.childModifiersCount != 0 ? 1 : 2,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Visibility(
                      visible: _transactionLineDTO.childModifiersCount != 0,
                      child: Text(
                        "${_transactionLineDTO.childModifiersCount.toInt()} Choices",
                        style: (_transactionLineDTO.quantity == 0)
                            ? theme.cardTextUnselectedLight?.copyWith(color:theme.secondaryColor, fontSize:SizeConfig.getFontSize(18))
                            : theme.cardTextSelectedLight?.copyWith(fontSize:SizeConfig.getFontSize(18)),
                        maxLines: 1,
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                      ),
                    )
                  ],
                ),
              ),
              Visibility(
                visible: !_transactionLineDTO.isModifierSet,
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        //show quantity dialog
                        _onInfoClicked();
                      },
                      child: Icon(
                        Icons.info_outline,
                        size: SizeConfig.getSize(24),
                        color: (_transactionLineDTO.quantity == 0) ? theme.secondaryColor : theme.light1!,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
