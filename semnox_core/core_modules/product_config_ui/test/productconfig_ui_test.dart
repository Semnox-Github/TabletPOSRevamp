import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:product_config_ui/add_product_quantity_dialog.dart';

void main() {}

class ProductConfig extends StatefulWidget {
  const ProductConfig({Key? key}) : super(key: key);

  @override
  State<ProductConfig> createState() => _ProductConfigState();
}

class _ProductConfigState extends State<ProductConfig> {
  String quantityValue = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return ProductQuantityDialog('Chicken Roasted', (value) {
                      setState(() {
                        quantityValue = value;
                      });
                      quantityValue = value;
                    });
                  });
            },
            child: const Text('Add Quantity'),
          ),
          Text('Value is  ...  $quantityValue'),
          // Text(SimpleCustomAlert()),
        ],
      ),
    );
  }
}
