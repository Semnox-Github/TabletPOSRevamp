import 'package:customer_ui/utils/AppStyle.dart';
import 'package:flutter/material.dart';
import 'package:themes_library/themes_library.dart';

import '../utils/size_config.dart';

class VerifiedCheckBox extends StatefulWidget{

  String title;
  bool enable = true;
  Function(bool? value)? onCheck;

  VerifiedCheckBox({required this.title, required this.enable,this.onCheck});

  @override
  State<VerifiedCheckBox> createState() => _VerifiedCheckBoxState();
}

class _VerifiedCheckBoxState extends State<VerifiedCheckBox> {

  @override
  Widget build(BuildContext context) {
    SemnoxTheme theme = Theme.of(context).extension<SemnoxTheme>()!;
    SizeConfig.init(context);
    bool _isChecked = widget.enable;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.title, style: widget.enable ?  theme.heading6?.copyWith(fontSize: SizeConfig.getFontSize(20), fontWeight: FontWeight.normal) : AppStyle.customerDisableText?.copyWith(fontSize: SizeConfig.getFontSize(20), fontWeight: FontWeight.normal),),
        const SizedBox(height: 4.0,),
        Padding(
          padding: EdgeInsets.all(SizeConfig.getSize(15)),
          child: SizedBox(
            height:SizeConfig.getSize(24),
            width:SizeConfig.getSize(24),
            child: Transform.scale(
              scale: 1.5,
              child: Checkbox(
                checkColor: theme.secondaryColor,
                activeColor: theme.backGroundColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
                side: MaterialStateBorderSide.resolveWith(
                      (states) => BorderSide(width: 1.0, color:widget.enable? theme.secondaryColor!:Colors.grey,),
                ),
                value: _isChecked,
                onChanged: widget.enable ?  (bool? value) {
                  setState(() {
                    _isChecked = value!;
                    widget.onCheck!(_isChecked);
                  });
                } : null,
              ),
            ),
          ),
        )
      ],
    );
  }
}