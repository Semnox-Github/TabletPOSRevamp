import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nfc/nfc.dart';
import 'package:other_function_ui/bloc/other_function_bloc.dart';
import 'package:other_function_ui/widgets/headerWidgets/header_button.dart';
import 'package:themes_library/themes_library.dart';
import 'package:widgets_library/utils/size_config.dart';

class DeactivateHeader extends StatefulWidget {
  final String header;
  const DeactivateHeader({super.key, required this.header});

  @override
  State<DeactivateHeader> createState() => _DeactivateHeaderState();
}

class _DeactivateHeaderState extends State<DeactivateHeader> {
  TextEditingController cardNoController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isNFCAvailable = false;

  @override
  void initState() {
    Future.microtask(() async {
      _isNFCAvailable = await NFCManager().isNfcAvailable();
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<SemnoxTheme>()!;
    SizeConfig.init(context);
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
      child: Container(
        decoration: BoxDecoration(
            color: theme.backGroundColor,
            borderRadius: const BorderRadius.only(
                topRight: Radius.circular(6), topLeft: Radius.circular(6))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                height: SizeConfig.getSize(96),
                decoration: BoxDecoration(
                  color: theme.button2InnerShadow1,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(8),
                    bottomRight: Radius.circular(8),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                    ),
                    Center(
                      child: Text(
                        widget.header,
                        style: theme.headingLight4?.copyWith(
                            color: Colors.white,
                            fontSize: SizeConfig.getFontSize(22)),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Container(
                height: SizeConfig.getSize(96),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: theme.button1BG1,
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      HeaderButton(
                        isNfcAvailable: _isNFCAvailable,
                        formKey: _formKey,
                        isDeactivate: true,
                        cardController: cardNoController,
                        otherFunctionBloc: context.read<OtherFunctionBloc>(),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
