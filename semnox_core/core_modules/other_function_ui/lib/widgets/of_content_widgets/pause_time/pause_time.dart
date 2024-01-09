import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:other_function_ui/bloc/other_function_bloc.dart';
import 'package:other_function_ui/widgets/ofContent/pause_time_content.dart';

class PauseTime extends StatefulWidget {
  const PauseTime({super.key});

  @override
  State<PauseTime> createState() => _PauseTimeState();
}

class _PauseTimeState extends State<PauseTime> {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OtherFunctionBloc, OtherFunctionState>(
      builder: (context, state) {
        final otherFunctionBloc = context.read<OtherFunctionBloc>();
        return PauseTimeContent(
          otherFunctionBloc: otherFunctionBloc,
        );
      },
      listener: (context, state) {
        if (state is ClearState) {
          context
              .read<OtherFunctionBloc>()
              .accounts = null;
        }
      },
    );
  }
}
