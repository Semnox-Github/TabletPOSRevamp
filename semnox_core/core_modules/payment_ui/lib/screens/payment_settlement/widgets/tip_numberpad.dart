import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment_ui/cubits/payment_settlement/tip_split/tip_split_cubit.dart';
import 'package:payment_ui/cubits/payment_summary/cash_screen/cash_screen_cubit.dart';
import 'package:payment_ui/cubits/payment_summary/cash_screen/cash_screen_state.dart';
import 'package:payment_ui/utils/colors.dart';
import 'package:payment_ui/utils/extensions.dart';
import 'package:themes_library/themes_library.dart';
import 'package:widgets_library/utils/size_config.dart';
import 'package:payment_ui/utils/styles.dart';
import 'dart:ui';
import 'package:async/async.dart';


class TipNumberPadWidget extends StatefulWidget {
  final double initialAmt;
  final VoidCallback onOkClicked;

  const TipNumberPadWidget({
    Key? key,
    required this.initialAmt,
    required this.onOkClicked
  }) : super(key: key);

  @override
  State<TipNumberPadWidget> createState() => _TipNumberPadWidgetState();
}

class _TipNumberPadWidgetState extends State<TipNumberPadWidget> {

  final _numberController = TextEditingController();
  bool _isFirstClickDone = false;
  CancelableOperation? _cancellableOperation;

  @override
  void initState() {
    _initTenderAmount();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<SemnoxTheme>()!;
    return Container(
      height: SizeConfig.isBigDevice() ?  SizeConfig.getHeight(315) : SizeConfig.getHeight(370),
      width: SizeConfig.getWidth(308),
      decoration: BoxDecoration(
          color: theme.darkTextColor ?? colorBlack,
          borderRadius: BorderRadius.circular(8)
      ),
      padding: EdgeInsets.symmetric(vertical: SizeConfig.getHeight(6), horizontal: SizeConfig.getWidth(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 2.0),
              child: Text(
                'Tip Amount',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: theme.headingLight5?.copyWith(fontSize: SizeConfig.getFontSize(18), fontWeight: FontWeight.w500) ?? tsS14W50016,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: SizeConfig.getWidth(8), vertical: SizeConfig.getHeight(10)),
            padding: EdgeInsets.symmetric(vertical: SizeConfig.getHeight(12), horizontal: SizeConfig.getWidth(16)),
            decoration: BoxDecoration(
                color: colorWhite,
                borderRadius: BorderRadius.circular(8)
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Expanded(
                  child: Container(
                      height: SizeConfig.getHeight(30),
                      decoration: const BoxDecoration(
                        borderRadius:
                        BorderRadius.all(Radius.circular(6)),
                        color: Colors.white,
                      ),
                      child: Center(
                        child: TextFormField(
                          inputFormatters: [
                            FilteringTextInputFormatter
                                .digitsOnly,
                          ],
                          readOnly: true,
                          style: theme.heading5?.copyWith(fontSize: SizeConfig.getFontSize(26), color: Colors.black) ?? tsS22W70016,
                          textAlign: TextAlign.right,
                          controller: _numberController,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            contentPadding: EdgeInsets.only(top: 0, bottom: 13)
                          ),
                        ),
                      )),
                )
              ],
            ),
          ),
          SizedBox(height: SizeConfig.getSize(8)),
          IntrinsicHeight(
            child: Row(
              mainAxisAlignment:
              MainAxisAlignment.spaceBetween,
              children: [
                numbersButton(title: "1"),
                numbersButton(title: "2"),
                numbersButton(title: "3"),
                numbersButton(title: "C")
              ],
            ),
          ),
          SizedBox(height: SizeConfig.isBigDevice() ? SizeConfig.getHeight(9) : SizeConfig.getHeight(8)),
          IntrinsicHeight(
            child: Row(
              mainAxisAlignment:
              MainAxisAlignment.spaceBetween,
              children: [
                numbersButton(title: "4"),
                numbersButton(title: "5"),
                numbersButton(title: "6"),
                backButton(title: "arrow")
              ],
            ),
          ),
          SizedBox(height: SizeConfig.isBigDevice() ? SizeConfig.getHeight(9) : SizeConfig.getHeight(8)),
          IntrinsicHeight(
            child: Row(
              mainAxisAlignment:
              MainAxisAlignment.spaceBetween,
              children: [
                numbersButton(title: "7"),
                numbersButton(title: "8"),
                numbersButton(title: "9"),
                numbersButton(title: ".")
              ],
            ),
          ),
          SizedBox(height: SizeConfig.isBigDevice() ? SizeConfig.getHeight(9) : SizeConfig.getHeight(8)),
          IntrinsicHeight(
            child: Row(
              mainAxisAlignment:
              MainAxisAlignment.spaceBetween,
              children: [
                zeroButton(title: "0"),
                const SizedBox(width: 6,),
                okButton(title: "OK"),
              ],
            ),
          )
        ],
      ),
    );
  }

  bool _hasDecimalPoint() {
    final input = _numberController.text;
    return input.contains('.');
  }

  void _initTenderAmount() {
    _numberController.text = widget.initialAmt.formatToDC();
  }

  Widget numbersButton({title}) {
    final theme = Theme.of(context).extension<SemnoxTheme>()!;
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(right: 3.0, left: 3),
        child: ConstrainedBox(
          constraints: BoxConstraints.tightFor(width: SizeConfig.getSize(50), height: SizeConfig.getSize(50)),
          child: ElevatedButton(
              onPressed: () {
                _cancellableOperation?.cancel();

                if(!_isFirstClickDone) {
                  _isFirstClickDone = true;
                  _numberController.clear();
                }

                if (title == 'C') {
                  _numberController.clear();
                  _startCalculation();
                } else if (title == 'arrow') {
                  if (_numberController.text.isNotEmpty) {
                    _numberController.text = _numberController.text
                        .substring(0, _numberController.text.length - 1);
                    _startCalculation();
                  }
                } else if (title == '.') {
                  if(!_hasDecimalPoint()) {
                    _numberController.text = _numberController.text + title;
                  }
                } else {
                  if(_numberController.text.length + 1 > 6) {
                    return;
                  }
                  _numberController.text = _numberController.text + title;
                  final amt = _numberController.text;
                  if(amt.isNotEmpty) {
                    _startCalculation();
                  }
                }
              },
              style: ElevatedButton.styleFrom(
                maximumSize: Size(SizeConfig.getSize(50), SizeConfig.getSize(50)),
                minimumSize: Size(SizeConfig.getSize(50), SizeConfig.getSize(50)),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6), // <-- Radius
                ),
                backgroundColor: theme.sideNavListBGSelectedState ?? colorBlack3D,
              ),
              child: title == 'arrow'
                  ? Image.asset(
                'assets/ic_back_arrow_white.png',
                height: SizeConfig.getSize(20),
                width: SizeConfig.getSize(20),
              )
                  : Text(
                '$title',
                style: theme.headingLight5?.copyWith(fontSize: SizeConfig.getFontSize(24), fontWeight: FontWeight.w500, color: Colors.white) ?? tsS20W50016,
              )),
        ),
      ),
    );
  }


  Widget backButton({title}) {
    final theme = Theme.of(context).extension<SemnoxTheme>()!;
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(right: 3.0, left: 3),
        child: ConstrainedBox(
          constraints: BoxConstraints.tightFor(width: SizeConfig.getSize(50), height: SizeConfig.getSize(50)),
          child: InkWell(
              onTap: () {
                _cancellableOperation?.cancel();

                if(!_isFirstClickDone) {
                  _isFirstClickDone = true;
                  _numberController.clear();
                }

                if (title == 'arrow') {
                  if (_numberController.text.isNotEmpty) {
                    _numberController.text = _numberController.text
                        .substring(0, _numberController.text.length - 1);
                    final amt = _numberController.text;
                    if(amt.isNotEmpty) {
                      _startCalculation();
                    }
                  }
                }
              },

              child: title == 'arrow'
                  ? Image.asset(
                'assets/ic_back_arrow_white.png',
                height: SizeConfig.getSize(20),
                width: SizeConfig.getSize(20),
              )
                  : Text(
                '$title',
                style: tsS20W50016.copyWith(color: Colors.white, fontSize: SizeConfig.getFontSize(24)),
              )),
        ),
      ),
    );
  }

  Widget okButton({title}) {
    final theme = Theme.of(context).extension<SemnoxTheme>()!;
    return Expanded(
      child: ConstrainedBox(
        constraints: BoxConstraints.tightFor(width: SizeConfig.getSize(100), height: SizeConfig.getSize(50)),
        child: ElevatedButton(
            onPressed: () {
              widget.onOkClicked();
            },
            style: ElevatedButton.styleFrom(
              maximumSize: Size(SizeConfig.getSize(100), SizeConfig.getSize(50)),
              minimumSize: Size(SizeConfig.getSize(100), SizeConfig.getSize(50)),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6), // <-- Radius
              ),
              backgroundColor: theme.sideNavListBGSelectedState ?? colorBlack3D,
            ),
            child: Text(
              '$title',
              style: theme.headingLight5?.copyWith(fontSize: SizeConfig.getFontSize(24), fontWeight: FontWeight.w500, color: Colors.white) ?? tsS20W50016,
            )),
      ),
    );
  }

  Widget zeroButton({title}) {
    final theme = Theme.of(context).extension<SemnoxTheme>()!;
    return Expanded(
      child: ConstrainedBox(
        constraints: BoxConstraints.tightFor(width: SizeConfig.getSize(100), height: SizeConfig.getSize(50)),
        child: ElevatedButton(
            onPressed: () {
              _cancellableOperation?.cancel();

              if(!_isFirstClickDone) {
                _isFirstClickDone = true;
                _numberController.clear();
              }

              if(_numberController.text.length + 1 > 6) {
                return;
              }
              _numberController.text = _numberController.text + title;

              final amt = _numberController.text;
              if(amt.isNotEmpty) {
                _startCalculation();
              }
            },
            style: ElevatedButton.styleFrom(
              maximumSize: Size(SizeConfig.getSize(100), SizeConfig.getSize(50)),
              minimumSize: Size(SizeConfig.getSize(100), SizeConfig.getSize(50)),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6), // <-- Radius
              ),
              backgroundColor: theme.sideNavListBGSelectedState ?? colorBlack3D,
            ),
            child: Text(
              '$title',
              style: theme.headingLight5?.copyWith(fontSize: SizeConfig.getFontSize(24), color: Colors.white) ?? tsS20W50016,
            )),
      ),
    );
  }

  Future<void> _startCalculation() async {
    _cancellableOperation = CancelableOperation.fromFuture(
      _calculateTipAmount(),
      onCancel: () => '',
    );
    await _cancellableOperation?.value;
  }

  Future<void> _calculateTipAmount() async {
    await Future.delayed(const Duration(milliseconds: 100));
    var amt = 0.0;
    if(_numberController.text.isNotEmpty) {
      amt = double.parse(_numberController.text);
    }
    if(mounted) {
      final tipSplitCubit = context.read<TipSplitCubit>();
      tipSplitCubit.updateTipAmount(amt);
    }
  }
}

