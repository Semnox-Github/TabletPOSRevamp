import 'package:execution_context/builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:master_data/builder.dart';
import 'package:master_data/models/lookup_container/lookup_values_container_dto.dart';
import 'package:messages_data/builder.dart';
import 'package:notificationbar_ui/NotificationBar.dart';
import 'package:product_config_ui/utils/constants.dart';
import 'package:product_config_ui/widgets/primaryLargeButton.dart';
import 'package:product_config_ui/widgets/secondaryLargeButton.dart';
import 'package:themes_library/themes_library.dart';
import 'package:transaction_ui/cubit/transaction_cubit.dart';
import 'package:transaction_ui/cubit/transaction_cubit_state.dart';
import 'package:login_ui/loader_dialog.dart' as loader;
import 'package:logs_data/logger.dart';
import 'package:widgets_library/error_alert_dialog.dart';
import 'package:widgets_library/utils/size_config.dart';

class CancelLineAlertDialog extends StatefulWidget {
  const CancelLineAlertDialog({Key? key,required this.productName, required this.transactionLineIds,required this.showNotification,required  this.onCancel, this.approverID,required this.notificationBar})
      : super(key: key);

  final List<int> transactionLineIds;
  final String?productName;
  final Function(String value) showNotification;
  final Function(String value) onCancel;
  final int? approverID;
  final NotificationBar? notificationBar;


  @override
  State<CancelLineAlertDialog> createState() => _CancelLineAlertDialogState();
}

class _CancelLineAlertDialogState extends State<CancelLineAlertDialog> {
  String? _reasonDropDown;
  TextEditingController _remarksTextController = TextEditingController();
  bool _isLoading = false;
  List<LookupValuesContainerDTO>? _listValues = [];
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  Size? _screenSize;
  double _screenHeight = 0.0;
  double _screenWidth = 0.0;
  List<LookupValuesContainerDTO> _filtered = [];
  final _scrollController = ScrollController();
  late SemnoxTheme _theme;


  @override
  void initState() {
    _initUpdateTransUpdateEnums();
    Future.microtask(() => initDropDownList());
    super.initState();
  }
  _initUpdateTransUpdateEnums(){
    final transactionState = context.read<TransactionCubit>();
    transactionState.initUpdateTransactionOrderDetailsSection();
    transactionState.initTransactionOrderDetailsErrorString();
  }


  @override
  Widget build(BuildContext context) {
    _screenSize = MediaQuery.of(context).size;
    _screenHeight = _screenSize!.height;
    _screenWidth = _screenSize!.width;
    _theme = Theme.of(context).extension<SemnoxTheme>()!;
    SizeConfig.init(context);
    return WillPopScope(
      onWillPop: () async => false,
      child: Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(SizeConfig.getSize(8)),
        ),
        child: Stack(
          children: [
            SizedBox(
              height: SizeConfig.getSize(365),
              width: SizeConfig.getSize(420),
              child: Stack(
                children: [
                  Form(
                    key: _formKey,
                    child: Padding(
                      padding:  EdgeInsets.fromLTRB(0,0,SizeConfig.getSize(8),0),
                      child: Scrollbar(
                        radius: Radius.circular(SizeConfig.getSize(8)),
                        thumbVisibility: true,
                        controller: _scrollController,
                        child: SingleChildScrollView(
                          controller: _scrollController,
                          child: Padding(
                            padding:  EdgeInsets.fromLTRB(SizeConfig.getSize(8),0,0,0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                 SizedBox(
                                  height: SizeConfig.getSize(11),
                                ),
                                Text(
                                  '${MessagesProvider.get('Cancel').toUpperCase()} ${widget.productName?.toUpperCase() ?? ''}',
                                  style: _theme.heading2!.copyWith(fontSize: SizeConfig.getFontSize(22))
                                ),
                                 SizedBox(
                                  height: SizeConfig.getSize(15),
                                ),
                                Container(
                                  height: 1,
                                  color:  _theme.dialogFooterInnerShadow,
                                ),
                                _isLoading
                                    ? Center(
                                        child: Padding(
                                          padding:  EdgeInsets.all(SizeConfig.getSize(8)),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: <Widget>[
                                               CircularProgressIndicator(
                                                color:_theme.secondaryColor,
                                              ),
                                               SizedBox(
                                                height: SizeConfig.getSize(8),
                                              ),
                                              Text(
                                                MessagesProvider.get("Getting reasons"),
                                              )
                                            ],
                                          ),
                                        ),
                                      )
                                    : Padding(
                                        padding:  EdgeInsets.all(SizeConfig.getSize(12)),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Align(
                                              alignment: Alignment.centerLeft,
                                              child: Text(
                                                MessagesProvider.get('Reason*'),
                                                style:_theme.subtitle1!.copyWith(fontSize: SizeConfig.getFontSize(18)),
                                              ),
                                            ),
                                             SizedBox(
                                              height: SizeConfig.getSize(18),
                                            ),
                                            SizedBox(
                                              width: SizeConfig.getSize(380),
                                              height: SizeConfig.getSize(52),
                                              child: DropdownButtonFormField<String>(
                                                value: _reasonDropDown,
                                                autovalidateMode:
                                                    AutovalidateMode.onUserInteraction,
                                                validator: (value) {
                                                  if (value == null || value.isEmpty) {
                                                    _showErrorDialog(MessagesProvider.get(
                                                        "Reason is required"));
                                                    return '';
                                                  }
                                                  return null;
                                                },
                                                decoration: InputDecoration(
                                                  errorStyle:const TextStyle(fontSize: 0.01),
                                                  enabledBorder: OutlineInputBorder(
                                                      borderRadius: BorderRadius.circular(SizeConfig.getSize(10)),
                                                      borderSide:  BorderSide(
                                                        width: 1,
                                                        color: _theme.secondaryColor!,
                                                      )),
                                                  focusedBorder: OutlineInputBorder(
                                                      borderRadius: BorderRadius.circular(SizeConfig.getSize(10)),
                                                      borderSide:  BorderSide(
                                                        width: 1,
                                                        color: _theme.secondaryColor!,
                                                      )),
                                                  contentPadding:  EdgeInsets.only(
                                                      left: SizeConfig.getSize(10), right: SizeConfig.getSize(10), bottom: SizeConfig.getSize(10), top: SizeConfig.getSize(10)),
                                                  labelText: "",
                                                  floatingLabelBehavior:
                                                      FloatingLabelBehavior.always,
                                                  border: OutlineInputBorder(
                                                    // <--- this line
                                                    borderRadius: BorderRadius.circular(10),
                                                  ),
                                                ),
                                                icon: const Icon(Icons.arrow_drop_down_sharp),
                                                hint: Padding(
                                                  padding:
                                                       EdgeInsets.fromLTRB(SizeConfig.getSize(8), 0, SizeConfig.getSize(8), 0),
                                                  child: Text(MessagesProvider.get("Select"),
                                                      style: _theme.title3!.copyWith(fontSize: SizeConfig.getFontSize(18))),
                                                ),
                                                style:_theme.title3!.copyWith(fontSize: SizeConfig.getFontSize(18)),
                                                onChanged: (String? newValue) {
                                                  setState(() {
                                                    _reasonDropDown = newValue!;
                                                  });
                                                },
                                                items: _listValues
                                                    ?.map((e) => e.lookupValue.toString())
                                                    .toList()
                                                    .map<DropdownMenuItem<String>>(
                                                        (String value) {
                                                  return DropdownMenuItem<String>(
                                                    value: value,
                                                    child: Padding(
                                                      padding:   EdgeInsets.fromLTRB(
                                                          SizeConfig.getSize(8), 0, SizeConfig.getFontSize(8), 0),
                                                      child: Text(value, style:_theme.title1!.copyWith(fontSize:SizeConfig.getFontSize(16))),
                                                    ),
                                                  );
                                                }).toList(),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                Padding(
                                  padding:  EdgeInsets.all(SizeConfig.getSize(12)),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          MessagesProvider.get('Remarks*'),
                                          style:_theme.subtitle1!.copyWith(fontSize: SizeConfig.getFontSize(18)),
                                        ),
                                      ),
                                       SizedBox(
                                        height: SizeConfig.getSize(8),
                                      ),
                                      SizedBox(
                                        height: SizeConfig.getSize(52),
                                        child: TextFormField(
                                          inputFormatters: [
                                            LengthLimitingTextInputFormatter(100),
                                          ],
                                          autovalidateMode: AutovalidateMode.onUserInteraction,
                                          validator: (String? value) {
                                            if( value == null || value.isEmpty || value.trim() == ''){
                                              _showErrorDialog(MessagesProvider.get("Remarks is required"));
                                              return '';
                                            }
                                            if (value!.length > 50) {
                                              _showErrorDialog(MessagesProvider.get(
                                                  "A maximum of 50 characters is allowed for remarks"));

                                              return '';
                                            } else if (!
                                            AppConstants
                                                .alphanumericRegExpWithSpecialChar
                                                .hasMatch(value ?? '')) {
                                              _showErrorDialog(MessagesProvider.get(
                                                  "Remarks should not contain any special characters"));

                                              return '';
                                            } else if (value.isNotEmpty &&
                                                value.trim() == '') {
                                              _showErrorDialog(MessagesProvider.get(
                                                  "Empty spaces are not allowed!"));
                                              return '';
                                            }
                                            return null;
                                          },
                                          controller: _remarksTextController,
                                          style:_theme.title1!.copyWith(fontSize: SizeConfig.getFontSize(18)),
                                          decoration: InputDecoration(
                                            errorStyle:const TextStyle(fontSize: 0.01),
                                            fillColor: _theme.primaryColor,
                                            filled: true,
                                            hintStyle: _theme.textFieldHintStyle!.copyWith(fontSize: SizeConfig.getFontSize(16)),
                                            hintText: MessagesProvider.get("Enter"),
                                            contentPadding:  EdgeInsets.only(
                                                top: SizeConfig.getSize(8), bottom: SizeConfig.getSize(8), right: SizeConfig.getSize(8), left: SizeConfig.getSize(8)),
                                            focusedBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(SizeConfig.getSize(8)),
                                                borderSide:  BorderSide(
                                                  width: 1,
                                                  color: _theme.secondaryColor!,
                                                )),
                                            border: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(SizeConfig.getSize(8)),
                                              borderSide:  BorderSide(
                                                width: 1,
                                                color:_theme.secondaryColor!,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  height: 1,
                                  color:_theme.dialogFooterInnerShadow,
                                ),
                                Padding(
                                  padding:  EdgeInsets.all(SizeConfig.getSize(8)),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SecondaryLargeButton(onPressed: () {
                                        _initUpdateTransUpdateEnums();
                                        widget.onCancel(MessagesProvider.get("Cancel transaction line requires remarks."));
                                        Navigator.pop(context);
                                      }, text: MessagesProvider.get("CANCEL")),
                                       SizedBox(
                                        width: SizeConfig.getSize(8),
                                      ),
                                      PrimaryLargeButton(onPressed: () async{

                                        FocusManager.instance.primaryFocus?.unfocus();
                                        // final transactionState =
                                        // context.read<TransactionCubit>();
                                        if (_formKey.currentState!.validate()) {
                                          loader.showLoaderDialog(
                                              context,
                                              MessagesProvider.get(
                                                  "Cancelling product..."));
                                          final transactionCubit =
                                          context.read<TransactionCubit>();
                                          await transactionCubit
                                              .removeProductFromLine(
                                              approverID:widget.approverID,
                                              transactionLineIds: widget.transactionLineIds ,
                                              remarks:
                                              _remarksTextController.text ?? '',
                                              reason: _reasonDropDown ?? '',
                                              reasonId: getReasonId());
                                          if(transactionCubit.state.transactionDetailsUpdateStatusEnum == TransactionDetailsUpdateStatusEnum.error){
                                            Future.microtask(() => loader.hideLoaderDialog(context));
                                            widget.notificationBar!.showMessage(transactionCubit.state.remarksUpdateErrorString??'', _theme.footerBG3!);
                                          }
                                          if(transactionCubit.state.transactionDetailsUpdateStatusEnum == TransactionDetailsUpdateStatusEnum.success){
                                            Future.microtask(() => Navigator.pop(context));
                                            loader.hideLoaderDialog(context);
                                            widget.showNotification(MessagesProvider.get("Transaction Line(s) Cancelled"));
                                          }


                                        }
                                      }, text: MessagesProvider.get("OK"))
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),

                ],
              ),
            ),
            BlocBuilder<TransactionCubit, TransactionCubitState>(
                builder: (context, transactionState) {
                  if (transactionState.transactionDetailsUpdateStatusEnum ==
                      TransactionDetailsUpdateStatusEnum.error) {
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      _initUpdateTransUpdateEnums();
                    });

                  }
                  return const SizedBox();
                }),
          ],
        ),
      ),
    );
  }

  _showErrorDialog(String message){
    showDialog(
        barrierDismissible: true,
        context: context,
        builder: (BuildContext newContext) {
          return ErrorAlertDialog(title: 'Error',message:message ,
          );
        });
  }

  int getReasonId() {
    _filtered = _listValues
            ?.where(
                (e) => e.lookupValue.toString() == _reasonDropDown.toString())
            .toList() ??
        [];
Log.v("valueee: ${_filtered.isNotEmpty ? _filtered[0].lookupValueId : -1}");
   return _filtered.isNotEmpty ? _filtered[0].lookupValueId : -1;
  }

  Future<void> initDropDownList() async {
    setState(() {
      _isLoading = true;
    });
    var execContextBL = await ExecutionContextBuilder.build();
    var execContextDTO = execContextBL.getExecutionContext();
    var masterDataBL = await MasterDataBuilder.build(execContextDTO!);
    _listValues =
        await masterDataBL.getLookUpValuesByName("TRX_REVERSAL_REASONS");
    Log.v("print list: ${_listValues}");
    setState(() {
      _isLoading = false;
    });
  }
}
