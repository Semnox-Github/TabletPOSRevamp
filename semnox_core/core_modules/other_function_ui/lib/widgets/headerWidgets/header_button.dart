import 'package:flutter/material.dart';
import 'package:other_function_ui/bloc/other_function_bloc.dart';
import 'package:other_function_ui/widgets/of_content_widgets/general/common_card_form.dart';
import 'package:other_function_ui/widgets/text_style.dart';
import 'package:themes_library/themes_library.dart';
import 'package:widgets_library/utils/size_config.dart';

class HeaderButton extends StatelessWidget {
  final bool? isDeactivate;
  final TextEditingController cardController;
  final OtherFunctionBloc otherFunctionBloc;
  final GlobalKey<FormState> formKey;
  final bool isNfcAvailable;
  const HeaderButton(
      {super.key,
      required this.formKey,
      this.isDeactivate,
      required this.isNfcAvailable,
      required this.cardController,
      required this.otherFunctionBloc});

  @override
  Widget build(BuildContext context) {
    SemnoxTheme theme = Theme.of(context).extension<SemnoxTheme>()!;
    SizeConfig.init(context);
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children:[
        Text(
        isNfcAvailable
        ? 'Tap Card OR'
              : '',
          style: KTextStyle.titleStyleBold.copyWith(
              color: theme.primaryOpposite,
              fontSize: SizeConfig.getFontSize(22)),
          textAlign: TextAlign.start,
    ),
      const SizedBox(width: 5,),
      SizedBox(
        height: SizeConfig.isBigDevice()? SizeConfig.getSize(72):SizeConfig.getSize(90),
        child: ElevatedButton(onPressed: (){
          showDialog(
           barrierDismissible: false,
             context: context,
             builder: (context) {
                return CommonCardForDialog(
             otherFunctionBloc: otherFunctionBloc,
             isNFCAvailable: isNfcAvailable,
             isDeactivate: isDeactivate,
          );
        },
        );
    }, style: ElevatedButton.styleFrom(
        padding: EdgeInsets.all(SizeConfig.getWidth(4)),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
          SizeConfig.getSize(8)), // <-- Radius
        ),
        backgroundColor: theme.button2InnerShadow1!,),
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text('ENTER CARD NO',
            overflow: TextOverflow.ellipsis,
            style: theme.heading5!.copyWith(fontSize: SizeConfig.getFontSize(18),color: theme.light1!)),
          )),
      ),
      ],
      ),
    );
  }
}
