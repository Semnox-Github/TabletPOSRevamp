import 'package:customer_ui/utils/AppStyle.dart';
import 'package:flutter/material.dart';
import 'package:themes_library/themes_library.dart';

class ContactWidget extends StatelessWidget {
  String title;
  String? hint;
  TextEditingController? controller;
  VoidCallback? onAdd;
  VoidCallback? onRemove;
  String? validationText;
  TextInputType? keyboardType;
  int? maxLength;
  var inputFormatter;

  ContactWidget(
      {super.key,
      required this.title,
      this.hint,
      this.controller,
      this.onAdd,
      this.onRemove,
      this.validationText,
      this.keyboardType,
      this.maxLength,
      this.inputFormatter});

  @override
  Widget build(BuildContext context) {
    SemnoxTheme theme = Theme.of(context).extension<SemnoxTheme>()!;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style:
              AppStyle.customerTextBold.copyWith(color: theme.primaryOpposite),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
              child: TextFormField(
                controller: controller,
                textAlign: TextAlign.start,
                style: AppStyle.customerText,
                keyboardType: keyboardType,
                maxLength: maxLength,
                inputFormatters: inputFormatter != null ? [inputFormatter] : [],
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) {
                  if (validationText == null) {
                    return null;
                  } else if (value == null || value.isEmpty) {
                    return validationText;
                  }
                  return null;
                },
                decoration: InputDecoration(
                  isDense: true,
                  contentPadding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  hintText: hint,
                  hintStyle: AppStyle.customerText
                      .copyWith(color: theme.primaryOpposite),
                  counterText: '',
                  counterStyle: const TextStyle(fontSize: 0),
                ),
              ),
            ),
            const SizedBox(
              width: 8.0,
            ),
            Container(
              decoration: BoxDecoration(
                color: theme.button2InnerShadow1,
                borderRadius: BorderRadius.circular(6),
              ),
              child: IconButton(
                onPressed: onAdd,
                icon: const Icon(Icons.add),
                padding: const EdgeInsets.all(6.0),
                constraints: const BoxConstraints(),
                color: theme.light1!,
              ),
            ),
            const SizedBox(
              width: 8.0,
            ),
            Container(
              decoration: BoxDecoration(
                color: theme.button2InnerShadow1,
                borderRadius: BorderRadius.circular(6),
              ),
              child: IconButton(
                onPressed: onRemove,
                icon: const Icon(Icons.remove),
                padding: const EdgeInsets.all(6.0),
                constraints: const BoxConstraints(),
                color: theme.light1!,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 8.0,
        ),
      ],
    );
  }
}
