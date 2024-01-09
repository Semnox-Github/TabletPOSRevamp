import 'package:customer_ui/widgets/CustomerFormWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:messages_data/builder.dart';
import 'package:themes_library/themes_library.dart';

import '../../utils/size_config.dart';

class SocialMediaWidget extends StatelessWidget{

  VoidCallback? onAdd;
  VoidCallback? onRemove;
  String title;
  String? title1;
  String? hint1;
  String? title2;
  String? hint2;
  String? validationText1;
  String? validationText2;
  TextEditingController? idController;
  TextEditingController? tokenController;
  String? fbuserIdView;
  String? fbAccessTokenView;
  String? twAccessTokenView;
  String? twsecretView;
  String? weChatTokenView;

  SocialMediaWidget({this.onAdd, this.onRemove, required this.title, this.title1, this.hint1,
      this.title2, this.hint2, this.idController, this.tokenController,this.validationText1, this.validationText2, super.key,
      this.fbuserIdView,this.fbAccessTokenView,this.twsecretView,this.twAccessTokenView,this.weChatTokenView
  });

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    SemnoxTheme theme = Theme.of(context).extension<SemnoxTheme>()!;
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: SizeConfig.getSize(300),
          alignment: FractionalOffset.centerLeft,
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              color: theme.dialogFooterInnerShadow!,
            ),
            borderRadius: BorderRadius.circular(8.0),
          ),
          child:
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: theme.heading5?.copyWith(fontSize: SizeConfig.getFontSize(20)),),
                const SizedBox(height: 4.0,),
                CustomerFormWidget(title: title1 ?? "",hint: hint1, enable: true,controller: idController,
                visible: _getCodeVisibility(),
                validation: validationText1,),
                CustomerFormWidget(title: title2 ?? "",hint: hint2, enable: true, controller: tokenController,
                visible: title == MessagesProvider.get("WeChat") ? false : _getVisibility(),
                validation: validationText2,)
              ],
            ),
          ),
        ),
        Positioned(
          top: -14,
          right: 64,
          child: CircleAvatar(
            backgroundColor: theme.secondaryColor,
            radius: 15,
            child: IconButton(
              padding: EdgeInsets.zero,
              icon: Icon(Icons.add),
              color: theme.primaryColor,
              onPressed: onAdd,
            ),
          ),
        ),
        Positioned(
          top: -14,
          right: 16,
          child: CircleAvatar(
            backgroundColor: theme.secondaryColor,
            radius: 15,
            child: IconButton(
              padding: EdgeInsets.zero,
              icon: Icon(Icons.remove),
              color: theme.primaryColor,
              onPressed: onRemove,
            ),
          ),
        ),
      ],
    );
  }
_getCodeVisibility(){
    if(title == MessagesProvider.get("Facebook")){
      return (fbuserIdView == 'M' || fbuserIdView == 'O') ? true:false;
    }
    else if(title == MessagesProvider.get("Twitter")){
      return (twAccessTokenView == 'M' || twAccessTokenView == 'O') ? true:false;
    }
    else{
      return (weChatTokenView == 'M' || weChatTokenView == 'O') ? true:false;
    }
}

  _getVisibility(){
    if(title == MessagesProvider.get("Facebook")){
      return (fbAccessTokenView == 'M' || fbAccessTokenView == 'O') ? true:false;
    }
    else if(title == MessagesProvider.get("Twitter")){
      return (twsecretView == 'M' || twsecretView == 'O') ? true:false;
    }
    else{
      return false;
    }
  }

}