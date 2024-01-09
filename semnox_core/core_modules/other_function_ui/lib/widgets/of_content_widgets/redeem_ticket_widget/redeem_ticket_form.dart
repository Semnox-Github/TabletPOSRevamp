import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:other_function_ui/bloc/other_function_bloc.dart';
import 'package:other_function_ui/widgets/of_content_widgets/general/content_column.dart';
import 'package:other_function_ui/widgets/of_content_widgets/redeem_ticket_widget/redeem_card_row_widget.dart';
import 'package:other_function_ui/widgets/text_style.dart';
import 'package:themes_library/themes_library.dart';
import 'package:widgets_library/number_pad/number_pad.dart';
import 'package:widgets_library/utils/size_config.dart';

class RedeemTicketForm extends StatelessWidget {
  final OtherFunctionBloc otherFunctionBloc;

  final Function(String) onTap;
  const RedeemTicketForm({
    super.key,
    required this.otherFunctionBloc,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    SemnoxTheme theme = Theme.of(context).extension<SemnoxTheme>()!;
    SizeConfig.init(context);
    return Container(
      color: theme.backGroundColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ContentColumn(
            contentTitle: 'Choose Redeem Type',
            contentWidget: RedeemCardRow(
              onTap: (p0) {
                onTap(p0);
              },
              selectedCard: otherFunctionBloc.selectedCard,
            ),
          ),
          ContentColumn(
            contentTitle: 'Tickets Available',
            contentWidget: Container(
              padding: const EdgeInsets.symmetric(vertical: 6),
              width: MediaQuery.of(context).size.width * 0.3,
              height: SizeConfig.getSize(60),
              decoration: BoxDecoration(
                color: theme.button1BG1,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: BlocBuilder<OtherFunctionBloc, OtherFunctionState>(
                  builder: (context, state) {
                    if (state is ClearState) {
                      return Text(
                        '0',
                        style: KTextStyle.breadCrumbTitle.copyWith(
                            color: theme.primaryOpposite,
                            fontSize: SizeConfig.getSize(26)),
                      );
                    }
                    return Text(
                      '${otherFunctionBloc.accounts?.data?.first.totalTicketsBalance?.toInt() ?? 0}',
                      style: KTextStyle.breadCrumbTitle.copyWith(
                          color: theme.primaryOpposite,
                          fontSize: SizeConfig.getSize(26)),
                    );
                  },
                ),
              ),
            ),
          ),
          const SizedBox(height: 15),
          ContentColumn(
            contentTitle: 'Tickets to Redeem',
            contentWidget: GestureDetector(
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
                        otherFunctionBloc.redeemTickets.value = value;
                      },
                    );
                  },
                );
              },
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 6),
                width: MediaQuery.of(context).size.width * 0.3,
                height: SizeConfig.getSize(60),
                decoration: BoxDecoration(
                  border: Border.all(
                      color: theme.dialogFooterInnerShadow ?? Colors.black),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: ValueListenableBuilder(
                  valueListenable: otherFunctionBloc.redeemTickets,
                  builder: (context, value, child) {
                    return Center(
                      child: Text(
                        '${otherFunctionBloc.redeemTickets.value.toInt()}',
                        style: KTextStyle.breadCrumbTitle.copyWith(
                            color: theme.primaryOpposite,
                            fontSize: SizeConfig.getSize(26)),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          const SizedBox(height: 15),
          ValueListenableBuilder(
            valueListenable: otherFunctionBloc.redeemTickets,
            builder: (context, value, child) {
              return Text(
                ' = ${otherFunctionBloc.redeemTickets.value / (otherFunctionBloc.selectedCard == 'Bonus' ? int.parse(otherFunctionBloc.ticketsPerBonux ?? '100') : int.parse(otherFunctionBloc.ticketsPerCredit ?? '10'))} ${otherFunctionBloc.selectedCard}',
                style: KTextStyle.breadCrumbTitle.copyWith(
                    color: theme.primaryOpposite,
                    fontSize: SizeConfig.getFontSize(22)),
              );
            },
          )
        ],
      ),
    );
  }
}
