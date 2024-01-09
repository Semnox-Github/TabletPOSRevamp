import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:themes_library/themes_library.dart';
import 'package:widgets_library/utils/size_config.dart';
import 'cubit/order_transaction_lines_cubit.dart';
import 'cubit/order_transaction_lines_state.dart';

class SearchMenuView extends StatefulWidget {
  const SearchMenuView(
      {super.key,
      required this.title,
      required this.dropdownValues,
      required this.selectedValueCallback});

  final String title;
  final List<String> dropdownValues;
  final Function(String value) selectedValueCallback;

  @override
  State<StatefulWidget> createState() => _SearchMenuViewState();
}

class _SearchMenuViewState extends State<SearchMenuView> {
  String selectedDropDownValue = '';

  @override
  void initState() {
    selectedDropDownValue = widget.dropdownValues.first;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    final theme = Theme.of(context).extension<SemnoxTheme>()!;
    return BlocBuilder<OrderTransactionLinesCubit, OrderTransactionLinesState>(
        builder: (context, OrderTransactionLinesState orderTransactionLinesState) {
      if (orderTransactionLinesState.shouldClearSearchFilter == true) {
        selectedDropDownValue = widget.dropdownValues[0];
        context.read<OrderTransactionLinesCubit>().resetShouldClearSearchFilter();
      }
      return Container(
        margin: EdgeInsets.only(top: SizeConfig.getHeight(16), left: SizeConfig.getWidth(22)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(SizeConfig.getSize(0)),
              child: Text(
                widget.title,
                style: theme.heading6?.copyWith(color: theme.secondaryColor, fontSize: SizeConfig.getFontSize(20)),
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                // left: SizeConfig.getWidth(16),
                top: SizeConfig.getHeight(0),
                bottom: SizeConfig.getHeight(0),
              ),
              height: SizeConfig.getHeight(42),
              margin: EdgeInsets.only(top: SizeConfig.getHeight(8)),
              child: InputDecorator(
                decoration: InputDecoration(
                    focusColor: theme.cartItemCardBG,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(SizeConfig.getSize(8))),
                      borderSide: BorderSide(color: theme.secondaryColor!, width: SizeConfig.getWidth(1)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(SizeConfig.getSize(8)),
                      borderSide: BorderSide(color: theme.secondaryColor!, width: SizeConfig.getWidth(1)),
                    ),
                    filled: true,
                    fillColor: theme.cartItemCardBG,
                    contentPadding: EdgeInsets.all(SizeConfig.getSize(10))),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    isExpanded: true,
                    icon: const Icon(Icons.keyboard_arrow_down),
                    iconSize: SizeConfig.getSize(30),
                    isDense: true,
                    value: selectedDropDownValue,
                    items: widget.dropdownValues.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: theme.subtitle2?.copyWith(fontSize: SizeConfig.getFontSize(18)),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedDropDownValue = newValue!;
                        widget.selectedValueCallback(selectedDropDownValue);
                      });
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
