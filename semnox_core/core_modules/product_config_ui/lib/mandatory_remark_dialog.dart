import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:messages_data/builder.dart';
import 'package:notificationbar_ui/NotificationBar.dart';
import 'package:product_config_ui/widgets/primaryLargeButton.dart';
import 'package:product_config_ui/widgets/secondaryLargeButton.dart';
import 'package:themes_library/themes_library.dart';
import 'package:transaction_ui/cubit/transaction_cubit.dart';
import 'package:transaction_ui/cubit/transaction_cubit_state.dart';
import 'package:login_ui/loader_dialog.dart' as loader;
import 'package:widgets_library/utils/size_config.dart';

class MandatoryRemarkDialog extends StatefulWidget {
  final int productId;
  final int quantity;
  final bool isCardProduct;
  final Function() onComplete;
  final Function() onCancel;
  final Function(String remarks) onRemarksInput;

  const MandatoryRemarkDialog(
      {Key? key,
      required this.productId,
      required this.quantity,
      required this.isCardProduct,
      required this.onComplete,
      required this.onCancel,
      required this.onRemarksInput})
      : super(key: key);

  @override
  State<MandatoryRemarkDialog> createState() => _MandatoryRemarkDialogState();
}

class _MandatoryRemarkDialogState extends State<MandatoryRemarkDialog> {
  final _remarkTextEditingController = TextEditingController();
  bool _validate = false;
  final _scrollController = ScrollController();
  late SemnoxTheme _theme;
  NotificationBar? _notificationBar;

  @override
  void initState() {
    super.initState();
    _notificationBar = NotificationBar(showHideSideBar: false);
  }

  @override
  Widget build(BuildContext context) {
    _theme = Theme.of(context).extension<SemnoxTheme>()!;
    SizeConfig.init(context);
    return WillPopScope(
      onWillPop: () async => false,
      child: Material(
        color: _theme.transparentColor,
        child: Stack(
          children: [
            Scaffold(
              backgroundColor: _theme.transparentColor,
              resizeToAvoidBottomInset: false,
              bottomNavigationBar: Container(
                child: _notificationBar,
              ),
              body: Dialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(SizeConfig.getSize(8)),
                ),
                child: SizedBox(
                  width: SizeConfig.isBigDevice() ? SizeConfig.getHeight(420) : SizeConfig.getWidth(400),
                  height: SizeConfig.isBigDevice() ? SizeConfig.getHeight(240) : SizeConfig.getHeight(320),
                  child: RawScrollbar(
                    radius: Radius.circular(SizeConfig.getSize(2)),
                    thumbVisibility: true,
                    mainAxisMargin: SizeConfig.getSize(3),
                    crossAxisMargin: SizeConfig.getSize(3),
                    trackVisibility: true,
                    trackBorderColor: _theme.scrollBarHandle,
                    trackColor: _theme.scrollArea,
                    thumbColor: _theme.scrollBarHandle,
                    thickness: SizeConfig.getWidth(7),
                    controller: _scrollController,
                    child: CustomScrollView(controller: _scrollController, slivers: [
                      SliverFillRemaining(
                        hasScrollBody: false,
                        child: Column(
                          children: [
                            SizedBox(
                              height: SizeConfig.isBigDevice() ? SizeConfig.getHeight(60) : SizeConfig.getHeight(90),
                              child: Center(
                                child: Text(
                                    MessagesProvider.get("REMARKS"),
                                    style: _theme.heading2!.copyWith(fontSize:SizeConfig.getFontSize(26)),
                                    textAlign: TextAlign.center,
                                  ),
                              ),
                            ),
                            Divider(
                              thickness: SizeConfig.getSize(1),
                              color: _theme.dialogFooterInnerShadow,
                              height: SizeConfig.getHeight(1),
                            ),
                            Expanded(
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      left: SizeConfig.getHeight(24.0),
                                      right: SizeConfig.getHeight(24.0),
                                      top: SizeConfig.getWidth(15.0),
                                      bottom: SizeConfig.getWidth(15.0)),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        MessagesProvider.get("* Remarks"),
                                        style:  _theme.subtitle1!.copyWith(fontSize: SizeConfig.getFontSize(20)),
                                        textAlign: TextAlign.start,
                                      ),
                                      SizedBox(
                                        height: SizeConfig.getHeight(10),
                                      ),
                                      SizedBox(
                                        height:SizeConfig.getSize(52),
                                        child: TextFormField(
                                            inputFormatters: [
                                              LengthLimitingTextInputFormatter(40)
                                            ],
                                            controller: _remarkTextEditingController,
                                            style: _theme.subtitle3?.copyWith(fontSize: SizeConfig.getFontSize(18)),
                                            decoration: InputDecoration(
                                              fillColor: _theme.primaryColor,
                                              filled: true,
                                              contentPadding:  EdgeInsets.only(top: SizeConfig.getSize(10), bottom: SizeConfig.getSize(10), right: SizeConfig.getSize(10), left: SizeConfig.getSize(10)),
                                              focusedBorder: OutlineInputBorder(
                                                  borderRadius: BorderRadius.circular(SizeConfig.getSize(8)),
                                                  borderSide:  BorderSide(
                                                    width: SizeConfig.getSize(1),
                                                    color: _theme.secondaryColor!,
                                                  )),
                                              border:  OutlineInputBorder(
                                                  borderRadius: BorderRadius.circular(SizeConfig.getSize(8)),
                                                  borderSide:  BorderSide(
                                                    width: SizeConfig.getSize(1),
                                                    color: _theme.secondaryColor!,
                                                  )),
                                            )
                                        ),
                                      )
                                    ],
                                  ),
                                )),
                            Divider(
                              thickness: SizeConfig.getSize(1),
                              color: _theme.dialogFooterInnerShadow,
                              height: SizeConfig.getHeight(1),
                            ),
                            SizedBox(
                              height: SizeConfig.isBigDevice() ? SizeConfig.getHeight(75) : SizeConfig.getHeight(90),
                              child: Row(
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
                                    text: MessagesProvider.get("OK").toUpperCase(),
                                    onPressed: () async {
                                      if (_remarkTextEditingController.text.isNotEmpty) {
                                        if (widget.isCardProduct) {
                                          Navigator.pop(context);
                                          widget.onRemarksInput(_remarkTextEditingController.text);
                                        } else {
                                          _notificationBar?.showMessage(
                                              MessagesProvider.get("Please enter the remarks"),
                                              _theme.footerBG5!);
                                          loader.showLoaderDialog(context,
                                              MessagesProvider.get("Adding product to the transaction..."));
                                          final transactionState = context.read<TransactionCubit>();
                                          await transactionState.addMandatoryProductToTransaction(
                                              widget.productId,
                                              widget.quantity,
                                              _remarkTextEditingController.text);
                                          if (transactionState.state.isRemarksMandatoryProductAdded == true) {
                                            loader.hideLoaderDialog(context);
                                            Navigator.pop(context);
                                            widget.onComplete();
                                          } else {
                                            loader.hideLoaderDialog(context);
                                          }
                                        }
                                      } else {
                                        _notificationBar?.showMessage(
                                            MessagesProvider.get("Please enter the remarks"),
                                            _theme.footerBG5!);
                                      }
                                    },
                                  ),
                                ],
                              ),
                            ),
                            BlocBuilder<TransactionCubit, TransactionCubitState>(
                                builder: (context, transactionState) {
                                  if (transactionState.remarksMandatoryProductErrorString?.isNotEmpty ==
                                      true) {
                                    setValidateText(true);
                                  }
                                  return const SizedBox();
                                }),
                          ],
                        ),
                      )
                    ]),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _notificationBar = null;
    _remarkTextEditingController.dispose();
  }

  setValidateText(bool isValidate) {
    setState(() {
      _validate = isValidate;
    });
  }
}
