import 'dart:math';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:messages_data/builder.dart';
import 'package:product_config_ui/widgets/primaryLargeButton.dart';
import 'package:themes_library/themes_library.dart';
import 'package:transaction_ui/cubit/transaction_cubit.dart';
import 'package:transaction_ui/models/transaction_lines_group.dart';
import 'package:login_ui/loader_dialog.dart' as loader;
import 'package:widgets_library/utils/size_config.dart';
import 'widgets/secondaryLargeButton.dart';

class UpdateTransactionLineSeatDialog extends StatefulWidget {
  final List<int> transactionLinesIDs;
  final TransactionLinesGroup? selectedTransactionLinesGroup;
  final Map<int, String>? seatNames;
  final List<int>? seatNumbers;
  final Function() onComplete;
  final Function() onValidation;
  final int? approverID;

  const UpdateTransactionLineSeatDialog(
      {Key? key,
      required this.transactionLinesIDs,
      required this.selectedTransactionLinesGroup,
      required this.seatNames,
      required this.seatNumbers,
      required this.onComplete,
      required this.onValidation,
      this.approverID})
      : super(key: key);

  @override
  State<UpdateTransactionLineSeatDialog> createState() => _UpdateTransactionLineSeatDialogState();
}

class _UpdateTransactionLineSeatDialogState extends State<UpdateTransactionLineSeatDialog> {
  final selectedSeatNumber = ValueNotifier<int?>(null);
  String? selectedSeatName;
  int newAddSeatNumber = 0;
  late SemnoxTheme theme;

  @override
  void initState() {
    newAddSeatNumber = (widget.seatNumbers?.reduce(max) ?? 0) + 1;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    theme = Theme.of(context).extension<SemnoxTheme>()!;
    SizeConfig.init(context);
    return WillPopScope(
      onWillPop: () async => false,
      child: Material(
        color: theme.transparentColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(SizeConfig.getSize(8.0)),
        ),
        child: Stack(
          children: [
            Scaffold(
              resizeToAvoidBottomInset: true,
              backgroundColor: theme.transparentColor,
              body: Dialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(SizeConfig.getSize(8.0)),
                ),
                child: SizedBox(
                  height: SizeConfig.isBigDevice() ? SizeConfig.getHeight(292) : SizeConfig.getHeight(362),
                  width: SizeConfig.getWidth(572),
                  child: Column(
                    children: [
                      SizedBox(
                        height: SizeConfig.isBigDevice() ? SizeConfig.getHeight(78) : SizeConfig.getHeight(98),
                        child: Center(
                          child: Text(
                            (MessagesProvider.get("UPDATE SEAT")),
                            style: theme.heading3?.copyWith(fontSize: SizeConfig.getFontSize(22)),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      Divider(
                        thickness: SizeConfig.getSize(1),
                        color: theme.dialogFooterInnerShadow,
                        height: SizeConfig.getHeight(1),
                      ),
                      Expanded(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: SizeConfig.getHeight(85),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text((MessagesProvider.get("Existing Seats")),
                                      style: theme.heading6?.copyWith(fontSize: SizeConfig.getFontSize(16))),
                                  SizedBox(
                                    height: SizeConfig.getHeight(65),
                                    child: Row(
                                      children: [
                                        Container(
                                            height: SizeConfig.getHeight(50),
                                            width: SizeConfig.getWidth(250),
                                            padding: EdgeInsets.only(left: SizeConfig.getWidth(16)),
                                            margin: EdgeInsets.only(top: SizeConfig.getHeight(8)),
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(SizeConfig.getSize(8.0)),
                                                color: theme.cartItemCardBG,
                                                border: Border.all(color: theme.secondaryColor!)),
                                            child: IntrinsicWidth(
                                              child: DropdownButtonHideUnderline(
                                                child: DropdownButton<int?>(
                                                  isExpanded: true,
                                                  value: selectedSeatNumber.value,
                                                  items: widget.seatNames
                                                      ?.map((int seatNumber, String seatName) {
                                                    return MapEntry(
                                                        seatNumber,
                                                        DropdownMenuItem<int>(
                                                          value: seatNumber,
                                                          child: Text(
                                                            seatName,
                                                            style: theme.subtitle2?.copyWith(fontSize: SizeConfig.getFontSize(14)),
                                                            overflow: TextOverflow.ellipsis,
                                                            maxLines: 1,
                                                          ),
                                                        ));
                                                  })
                                                      .values
                                                      .toList(),
                                                  onChanged: (seatNumber) {
                                                    setState(() {
                                                      selectedSeatNumber.value = seatNumber;
                                                      selectedSeatName = '${widget.seatNames![seatNumber]}';
                                                    });
                                                  },
                                                  hint: Text(
                                                    MessagesProvider.get("Select"),
                                                    style: theme.textFieldHintStyle?.copyWith(fontSize: SizeConfig.getFontSize(14)),
                                                  ),
                                                ),
                                              ),
                                            )),
                                        Padding(
                                          padding: EdgeInsets.only(left: SizeConfig.getWidth(15), right: SizeConfig.getWidth(15)),
                                          child: AutoSizeText(
                                            (MessagesProvider.get("OR")),
                                            style: theme.title2?.copyWith(fontSize: SizeConfig.getFontSize(20)),
                                            textAlign: TextAlign.start,
                                          ),
                                        ),
                                        Align(
                                          alignment: Alignment.bottomCenter,
                                          child: PrimaryLargeButton(
                                            onPressed: () async {
                                              loader.showLoaderDialog(
                                                  context,
                                                  MessagesProvider.get("Please wait while we update the seat for the transaction line..."));
                                              final transactionState = context.read<TransactionCubit>();
                                              await transactionState.updateTransactionLinesSeat(
                                                  approverID: widget.approverID,
                                                  widget.transactionLinesIDs,
                                                  'Seat$newAddSeatNumber',
                                                  '$newAddSeatNumber');
                                              if (transactionState.state.isTransactionLinesSeatUpdated == true) {
                                                loader.hideLoaderDialog(context);
                                                widget.onComplete();
                                                Navigator.pop(context);
                                              } else {
                                                loader.hideLoaderDialog(context);
                                              }
                                            },
                                            text: MessagesProvider.get("ADD SEAT"),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      Divider(
                        thickness: SizeConfig.getSize(1),
                        color: theme.dialogFooterInnerShadow,
                        height: SizeConfig.getHeight(1),
                      ),
                      SizedBox(
                        height: SizeConfig.isBigDevice() ? SizeConfig.getHeight(78) : SizeConfig.getHeight(98),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SecondaryLargeButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              text: MessagesProvider.get("CANCEL"),
                            ),
                            SizedBox(width: SizeConfig.getWidth(10)),
                            PrimaryLargeButton(
                              onPressed: () async {
                                if (selectedSeatNumber.value == null) {
                                  widget.onValidation();
                                } else {
                                  loader.showLoaderDialog(
                                      context,
                                      MessagesProvider.get(
                                          "Please wait while we update the seat for the transaction line..."));
                                  final transactionState = context.read<TransactionCubit>();
                                  await transactionState.updateTransactionLinesSeat(
                                      widget.transactionLinesIDs, selectedSeatName ?? '', selectedSeatNumber.value.toString());
                                  if (transactionState.state.isTransactionLinesSeatUpdated == true) {
                                    loader.hideLoaderDialog(context);
                                    widget.onComplete();
                                    Navigator.pop(context);
                                  } else {
                                    loader.hideLoaderDialog(context);
                                  }
                                }
                              },
                              text: MessagesProvider.get("OK"),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
