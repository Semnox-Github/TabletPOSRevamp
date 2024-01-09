import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:messages_data/builder.dart';
import 'package:other_function_ui/bloc/other_function_bloc.dart';
import 'package:other_function_ui/widgets/text_style.dart';
import 'package:themes_library/themes_library.dart';
import 'package:widgets_library/number_pad/number_pad.dart';

class RedeemLoyaltyPoints extends StatelessWidget {
  const RedeemLoyaltyPoints({super.key});

  @override
  Widget build(BuildContext context) {
    SemnoxTheme theme = Theme.of(context).extension<SemnoxTheme>()!;
    return BlocConsumer<OtherFunctionBloc, OtherFunctionState>(
      // bloc: OtherFunctionBloc(),
      listener: (context, state) {
        if (state is SelectedRowState) {
          context.read<OtherFunctionBloc>().selectedRow = state.rowId;
        }
      },
      builder: (context, state) {
        final otherFunctionBloc = context.read<OtherFunctionBloc>();
        otherFunctionBloc.otherFunctionType = 'loyalty points';
        if (otherFunctionBloc.isApplied) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(MessagesProvider.get('Points Available'),
                                style: KTextStyle.smallBlackText
                                    .copyWith(color: theme.primaryOpposite)),
                            const SizedBox(height: 3),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 10),
                              width: MediaQuery.of(context).size.width * 0.48,
                              decoration: BoxDecoration(
                                color: theme.button1BG1,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Text(
                                '${otherFunctionBloc.accounts?.data?.first.accountSummaryDTO?.totalLoyaltyPointBalance}',
                                textAlign: TextAlign.left,
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            GestureDetector(
                              onTap: () {},
                              child: Text(
                                  MessagesProvider.get('Points to Redeem'),
                                  style: KTextStyle.smallBlackText
                                      .copyWith(color: theme.primaryOpposite)),
                            ),
                            const SizedBox(height: 3),
                            GestureDetector(
                              onTap: () {
                                showDialog(
                                  barrierDismissible: true,
                                  context: context,
                                  barrierColor: const Color(0x01000000),
                                  builder: (BuildContext context) {
                                    return NumberPad(
                                      isDecimalRequired: true,
                                      initialOffset: const Offset(50, 50),
                                      title: '',
                                      onOkPressed: (value) {
                                        otherFunctionBloc.redeemPoints.value =
                                            value;
                                      },
                                    );
                                  },
                                );
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 10),
                                width: MediaQuery.of(context).size.width * 0.48,
                                decoration: BoxDecoration(
                                  border:
                                      Border.all(color: theme.secondaryColor!),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: ValueListenableBuilder(
                                  valueListenable:
                                      otherFunctionBloc.redeemPoints,
                                  builder: (context, value, child) {
                                    return Text(
                                      otherFunctionBloc.redeemPoints.value
                                          .toStringAsFixed(2),
                                      textAlign: TextAlign.left,
                                    );
                                  },
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                ConstrainedBox(
                  constraints: BoxConstraints(
                      minWidth: MediaQuery.of(context).size.width),
                  child: Theme(
                    data: Theme.of(context)
                        .copyWith(dividerColor: Colors.transparent),
                    child: DataTable(
                      dividerThickness: 0.0,
                      columnSpacing: 0,
                      showCheckboxColumn: false,
                      dataRowHeight: 40,
                      headingRowHeight: 40,
                      columns: [
                        DataColumn(
                          label: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 4.0),
                            child: IntrinsicHeight(
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 140,
                                    child: Text(
                                      MessagesProvider.get(
                                          'Choose an attribute'),
                                      overflow: TextOverflow.ellipsis,
                                        style: theme.subtitle3
                                      // style: AppStyle.dialogHeading2TextStyle,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 80,
                                    child: Text(
                                      MessagesProvider.get('Rule'),
                                      maxLines: 2,
                                      style: theme.subtitle3,
                                      overflow: TextOverflow.ellipsis,
                                      // style: AppStyle.dialogHeading2TextStyle,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 100,
                                    child: Text(
                                      MessagesProvider.get('Redemption Value'),
                                      maxLines: 2,
                                      style: theme.subtitle3,
                                      overflow: TextOverflow.ellipsis,
                                      // style: AppStyle.dialogHeading2TextStyle,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 80,
                                    child: Text(
                                      MessagesProvider.get('Min Points'),
                                      style: theme.subtitle3,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      // style: AppStyle.dialogHeading2TextStyle,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 80,
                                    child: Text(
                                      MessagesProvider.get('Multiples Only'),
                                      style:theme.subtitle3,
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
                      ],
                      rows: otherFunctionBloc.loyaltyRule!
                          .map(
                            (e) => DataRow(
                              cells: [
                                DataCell(
                                  InkWell(
                                    onTap: () {
                                      otherFunctionBloc.add(SetSelectedRow(
                                          rowId: e.redemptionRuleId ?? 1));
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: theme.tableRow1,
                                        border: Border.all(
                                            width: 1,
                                            color:
                                                otherFunctionBloc.selectedRow ==
                                                        e.redemptionRuleId
                                                    ? theme.secondaryColor!
                                                    : Colors.transparent),
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(6),
                                        ),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(6.0),
                                        child: Row(
                                          children: [
                                            SizedBox(
                                              width: 140,
                                              child: Text(
                                                MessagesProvider.get(
                                                    'Card Balance'),
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
                                                style: theme.subtitle3,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 80,
                                              child: Text(
                                                "${e.redemptionValue} for ${e.loyaltyPoints}",
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
                                                style: theme.subtitle3,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 100,
                                              child: ValueListenableBuilder(
                                                valueListenable:
                                                    otherFunctionBloc
                                                        .redeemPoints,
                                                builder:
                                                    (context, value, child) {
                                                  return Text(
                                                    "${otherFunctionBloc.redeemPoints.value * e.redemptionValue}",
                                                    maxLines: 2,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: theme.subtitle3,
                                                  );
                                                },
                                              ),
                                            ),
                                            SizedBox(
                                              width: 80,
                                              child: Text(
                                                "${e.minimumPoints}",
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
                                                style: theme.subtitle3,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 140,
                                              child: Text(
                                                "${e.multiplesOnly}",
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
                                                style: theme.subtitle3,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                          .toList(),
                    ),
                  ),
                ),
              ],
            ),
          );
        }
        return Container();
      },
    );
  }
}
