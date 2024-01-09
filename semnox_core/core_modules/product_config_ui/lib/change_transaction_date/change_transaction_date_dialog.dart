import 'package:dio/dio.dart';
import 'package:execution_context/builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:messages_data/builder.dart';
import 'package:product_config_ui/change_transaction_date/date_time_extension.dart';
import 'package:themes_library/themes_library.dart';
import 'package:transaction_data/builder.dart';
import 'package:transaction_data/models/create_transaction/transaction_response.dart';
import 'package:transaction_ui/cubit/transaction_cubit.dart';
import 'package:product_config_ui/change_staff_dialog/loader_widget_extension.dart';
import 'package:intl/intl.dart';
import 'package:notificationbar_ui/NotificationBar.dart';
import 'package:widgets_library/utils/size_config.dart';
import '../widgets/primaryLargeButton.dart';
import '../widgets/secondaryLargeButton.dart';

class ChangeTransactionDateDialog extends StatefulWidget {
  final String date;
  final String dateTimeFormat;
  final Function() onTransactionDateChangedCallback;
  final int? approverID;
  final bool isEnabled;

  const ChangeTransactionDateDialog(
      {Key? key,
      required this.date,
      required this.dateTimeFormat,
      required this.onTransactionDateChangedCallback,
      required this.isEnabled,
      this.approverID})
      : super(key: key);

  @override
  State<ChangeTransactionDateDialog> createState() => _ChangeTransactionDateDialogState();
}

class _ChangeTransactionDateDialogState extends State<ChangeTransactionDateDialog> {
  NotificationBar? _notificationBar;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late TextEditingController _dateTimeTextController;
  final String _timeFormat = " hh:mm:ss a";
  final String _dateFormat = "dd-MM-yyyy";
  final DateFormat _dateTimeOutputFormat = DateFormat("yyyy-MM-ddTHH:mm:ss");
  String _selectedDateTime = '';
  String _selectedDate = '';
  String _selectedTime = '';
  bool _isLoading = false;
  String _loadingMessage = "";
  late SemnoxTheme theme;

  @override
  void initState() {
    super.initState();
    _notificationBar = NotificationBar(showHideSideBar: false);
    _dateTimeTextController =
        TextEditingController(text: DateFormat(widget.dateTimeFormat).format(DateTime.parse(widget.date)));
    _selectedDateTime = DateFormat(widget.dateTimeFormat).format(DateTime.parse(widget.date));
  }

  @override
  void dispose() {
    super.dispose();
    _notificationBar = null;
  }

  @override
  Widget build(BuildContext context) {
    theme = Theme.of(context).extension<SemnoxTheme>()!;
    SizeConfig.init(context);

    return WillPopScope(
      onWillPop: () async => false,
      child: Material(
        color: theme.transparentColor,
        child: Stack(
          children: [
            Scaffold(
              backgroundColor: theme.transparentColor,
              resizeToAvoidBottomInset: false,
              bottomNavigationBar: Container(
                child: _notificationBar,
              ),
              body: Dialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(SizeConfig.getSize(8)),
                ),
                child: SizedBox(
                  height: SizeConfig.getHeight(372),
                  width: SizeConfig.getWidth(420),
                  child: Column(
                    children: [
                      SizedBox(
                        height: SizeConfig.getHeight(90),
                        child: Center(
                          child: Text(MessagesProvider.get("CHANGE TRANSACTION DATE"),
                              style: theme.heading2?.copyWith(fontSize: SizeConfig.getFontSize(24))),
                        ),
                      ),
                      Divider(
                        thickness: SizeConfig.getSize(1),
                        color: theme.dialogFooterInnerShadow,
                        height: SizeConfig.getHeight(1),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.all(SizeConfig.getSize(20)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                MessagesProvider.get("Transaction Date"),
                                style: theme.heading5?.copyWith(fontSize: SizeConfig.getFontSize(18)),
                              ),
                              SizedBox(
                                height: SizeConfig.getHeight(5),
                              ),
                              SizedBox(
                                height: SizeConfig.getHeight(70),
                                child: Form(
                                  key: _formKey,
                                  child: TextField(
                                    style: theme.heading5?.copyWith(fontSize: SizeConfig.getFontSize(18)),
                                    controller: _dateTimeTextController,
                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor: widget.isEnabled ? Colors.transparent : Colors.grey.shade400,
                                      contentPadding: EdgeInsets.only(
                                          top: SizeConfig.getHeight(2),
                                          bottom: SizeConfig.getHeight(2),
                                          right: SizeConfig.getWidth(15),
                                          left: SizeConfig.getWidth(15)),
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(SizeConfig.getSize(10.0)),
                                          borderSide: BorderSide(
                                            width: SizeConfig.getWidth(1),
                                            color: theme.dialogFooterInnerShadow!,
                                          )),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(SizeConfig.getSize(10.0)),
                                        borderSide: BorderSide(
                                          width: SizeConfig.getWidth(1),
                                          color: theme.dialogFooterInnerShadow!,
                                        ),
                                      ),
                                      suffix: Image.asset(
                                        (Theme.of(context).brightness == Brightness.light)
                                            ? "assets/ic_transaction_date_1.png"
                                            : "assets/ic_transaction_date_light.png",
                                        width: SizeConfig.getWidth(24),
                                        height: SizeConfig.getHeight(24),
                                      ),
                                    ),
                                    readOnly: true,
                                    onTap: () async {
                                      _showDatePicker();
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Divider(
                        thickness: SizeConfig.getSize(1),
                        color: theme.dialogFooterInnerShadow,
                        height: SizeConfig.getHeight(1),
                      ),
                      SizedBox(
                        height: SizeConfig.getHeight(90),
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
                                if (_selectedDateTime.isNotEmpty) {
                                  _changeTransactionDate();
                                } else {
                                  _notificationBar?.showMessage(
                                      MessagesProvider.get("Please Select Date..."), theme.footerBG5!);
                                }
                              },
                              text: MessagesProvider.get("OK"),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ).withLoader(isLoading: _isLoading, message: _loadingMessage, theme: theme),
    );
  }

  void _setLoadingStatus(bool status) {
    setState(() {
      _isLoading = status;
    });
  }

  _showDatePicker() async {
    DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.parse(widget.date) ?? DateTime.now(),
        firstDate: _getFirstDate(),
        lastDate: DateTime(2101),
        builder: (context, child) {
          return Theme(
            data: ThemeData.light().copyWith(
              colorScheme: const ColorScheme.light(
                primary: Colors.black,
              ),
              buttonTheme: const ButtonThemeData(textTheme: ButtonTextTheme.primary),
            ),
            child: child ?? const SizedBox(),
          );
        });

    if (pickedDate != null) {
      if (DateTime.now().isFutureDate(pickedDate)) {
        _selectedDate = DateFormat(_dateFormat).format(pickedDate);
        _showTimePicker(pickedDate);
      } else {
        _notificationBar?.showMessage(MessagesProvider.get("Please Select Future Date"), theme.footerBG5!);
      }
    } else {
      _notificationBar?.showMessage(MessagesProvider.get("Please Select the Date"), theme.footerBG5!);
    }
  }

  _showTimePicker(DateTime pickedDate) async {
    TimeOfDay? pickedTime = await showTimePicker(
      initialTime: TimeOfDay.now(),
      context: context,
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: ColorScheme.light(
              primary: Colors.black!,
            ),
            buttonTheme: const ButtonThemeData(textTheme: ButtonTextTheme.primary),
          ),
          child: MediaQuery(
            data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: false),
            child: child ?? const SizedBox(),
          ),
        );
      },
    );

    if (pickedTime != null) {
      _selectedTime = DateFormat(_timeFormat).format(DateTime(pickedTime.hour, pickedTime.minute));
      if (DateTime.now().isSameDate(pickedDate)) {
        if (DateTime.now().isFutureTime(pickedTime)) {
          _formatChosenDateTime(pickedDate, pickedTime);
        } else {
          _notificationBar?.showMessage(MessagesProvider.get("Please Select Future Time"), theme.footerBG5!);
        }
      } else {
        _formatChosenDateTime(pickedDate, pickedTime);
      }
    } else {
      _formatChosenDateTime(pickedDate, pickedTime!);
      _notificationBar?.showMessage(MessagesProvider.get("Please Select the Time"), theme.footerBG5!);
    }
  }

  _formatChosenDateTime(DateTime pickedDate, TimeOfDay? pickedTime) {
    DateTime time = DateFormat(widget.dateTimeFormat).parse(_selectedDateTime);
    _selectedDateTime = DateFormat(widget.dateTimeFormat).format(DateTime(pickedDate.year, pickedDate.month, pickedDate.day,
        pickedTime != null ? pickedTime.hour : time.hour, pickedTime != null ? pickedTime.minute : time.minute));
    _dateTimeTextController.text = _selectedDateTime;
  }

  DateTime _getFirstDate() {
    return DateTime.now().isPastDate(DateTime.parse(widget.date)) ? DateTime.parse(widget.date) : DateTime.now();
  }

  _changeTransactionDate() async {
    try {
      _loadingMessage = MessagesProvider.get("Updating Transaction Date...");
      _setLoadingStatus(true);
      final TransactionCubit transactionCubit = context.read<TransactionCubit>();
      var execContextBL = await ExecutionContextBuilder.build();
      var execContextDTO = execContextBL.getExecutionContext();
      var transactionDataBl = await TransactionDataBuilder.build(execContextDTO!);
      var dateTime = _dateTimeOutputFormat.format(DateFormat(widget.dateTimeFormat).parse(_selectedDateTime));
      TransactionResponse? transactionResponse = await transactionDataBl.updateTransactionIdentifiers(
        transactionDateTime: dateTime,
      );
      _setLoadingStatus(false);
      if (transactionResponse.exception == null) {
        transactionCubit.onTransactionDataUpdated(transactionResponse.data);
        Navigator.pop(context);
        widget.onTransactionDateChangedCallback();
      } else {
        _notificationBar?.showMessage(transactionResponse.exception!, theme.footerBG3!);
      }
    } on DioError catch (error) {
      _setLoadingStatus(false);
      var errorString = error.response?.data['data'] as String?;
      _notificationBar?.showMessage(errorString!, theme.footerBG3!);
    } catch (error) {
      _setLoadingStatus(false);
      _notificationBar?.showMessage(error.toString(), theme.footerBG3!);
    }
  }
}
