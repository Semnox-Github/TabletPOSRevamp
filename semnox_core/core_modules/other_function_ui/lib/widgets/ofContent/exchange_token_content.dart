import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:other_function_ui/bloc/other_function_bloc.dart';
import 'package:other_function_ui/widgets/of_content_widgets/general/content_column.dart';
import 'package:other_function_ui/widgets/of_content_widgets/general/counter_widget.dart';
import 'package:other_function_ui/widgets/of_content_widgets/general/credit_widget.dart';
import 'package:themes_library/themes_library.dart';
import 'package:widgets_library/utils/size_config.dart';

class ExchangeTokenBody extends StatefulWidget {
  final bool? isChangeToken;
  const ExchangeTokenBody({Key? key, this.isChangeToken}) : super(key: key);

  @override
  State<ExchangeTokenBody> createState() => _ExchangeTokenBodyState();
}

class _ExchangeTokenBodyState extends State<ExchangeTokenBody> {
  @override
  Widget build(BuildContext context) {
    SemnoxTheme theme = Theme.of(context).extension<SemnoxTheme>()!;
    return Container(
      color: theme.backGroundColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizeConfig.isBigDevice()?const SizedBox(height: 150,):const SizedBox(height: 10,),
                ContentColumn(
                  contentTitle: widget.isChangeToken ?? false
                      ? 'Token Tendered'
                      : 'Tokens to Buy',
                  contentWidget: CounterWidget(
                    count: context.read<OtherFunctionBloc>().tokenCount,
                  ),
                ),
                const SizedBox(height: 10,),
                ContentColumn(
                  contentTitle: widget.isChangeToken ?? false
                      ? 'Credits Exchanged'
                      : 'Credits Required',
                  contentWidget: CreditWidget(
                    count: context.read<OtherFunctionBloc>().tokenCount,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
