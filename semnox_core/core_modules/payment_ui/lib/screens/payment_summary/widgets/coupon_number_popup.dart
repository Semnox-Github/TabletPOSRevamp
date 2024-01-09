import 'package:customer_data/builder.dart';
import 'package:customer_data/models/account_details/account_details_response.dart';
import 'package:customer_ui/utils/AppColors.dart';
import 'package:customer_ui/utils/AppStyle.dart';
import 'package:customer_ui/utils/styles.dart';
import 'package:execution_context/builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:messages_data/builder.dart';
import 'package:nfc/nfc.dart';
import 'package:notificationbar_ui/NotificationBar.dart';
import 'package:payment_ui/cubits/payment_summary/debit_screen/semnox_debit_cubit.dart';
import 'package:payment_ui/cubits/payment_summary/payment_screen_cubit.dart';
import 'package:payment_ui/utils/colors.dart';
import 'package:payment_ui/utils/common_widgets.dart';
import 'package:messages_data/builder.dart';
import 'package:themes_library/themes_library.dart';
import 'package:widgets_library/utils/keyboard_hider_widget.dart';
import 'package:widgets_library/utils/size_config.dart';

class CouponNumberPopup extends StatefulWidget {
  final Function(String) onCouponEntered;
  final VoidCallback onCancelClicked;

  const CouponNumberPopup({
    super.key,
    required this.onCouponEntered,
    required this.onCancelClicked,
  });

  @override
  State<StatefulWidget> createState() => _CouponNumberPopupState();
}

class _CouponNumberPopupState extends State<CouponNumberPopup> {

  final _couponNumberCtr = TextEditingController();
  var focusNode = FocusNode();
  final ScrollController _verticalCtr = ScrollController();
  late NotificationBar _notificationBar;

  @override
  void initState() {
    super.initState();
    _notificationBar = NotificationBar(showHideSideBar: false);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<SemnoxTheme>()!;
    SizeConfig.init(context);
    return Container(
      padding: MediaQuery.of(context).viewInsets.bottom == 0 ? EdgeInsets.only(top: SizeConfig.getSize(220)):EdgeInsets.only(top: SizeConfig.getSize(70)),
      alignment: Alignment.center,
      child: WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          backgroundColor:  Colors.transparent,
          resizeToAvoidBottomInset: false,
          body: KeyboardHider(
            child: Column(
              children: [
                Expanded(
                    child: SingleChildScrollView(
                      controller: _verticalCtr,
                      child: Align(
                        alignment: Alignment.center,
                        child: Container(
                          margin: const EdgeInsets.all(0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: theme.backGroundColor ?? Colors.white,
                          ),
                          child: SizedBox(
                            width: SizeConfig.screenWidth * 0.38,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: SizeConfig.screenHeight * 0.02,
                                      bottom: SizeConfig.screenHeight * 0.02),
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      MessagesProvider.get('Coupon Number').toUpperCase(),
                                      style: theme.heading5?.copyWith(fontSize: SizeConfig.getFontSize(26)),
                                    ),
                                  ),
                                ),
                                Divider(
                                  thickness: 1,
                                  color: Colors.grey[400],
                                  height: SizeConfig.screenHeight * 0.0002,
                                ),
                                SizedBox(height: SizeConfig.getHeight(12)),
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: SizeConfig.getWidth(24)),
                                  child: Text(
                                    '* ${MessagesProvider.get('Enter Coupon Number')}',
                                    style: theme.heading5?.copyWith(fontSize: SizeConfig.getFontSize(18), fontWeight: FontWeight.w500) ?? tsS14W50016,
                                  ),
                                ),
                                SizedBox(height: SizeConfig.getHeight(8)),
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: SizeConfig.getWidth(24)),
                                  child: TextFormField(
                                    controller: _couponNumberCtr,
                                    textAlign: TextAlign.start,
                                    readOnly: false,
                                    focusNode: focusNode,
                                    style: theme.heading5?.copyWith(fontSize: SizeConfig.getFontSize(18), fontWeight: FontWeight.w500),
                                    decoration: InputDecoration(
                                      isDense: true,
                                      contentPadding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(4.0),
                                      ),
                                      hintText: MessagesProvider.get('Enter'),
                                      hintStyle: theme.heading5?.copyWith(fontSize: SizeConfig.getFontSize(18), fontWeight: FontWeight.w500),
                                    ),
                                    onTap: () {
                                      FocusScope.of(context)
                                          .requestFocus(focusNode);
                                    },
                                  ),
                                ),
                                SizedBox(height: SizeConfig.getHeight(24)),
                                Divider(
                                  thickness: 1,
                                  color: Colors.grey[400],
                                  height: SizeConfig.screenHeight * 0.0002,
                                ),
                                SizedBox(height: SizeConfig.getHeight(16)),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    containerButton(
                                        text: MessagesProvider.get('Cancel'),
                                        textStyle: theme.heading5?.copyWith(fontSize: SizeConfig.getFontSize(26)) ?? tsS20W70016,
                                        buttonColor: theme.footerBG1 ?? colorBlueF8,
                                        height: SizeConfig.getHeight(60),
                                        width: SizeConfig.getWidth(150),
                                        cornerRadius: 5,
                                        onTapped: () {
                                          FocusManager.instance.primaryFocus?.unfocus();
                                          widget.onCancelClicked();
                                          Navigator.pop(context);
                                        }
                                    ),
                                    SizedBox(width: SizeConfig.getWidth(12)),
                                    containerButton(
                                        text: MessagesProvider.get('OK'),
                                        textStyle: theme.heading5?.copyWith(fontSize: SizeConfig.getFontSize(26), color: Colors.white) ?? tsS20W700FF,
                                        height: SizeConfig.getHeight(60),
                                        width: SizeConfig.getWidth(150),
                                        cornerRadius: 5,
                                        onTapped: () {
                                          FocusManager.instance.primaryFocus?.unfocus();
                                          final couponNumber = _couponNumberCtr.text.trim();
                                          if (couponNumber.isEmpty) {
                                            _notificationBar.showMessage(MessagesProvider.get('Please enter required fields'), AppColors.notificationBGRedColor);
                                            return;
                                          }
                                          _notificationBar.showMessage(
                                              '', AppColors.primaryColor);
                                          widget.onCouponEntered(couponNumber);
                                          Navigator.pop(context);
                                        }, buttonColor: theme.button2InnerShadow1 ?? colorBlack
                                    ),
                                  ],
                                ),
                                SizedBox(height: SizeConfig.getHeight(12)),
                              ],
                            ),
                          ),
                        ),
                      ),
                    )),
                Container(
                  child: _notificationBar,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
