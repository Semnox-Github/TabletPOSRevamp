import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:other_function_ui/bloc/other_function_bloc.dart';
import 'package:other_function_ui/widgets/of_content_widgets/general/content_column.dart';
import 'package:other_function_ui/widgets/of_content_widgets/redeemBonus/bonus_widget.dart';
import 'package:other_function_ui/widgets/text_style.dart';
import 'package:themes_library/themes_library.dart';
import 'package:widgets_library/utils/size_config.dart';

class RedeemBonus extends StatefulWidget {
  const RedeemBonus({super.key});

  @override
  State<RedeemBonus> createState() => _RedeemBonusState();
}

class _RedeemBonusState extends State<RedeemBonus> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    SizeConfig.init(context);
    SemnoxTheme theme = Theme.of(context).extension<SemnoxTheme>()!;
    return Container(
      color: theme.backGroundColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const SizedBox(height: 22,),
                ContentColumn(
                  contentTitle: 'Bonus Available',
                  contentWidget: Container(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    width: MediaQuery.of(context).size.width * 0.3,
                    height: SizeConfig.getSize(60),
                    decoration: BoxDecoration(
                      color: theme.button1BG1,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child:
                          BlocConsumer<OtherFunctionBloc, OtherFunctionState>(
                        listener: (context, state) {
                          OtherFunctionBloc otherFunctionBloc =
                              context.read<OtherFunctionBloc>();
                          if (state is ClearState) {
                            otherFunctionBloc.accounts = null;
                          }
                        },
                        builder: (context, state) {
                          OtherFunctionBloc otherFunctionBloc =
                              context.read<OtherFunctionBloc>();
                          if (state is ClearState) {
                            return Text(
                              '0',
                              style: KTextStyle.breadCrumbTitle.copyWith(
                                  color: theme.primaryOpposite,
                                  fontSize: SizeConfig.getFontSize(26)),
                            );
                          }
                          return Text(
                            '${otherFunctionBloc.accounts?.data?.first.totalBonusBalance?.toStringAsFixed(2) ?? 0}',
                            style: KTextStyle.breadCrumbTitle.copyWith(
                                color: theme.primaryOpposite,
                                fontSize: SizeConfig.getFontSize(26)),
                          );
                        },
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 5,),
                const ContentColumn(
                  contentTitle: 'Bonus to Redeem',
                  contentWidget: BonusWidget(),
                )
              ],
            ),
          ),
          BlocBuilder<OtherFunctionBloc, OtherFunctionState>(
            builder: (context, state) {
              OtherFunctionBloc otherFunctionBloc =
                  context.read<OtherFunctionBloc>();
              return ValueListenableBuilder(
                valueListenable: otherFunctionBloc.redeemBonus,
                builder: (context, value, child) {
                  return Text(
                    ' = ${((otherFunctionBloc.redeemBonus.value ?? 0) * int.parse(otherFunctionBloc.ticketsPerBonux ?? '100')).toStringAsFixed(2)} Tickets',
                    style: KTextStyle.breadCrumbTitle.copyWith(
                        color: theme.primaryOpposite,
                        fontSize: SizeConfig.getFontSize(22)),
                  );
                },
              );
            },
          )
        ],
      ),
    );
  }
}
