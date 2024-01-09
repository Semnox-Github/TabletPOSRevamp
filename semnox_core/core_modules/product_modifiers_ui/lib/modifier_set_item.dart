import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:product_menu_data/models/product_price_container/modifier_set_container_dto.dart';
import 'package:product_modifiers_ui/models/modifier_dto.dart';
import 'package:themes_library/themes_library.dart';
import 'package:widgets_library/utils/size_config.dart';

class ModifierSetItem extends StatelessWidget {
  final ModifierSetContainerDTO? _setDTO;
  final List<ModifierDTO> selectedItems;
  final Function _callback;

  const ModifierSetItem(this._setDTO, this.selectedItems, this._callback, {super.key});

  @override
  Widget build(BuildContext context) {
    SemnoxTheme theme = Theme.of(context).extension<SemnoxTheme>()!;
    SizeConfig.init(context);
    return GestureDetector(
      onTap: () {
        _callback();
      },
      child: SizedBox(
        child: Card(
          shadowColor: CupertinoColors.label,
          color: theme.tableRow1,
          child: Padding(
            padding:  EdgeInsets.all(SizeConfig.getSize(6)),
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding:  EdgeInsets.only(
                        top: SizeConfig.getSize(8),
                        bottom: SizeConfig.getSize(8),
                        right: _getWarningIconVisibility() ? SizeConfig.getSize(32) : (_getCheckIconVisibility() ? SizeConfig.getSize(32) : 0),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Text(
                            _setDTO?.setName ?? '',
                            style:  TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: SizeConfig.getFontSize(18)
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
                Visibility(
                  visible: _getWarningIconVisibility(),
                  child: Positioned(
                    top: 0,
                    right: 1,
                    child: Icon(Icons.warning_amber, color: theme.primaryOpposite,  size: SizeConfig.getSize(20),),
                  ),
                ),
                Visibility(
                  visible: _getCheckIconVisibility(),
                  child: Positioned(
                    top: 0,
                    right: 1,
                    child: Icon(Icons.check_circle, color: theme.primaryOpposite, size: SizeConfig.getSize(20),),
                  ),
                ),
                Visibility(
                  visible: _getValidationTextVisibility(),
                  child: Positioned(
                    bottom: 0,
                    left: 1,
                    child: Text(
                      _getValidationText(),
                      style:  TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: SizeConfig.getFontSize(14)
                      ),
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  bool _getValidationTextVisibility() {
    if(_setDTO?.minQuantity != -1) {
      return true;
    }
    return false;
  }

  bool _getWarningIconVisibility() {
    if(_setDTO?.minQuantity != -1) {
      bool isProductAdded = true;
      for (var element in selectedItems) {
        if(element.modifierSetId == _setDTO?.modifierSetId) {
          isProductAdded = false;
          break;
        }
      }
      return isProductAdded;
    }
    return false;
  }

  bool _getCheckIconVisibility() {
    if(_setDTO?.minQuantity != -1) {
      bool isProductAdded = false;
      for (var element in selectedItems) {
        if(element.modifierSetId == _setDTO?.modifierSetId) {
          isProductAdded = true;
          break;
        }
      }
      return isProductAdded;
    }
    return false;
  }

  String _getValidationText() {
    String minValidation = (_setDTO?.minQuantity != -1) ? "Min: ${_setDTO?.minQuantity}" : "";
    String maxValidation = (_setDTO?.maxQuantity != -1) ? "Max: ${_setDTO?.maxQuantity}" : "";
    String validationText = (minValidation.isNotEmpty || maxValidation.isNotEmpty)
        ? "$minValidation${(minValidation.isNotEmpty && maxValidation.isNotEmpty) ? ", " : ""}$maxValidation"
        : "";
    return validationText;
  }
}
