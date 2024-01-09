import 'package:execution_context/builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:master_data/builder.dart';
import 'package:messages_data/builder.dart';
import 'package:other_function_ui/bloc/other_function_bloc.dart';
import 'package:other_function_ui/widgets/colors.dart';
import 'package:themes_library/themes_library.dart';
import 'package:widgets_library/number_pad/number_pad.dart';

class RefundWidget extends StatefulWidget {
  final bool isChecked;
  const RefundWidget({super.key, required this.isChecked});

  @override
  State<RefundWidget> createState() => _RefundWidgetState();
}

class _RefundWidgetState extends State<RefundWidget> {
  final rowList = <DataRow>[];
  String currency = '';
  String amountFmt = '#,##0.00';

  @override
  void initState() {
    Future.microtask(() async {
      final execContextBL = await ExecutionContextBuilder.build();
      final masterDataBL = await MasterDataBuilder.build(execContextBL.getExecutionContext()!);
      currency = await masterDataBL.getDefaultValuesByName(defaultValueName: 'CURRENCY_SYMBOL') ?? '';
      amountFmt = await masterDataBL.getDefaultValuesByName(defaultValueName: 'AMOUNT_FORMAT') ?? '#,##0.00';
      setState(() {});
    });
    Future.microtask(() => addRowItems());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SemnoxTheme theme = Theme.of(context).extension<SemnoxTheme>()!;
    return BlocBuilder<OtherFunctionBloc, OtherFunctionState>(
      builder: (context, state) {
        OtherFunctionBloc otherFunctionBloc = context.read<OtherFunctionBloc>();
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                    border: Border.all(color: KColor.borderGrey),
                    borderRadius: BorderRadius.circular(18)),
                child: Theme(
                  data: Theme.of(context)
                      .copyWith(dividerColor: Colors.transparent),
                  child: DataTable(
                    columnSpacing: 16.0,
                    dataRowHeight: 25.0, // Set the height of each data row

                    columns: [
                      DataColumn(
                        label: IntrinsicHeight(
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom:
                                        BorderSide(color: KColor.borderGrey))),
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * 0.3,
                                    child: const Text(
                                      'Credit Type',

                                      overflow: TextOverflow.ellipsis,
                                      // style: AppStyle.dialogHeading2TextStyle,
                                    ),
                                  ),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * 0.3,
                                    child: const Text(
                                      'Value',
                                      maxLines: 2,
                                      textAlign: TextAlign.center,
                                      overflow: TextOverflow.ellipsis,
                                      // style: AppStyle.dialogHeading2TextStyle,
                                    ),
                                  ),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * 0.3,
                                    child: Text(
                                      'Refund($currency)',
                                      textAlign: TextAlign.center,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      // style: AppStyle.dialogHeading2TextStyle,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                    rows: rowList,
                  ),
                ),
              ),
              const Divider(),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                width: MediaQuery.of(context).size.width * 0.9,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ValueListenableBuilder(
                      builder: (BuildContext context, value, Widget? child) {
                        return IgnorePointer(
                          ignoring: value,
                          child: Column(
                            children: [
                              Text(
                                MessagesProvider.get('Enter Amount to Refund:'),
                                style: TextStyle(
                                    color: value
                                        ? const Color(0xFFD3D3DB)
                                        : theme.primaryOpposite),
                              ),
                              BlocBuilder<OtherFunctionBloc,
                                  OtherFunctionState>(
                                builder: (context, state) {
                                  OtherFunctionBloc otherFunctionBloc =
                                      context.read<OtherFunctionBloc>();
                                  return GestureDetector(
                                    onTap: () {
                                      showDialog(
                                        barrierDismissible: true,
                                        context: context,
                                        barrierColor: const Color(0x01000000),
                                        builder: (BuildContext context) {
                                          return NumberPad(
                                            isDecimalRequired: false,
                                            initialOffset: const Offset(50, 50),
                                            title: '',
                                            onOkPressed: (int value) {
                                              setState(() {
                                                otherFunctionBloc.refundValue.value = value.toDouble();
                                                otherFunctionBloc.refundApiValue = value.toDouble();
                                              });
                                            },
                                          );
                                        },
                                      );
                                    },
                                    child: Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.16,
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          border: Border.all(
                                              color: KColor.borderGrey)),
                                      child: ValueListenableBuilder(
                                        valueListenable:
                                            otherFunctionBloc.refundValue,
                                        builder: (context, refund, child) {
                                          return Text(
                                            '$refund',
                                            style: TextStyle(
                                                color: value
                                                    ? const Color(0xFFD3D3DB)
                                                    : theme.primaryOpposite),
                                            textAlign: TextAlign.center,
                                          );
                                        },
                                      ),
                                    ),
                                  );
                                },
                              )
                            ],
                          ),
                        );
                      },
                      valueListenable:
                          context.read<OtherFunctionBloc>().isMakeNew,
                    ),
                    ValueListenableBuilder(
                      valueListenable:
                          context.read<OtherFunctionBloc>().isMakeNew,
                      builder: (context, value, child) {
                        return Column(
                          children: [
                            Text(
                              MessagesProvider.get('Tax Amount:'),
                              style: TextStyle(
                                  color:  theme.primaryOpposite),
                            ),
                            BlocBuilder<OtherFunctionBloc, OtherFunctionState>(
                              builder: (context, state) {
                                OtherFunctionBloc otherFunctionBloc =
                                    context.read<OtherFunctionBloc>();
                                return GestureDetector(
                                  onTap: () {
                                    /*showDialog(
                                      barrierDismissible: true,
                                      context: context,
                                      barrierColor: const Color(0x01000000),
                                      builder: (BuildContext context) {
                                        return NumberPad(
                                          isDecimalRequired: false,
                                          initialOffset: const Offset(50, 50),
                                          title: '',
                                          onOkPressed: (int value) {
                                            setState(() {
                                              otherFunctionBloc.taxAmt.value =
                                                  value.toDouble();
                                            });
                                          },
                                        );
                                      },
                                    );*/
                                  },
                                  child: Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.08,
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10),
                                    decoration: BoxDecoration(
                                        color: theme.button1BG1,
                                        borderRadius: BorderRadius.circular(8),
                                        border: Border.all(color: KColor.borderGrey)),
                                    child: ValueListenableBuilder(
                                      valueListenable: otherFunctionBloc.taxAmt,
                                      builder: (context, taxAmt, child) {
                                        return Text(
                                          '$taxAmt',
                                          style: TextStyle(
                                              color: theme.primaryOpposite),
                                          textAlign: TextAlign.center,
                                        );
                                      },
                                    ),
                                  ),
                                );
                              },
                            )
                          ],
                        );
                      },
                    ),
                    Column(
                      children: [
                        Text(MessagesProvider.get('Refund Amount:')),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.1,
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          decoration: BoxDecoration(
                              color: theme.button1BG1,
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: KColor.borderGrey)),
                          child: Text(
                            '${otherFunctionBloc.refundValue.value + otherFunctionBloc.taxAmt.value}',
                            textAlign: TextAlign.center,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(width: 10),
                    Column(
                      children: [
                        SizedBox(
                          // clipBehavior: Clip.hardEdge,
                          width: MediaQuery.of(context).size.width * 0.17,
                          child: Text(
                            MessagesProvider.get(
                                'Make card new on full refund'),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Checkbox(
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                          checkColor: Colors.black,
                          activeColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          side: MaterialStateBorderSide.resolveWith(
                            (states) => BorderSide(
                                width: 1.0, color: theme.secondaryColor!),
                          ),
                          //fillColor: MaterialStateProperty.resolveWith(Colors.black),
                          value:
                              context.read<OtherFunctionBloc>().isMakeNew.value,
                          onChanged: (bool? value) {
                            setState(() {
                              context
                                  .read<OtherFunctionBloc>()
                                  .isMakeNew
                                  .value = value!;
                            });
                          },
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          );
      },
    );
  }

  void addRowItems() {
    rowList.clear();

      rowList.add(DataRow(
        cells: [
          DataCell(
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width:
                  MediaQuery.of(context).size.width * 0.3,
                  child: const Text(
                    'Card Deposit',

                    overflow: TextOverflow.ellipsis,
                    // style: AppStyle.dialogHeading2TextStyle,
                  ),
                ),
                SizedBox(
                  width:
                  MediaQuery.of(context).size.width * 0.3,
                  child: BlocBuilder<OtherFunctionBloc,
                      OtherFunctionState>(
                    builder: (context, state) {
                      OtherFunctionBloc otherFunctionBloc =
                      context.read<OtherFunctionBloc>();
                      return Text(
                        '${otherFunctionBloc.cardDeposit.toInt()} ',
                        maxLines: 2,
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        // style: AppStyle.dialogHeading2TextStyle,
                      );
                    },
                  ),
                ),
                SizedBox(
                  width:
                  MediaQuery.of(context).size.width * 0.3,
                  child: const Text(
                    '0',
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    // style: AppStyle.dialogHeading2TextStyle,
                  ),
                ),
              ],
            ),
          ),
        ],
      ));

      rowList.add(DataRow(
        cells: [
          DataCell(
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.3,
                    child: const Text(
                      'Credit Plus',
                      overflow: TextOverflow.ellipsis,
                      // style: AppStyle.dialogHeading2TextStyle,
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.3,
                    child: BlocBuilder<OtherFunctionBloc,
                        OtherFunctionState>(
                      builder: (context, state) {
                        OtherFunctionBloc otherFunctionBloc =
                        context.read<OtherFunctionBloc>();
                        return Text(
                          '${otherFunctionBloc.creditPlus.toInt()}',
                          maxLines: 2,
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                          // style: AppStyle.dialogHeading2TextStyle,
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.3,
                    child: const Text(
                      '0',
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      // style: AppStyle.dialogHeading2TextStyle,
                    ),
                  ),
                ],
              )
          ),
        ],
      ));
    setState(() {});
  }
}
