import 'package:flutter/material.dart';
import 'package:widgets_library/utils/size_config.dart';
import 'package:themes_library/themes_library.dart';

class ErrorAlertDialog extends StatelessWidget {
  ErrorAlertDialog(
      {Key? key, required this.title, required this.message, this.onOkPressed})
      : super(key: key);
  final String title;
  final String message;
  final VoidCallback? onOkPressed;

  late SemnoxTheme _theme;

  @override
  Widget build(BuildContext context) {
    _theme = Theme.of(context).extension<SemnoxTheme>()!;
    SizeConfig.init(context);
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(SizeConfig.getSize(8)),
      ),
      child: SizedBox(
        width: SizeConfig.getWidth(500),
        height: SizeConfig.getSize(350),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding:  EdgeInsets.all(SizeConfig.getSize(30)),
                  child: Text(title,
                      style: _theme.heading2!.copyWith(
                          fontSize: SizeConfig.getFontSize(26))
                  ),
                ),
                Container(
                    height: 1,
                    color: _theme.dialogFooterInnerShadow
                ),

                // const SizedBox(height: 15),
              ],
            ),

            Padding(
              padding:  EdgeInsets.all(SizeConfig.getSize(20)),
              child: Text(message ?? '',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                  style: _theme.heading5?.copyWith(fontSize: SizeConfig.getFontSize(24), fontWeight: FontWeight.w400)),
            ),

            Column(
              children: [
                Container(
                    height: 1,
                    color: _theme.dialogFooterInnerShadow
                ),
                Padding(
                  padding:  EdgeInsets.all(SizeConfig.getSize(20)),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.all(SizeConfig.getSize(4)),
                      tapTargetSize:
                      MaterialTapTargetSize.shrinkWrap,
                      maximumSize: Size(
                          SizeConfig.getSize(122), SizeConfig.getSize(72)),
                      minimumSize: Size(
                          SizeConfig.getSize(122), SizeConfig.getSize(72)),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            SizeConfig.getSize(8)), // <-- Radius
                      ),

                      backgroundColor: _theme.button1BG1!,
                    ),
                    onPressed: () {
                      if (onOkPressed != null) {
                        onOkPressed!();
                      }
                      Navigator.pop(context);
                    },
                    child: Text(
                      'OK',
                      style: _theme.heading5!.copyWith(
                          fontSize: SizeConfig.getFontSize(18)),
                    ),
                  ),
                ),
              ],
            ),

          ],
        ),
      ),
    );
  }
}
