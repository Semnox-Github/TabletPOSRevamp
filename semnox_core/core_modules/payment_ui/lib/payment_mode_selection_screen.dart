import 'package:customer_ui/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:messages_data/builder.dart';
import 'package:themes_library/themes_library.dart';

class PaymentModeSelectionDialog extends StatefulWidget {
  final VoidCallback onSwipeSelected;
  final VoidCallback onKeyedSelected;
  final VoidCallback onOkSelected;

  const PaymentModeSelectionDialog(
      {super.key,
        required this.onSwipeSelected,
        required this.onKeyedSelected,
        required this.onOkSelected});

  @override
  State<StatefulWidget> createState() => _PaymentModeSelectionDialogState();
}

class _PaymentModeSelectionDialogState
    extends State<PaymentModeSelectionDialog> {
  bool _isSwiped = true;

  @override
  void initState() {
    setState(() {
      widget.onSwipeSelected();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SemnoxTheme theme = Theme.of(context).extension<SemnoxTheme>()!;
    SizeConfig.init(context);
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
      elevation: 0.0,
      alignment: Alignment.center,
      backgroundColor: Colors.transparent,
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(16.0)),
        width: SizeConfig.getSize(SizeConfig.screenWidth * 0.42),
        height: SizeConfig.getSize(400),
        alignment: Alignment.center,
        child: Scaffold(
          backgroundColor: Colors.transparent,
          resizeToAvoidBottomInset: false,
          body: Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(16.0), color:theme.backGroundColor),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
                  child: Text(
                    MessagesProvider.get('Please select Entry Mode'),
                    style: GoogleFonts.robotoCondensed(
                        color: theme.secondaryColor,
                        fontSize: SizeConfig.getFontSize(28),
                        fontWeight: FontWeight.w700),
                    textAlign: TextAlign.center,
                  ),
                ),
                Container(
                  height: 1,
                  color: theme.dividerColor,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            _isSwiped = true;
                            widget.onSwipeSelected();
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 16),
                          backgroundColor: !_isSwiped
                              ? theme.button1BG1
                              : theme.secondaryColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4.0)),
                        ),
                        child: Text(
                          MessagesProvider.get("Swiped").toUpperCase(),
                          style: GoogleFonts.robotoCondensed(
                              color: !_isSwiped ?theme.secondaryColor : theme.primaryColor,
                              fontSize: 19.0,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            _isSwiped = false;
                            widget.onKeyedSelected();
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 16),
                          backgroundColor:
                          _isSwiped ? theme.button1BG1 : theme.secondaryColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4.0)),
                        ),
                        child: Text(
                          MessagesProvider.get("Keyed").toUpperCase(),
                          style: GoogleFonts.robotoCondensed(
                              color: _isSwiped ? theme.secondaryColor : theme.primaryColor,
                              fontSize: 19.0,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  height: 1,
                  color: theme.dividerColor,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            Navigator.pop(context);
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 22),
                          backgroundColor: theme.button1BG1,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4.0)),
                        ),
                        child: Text(
                          MessagesProvider.get("Cancel").toUpperCase(),
                          style: GoogleFonts.robotoCondensed(
                              color: theme.secondaryColor,
                              fontSize: 19.0,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            widget.onOkSelected();
                            Navigator.pop(context);
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 40),
                          backgroundColor:theme.secondaryColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4.0)),
                        ),
                        child: Text(
                          MessagesProvider.get("Ok").toUpperCase(),
                          style: GoogleFonts.robotoCondensed(
                              color: theme.primaryColor,
                              fontSize: 19.0,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
