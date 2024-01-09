import 'package:flutter/material.dart';
import 'package:product_menu_data/models/product_price_container/modifier_set_container_dto.dart';
import 'package:product_modifiers_ui/models/modifier_customization_model.dart';
import 'package:product_modifiers_ui/models/modifier_dto.dart';
import 'package:themes_library/themes_library.dart';
import 'package:widgets_library/utils/size_config.dart';

class ProductListItem extends StatelessWidget {
  late String _title;
  int _index;
  final bool _isSelected;
  String _subTitle;
  Function _onClick;
  final List<ModifierCustomizationModel> _customizationItems;
  final List<ModifierSetContainerDTO> _requiredModifiers;

  ProductListItem(this._index, this._subTitle, this._isSelected, this._customizationItems, this._requiredModifiers, this._onClick, {super.key}) {
    _title = "Item ${_index + 1}";
  }

  @override
  Widget build(BuildContext context) {
    SemnoxTheme theme = Theme.of(context).extension<SemnoxTheme>()!;
    final brightness = MediaQuery.platformBrightnessOf(context);
    final isDarkModeEnabled = brightness == Brightness.dark;
    SizeConfig.init(context);
    return Padding(
      padding:  EdgeInsets.only(right: SizeConfig.getSize(4)),
      child: GestureDetector(
        onTap: () {
          _onClick(_index);
        },
        child: SizedBox(
          child: Card(
            shadowColor: theme.shadowColor,
            color: (_isSelected) ? theme.cardStateSelectedLight : theme.cardStateUnselectedLight,
            child: Padding(
              padding:  EdgeInsets.all(SizeConfig.getSize(4)),
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                _title,
                                style:
                                (_isSelected) ? theme.cardTextSelectedLight!.copyWith(fontSize:SizeConfig.getFontSize(18)) : theme.cardTextUnselectedLight!.copyWith(fontSize:SizeConfig.getFontSize(18)),
                                maxLines: 1,
                                textAlign: TextAlign.center,
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text(
                                _subTitle,
                                maxLines: 1,
                                style:
                                (_isSelected) ? theme.cardTextSelectedLight!.copyWith(fontSize:SizeConfig.getFontSize(18)) : theme.cardTextUnselectedLight!.copyWith(fontSize:SizeConfig.getFontSize(18)),
                                textAlign: TextAlign.center,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Visibility(
                    visible: _getWarningIconVisibility(),
                    child: Positioned(
                      top: 0,
                      right: 1,
                      child: Icon(Icons.warning_amber, color: _isSelected ? (
                          isDarkModeEnabled ? theme.primaryOpposite : theme.primaryColor
                      ) : (
                          isDarkModeEnabled ? theme.primaryColor : theme.primaryOpposite
                      ),  size: SizeConfig.getSize(20),),
                    ),
                  ),
                  Visibility(
                    visible: _getCheckIconVisibility(),
                    child: Positioned(
                      top: 0,
                      right: 1,
                      child: Icon(Icons.check_circle, color: _isSelected ? (
                      isDarkModeEnabled ? theme.primaryOpposite : theme.primaryColor
                      ) : (
                      isDarkModeEnabled ? theme.primaryColor : theme.primaryOpposite
                      ), size: SizeConfig.getSize(20),),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  bool _getWarningIconVisibility() {
    if(_requiredModifiers.isNotEmpty) {
      int completed = 0;
      for (var element in _requiredModifiers) {
        _customizationItems[_index].selectedItems.firstWhere((e) {
          if(e.modifierSetId == element.modifierSetId) {
            completed++;
            return true;
          } else {
            return false;
          }
        }, orElse: () => ModifierDTO(-1,-1,-1,"", 0, false, false, false, 0, false, 0));
      }
      return completed != _requiredModifiers.length;
    }
    return false;
  }

  bool _getCheckIconVisibility() {
    if(_requiredModifiers.isNotEmpty) {
      int completed = 0;
      for (var element in _requiredModifiers) {
        _customizationItems[_index].selectedItems.firstWhere((e) {
          if(e.modifierSetId == element.modifierSetId) {
            completed++;
            return true;
          } else {
            return false;
          }
        }, orElse: () => ModifierDTO(-1,-1,-1,"", 0, false, false, false, 0, false, 0));
      }
      return completed == _requiredModifiers.length;
    }
    return false;
  }
}
