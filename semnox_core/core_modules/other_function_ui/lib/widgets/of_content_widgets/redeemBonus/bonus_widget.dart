import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:other_function_ui/bloc/other_function_bloc.dart';
import 'package:other_function_ui/widgets/text_style.dart';
import 'package:themes_library/themes_library.dart';
import 'package:widgets_library/number_pad/number_pad.dart';
import 'package:widgets_library/utils/size_config.dart';

class BonusWidget extends StatelessWidget {
  const BonusWidget({super.key});

  @override
  Widget build(BuildContext context) {
    SemnoxTheme theme = Theme.of(context).extension<SemnoxTheme>()!;
    SizeConfig.init(context);
    return BlocBuilder<OtherFunctionBloc, OtherFunctionState>(
      builder: (context, state) {
        OtherFunctionBloc otherFunctionbloc = context.read<OtherFunctionBloc>();
        return GestureDetector(
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
                    otherFunctionbloc.redeemBonus.value = value;
                  },
                );
              },
            );
          },
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 8),
            width: MediaQuery.of(context).size.width * 0.3,
            height: SizeConfig.getSize(60),
            decoration: BoxDecoration(
              border: Border.all(
                  color: theme.dialogFooterInnerShadow ?? Colors.black),
              borderRadius: BorderRadius.circular(8),
            ),
            child: ValueListenableBuilder(
              valueListenable: otherFunctionbloc.redeemBonus,
              builder: (context, value, child) {
                if (value == null) {
                  return Center(
                      child: Text('Enter',
                          style: KTextStyle.bonusHintText.copyWith(
                              color: theme.primaryOpposite,
                              fontSize: SizeConfig.getFontSize(22))));
                }
                return Center(
                  child: Text(
                    otherFunctionbloc.redeemBonus.value?.toStringAsFixed(2) ??
                        '0.0',
                    style: KTextStyle.breadCrumbTitle
                        .copyWith(color: theme.primaryOpposite,fontSize: SizeConfig.getFontSize(26)),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
