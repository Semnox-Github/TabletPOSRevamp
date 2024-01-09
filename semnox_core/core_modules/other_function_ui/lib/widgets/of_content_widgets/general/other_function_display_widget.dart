import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:other_function_ui/bloc/other_function_bloc.dart';
import 'package:other_function_ui/widgets/colors.dart';
import 'package:other_function_ui/widgets/text_style.dart';

class DisplayWidget extends StatelessWidget {
  const DisplayWidget({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: height * 0.06,
            width: width * 0.3,
            child: Card(
              color: KColor.primaryBtnColor,
              child: Center(
                child: BlocBuilder<OtherFunctionBloc, OtherFunctionState>(
                  builder: (context, state) {
                    return Text(
                      '${context.read<OtherFunctionBloc>().display}',
                      style: KTextStyle.breadCrumbTitle,
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
