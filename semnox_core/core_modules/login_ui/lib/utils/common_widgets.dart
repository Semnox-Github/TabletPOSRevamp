import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_ui/LoginErrorDialog.dart';
import 'package:login_ui/utils/colors.dart';
import 'package:login_ui/utils/size_config.dart';
import 'package:login_ui/utils/styles.dart';
import 'package:messages_data/builder.dart';

void showErrorDialog(BuildContext context, String title, String message) {
  showDialog(
      context: context,
      builder: (_) => CupertinoAlertDialog(
            title: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                title,
                style: GoogleFonts.robotoCondensed(
                    color: Colors.black,
                    fontSize: 26.0,
                    fontWeight: FontWeight.w400),
              ),
            ),
            content: Text(
              message,
              style: GoogleFonts.robotoCondensed(
                  color: Colors.black,
                  fontSize: 19.0,
                  fontWeight: FontWeight.w400),
            ),
            actions: [
              CupertinoDialogAction(
                child: Text(
                  MessagesProvider.get("OK"),
                  style: GoogleFonts.robotoCondensed(
                      color: Colors.black,
                      fontSize: 26.0,
                      fontWeight: FontWeight.w400),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
      barrierDismissible: true);
}

Widget containerButton(
    {required String text,
    required TextStyle textStyle,
    required VoidCallback onTapped,
    Color buttonColor = colorBlack,
    double cornerRadius = 8,
    height = 50,
    width = 300}) {
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
        child: Text(text, style: textStyle),
      ),
    ),
  );
}

Widget customTextField(
    {required String hint,
    required TextStyle textStyle,
    required TextEditingController controller,
    height = 50,
    width = 300}) {
  return SizedBox(
      height: height,
      width: width,
      child: TextField(
        maxLines: 1,
        style: textStyle,
        textAlignVertical: TextAlignVertical.center,
        controller: controller,
        decoration: InputDecoration(
          filled: true,
          fillColor: colorWhite,
          border: const OutlineInputBorder(
              borderSide: BorderSide(color: colorBlack3D),
              borderRadius: BorderRadius.all(Radius.circular(8))),
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: colorBlack3D),
              borderRadius: BorderRadius.all(Radius.circular(8))),
          contentPadding: EdgeInsets.symmetric(
              horizontal: SizeConfig.getWidth(12),
              vertical: SizeConfig.getHeight(9)),
          hintText: hint,
        ),
      ));
}

Widget whiteTextField(
    {required String hint,
    required TextStyle textStyle,
    height = 50.0,
    width = 300.0}) {
  return SizedBox(
      height: height,
      width: width,
      child: TextField(
        maxLines: 1,
        style: tsS14W400FF,
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
            filled: true,
            fillColor: colorBlack,
            border: const OutlineInputBorder(
                borderSide: BorderSide(color: colorBlack3D),
                borderRadius: BorderRadius.all(Radius.circular(8))),
            enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: colorBlack3D),
                borderRadius: BorderRadius.all(Radius.circular(8))),
            focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: colorBlack3D),
                borderRadius: BorderRadius.all(Radius.circular(8))),
            contentPadding: EdgeInsets.symmetric(
                horizontal: SizeConfig.getWidth(12),
                vertical: SizeConfig.getHeight(9)),
            hintText: hint,
            hintStyle: tsS14W400FF),
      ));
}

Future<T?> showAppErrorDialog<T>({
  required BuildContext context,
  String title = 'Error',
  required String message,
}) async {
  final dialog = await showDialog<T>(
      context: context,
      builder: (BuildContext context) {
        return LoginErrorDialog(title, message);
      });
  return dialog;
}
