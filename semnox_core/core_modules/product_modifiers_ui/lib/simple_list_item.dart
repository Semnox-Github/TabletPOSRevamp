import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:product_modifiers_ui/models/selected_item_model.dart';
import 'package:widgets_library/utils/size_config.dart';

class SimpleListItem extends StatelessWidget {
  final SelectedItemModel _model;

  SimpleListItem(this._model, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Card(
        shadowColor: CupertinoColors.label,
        color: (_model.isSelected) ? Colors.black : const Color.fromARGB(255, 239, 241, 250),
        child: Padding(
          padding:  EdgeInsets.all(SizeConfig.getSize(4)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 1,
                child: Text(
                  _model.title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: SizeConfig.getFontSize(18),
                    color: (_model.isSelected) ? Colors.white : Colors.black,
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
