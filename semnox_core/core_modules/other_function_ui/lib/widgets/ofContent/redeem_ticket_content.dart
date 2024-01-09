import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:other_function_ui/bloc/other_function_bloc.dart';
import 'package:other_function_ui/widgets/of_content_widgets/redeem_ticket_widget/redeem_ticket_form.dart';
import 'package:themes_library/themes_library.dart';

class RedeemTicket extends StatefulWidget {
  const RedeemTicket({super.key});

  @override
  State<RedeemTicket> createState() => _RedeemTicketState();
}

class _RedeemTicketState extends State<RedeemTicket> {
  setCard(String value) {
    setState(() {
      context.read<OtherFunctionBloc>().selectedCard = value;
    });
  }

  ValueNotifier<int> tokenCount = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    SemnoxTheme theme = Theme.of(context).extension<SemnoxTheme>()!;
    return Container(
      color: theme.primaryColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          BlocBuilder<OtherFunctionBloc, OtherFunctionState>(
            builder: (context, state) {
              final otherFunctionBloc = context.read<OtherFunctionBloc>();
              return RedeemTicketForm(
                otherFunctionBloc: otherFunctionBloc,
                onTap: (p0) => setCard(p0),
              );
            },
          ),
        ],
      ),
    );
  }
}
