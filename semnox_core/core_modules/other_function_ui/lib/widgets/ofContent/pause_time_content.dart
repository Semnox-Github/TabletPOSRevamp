import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:messages_data/builder.dart';
import 'package:notificationbar_ui/NotificationBar.dart';
import 'package:other_function_ui/bloc/other_function_bloc.dart';
import 'package:other_function_ui/widgets/colors.dart';
import 'package:other_function_ui/widgets/of_content_widgets/general/content_column.dart';
import 'package:other_function_ui/widgets/of_content_widgets/redeem_ticket_widget/redeem_card_row_widget.dart';
import 'package:other_function_ui/widgets/text_style.dart';
import 'package:themes_library/themes_library.dart';
import 'package:widgets_library/number_pad/number_pad.dart';
import 'package:widgets_library/utils/size_config.dart';

class PauseTimeContent extends StatefulWidget {
  final OtherFunctionBloc otherFunctionBloc;
  const PauseTimeContent({
    super.key,
    required this.otherFunctionBloc,
  });

  @override
  State<PauseTimeContent> createState() => _PauseTimeContentState();
}

class _PauseTimeContentState extends State<PauseTimeContent> {

  @override
  void initState() {
    Future.microtask(() => context.read<OtherFunctionBloc>().add(
      MessageEvent(MessagesProvider.get('Timed Play will be paused'), KColor.notificationBGLightBlueColor)
    ));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<SemnoxTheme>()!;
    SizeConfig.init(context);
    return Container(
      color: theme.backGroundColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizeConfig.isBigDevice()? const SizedBox(height: 200,):const SizedBox(height: 40,),
          Visibility(
            visible: widget.otherFunctionBloc.accounts != null,
            child: ContentColumn(
              contentTitle: MessagesProvider.get('Time Remaining'),
              contentWidget: Container(
                padding: const EdgeInsets.symmetric(vertical: 10),
                width: MediaQuery.of(context).size.width * 0.3,
                decoration: BoxDecoration(
                  color: KColor.borderGrey,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    const SizedBox(width: 8,),
                    Text(
                      '${widget.otherFunctionBloc.accounts?.data?.first.totalTimeBalance?.toInt() ?? 0} ${MessagesProvider.get('Minutes')}',
                      style: KTextStyle.breadCrumbTitle.copyWith(fontSize: SizeConfig.getSize(30)),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 15),
          Visibility(
            visible: widget.otherFunctionBloc.accounts != null && widget.otherFunctionBloc.accounts?.data?.first.totalTicketsBalance != 0,
            child: ContentColumn(
              contentTitle: 'eTicket Balance',
              contentWidget: Container(
                padding: const EdgeInsets.symmetric(vertical: 10),
                width: MediaQuery.of(context).size.width * 0.3,
                decoration: BoxDecoration(
                  color: KColor.borderGrey,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: Text(
                    '${widget.otherFunctionBloc.accounts?.data?.first.totalTicketsBalance?.toInt() ?? 0} ${MessagesProvider.get('Tickets')}',
                    style: KTextStyle.breadCrumbTitle,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 15),
        ],
      ),
    );
  }
}
