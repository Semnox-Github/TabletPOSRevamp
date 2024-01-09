import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:payment_ui/utils/colors.dart';
import 'package:payment_ui/utils/styles.dart';
import 'package:themes_library/themes_library.dart';
import 'package:widgets_library/utils/size_config.dart';

typedef OnQuantityUpdated = Function(int updatedQty);

class AddQuantityWidget extends StatefulWidget {
  final int initialQuantity;
  final OnQuantityUpdated onQtyUpdated;

  const AddQuantityWidget({
    required this.onQtyUpdated,
    this.initialQuantity = 0, super.key
  });

  @override
  State<AddQuantityWidget> createState() => _AddQuantityWidgetState();
}

class _AddQuantityWidgetState extends State<AddQuantityWidget> {
  int _quantity = 0;
  final _quantityTextController = TextEditingController();

  @override
  void initState() {
    _updateTextController();
    super.initState();
  }

  void _incrementQuantity() {
    _quantity = int.parse(_quantityTextController.text);
    setState(() {
      _quantity++;
      _quantityTextController.text =
          (_quantity < 1000 ? _quantity : 999).toString();
      widget.onQtyUpdated(_quantity);
      _quantityTextController.selection =
          TextSelection.collapsed(offset: _quantityTextController.text.length);
      _quantityTextController.selection = TextSelection.fromPosition(
          TextPosition(offset: _quantityTextController.text.length));
    });
  }

  void _decrementQuantity() {
    _quantity = int.parse(_quantityTextController.text);
    setState(() {
      _quantity--;
      _quantityTextController.text = (_quantity > 0 ? _quantity : 0).toString();
      widget.onQtyUpdated(_quantity > 0 ? _quantity : 0);
      _quantityTextController.selection =
          TextSelection.collapsed(offset: _quantityTextController.text.length);
      _quantityTextController.selection = TextSelection.fromPosition(
          TextPosition(offset: _quantityTextController.text.length));
    });
  }

  void _refreshQuantity() {
    _quantity = int.parse(_quantityTextController.text);
    setState(() {
      _quantityTextController.text = (_quantity > 0 ? _quantity : 0).toString();
      widget.onQtyUpdated(_quantity > 0 ? _quantity : 0);
      _quantityTextController.selection =
          TextSelection.collapsed(offset: _quantityTextController.text.length);
      _quantityTextController.selection = TextSelection.fromPosition(
          TextPosition(offset: _quantityTextController.text.length));
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<SemnoxTheme>()!;
    _updateTextController();
    return Container(
      height: SizeConfig.getHeight(88),
      width: SizeConfig.getWidth(363),
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Center(
        child: TextField(
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
          ],
          onSubmitted: (text) {
            if (_quantityTextController.text.isEmpty) {
              _quantityTextController.text = '0';
            } else {
              if(_quantityTextController.text.toString().startsWith('0') && _quantityTextController.text.toString().length > 1) {
                _quantityTextController.text = _quantityTextController.text.substring(1);
              }
            }
            _quantityTextController.selection =
                TextSelection.collapsed(
                    offset:
                    _quantityTextController.text.length);
            _refreshQuantity();
          },
          onChanged: (text) {
            if (_quantityTextController.text.isEmpty) {
              _quantityTextController.text = '0';
            } else {
              if(_quantityTextController.text.toString().startsWith('0') && _quantityTextController.text.toString().length > 1) {
                _quantityTextController.text = _quantityTextController.text.substring(1);
              }
            }
            _quantityTextController.selection =
                TextSelection.collapsed(
                    offset:
                    _quantityTextController.text.length);
          },
          cursorWidth: 0,
          cursorHeight: 0,
          controller: _quantityTextController,
          autofocus: false,
          maxLength: 3,
          style: theme.heading5?.copyWith(fontSize: SizeConfig.getFontSize(28)) ?? tsS24W70016,
          textAlign: TextAlign.center,
          textAlignVertical: TextAlignVertical.center,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            counterText: '',
            contentPadding: const EdgeInsets.only(top: 8),
            prefixIcon: ConstrainedBox(
              constraints: BoxConstraints.tightFor(width: SizeConfig.getSize(88), height: SizeConfig.getSize(88)),
              child: Padding(
                padding: const EdgeInsets.all(6),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.only(
                          left: 2, right: 2),
                      backgroundColor: const Color(0xffE9EBF6)), //todo c
                  onPressed: () {
                    _decrementQuantity();
                  },
                  child: Icon(
                    Icons.remove,
                    color: theme.darkTextColor ?? Colors.black,
                  ),
                ),
              ),
            ),
            suffixIcon: ConstrainedBox(
              constraints: BoxConstraints.tightFor(width: SizeConfig.getSize(88), height: SizeConfig.getSize(88)),
              child: Padding(
                padding: const EdgeInsets.all(6),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.only(
                          left: 2, right: 2),
                      backgroundColor: const Color(0xffE9EBF6)),
                  onPressed: () {
                    _incrementQuantity();
                  },
                  child: Icon(
                    Icons.add,
                    color: theme.darkTextColor ?? Colors.black,
                  ),
                ),
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(8)),
              borderSide: BorderSide(
                width: 1,
                color: theme.scrollDisabled ?? colorGreyD8,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(8)),
              borderSide: BorderSide(
                width: 1,
                color: theme.scrollDisabled ?? colorGreyD8,
              ),
            ),
            border: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(8)),
              borderSide: BorderSide(
                width: 1,
                color: theme.scrollDisabled ?? colorGreyD8,
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _updateTextController() {
    _quantity = widget.initialQuantity;
    _quantityTextController.text = '$_quantity';
    _quantityTextController.selection =
        TextSelection.collapsed(offset: _quantityTextController.text.length);
    _quantityTextController.selection = TextSelection.fromPosition(
        TextPosition(offset: _quantityTextController.text.length));
  }
}
