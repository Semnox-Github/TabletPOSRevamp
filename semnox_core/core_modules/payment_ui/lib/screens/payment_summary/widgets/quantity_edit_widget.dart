import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment_ui/cubits/payment_summary/cash_screen/cash_screen_cubit.dart';
import 'package:payment_ui/cubits/payment_summary/cash_screen/cash_screen_state.dart';
import 'package:payment_ui/utils/colors.dart';
import 'package:payment_ui/utils/extensions.dart';
import 'package:themes_library/themes_library.dart';
import 'package:widgets_library/utils/size_config.dart';
import 'package:payment_ui/utils/styles.dart';
import 'dart:ui';


class QuantityEditWidget extends StatefulWidget {
  final double totalAmt;
  final String tenderedAmt;
  final VoidCallback onOkClicked;

  const QuantityEditWidget({
    Key? key,
    required this.totalAmt,
    required this.tenderedAmt,
    required this.onOkClicked
  }) : super(key: key);

  @override
  State<QuantityEditWidget> createState() => _QuantityEditWidgetState();
}

class _QuantityEditWidgetState extends State<QuantityEditWidget> {

  final _numberController = TextEditingController();
  bool _isFirstClickDone = false;

  @override
  void initState() {
    _initTenderAmount();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<SemnoxTheme>()!;
    return Container(
      height: SizeConfig.isBigDevice() ?  SizeConfig.getHeight(340) : SizeConfig.getHeight(384),
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
          Container(
            margin: EdgeInsets.symmetric(horizontal: SizeConfig.getWidth(8), vertical: SizeConfig.getHeight(10)),
            padding: EdgeInsets.symmetric(vertical: SizeConfig.getHeight(12), horizontal: SizeConfig.getWidth(16)),
            decoration: BoxDecoration(
              color: colorWhite,
              border: Border.all(color: theme.secondaryColor ?? colorBlack),
              borderRadius: BorderRadius.circular(8)
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                BlocBuilder<CashScreenCubit, CashScreenState>(
                    builder: (ctx, state) {
                      _updateQtyText();
                      return  Expanded(
                        child: Container(
                            height: SizeConfig.getHeight(30),
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(6)),
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
                      );
                    })
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
    _numberController.text = widget.totalAmt.formatToDC.toString();
    context.read<CashScreenCubit>().updateTenderAmt(widget.totalAmt.toString());
  }

  void _updateQtyText() {
    final amt = context.read<CashScreenCubit>().state.tenderedAmount;
    if(amt == '0') {
      _numberController.text = '';
    } else {
      _numberController.text = amt;
    }
  }

  void _clearDenominations() {
    final provider = context.read<CashScreenCubit>();
    provider.updateHundredDenominationCount(0);
    provider.updateFiftyDenominationCount(0);
    provider.updateTwentyDenominationCount(0);
    provider.updateTenDenominationCount(0);
    provider.updateFiveDenominationCount(0);
    provider.updateOneDenominationCount(0);
  }

  Widget numbersButton({title}) {
    final theme = Theme.of(context).extension<SemnoxTheme>()!;
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(right: 3.0, left: 3),
        child: ConstrainedBox(
          constraints: BoxConstraints.tightFor(width: SizeConfig.getSize(60), height: SizeConfig.getSize(60)),
          child: ElevatedButton(
              onPressed: () {

                if(!_isFirstClickDone) {
                  _isFirstClickDone = true;
                  _numberController.clear();
                }

                if (title == 'C') {
                  _numberController.clear();
                  context.read<CashScreenCubit>().updateTenderAmt('0');
                } else if (title == 'arrow') {
                  if (_numberController.text.isNotEmpty) {
                    _numberController.text = _numberController.text
                        .substring(0, _numberController.text.length - 1);
                    final amt = _numberController.text;
                    if(amt.isNotEmpty) {
                      context.read<CashScreenCubit>().updateTenderAmt(amt);
                    }
                  } else {
                    context.read<CashScreenCubit>().updateTenderAmt('0');
                  }
                } else if (title == '.') {
                  if(!_hasDecimalPoint()) {
                    _numberController.text = _numberController.text + title;
                    context.read<CashScreenCubit>().updateTenderAmt(_numberController.text);
                  }
                } else {
                  if(_numberController.text.length + 1 > 6) {
                    return;
                  }
                  _numberController.text = _numberController.text + title;
                  final amt = _numberController.text;
                  if(amt.isNotEmpty) {
                    context.read<CashScreenCubit>().updateTenderAmt(amt);
                  } else {
                    context.read<CashScreenCubit>().updateTenderAmt('0');
                  }
                }
                _clearDenominations();
              },
              style: ElevatedButton.styleFrom(
                maximumSize: Size(SizeConfig.getSize(60), SizeConfig.getSize(60)),
                minimumSize: Size(SizeConfig.getSize(60), SizeConfig.getSize(60)),
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
                style: theme.headingLight5?.copyWith(fontSize: SizeConfig.getFontSize(24), fontWeight:  FontWeight.w500, color: Colors.white) ?? tsS20W50016,
              )),
        ),
      ),
    );
  }


  Widget backButton({title}) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(right: 3.0, left: 3),
        child: ConstrainedBox(
          constraints: BoxConstraints.tightFor(width: SizeConfig.getSize(60), height: SizeConfig.getSize(60)),
          child: InkWell(
              onTap: () {

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
                      context.read<CashScreenCubit>().updateTenderAmt(amt);
                    }
                  } else {
                    context.read<CashScreenCubit>().updateTenderAmt('0');
                  }
                }
                _clearDenominations();
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
        constraints: BoxConstraints.tightFor(width: SizeConfig.getSize(120), height: SizeConfig.getSize(60)),
        child: ElevatedButton(
            onPressed: () {
              widget.onOkClicked();
            },
            style: ElevatedButton.styleFrom(
              maximumSize: Size(SizeConfig.getSize(120), SizeConfig.getSize(60)),
              minimumSize: Size(SizeConfig.getSize(120), SizeConfig.getSize(60)),
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
        constraints: BoxConstraints.tightFor(width: SizeConfig.getSize(120), height: SizeConfig.getSize(60)),
        child: ElevatedButton(
            onPressed: () {
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
                context.read<CashScreenCubit>().updateTenderAmt(amt);
              }
              _clearDenominations();
            },
            style: ElevatedButton.styleFrom(
              maximumSize: Size(SizeConfig.getSize(120), SizeConfig.getSize(60)),
              minimumSize: Size(SizeConfig.getSize(120), SizeConfig.getSize(60)),
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
}

