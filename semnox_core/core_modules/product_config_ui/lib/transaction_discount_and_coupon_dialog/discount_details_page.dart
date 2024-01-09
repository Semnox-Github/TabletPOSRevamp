import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:master_data/models/discount_container/discount_container_dto.dart';
import 'package:notificationbar_ui/NotificationBar.dart';
import 'package:product_config_ui/transaction_discount_and_coupon_dialog/widgets/discount_details_section.dart';
import 'package:messages_data/builder.dart';
import 'package:themes_library/themes_library.dart';
import 'package:widgets_library/utils/size_config.dart';


class DiscountDetailsDialog extends StatefulWidget {
  const DiscountDetailsDialog(
      {Key? key,
        required this.discountContainerDto
      })
      : super(key: key);
  final DiscountContainerDto? discountContainerDto;

  @override
  State<DiscountDetailsDialog> createState() =>
      _DiscountDetailsDialogState();
}

class _DiscountDetailsDialogState extends State<DiscountDetailsDialog> {
  NotificationBar? _notificationBar;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late SemnoxTheme _theme;

  @override
  void initState() {
    _notificationBar = NotificationBar(showHideSideBar: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _theme = Theme.of(context).extension<SemnoxTheme>()!;
    SizeConfig.init(context);
    return Material(
      color: _theme.transparentColor,
      child: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                Expanded(
                  child: Container(
                    margin:  EdgeInsets.all(SizeConfig.getSize(8)),
                    decoration: BoxDecoration(
                      color:_theme.backGroundColor,
                      borderRadius: BorderRadius.circular(SizeConfig.getSize(8)),
                    ),
                    child: Form(
                      key: _formKey,
                      child: Container(
                        decoration: BoxDecoration(
                          color: _theme.backGroundColor,
                          borderRadius: BorderRadius.circular(SizeConfig.getSize(8)),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: SizeConfig.getSize(64),
                              decoration:  BoxDecoration(
                                  color:_theme.backGroundColor,
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(SizeConfig.getSize(8)),
                                      topLeft: Radius.circular(SizeConfig.getSize(8)))),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                    child: Container(
                                      decoration:  BoxDecoration(
                                          color: _theme.button2InnerShadow1,
                                          borderRadius: BorderRadius.only(
                                              bottomRight: Radius.circular(SizeConfig.getSize(8)),
                                              topLeft: Radius.circular(SizeConfig.getSize(8)))),
                                      constraints: const BoxConstraints(
                                        minHeight: double.infinity,
                                        maxHeight: double.infinity,
                                      ),
                                      child: Padding(
                                        padding:  EdgeInsets.only(
                                            left: SizeConfig.getSize(20), right: SizeConfig.getSize(20)),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                             Icon(
                                              Icons.arrow_back_ios,
                                              color: Colors.white,
                                              size: SizeConfig.getSize(30),
                                            ),
                                             SizedBox(width: SizeConfig.getSize(20),),
                                            Text(
                                              MessagesProvider.get('Discount Details').toUpperCase(),
                                              style:_theme.headingLight3!.copyWith(color:_theme.light1, fontSize: SizeConfig.getFontSize(22)),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                   SizedBox(width: SizeConfig.getSize(8),),
                                  Expanded(
                                    child: Container(
                                      constraints: const BoxConstraints(
                                        minHeight: double.infinity,
                                        maxHeight: double.infinity,
                                      ),
                                      decoration:  BoxDecoration(
                                          color: _theme.button1BG1,
                                          borderRadius: BorderRadius.only(
                                              topRight: Radius.circular(SizeConfig.getSize(8)),
                                              bottomLeft: Radius.circular(SizeConfig.getSize(8)))),
                                      height: SizeConfig.getSize(64),
                                    ),
                                  )
                                ],
                              ),
                            ),
                             SizedBox(height: SizeConfig.getSize(15),),
                            DiscountDetailsSection(
                              discountContainerDto: widget.discountContainerDto,
                            ),
                            Container(
                              height: 1,
                            ),

                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  child: _notificationBar,
                )
              ],
            ),


          ],
        ),
      ),
    );
  }



  @override
  void dispose() {
    _notificationBar = null;
    super.dispose();
  }
}
