import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:other_function_ui/bloc/other_function_bloc.dart';
import 'package:other_function_ui/widgets/text_style.dart';
import 'package:themes_library/themes_library.dart';
import 'package:widgets_library/number_pad/number_pad.dart';

class RedeemVirtualLoyaltyPoints extends StatelessWidget {
  const RedeemVirtualLoyaltyPoints({super.key});

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
        otherFunctionBloc.otherFunctionType = 'virtual points';
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
                            Text('Points Available',
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
                                '${otherFunctionBloc.accounts?.data?.first.totalVirtualPointBalance}',
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
                              child: Text('Points to Redeem',
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
                                        otherFunctionBloc
                                            .redeemVirtualPoints.value = value;
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
                                      otherFunctionBloc.redeemVirtualPoints,
                                  builder: (context, value, child) {
                                    return Text(
                                      otherFunctionBloc
                                          .redeemVirtualPoints.value
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
                      columns: const [
                        DataColumn(
                          label: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 4.0),
                            child: IntrinsicHeight(
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 140,
                                    child: Text(
                                      'Choose an attribute',
                                      overflow: TextOverflow.ellipsis,
                                      // style: AppStyle.dialogHeading2TextStyle,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 80,
                                    child: Text(
                                      'Rule',
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      // style: AppStyle.dialogHeading2TextStyle,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 100,
                                    child: Text(
                                      'Redemption Rule',
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      // style: AppStyle.dialogHeading2TextStyle,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 80,
                                    child: Text(
                                      'Min Points',
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      // style: AppStyle.dialogHeading2TextStyle,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 80,
                                    child: Text(
                                      'Multiples Only',
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
                      rows: otherFunctionBloc.virtualRule!
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
                                                '${e.attributeName}',
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
                                                style: theme.subtitle3,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 80,
                                              child: Text(
                                                "${e.redemptionValue} for ${e.virtualLoyaltyPoints}",
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
                                                        .redeemVirtualPoints,
                                                builder:
                                                    (context, value, child) {
                                                  if (e.multiplesOnly == 'Y') {
                                                    otherFunctionBloc
                                                            .virtualpointsMultiple =
                                                        (otherFunctionBloc
                                                                    .redeemVirtualPoints
                                                                    .value ~/
                                                                100) *
                                                            100;
                                                  } else {
                                                    otherFunctionBloc
                                                            .virtualpointsMultiple =
                                                        0.0;
                                                  }
                                                  return Text(
                                                    e.multiplesOnly == 'Y'
                                                        ? otherFunctionBloc
                                                            .virtualpointsMultiple
                                                            .toStringAsFixed(2)
                                                        : "${otherFunctionBloc.redeemVirtualPoints.value * e.redemptionValue}",
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
