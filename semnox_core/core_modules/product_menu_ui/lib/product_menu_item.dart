import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:product_menu_ui/models/product_grid_item.dart';
import 'package:themes_library/themes_library.dart';
import 'package:widgets_library/utils/size_config.dart';

class ProductMenuItem extends StatelessWidget {
  final GridItem _productMenuItemModel;
  final Function() _onInfoClicked;

  const ProductMenuItem(this._productMenuItemModel, this._onInfoClicked, {super.key});

  @override
  Widget build(BuildContext context) {
    SemnoxTheme theme = Theme.of(context).extension<SemnoxTheme>()!;
    SizeConfig.init(context);
    return SizedBox(
      child: Container(
        margin: EdgeInsets.only(
            left: _productMenuItemModel.cellMarginLeft.toDouble(),
            right: _productMenuItemModel.cellMarginRight.toDouble(),
            bottom: _productMenuItemModel.cellMarginBottom.toDouble(),
            top: _productMenuItemModel.cellMarginTop.toDouble()),
        child: Card(
          shadowColor: CupertinoColors.label,
          color: (_productMenuItemModel.dataObject.backColor?.isNotEmpty ?? false)
              ? Color.fromARGB(
                  255,
                  int.parse(_productMenuItemModel.dataObject.backColor.split(',')[0]),
                  int.parse(_productMenuItemModel.dataObject.backColor.split(',')[1]),
                  int.parse(_productMenuItemModel.dataObject.backColor.split(',')[2]))
              : theme.button1BG1,
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 1,
                  child: Text(
                    _productMenuItemModel.title,
                    style: TextStyle(
                        fontFamily: (_productMenuItemModel.dataObject.font?.isNotEmpty ?? false)
                            ? _productMenuItemModel.dataObject.font.split(',')[0]
                            : 'RobotoCondensed',
                        fontSize: SizeConfig.getFontSize((_productMenuItemModel.dataObject.font?.isNotEmpty ?? false)
                            ? double.parse(_productMenuItemModel.dataObject.font.split(',')[1])
                            : 16),
                        fontWeight: (_productMenuItemModel.dataObject.font != null &&
                                _productMenuItemModel.dataObject.font.isNotEmpty &&
                                _productMenuItemModel.dataObject.font.split(',')[2].toLowerCase().contains("bold"))
                            ? FontWeight.bold
                            : FontWeight.bold,
                        //FontWeight.normal,
                        fontStyle: (_productMenuItemModel.dataObject.font != null &&
                                _productMenuItemModel.dataObject.font.isNotEmpty &&
                                _productMenuItemModel.dataObject.font.split(',')[2].toLowerCase().contains("italic"))
                            ? FontStyle.italic
                            : FontStyle.normal,
                        color: (_productMenuItemModel.dataObject.textColor?.isNotEmpty ?? false)
                            ? Color.fromARGB(
                                255,
                                int.parse(_productMenuItemModel.dataObject.textColor.split(',')[0]),
                                int.parse(_productMenuItemModel.dataObject.textColor.split(',')[1]),
                                int.parse(_productMenuItemModel.dataObject.textColor.split(',')[2]))
                            : theme.secondaryColor),
                    maxLines: 2,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                if (_productMenuItemModel is ProductItem)
                  Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          _onInfoClicked();
                        },
                        child:  Icon(
                          Icons.info_outline,
                          color: theme.secondaryColor!,
                          size: SizeConfig.getSize(30),
                        ),
                      ),
                    ],
                  )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
