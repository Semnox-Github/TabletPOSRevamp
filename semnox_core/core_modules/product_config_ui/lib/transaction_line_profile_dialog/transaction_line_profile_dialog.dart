import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:messages_data/builder.dart';
import 'package:notificationbar_ui/NotificationBar.dart';
import 'package:product_config_ui/transaction_line_profile_dialog/transaction_line_profiles_list.dart';
import 'package:product_config_ui/widgets/primaryLargeButton.dart';
import 'package:product_config_ui/widgets/secondaryLargeButton.dart';
import 'package:themes_library/themes_library.dart';
import 'package:transaction_data/builder.dart';
import 'package:transaction_data/models/transaction_profiles/transaction_profile_container_dto.dart';
import 'package:execution_context/builder.dart';
import 'package:login_ui/loader_dialog.dart' as loader;
import 'package:transaction_ui/cubit/transaction_cubit.dart';
import 'package:widgets_library/utils/size_config.dart';

class TransactionProfileLineDialog extends StatefulWidget {
  final Function() onComplete;
  final int selectedProfileID;
  final List<int> transactionLineIds;
  final String remarks;
  final String productName;

  const TransactionProfileLineDialog({
    Key? key,
    required this.onComplete,
    required this.selectedProfileID,
    required this.transactionLineIds,
    required this.remarks,
    required this.productName,
  }) : super(key: key);

  @override
  State<TransactionProfileLineDialog> createState() => _TransactionProfileLineDialogState();
}

class _TransactionProfileLineDialogState extends State<TransactionProfileLineDialog> {
  TransactionProfileContainerDTO? _transactionProfileContainerDto;
  var transactionProfileLineNotifier = ValueNotifier<TransactionProfileContainerDTO?>(null);
  int selectedProfileId = 0;
  List<TransactionProfileContainerDTO> profileContainerDtoList = [];
  NotificationBar? _notificationBar;
  SemnoxTheme? theme;

  @override
  void initState() {
    Future.microtask(() => {_getTransactionLineProfiles()});
    _notificationBar = NotificationBar(showHideSideBar: false);
    selectedProfileId = widget.selectedProfileID;
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _notificationBar = null;
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    theme = Theme.of(context).extension<SemnoxTheme>()!;
    return WillPopScope(
      onWillPop: () async => false,
      child: Material(
        color: theme?.transparentColor,
        child: Stack(
          children: [
            Scaffold(
              backgroundColor: theme?.transparentColor,
              resizeToAvoidBottomInset: false,
              bottomNavigationBar: Container(
                child: _notificationBar,
              ),
              body: Dialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(SizeConfig.getSize(8.0)),
                ),
                child: SizedBox(
                  height: SizeConfig.getHeight(342),
                  width: SizeConfig.getWidth(572),
                  child: Column(
                    children: [
                      SizedBox(
                        height: SizeConfig.getHeight(98),
                        child: Center(
                          child: Text(
                            MessagesProvider.get("Transaction Profile for ${widget.productName.toUpperCase()}"),
                            style: theme?.heading3?.copyWith(fontSize: SizeConfig.getFontSize(22)),
                            textAlign: TextAlign.center,
                            maxLines: 2,
                          ),
                        ),
                      ),
                      Divider(
                        thickness: SizeConfig.getSize(1),
                        color: theme?.dialogFooterInnerShadow,
                        height: SizeConfig.getHeight(1),
                      ),
                      Expanded(
                        child: Center(
                          child: ValueListenableBuilder(
                            valueListenable: transactionProfileLineNotifier,
                            builder: (context, value, _) {
                              if (_transactionProfileContainerDto != null) {
                                return TransactionLineProfilesList(
                                  transactionProfileId: widget.selectedProfileID,
                                  onProfileIdSelected: (int profileId) {
                                    setState(() {
                                      selectedProfileId = profileId;
                                    });
                                  },
                                  transactionProfileContainerDtoList: profileContainerDtoList,
                                );
                              } else {
                                return const Center(
                                  child: CircularProgressIndicator(
                                    color: Colors.black45,
                                  ),
                                );
                              }
                            },
                          ),
                        ),
                      ),
                      Divider(
                        thickness: SizeConfig.getSize(1),
                        color: theme?.dialogFooterInnerShadow,
                        height: SizeConfig.getHeight(1),
                      ),
                      SizedBox(
                        height: SizeConfig.getHeight(98),
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
                                if (widget.selectedProfileID == selectedProfileId) {
                                  _notificationBar?.showMessage(
                                      MessagesProvider.get("The selected profile is already applied to the line."),
                                      theme!.footerBG5!);
                                } else {
                                  loader.showLoaderDialog(
                                      context, MessagesProvider.get("Updating Transaction Line(s) Profile..."));
                                  final transactionCubit = context.read<TransactionCubit>();
                                  await transactionCubit.addProfileToTransactionLinesGroup(
                                      selectedProfileId, widget.transactionLineIds, widget.remarks);
                                  if (transactionCubit.state.isProfileUpdatedToTransactionLine == true &&
                                      transactionCubit.state.updateTransactionLineProfileError == null) {
                                    loader.hideLoaderDialog(context);
                                    Navigator.pop(context);
                                    widget.onComplete();
                                  } else if (transactionCubit.state.isProfileUpdatedToTransactionLine == false &&
                                      transactionCubit.state.updateTransactionLineProfileError != null) {
                                    loader.hideLoaderDialog(context);
                                    _notificationBar?.showMessage(
                                        transactionCubit.state.updateTransactionLineProfileError.toString(),
                                        theme!.footerBG3!);
                                    transactionCubit.clearTransactionProfileStates();
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
            )
          ],
        ),
      ),
    );
  }

  Future<void> _getTransactionLineProfiles() async {
    try {
      var execContextBL = await ExecutionContextBuilder.build();
      var sysExecContext = execContextBL.getExecutionContext();
      var transactionDataBl = await TransactionDataBuilder.build(sysExecContext!);
      List<TransactionProfileContainerDTO> transactionProfiles = await transactionDataBl.getTransactionProfiles();
      if (transactionProfiles.isNotEmpty) {
        setState(() {
          profileContainerDtoList = transactionProfiles;
          _transactionProfileContainerDto = profileContainerDtoList.first;
          transactionProfileLineNotifier.value = _transactionProfileContainerDto;
        });
      } else {
        _notificationBar?.showMessage(MessagesProvider.get("No Profiles found."), theme!.footerBG3!);
      }
    } on DioError catch (error) {
      _notificationBar?.showMessage(error.message, theme!.footerBG3!);
    } catch (error) {
      _notificationBar?.showMessage(error.toString(), theme!.footerBG3!);
    }
  }
}
