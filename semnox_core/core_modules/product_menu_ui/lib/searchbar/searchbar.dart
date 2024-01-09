import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:themes_library/themes_library.dart';
import 'package:transaction_ui/cubit/transaction_cubit.dart';
import 'package:transaction_ui/cubit/transaction_cubit_state.dart';
import 'package:widgets_library/utils/size_config.dart';

typedef OnSearchClicked = void Function(String searchString);

class ProductMenuSearchBar extends StatefulWidget {
  final OnSearchClicked _onSearchClicked;

  const ProductMenuSearchBar(this._onSearchClicked, {super.key});

  @override
  State<StatefulWidget> createState() {
    return ProductMenuSearchBarState();
  }
}

class ProductMenuSearchBarState extends State<ProductMenuSearchBar> {
  final _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    SemnoxTheme theme = Theme.of(context).extension<SemnoxTheme>()!;
    SizeConfig.init(context);
    return Row(
      children: [
        Expanded(
          child: SizedBox(
            height: SizeConfig.getSize(52),
            child: TextFormField(
              controller: _textEditingController,
              onChanged: (text) {
                setState(() {});
              },
              style: GoogleFonts.robotoCondensed(
                  color: theme.secondaryColor, fontWeight: FontWeight.w400, fontSize: SizeConfig.getFontSize(20)),
              decoration: InputDecoration(
                hintText: "Search Product Name/Description/Search Description/HsnSacCode/BarCode",
                contentPadding: EdgeInsets.all(SizeConfig.getSize(8)),
                constraints: const BoxConstraints(
                  maxHeight: 40,
                ),
                border: InputBorder.none,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 1, color: theme.secondaryColor!),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 1, color: theme.secondaryColor!),
                ),
                hintStyle: theme.textFieldHintStyle!.copyWith(fontSize: SizeConfig.getFontSize(20)),
                suffixIcon: _textEditingController.text.isNotEmpty
                    ? IconButton(
                  padding: const EdgeInsets.all(0),
                        onPressed: () {
                          setState(() {
                            _textEditingController.clear();
                          });
                        },
                        icon: Icon(
                          Icons.cancel,
                          size: SizeConfig.getSize(50),
                          color: theme.secondaryColor,
                        ),
                      )
                    : null,
              ),
            ),
          ),
        ),
        SizedBox(
          width: SizeConfig.getSize(8),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.all(SizeConfig.getWidth(4)),
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            maximumSize: Size(SizeConfig.getSize(100), SizeConfig.getSize(52)),
            minimumSize: Size(SizeConfig.getSize(100), SizeConfig.getSize(52)),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(SizeConfig.getSize(8)), // <-- Radius
            ),
            backgroundColor: theme.button2BG1,
            foregroundColor: Colors.white,
          ),
          onPressed: () {
            widget._onSearchClicked(_textEditingController.text);
          },
          child: Text("Search".toUpperCase(),
              style: theme.heading5!.copyWith(color: theme.light1, fontSize: SizeConfig.getSize(18))),
        ),
        SizedBox(
          width: SizeConfig.getSize(8),
        ),
        BlocConsumer<TransactionCubit, TransactionCubitState>(
            listener: (context, state) {
              if(state.isInProductSearchMode == true) {
                if(state.barcodeReadData != null) {
                  _textEditingController.text = state.barcodeReadData!;

                  /**
                   * Search for the product directly without the click of Search button
                   */
                  widget._onSearchClicked(_textEditingController.text);
                } else {
                  _textEditingController.clear();
                }
              }
            },
            builder: (context, state) {
              return const SizedBox();
            }),
      ],
    );
  }
}
