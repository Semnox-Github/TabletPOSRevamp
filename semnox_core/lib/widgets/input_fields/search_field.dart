import  'package:flutter/material.dart';
// import  'package:flutter_modular/flutter_modular.dart';
import  'package:focus_widget/focus_widget.dart';
import  'package:semnox_core/semnox_core.dart';

class SemnoxSearchBox extends StatelessWidget {
  const SemnoxSearchBox({Key? key, required this.properties}) : super(key: key);
  final SemnoxTextFieldProperties properties;
  @override
  Widget build(BuildContext context) {
    return FocusWidget(
      focusNode: properties.focusNode,
      child: IconTheme.merge(
        data: IconThemeData(
          color: Colors.black,
        ),
        child: TextFormField(
          focusNode: properties.focusNode,
          textAlignVertical: TextAlignVertical.center,
          decoration: InputDecoration(
            hintText: properties.hintText ?? "Search Something",
            border: InputBorder.none,
            prefixIcon: Padding(
              padding:
                  EdgeInsets.only(right: SemnoxPadding.mediumSpace(context)),
              child: SemnoxIcons.search
                  .toIcon(color: SemnoxConstantColor.black(context)),
            ),
            prefixIconConstraints: BoxConstraints(maxWidth: 30),
            suffixIcon: IconButton(
              onPressed: () {
                if (properties.value.isEmpty) {
                  Navigator.pop(context);
                  // Modular.to.pop();
                } else
                  properties.setInitialValue("");
              },
              icon: SemnoxIcons.close.toIcon(
                color: SemnoxConstantColor.black(context),
              ),
            ),
          ),
          controller: properties.textEditingController,
        ),
      ),
    );
  }
}
