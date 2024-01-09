import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:other_function_ui/bloc/other_function_bloc.dart';
import 'package:other_function_ui/widgets/colors.dart';
import 'package:other_function_ui/widgets/text_style.dart';
import 'package:themes_library/themes_library.dart';
import 'package:widgets_library/utils/size_config.dart';

class RemarkWidget extends StatelessWidget {
  final bool? isStar;
  final bool? showText;
  final bool? showRemark;
  const RemarkWidget({super.key, this.isStar, this.showText, this.showRemark});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<SemnoxTheme>()!;
    SizeConfig.init(context);
    return Column(
      children: [
        Divider(color: KColor.borderGrey),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Visibility(
                visible: showText == true || showText == null ? true : false,
                child: Text(' ${(isStar ?? false) ? '*' : ''} Remarks',
                    style: KTextStyle.regularBoldTextStyle.copyWith(
                        color: theme.primaryOpposite,
                        fontSize: SizeConfig.getFontSize(18))),
              ),
              const SizedBox(height: 5),
              SizedBox(
                height: SizeConfig.getSize(42),
                child: TextFormField(
                  controller:
                      context.read<OtherFunctionBloc>().remarkController,
                  style: SizeConfig.isBigDevice()?theme.description3!.copyWith(fontSize:SizeConfig.getFontSize(18)) :theme.description3,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: theme.primaryColor,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                    border: const OutlineInputBorder(),
                    hintText: 'Enter ${showRemark == true ? 'Remarks' : ''}',
                    hintStyle: SizeConfig.isBigDevice()?theme.textFieldHintStyle!.copyWith(fontSize:SizeConfig.getFontSize(18)) :theme.textFieldHintStyle!.copyWith(fontSize: 10),
                  ),
                ),
              ),
            ],
          ),
        ),
        // const SizedBox(height: 5),
        Divider(color: KColor.borderGrey),
      ],
    );
  }
}
