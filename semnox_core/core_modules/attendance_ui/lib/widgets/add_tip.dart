import 'package:attendance_ui/utilities/text_style.dart';
import 'package:attendance_ui/widgets/required_fields_popup.dart';
import 'package:flutter/material.dart';
import 'package:messages_data/builder.dart';
import 'package:product_config_ui/widgets/primaryLargeButton.dart';
import 'package:product_config_ui/widgets/secondaryLargeButton.dart';
import 'package:themes_library/themes_library.dart';
import 'package:widgets_library/number_pad/number_pad.dart';
import 'package:widgets_library/utils/size_config.dart';

class AddTipPopUp extends StatelessWidget {
  final Function() onTap;
  final TextEditingController tipController;
  const AddTipPopUp(
      {super.key, required this.onTap, required this.tipController});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<SemnoxTheme>()!;
    double width = MediaQuery.of(context).size.width;
    SizeConfig.init(context);
    return Scaffold(
      backgroundColor: theme.transparentColor,
      body: Center(
        child: Container(
          height: SizeConfig.getHeight(352),
          width: SizeConfig.getWidth(572),
          decoration: BoxDecoration(
            color: theme.backGroundColor,
            borderRadius: BorderRadius.circular(SizeConfig.getSize(8.0)),
          ),
          child: Column(
            children: [
              SizedBox(
                height: SizeConfig.getHeight(98),
                child: Center(
                  child: Text(
                    MessagesProvider.get('CLOCK OUT: DIRECT TIP ENTRY'),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: theme.heading3?.copyWith(fontSize: SizeConfig.getFontSize(26)),),
                ),
              ),
              Divider(
                thickness: SizeConfig.getSize(1),
                color: theme.dialogFooterInnerShadow,
                height: SizeConfig.getHeight(1),
              ),
              Expanded(
                child: RawScrollbar(
                  thumbVisibility: true,
                  thickness: 10,
                  trackColor: theme.scrollArea,
                  thumbColor: theme.scrollBarHandle,
                  trackVisibility: true,
                  child: CustomScrollView(
                    slivers: [
                      SliverFillRemaining(
                        hasScrollBody: false,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                    MessagesProvider.get('Enter Direct Tip amount'),
                                    style: KTextStyle.regularBoldTextStyle.copyWith(
                                            fontSize: SizeConfig.getFontSize(22))),
                                SizedBox(height: SizeConfig.getHeight(10),),
                                SizedBox(
                                  height: SizeConfig.getSize(60),
                                  width: width * 0.3,
                                  child: TextFormField(
                                    readOnly: true,
                                    showCursor: true,
                                    onTap: () => showDialog(
                                      barrierDismissible: true,
                                      context: context,
                                      barrierColor: const Color(0x01000000),
                                      builder: (BuildContext context) {
                                        return NumberPad(
                                          initialOffset: const Offset(50, 50),
                                          title: '',
                                          isZeroRequired: true,
                                          onOkPressed: (value) {
                                            tipController.text =
                                                value.toString();
                                          },
                                        );
                                      },
                                    ),
                                    style: theme.subtitle1?.copyWith(fontSize: SizeConfig.getFontSize(22)),
                                    controller: tipController,
                                    decoration: InputDecoration(
                                      contentPadding: const EdgeInsets.only(left: 10),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Divider(
                thickness: SizeConfig.getSize(1),
                color: theme.dialogFooterInnerShadow,
                height: SizeConfig.getHeight(1),
              ),
              SizedBox(
                height: SizeConfig.getHeight(98),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SecondaryLargeButton(
                      onPressed: () {
                        onTap();
                      },
                      text: MessagesProvider.get("CANCEL"),
                    ),
                    SizedBox(width: SizeConfig.getWidth(10)),
                    PrimaryLargeButton(
                      onPressed: () {
                        if(tipController.text.isEmpty) {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return const RequiredFieldsPopUp();
                            },
                          );
                        } else {
                          onTap();
                        }
                      },
                      text: MessagesProvider.get("OK"),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
