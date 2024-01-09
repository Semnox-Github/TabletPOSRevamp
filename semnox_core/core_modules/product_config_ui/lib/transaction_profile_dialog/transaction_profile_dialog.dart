import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:messages_data/builder.dart';
import 'package:notificationbar_ui/NotificationBar.dart';
import 'package:product_config_ui/transaction_profile_dialog/transaction_profile_names_list.dart';
import 'package:themes_library/themes_library.dart';
import 'package:transaction_data/builder.dart';
import 'package:transaction_data/models/create_transaction/transaction_response.dart';
import 'package:transaction_data/models/transaction_profiles/transaction_profile_container_dto.dart';
import 'package:transaction_data/transaction_data_bl.dart';
import 'package:transaction_ui/cubit/transaction_cubit.dart';
import 'package:widgets_library/utils/size_config.dart';
import 'package:execution_context/builder.dart';
import 'package:login_ui/loader_dialog.dart' as loader;
import 'package:logs_data/logger.dart';
import '../add_remark_dialog.dart';
import '../widgets/primaryLargeButton.dart';
import '../widgets/secondaryLargeButton.dart';

class TransactionProfileDialog extends StatefulWidget {
  final Function() onComplete;
  final int selectedProfileID;
  final int? approverID;
  final Function(int? profileID)? onRemarksEnable;

  const TransactionProfileDialog({
    Key? key,
    required this.onComplete,
    required this.selectedProfileID,
    this.approverID,
    this.onRemarksEnable
  }) : super(key: key);

  @override
  State<TransactionProfileDialog> createState() => _TransactionProfileDialogState();
}

class _TransactionProfileDialogState extends State<TransactionProfileDialog> {
  List<TransactionProfileContainerDTO>? _transactionProfileResponse;
  var transactionProfileNotifier = ValueNotifier<List<TransactionProfileContainerDTO>?>(null);
  int _selectedProfileId = 0;
  bool _remarksMandatory = false;
  late TransactionDataBLContract _transactionDataBLContract;
  NotificationBar? _notificationBar;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  SemnoxTheme? theme;

  @override
  void initState() {
    Future.microtask(() => {_getTransactionProfiles()});
    _selectedProfileId = widget.selectedProfileID;
    _notificationBar = NotificationBar(showHideSideBar: false);
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
              key: _scaffoldKey,
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
                              MessagesProvider.get("TRANSACTION PROFILE"),
                              style: theme?.heading3?.copyWith(fontSize: SizeConfig.getFontSize(22)),
                              textAlign: TextAlign.center),
                        ),
                      ),
                      Divider(
                        thickness: SizeConfig.getSize(1),
                        color: theme?.dialogFooterInnerShadow,
                        height: SizeConfig.getHeight(1),
                      ),
                      Expanded(
                        child: ValueListenableBuilder(
                          valueListenable: transactionProfileNotifier,
                          builder: (context, value, _) {
                            if (_transactionProfileResponse != null) {
                              return TransactionProfileNamesList(
                                transactionProfiles: _transactionProfileResponse,
                                transactionProfileId:  widget.selectedProfileID,
                                onProfileIdSelected: (int profileId, bool? remarksMandatory) {
                                  setState(() {
                                    _selectedProfileId = profileId;
                                    _remarksMandatory = remarksMandatory ?? false;
                                    Log.v("_selectedProfileName:$_selectedProfileId ");
                                  });
                                },
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
                                if(widget.selectedProfileID == _selectedProfileId) {
                                  _notificationBar?.showMessage(
                                      MessagesProvider.get("The selected profile is already applied to the line."),
                                      theme!.footerBG5!);
                                }
                                else if(_remarksMandatory){
                                  Navigator.pop(context);
                                  widget.onRemarksEnable!(_selectedProfileId);
                                }
                                else {
                                  loader.showLoaderDialog(context, MessagesProvider.get("Updating Transaction Profile..."));
                                  final transactionCubit = context.read<TransactionCubit>();
                                  await transactionCubit.updateTransactionProfile(_selectedProfileId,approverID:widget.approverID);
                                  if (transactionCubit.state.updatedTransactionProfile == true &&
                                      transactionCubit.state.updateTransactionProfileError == null) {
                                    loader.hideLoaderDialog(context);
                                    Navigator.pop(context);
                                    transactionCubit.clearTransactionProfileStates();
                                    widget.onComplete();
                                  } else if(transactionCubit.state.updatedTransactionProfile == false &&
                                      transactionCubit.state.updateTransactionProfileError != null) {
                                    loader.hideLoaderDialog(context);
                                    _notificationBar?.showMessage(
                                        transactionCubit.state.updateTransactionProfileError.toString(),
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

  Future<void> _getTransactionProfiles() async {
    try {
      var executionContextBL = await ExecutionContextBuilder.build();
      var executionContext = executionContextBL.getExecutionContext();
      _transactionDataBLContract = await TransactionDataBuilder.build(executionContext!);
      List<TransactionProfileContainerDTO> transactionProfiles = await _transactionDataBLContract.getTransactionProfiles();
      if(transactionProfiles.isNotEmpty) {
        _transactionProfileResponse = transactionProfiles;
        Log.v('$transactionProfiles');
        transactionProfileNotifier.value = _transactionProfileResponse;
      } else {
        _notificationBar?.showMessage(MessagesProvider.get("No Profiles found."), theme!.footerBG3!);
      }
    } on DioError catch (error) {
      _notificationBar?.showMessage(error.message, theme!.footerBG3!);
    } catch (error) {
      _notificationBar?.showMessage(error.toString(), theme!.footerBG3!);
    }
  }

  void _showRemarks() {
    final transactionCubit = context.read<TransactionCubit>();
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AddRemarkDialog(
            remarks: transactionCubit.state.transactionData?.remarks ?? '',
            onConfirm: (String? value) async {
              loader.showLoaderDialog(context, MessagesProvider.get("Updating Transaction Profile..."));
              try{
                var execContextBL = await ExecutionContextBuilder.build();
                var sysExecContext = execContextBL.getExecutionContext();
                var _transactionDataBl = await TransactionDataBuilder.build(sysExecContext!);
                TransactionResponse? transactionResponse = await _transactionDataBl.updateTransactionIdentifiers(remarks: value ?? '');

                if(transactionResponse.exception == null){
                  Log.v('transaRemark ');
                  await transactionCubit.updateTransactionProfile(_selectedProfileId,approverID:widget.approverID);
                  if (transactionCubit.state.updatedTransactionProfile == true &&
                      transactionCubit.state.updateTransactionProfileError == null) {
                    loader.hideLoaderDialog(context);
                    //Navigator.pop(context);
                    transactionCubit.clearTransactionProfileStates();
                    widget.onComplete();
                  } else if(transactionCubit.state.updatedTransactionProfile == false &&
                      transactionCubit.state.updateTransactionProfileError != null) {
                    loader.hideLoaderDialog(context);
                    _notificationBar?.showMessage(
                        transactionCubit.state.updateTransactionProfileError.toString(),
                        theme!.footerBG3!);
                    transactionCubit.clearTransactionProfileStates();
                  }
                }
              }
              on DioError catch(error) {
                var errorString = error.response?.data['data'] as String?;
                _notificationBar?.showMessage(errorString ?? '', theme!.footerBG3!);
              }
            },
          );
        });
  }
}

