
import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:payment_ui/screens/payment_settlement/widgets/generic_msg_popup.dart';
import 'package:payment_ui/utils/colors.dart';
import 'package:themes_library/themes_library.dart';
import 'package:widgets_library/utils/size_config.dart';
import 'package:payment_ui/utils/styles.dart';
import 'package:messages_data/builder.dart';
import 'package:transaction_data/models/create_transaction/transaction_response.dart';

typedef OnPaymentComplete = Function(TransactionResponse? response);

void showErrorDialog(BuildContext context, String title, String message, TextStyle titleStyle, TextStyle msgStyle) {
  showDialog(
      context: context,
      builder: (_) => CupertinoAlertDialog(
        title: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Text(
            title,
            style: titleStyle,
          ),
        ),
        content: Text(
          message,
          style: msgStyle,
        ),
        actions: [
          CupertinoDialogAction(
            child: Text(
              MessagesProvider.get("OK"),
              style: titleStyle,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
      barrierDismissible: false);
}

Future<void> showGenericDialog(BuildContext context,
    VoidCallback onTapOk,
    String title, String message, {isDismissible = false}) async {
  final isBigDevice = SizeConfig.isBigDevice();
 return showDialog(
      context: context,
      builder: (_) => Dialog(
        insetPadding: EdgeInsets.symmetric(horizontal: isBigDevice ? SizeConfig.getWidth(260) : SizeConfig.getWidth(200)),
        child: GenericMsgPopup(
          onTapOk: onTapOk,
          title: title,
          msg: message,
        ),
      ),
      barrierDismissible: isDismissible);
}


void showSuccessDialog(BuildContext context, String title, String message, TextStyle titleStyle, TextStyle msgStyle) {
  showDialog(
      context: context,
      builder: (_) => CupertinoAlertDialog(
        content: Text(
          message,
          style: msgStyle,
        ),
      ),
      barrierDismissible: false);
}

Widget containerButton({
  required String text,
  required TextStyle textStyle,
  required VoidCallback onTapped,
  required Color buttonColor,
  double cornerRadius = 8,
  double height = 50,
  double width = 300
}) {
  return InkWell(
    onTap: () {
      onTapped();
    },
    child: Container(
    height: height,
    width: width,
    decoration: BoxDecoration(
      color: buttonColor,
      border: Border.all(color: colorGreyD8),
      borderRadius: BorderRadius.circular(cornerRadius),
    ),
    child: Center(
      child: Text(text,textAlign: TextAlign.center, style: textStyle),
    ),
    ),
  );
}

Widget customDropDown({
  required String hint,
  required TextStyle textStyle,
  required TextStyle hintTextStyle,
  List<DropdownMenuItem>? items,
  String? validationText,
  dynamic value,
  Function(dynamic)? onChange,
  height = 50.0,
  width = 300.0,
  maxLength = 10000,
  required Color iconColor,
  required Color borderColor,
  keyboardType = TextInputType.text
}) {
  return SizedBox(
      height: height,
      child: DropdownButtonFormField(
        items: items,
        onChanged: onChange,
        value: value,
        validator: (value){
           if(validationText == null){
            return null;
          }else if (value == null || value.isEmpty) {
            return validationText;
          }
          return null;
        },
        hint: Text(hint, style: hintTextStyle),
        style: textStyle.copyWith(overflow: TextOverflow.ellipsis),
        isDense: true,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(left: SizeConfig.getWidth(12), right: SizeConfig.getWidth(12), top: SizeConfig.getHeight(12)),
          border: OutlineInputBorder(
              borderSide: BorderSide(color: borderColor),
              borderRadius: const BorderRadius.all(Radius.circular(8))),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: borderColor),
              borderRadius: const BorderRadius.all(Radius.circular(8))),
        ),
        icon: Image.asset('assets/down_arrow_white.png', height: 15, width: 15, color: iconColor),
        isExpanded: true,)
  );
}


Widget dateTextField({
      required String hint,
      required SemnoxTheme theme,
      required BuildContext context,
      required TextStyle textStyle,
      required TextEditingController controller,
      required Color borderColor,
      required Color iconColor,
      String? dateTimeFormat,
      height = 50.0,
      width = 300.0,
      maxLength = 10000,
      keyboardType = TextInputType.text
    }) {
  return SizedBox(
    height: height,
    child: Theme(
      data: ThemeData.light().copyWith(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: primaryBlack,
          primaryColorDark: primaryBlack,
          accentColor: primaryBlack,
        ),
        dialogBackgroundColor:Colors.white,
      ),
      child: DateTimePicker(
        style: textStyle,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(left: SizeConfig.getWidth(12), right: SizeConfig.getWidth(12), top: SizeConfig.getHeight(12)),
          border: OutlineInputBorder(
              borderSide: BorderSide(color: borderColor),
              borderRadius: const BorderRadius.all(Radius.circular(8))),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: borderColor),
              borderRadius: const BorderRadius.all(Radius.circular(8))),
          disabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: borderColor),
              borderRadius: const BorderRadius.all(Radius.circular(8))),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: borderColor),
              borderRadius: const BorderRadius.all(Radius.circular(8))),
          suffixIconConstraints: BoxConstraints(
          minWidth: SizeConfig.getWidth(25),
          minHeight: SizeConfig.getHeight(25),
        ),
          suffixIcon: Padding(
              padding: const EdgeInsets.only(left: 0, right: 8, bottom: 2),
              child: Icon(Icons.date_range_outlined, size: SizeConfig.getFontSize(22), color: iconColor)),
        ),
        type: DateTimePickerType.dateTime,
        dateMask: dateTimeFormat ?? 'dd-MMM-yyyy hh:mm a',
        controller: controller,
        firstDate: DateTime(2000),
        lastDate: DateTime(2100),
        dateLabelText: 'Date Time',
        use24HourFormat: false,
        locale: const Locale('en', 'US'),
        onChanged: (val) {

        },
      ),
    )
  );
}

Widget customTextField({
      required String hint,
      required TextStyle textStyle,
      required TextEditingController controller,
      required BuildContext context,
      required Color borderColor,
      required Color fillColor,
      bool readOnly = false,
      bool autoFocus = false,
      VoidCallback? onTap,
      List<FilteringTextInputFormatter>? inputFilters,
      Widget? suffixIcon,
      height = 50.0,
      width = 300.0,
      maxLength = 10000,
      keyboardType = TextInputType.text
    }) {
  return SizedBox(
    height: height,
    child: TextField(
      maxLines: 1,
      inputFormatters: inputFilters,
      style: textStyle,
      textAlignVertical: TextAlignVertical.center,
      controller: controller,
      maxLength: maxLength,
      onTap: onTap,
      readOnly: readOnly,
      autofocus: autoFocus,
      keyboardType: keyboardType,
      scrollPadding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom + 30),
      decoration: InputDecoration(
        filled: true,
        suffixIcon: suffixIcon,
        suffixIconConstraints: const BoxConstraints(
          minWidth: 22,
          minHeight: 22,
        ),
        fillColor: fillColor,
        counterText: '',
        border: OutlineInputBorder(
            borderSide: BorderSide(color: borderColor),
            borderRadius: const BorderRadius.all(Radius.circular(8))),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: borderColor),
            borderRadius: const BorderRadius.all(Radius.circular(8))),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: borderColor),
            borderRadius: const BorderRadius.all(Radius.circular(8))),
        disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: borderColor),
            borderRadius: const BorderRadius.all(Radius.circular(8))),
        contentPadding: EdgeInsets.only(left: SizeConfig.getWidth(12), right: SizeConfig.getWidth(12), top: SizeConfig.getHeight(12)),
        hintText: hint,
      ),
    )
  );
}

Widget amountTextField({
      required TextEditingController controller,
      required VoidCallback onTap,
      required Color borderColor,
      required TextStyle textStyle,
    }) {
  return TextField(
    inputFormatters: [
    ],
    onChanged: (text) {
      if(text.length == 5 && text.substring(0,4) == '0.00') {
        controller.text = text.substring(4);
      }
      if(text.length == 2 && text.substring(0,1) == '0') {
        controller.text = text.substring(1);
      }
      controller.selection =
          TextSelection.collapsed(
              offset:
              controller.text.length);
    },
    cursorWidth: 0,
    cursorHeight: 0,
    readOnly: true,
    onTap: onTap,
    controller: controller,
    autofocus: false,
    maxLength: 6,
    style: textStyle,
    textAlign: TextAlign.start,
    keyboardType: const TextInputType.numberWithOptions(decimal: true, signed: false),
    decoration:  InputDecoration(
      contentPadding: const EdgeInsets.fromLTRB(10, 12, 0, 0),
      counterText: '',
      focusedBorder: OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        borderSide: BorderSide(
          width: 1,
          color: borderColor,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        borderSide: BorderSide(
          width: 1,
          color: borderColor,
        ),
      ),
      border: OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        borderSide: BorderSide(
          width: 1,
          color: borderColor,
        ),
      ),
    ),
  );
}

Widget whiteTextField({
  required String hint,
  required TextStyle textStyle,
  required Color borderColor,
  required Function(String) onTextEntered,
  required TextEditingController controller,
  VoidCallback? onClear,
  height = 50.0,
  width = 300.0
}) {
  return SizedBox(
      height: height,
      width: width,
      child: TextField(
        maxLines: 1,
        controller: controller,
        style: textStyle,
        onChanged: (text) {
          onTextEntered(text);
        },
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
          filled: false,
          fillColor: colorBlack,
          suffixIconConstraints: BoxConstraints(maxWidth: SizeConfig.getSize(45), maxHeight: SizeConfig.getSize(45)),
          suffixIcon: controller.text.isNotEmpty ? InkWell(
            onTap: () {
              if(onClear != null) {
                onClear();
              }
            },
            child: Padding(
              padding: EdgeInsets.only(left: SizeConfig.getSize(8), top: SizeConfig.getSize(5), bottom: SizeConfig.getSize(5), right: SizeConfig.getSize(8)),
              child: Image.asset('assets/ic_close.png',
                color: Colors.white,),
            ),
          ) : null,
          border: OutlineInputBorder(
              borderSide: BorderSide(color: borderColor),
              borderRadius: const BorderRadius.all(Radius.circular(8))),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: borderColor),
              borderRadius: const BorderRadius.all(Radius.circular(8))),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: borderColor),
              borderRadius: const BorderRadius.all(Radius.circular(8))),
            contentPadding: EdgeInsets.only(left: SizeConfig.getWidth(12), right: SizeConfig.getWidth(12), top: SizeConfig.getHeight(12)),
          hintText: hint,
          hintStyle: textStyle
        ),
      )
  );
}

const MaterialColor primaryBlack = MaterialColor(
  _blackPrimaryValue,
  <int, Color>{
    50: Color(0xFF000000),
    100: Color(0xFF000000),
    200: Color(0xFF000000),
    300: Color(0xFF000000),
    400: Color(0xFF000000),
    500: Color(_blackPrimaryValue),
    600: Color(0xFF000000),
    700: Color(0xFF000000),
    800: Color(0xFF000000),
    900: Color(0xFF000000),
  },
);
const int _blackPrimaryValue = 0xFF000000;