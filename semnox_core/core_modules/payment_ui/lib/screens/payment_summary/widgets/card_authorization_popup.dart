
import 'package:flutter/material.dart';
import 'package:messages_data/builder.dart';
import 'package:themes_library/themes_library.dart';
import 'package:widgets_library/utils/size_config.dart';

import '../../../utils/colors.dart';
import '../../../utils/styles.dart';

class CardAuthorizationPopup extends StatefulWidget {
  final bool isPreAuthDisabled;
  final VoidCallback onPreAuthClicked;
  final VoidCallback onAuthClicked;
  final VoidCallback onSettleClicked;
  final VoidCallback onCancelClicked;

  const CardAuthorizationPopup({
    Key? key,
    required this.onPreAuthClicked,
    required this.onAuthClicked,
    required this.onSettleClicked,
    required this.onCancelClicked,
    this.isPreAuthDisabled = false
  }) : super(key: key);

  @override
  State<CardAuthorizationPopup> createState() => _CardAuthorizationPopupState();
}

class _CardAuthorizationPopupState extends State<CardAuthorizationPopup> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<SemnoxTheme>()!;
    return LayoutBuilder(
      builder: (context, _) => AlertDialog(
        backgroundColor: theme.backGroundColor,
        content: Container(
          color: theme.backGroundColor ?? colorWhite,
          width: MediaQuery.of(context).size.width * 0.75,
          height: SizeConfig.getSize(320),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(MessagesProvider.get('Transaction Types'), style: theme.heading1?.copyWith(fontSize: SizeConfig.getFontSize(40), color: theme.secondaryColor) ?? tsS20W700FF),
              SizedBox(height: SizeConfig.getSize(16)),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: BlackBtnContainer(
                      isDisabled: widget.isPreAuthDisabled,
                      onTap: () {
                        if(!widget.isPreAuthDisabled) {
                          widget.onPreAuthClicked();
                          Navigator.pop(context);
                        }
                      },
                      text: MessagesProvider.get('Pre-Authorization'),
                    ),
                  ),
                  SizedBox(width: SizeConfig.getWidth(12)),
                  Expanded(
                    flex: 1,
                    child: BlackBtnContainer(
                      onTap: () {
                        widget.onAuthClicked();
                        Navigator.pop(context);
                      },
                      text: MessagesProvider.get('Authorization'),
                    ),
                  ),
                  SizedBox(width: SizeConfig.getWidth(12)),
                  Expanded(
                    flex: 1,
                    child: BlackBtnContainer(
                      onTap: () {
                        widget.onSettleClicked();
                        Navigator.pop(context);
                      },
                      text: MessagesProvider.get('Settlement'),
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Text(MessagesProvider.get('Pre-Authorization and Authorization transactions are not allowed for debit cards.'), style: theme.heading5?.copyWith(fontSize: SizeConfig.getFontSize(28), fontWeight: FontWeight.w500) ?? tsS20W700FF),
              SizedBox(height: SizeConfig.getSize(16)),
              BlackBtnContainer(
                onTap: () {
                  widget.onCancelClicked();
                  Navigator.pop(context);
                },
                text: MessagesProvider.get('Cancel'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BlackBtnContainer extends StatelessWidget {
  final VoidCallback onTap;
  final String text;
  final bool isDisabled;

  const BlackBtnContainer({
    Key? key,
    required this.onTap,
    required this.text,
    this.isDisabled = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<SemnoxTheme>()!;
    return InkWell(
      onTap: () {
        onTap();
      },
      child: Container(
        height: SizeConfig.getHeight(80),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: (theme.button2InnerShadow1 ?? colorBlack).withOpacity(isDisabled ? 0.5 : 1)
        ),
        child: Center(
          child: Text(text.toUpperCase(), style: theme.headingLight1?.copyWith(fontSize: SizeConfig.getFontSize(32), color: Colors.white) ?? tsS20W700FF),
        ),
      ),
    );
  }
}

