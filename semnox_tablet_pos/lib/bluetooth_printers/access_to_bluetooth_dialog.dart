import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:messages_data/builder.dart';
import 'package:product_config_ui/widgets/primaryLargeButton.dart';
import 'package:product_config_ui/widgets/secondaryLargeButton.dart';

class AccessToBluetoothDialog extends StatelessWidget {
  final VoidCallback onOpenSettingsTapped;
  final VoidCallback onDenyTapped;

  const AccessToBluetoothDialog({
    Key? key,
    required this.onOpenSettingsTapped,
    required this.onDenyTapped
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Stack(
        children: [
          Scaffold(
            resizeToAvoidBottomInset: true,
            backgroundColor: Colors.transparent,
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(170, 0, 170, 0),
                        child: Container(
                          height: 95,
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(8),
                                  topLeft: Radius.circular(8))),
                          child: Center(
                            child: AutoSizeText(
                              (MessagesProvider.get("Turn On Bluetooth to Allow Parafait POS to connect to Printer")),
                              minFontSize: 20,
                              maxFontSize: 26,
                              style: GoogleFonts.robotoCondensed(
                                  textStyle: const TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 26.0,
                                    color: Color.fromARGB(255, 16, 18, 22),
                                  )),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                          padding: const EdgeInsets.fromLTRB(170, 0, 170, 0),
                          child: Container (
                            height: 95,
                            decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(8),
                                    bottomLeft: Radius.circular(8))),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SecondaryLargeButton(onPressed: () {
                                  Navigator.pop(context);
                                  onDenyTapped();
                                }, text: MessagesProvider.get("DENY ")),
                                const SizedBox(width: 16,),
                                PrimaryLargeButton(onPressed: () {
                                  Navigator.pop(context);
                                  onOpenSettingsTapped();
                                }, text: MessagesProvider.get("OPEN SETTINGS"))
                              ],
                            ),
                          )
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}