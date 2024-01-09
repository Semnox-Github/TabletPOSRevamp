library transaction_ui;

import 'dart:math';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:messages_data/builder.dart';
import 'package:themes_library/themes_library.dart';
import 'package:transaction_data/models/create_transaction/transaction_data.dart';
import 'package:transaction_ui/models/transaction_lines_group.dart';
import 'package:widgets_library/utils/size_config.dart';
import 'models/modifier_transaction_lines_group.dart';
import 'dart:math';

class TransactionLinesGroupView extends StatefulWidget {
  final TransactionLinesGroup _transactionLinesGroup;
  final bool _isSelected;
  final TransactionData? transactionData;
  final String currency;
  final String amountFmt;

  const TransactionLinesGroupView(this._transactionLinesGroup,
      this._isSelected, this.transactionData,
      this.currency,
      this.amountFmt,{super.key});

  @override
  State<TransactionLinesGroupView> createState() => _TransactionLinesGroupViewState();
}

class _TransactionLinesGroupViewState extends State<TransactionLinesGroupView> {
  SemnoxTheme? theme;

  @override
  Widget build(BuildContext context) {
    theme = Theme.of(context).extension<SemnoxTheme>()!;
    SizeConfig.init(context);

    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(
            bottom: SizeConfig.getSize(3.0),
          ),
          padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.getWidth(8),
              vertical: SizeConfig.getHeight(4)),
          decoration: BoxDecoration(
            color: (widget._isSelected) ? theme?.tableRowSelectedState1 : theme?.cartItemCardBG,
            borderRadius: BorderRadius.circular(SizeConfig.getSize(2)),
            border: Border.all(
              color: (widget._isSelected)
                  ? const Color.fromARGB(255, 194, 195, 200)
                  : theme?.scrollArea ?? Color(int.parse("0xFFFFFFFF")),
              width: 1,
            ),
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                      flex: SizeConfig.isBigDevice() ? 7 : 6,
                      child: Row(
                        children: [
                          Expanded(
                            flex: SizeConfig.isBigDevice() ? 7 : 6,
                            child: widget._transactionLinesGroup.additionalLineInformation != ''
                                ? Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      getProductNameView(widget._transactionLinesGroup.productName),
                                      Text(
                                        widget._transactionLinesGroup.additionalLineInformation,
                                        style: theme?.description2?.copyWith(fontSize: SizeConfig.getFontSize(14)),
                                        maxLines: 3,
                                        overflow: TextOverflow.ellipsis,
                                      )
                                    ],
                                  )
                                : widget._transactionLinesGroup.remarks != ''
                                    ? Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          getProductNameView(widget._transactionLinesGroup.productName),
                                          Text(
                                            widget._transactionLinesGroup.remarks,
                                            style: theme?.textFieldStyle?.copyWith(fontSize: SizeConfig.getFontSize(17.5)),
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                          )
                                        ],
                                      )
                                    : getProductNameView(widget._transactionLinesGroup.productName),
                          ),
                          // const Spacer(),
                          Expanded(
                            flex: SizeConfig.isBigDevice() ? 3 : 4,
                            child: Padding(
                              padding: EdgeInsets.only(left: SizeConfig.getWidth(1.5)),
                              child: Text(
                                formatAmount(widget._transactionLinesGroup.amount, widget.currency),
                                style: theme?.textFieldStyle?.copyWith(fontSize: SizeConfig.getFontSize(17.5)),
                                textAlign: TextAlign.end,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                        ],
                      )),
                  Expanded(
                      flex: SizeConfig.isBigDevice() ? 3 : 4,
                      // fit: FlexFit.tight,
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                                left: SizeConfig.getSize(2.0),
                                right: SizeConfig.getSize(2.0)),
                            child: Text(
                              MessagesProvider.get(" X "),
                              style: theme?.textFieldStyle?.copyWith(fontSize: SizeConfig.getFontSize(17.5)),
                              textAlign: TextAlign.start,
                            ),
                          ),
                          Text(
                            "${widget._transactionLinesGroup.amount < 0 ? "-" : ""}${widget._transactionLinesGroup.transactionLines.length.toString()}",
                            style: theme?.textFieldStyle?.copyWith(fontSize: SizeConfig.getFontSize(17.5)),
                            textAlign: TextAlign.start,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Expanded(
                            // fit: FlexFit.tight,
                            child: Text(
                              formatAmount(widget._transactionLinesGroup.amount *
                                  widget._transactionLinesGroup.transactionLines.length, widget.currency, isTotalAmt: true),
                              style: theme?.subtitle3?.copyWith(fontSize: SizeConfig.getFontSize(17.5)),
                              textAlign: TextAlign.end,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ))
                ],
              ),
              widget._transactionLinesGroup.modifierTransactionLinesGroup.isNotEmpty
                  ? modifierSubProduct(widget._transactionLinesGroup.modifierTransactionLinesGroup)
                  : const SizedBox(),
            ],
          ),
        ),
        widget._transactionLinesGroup.transactionLineDiscountDto.isNotEmpty
            ? Padding(
                padding: EdgeInsets.only(left: SizeConfig.getWidth(10.0)),
                child: Container(
                  margin: EdgeInsets.only(
                    bottom: SizeConfig.getHeight(3.0),
                  ),
                  padding: EdgeInsets.symmetric(
                      horizontal: SizeConfig.isBigDevice() ? 10.0 : 8, vertical: SizeConfig.isBigDevice() ? 6.0 : 4),
                  decoration: BoxDecoration(
                    color: (widget._isSelected) ? theme?.tableRowSelectedState1 : theme?.cartItemCardBG,
                    borderRadius: BorderRadius.circular(2),
                  ),
                  child: Column(
                    children: [discountSectionView()],
                  ),
                ),
              )
            : const SizedBox(),
      ],
    );
  }

  void refreshUi() {
    setState(() {});
  }

  Widget discountSectionView() {
    String totalDiscountAmount = formatAmount(double.parse((widget._transactionLinesGroup.transactionLineDiscountDto[0].discountAmount *
        widget._transactionLinesGroup.transactionLineDiscountDto[0].transactionDiscountDTOList?.length).toString()), widget.currency, isTotalAmt: true);
    return ListView.builder(
        itemCount: 1,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget._transactionLinesGroup.transactionLineDiscountDto[0].discountName.toString(),
                style: theme?.subtitle3?.copyWith(fontSize: SizeConfig.getFontSize(17.5)),
                textAlign: TextAlign.start,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
              Text(
                totalDiscountAmount,
                style: theme?.subtitle3?.copyWith(fontSize: SizeConfig.getFontSize(17.5)),
                textAlign: TextAlign.start,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
            ],
          );
        });
  }

  Widget getProductNameView(String productName) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          productName,
          style: theme?.subtitle3?.copyWith(fontSize: SizeConfig.getFontSize(17.5)),
          textAlign: TextAlign.start,
          overflow: TextOverflow.ellipsis,
          maxLines: 4,
        ),
      ],
    );
  }

  Widget modifierSubProduct(List<ModifierTransactionLinesGroup> modifiersList) {
    return modifiersList.isNotEmpty
        ? ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: modifiersList.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(top: SizeConfig.getHeight(4)),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          flex: SizeConfig.isBigDevice() ? 7 : 6,
                          child: Row(
                            children: [
                              Expanded(
                                flex: SizeConfig.isBigDevice() ? 7 : 6,
                                child: Row(
                                  children: [
                                    Padding(padding: EdgeInsets.only(left: SizeConfig.getWidth(8))),
                                    modifiersList[index].transactionLineDtoList[0].remarks != ''
                                        ? Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: [
                                              getModifierName(modifiersList[index].modifierName),
                                              Padding(
                                                padding: EdgeInsets.only(top: SizeConfig.getHeight(2.0)),
                                                child: Text(
                                                  modifiersList[index].transactionLineDtoList[0].remarks,
                                                  style: theme?.description2?.copyWith(fontSize: SizeConfig.getFontSize(14)),
                                                  maxLines: 3,
                                                  overflow: TextOverflow.ellipsis,
                                                ),
                                              )
                                            ],
                                          )
                                        : getModifierName(modifiersList[index].modifierName),
                                  ],
                                ),
                              ),
                              Expanded(
                                flex: SizeConfig.isBigDevice() ? 3 : 4,
                                child: Text(
                                  formatAmount(modifiersList[index].amount, widget.currency),
                                  style: theme?.textFieldStyle?.copyWith(fontSize: SizeConfig.getFontSize(17.5)),
                                  textAlign: TextAlign.end,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: SizeConfig.isBigDevice() ? 3 : 4,
                          child: Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                    left: SizeConfig.getSize(2.0),
                                    right: SizeConfig.getSize(2.0)),
                                child: Text(
                                  MessagesProvider.get(" X "),
                                  style: theme?.textFieldStyle?.copyWith(fontSize: SizeConfig.getFontSize(17.5)),
                                  textAlign: TextAlign.start,
                                ),
                              ),
                              Text(
                                "${modifiersList[index].amount < 0 ? "-" : ""}${modifiersList[index].transactionLineDtoList.length}",
                                style: theme?.textFieldStyle?.copyWith(fontSize: SizeConfig.getFontSize(17.5)),
                                textAlign: TextAlign.end,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              Expanded(
                                child: Text(
                                  formatAmount(modifiersList[index].amount * modifiersList[index].transactionLineDtoList.length, widget.currency, isTotalAmt: true),
                                  style: theme?.subtitle3?.copyWith(fontSize: SizeConfig.getFontSize(17.5)),
                                  maxLines: 1,
                                  textAlign: TextAlign.end,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    modifiersList[index].parentModifiersDtoList.isNotEmpty
                        ? parentModifierProductUI(modifiersList[index].parentModifiersDtoList)
                        : const SizedBox(),
                  ],
                ),
              );
            })
        : const SizedBox();
  }

  Widget getNestedModifierItemWidget(ModifierTransactionLinesGroup modifier) {
    return Padding(
      padding:  EdgeInsets.only(top: SizeConfig.getSize(8)),
      child: getNestedModifier([modifier]),
    );
  }

  Widget getNestedModifier(List<ModifierTransactionLinesGroup> modifiers) {
    return Padding(
      padding: EdgeInsets.only(left: SizeConfig.getSize(8)),
      child: Column(
        children: modifiers.map<Widget>((e) => nestedItem(e)).toList(),
      ),
    );
  }

  Widget nestedItem(ModifierTransactionLinesGroup modifier) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: EdgeInsets.only(top: SizeConfig.getHeight(0.0)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: SizeConfig.isBigDevice() ? 7 : 6,
                child: Row(
                  children: [
                    Expanded(
                      flex: SizeConfig.isBigDevice() ? 7 : 6,
                      child: Row(
                        children: [
                          Padding(padding: EdgeInsets.only(left: SizeConfig.getWidth(10), right: SizeConfig.getWidth(2))),
                          Text(
                            modifier.modifierName,
                            style: theme?.subtitle3?.copyWith(fontSize: SizeConfig.getFontSize(17.5)),
                            textAlign: TextAlign.start,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: SizeConfig.isBigDevice() ? 0 : 0,
                      child: Text(
                        formatAmount(modifier.amount, widget.currency),
                        style: theme?.textFieldStyle?.copyWith(fontSize: SizeConfig.getFontSize(17.5)),
                        textAlign: TextAlign.start,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: SizeConfig.isBigDevice() ? 3 : 4,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              left: SizeConfig.getSize(2.0),
                              right: SizeConfig.getSize(2.0)),
                          child: Text(
                            MessagesProvider.get(" X "),
                            style: theme?.textFieldStyle?.copyWith(fontSize: SizeConfig.getFontSize(17.5)),
                            textAlign: TextAlign.start,
                          ),
                        ),
                        Text(
                          "${modifier.amount < 0 ? "-" : ""}${modifier.transactionLineDtoList.length}",
                          style: theme?.textFieldStyle?.copyWith(fontSize: SizeConfig.getFontSize(17.5)),
                          textAlign: TextAlign.end,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Expanded(
                          child: Text(
                            formatAmount(modifier.amount * modifier.transactionLineDtoList.length, widget.currency, isTotalAmt: true),
                            style: theme?.subtitle3?.copyWith(fontSize: SizeConfig.getFontSize(17.5)),
                            maxLines: 1,
                            textAlign: TextAlign.end,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Visibility(
            visible: modifier.parentModifiersDtoList.isNotEmpty,
            child: SizedBox(height: SizeConfig.getSize(2))),
        Visibility(
          visible: modifier.parentModifiersDtoList.isNotEmpty,
          child: Padding(
            padding: EdgeInsets.only(left: SizeConfig.getSize(8)),
            child: getNestedModifier(modifier.parentModifiersDtoList),
          ),
        ),
      ],
    );
  }

  Widget getModifierName(String name) {
    return Text(
      name,
      style: theme?.subtitle3?.copyWith(fontSize: SizeConfig.getFontSize(17)),
      textAlign: TextAlign.start,
      overflow: TextOverflow.ellipsis,
      maxLines: 2,
    );
  }

  Widget parentModifierProductUI(List<ModifierTransactionLinesGroup> modifiersList) {
    return modifiersList.isNotEmpty
        ? ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: modifiersList.length,
            itemBuilder: (context, index) {
              return getNestedModifierItemWidget(modifiersList[index]);
            })
        : const SizedBox();
  }

  String formatAmount(double amount, String currency, {bool isTotalAmt = false}) {
    final format = NumberFormat(widget.amountFmt);
    return "${(amount < 0 && isTotalAmt) ? "-" : ""} $currency ${format.format(amount.abs())}";
  }
}
