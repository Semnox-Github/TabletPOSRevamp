import 'package:execution_context/builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:master_data/builder.dart';
import 'package:master_data/models/lookup_container/lookup_values_container_dto.dart';
import 'package:messages_data/builder.dart';
import 'package:notificationbar_ui/NotificationBar.dart';
import 'package:product_config_ui/change_staff_dialog/loader_widget_extension.dart';
import 'package:product_config_ui/reverse_transaction_transaction_line/reversal_reason_data.dart';
import 'package:themes_library/themes_library.dart';
import 'package:widgets_library/utils/size_config.dart';
import '../utils/constants.dart';
import '../widgets/primaryLargeButton.dart';
import '../widgets/secondaryLargeButton.dart';

class ReversalDialog extends StatefulWidget {
  final String productName;
  final Function(ReversalReasonData data) onYes;
  final Function() onCancel;

  const ReversalDialog({
    Key? key,
    required this.productName,
    required this.onYes,
    required this.onCancel,
  }) : super(key: key);

  @override
  State<ReversalDialog> createState() => _ReversalDialogState();
}

class _ReversalDialogState extends State<ReversalDialog> {
  NotificationBar? _notificationBar;

  final ScrollController _scrollController = ScrollController();
  final TextEditingController _remarksTextController = TextEditingController();
  bool _isLoading = false;
  String _loadingMessage = "";

  List<LookupValuesContainerDTO>? _reversalReasons = [];
  String? _selectedReversalReason;
  int _selectedReversalReasonId = -1;

  @override
  void initState() {
    super.initState();
    _getTransactionReversalReasons();
    _notificationBar = NotificationBar(showHideSideBar: false);
  }

  @override
  void dispose() {
    super.dispose();
    _notificationBar = null;
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    SemnoxTheme theme = Theme.of(context).extension<SemnoxTheme>()!;
    return WillPopScope(
      onWillPop: () async => false,
      child: Material(
        color: theme.transparentColor,
        child: Stack(
          children: [
            Scaffold(
              backgroundColor: theme.transparentColor,
              resizeToAvoidBottomInset: true,
              bottomNavigationBar: Container(
                child: _notificationBar,
              ),
              body: Dialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(SizeConfig.getSize(8.0)),
                ),
                child: SizedBox(
                  height: SizeConfig.getHeight(422),
                  width: SizeConfig.getWidth(572),
                  child: Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.only(right: SizeConfig.getWidth(2)),
                    child: RawScrollbar(
                      radius: Radius.circular(SizeConfig.getSize(2)),
                      thumbVisibility: true,
                      trackVisibility: false,
                      trackBorderColor: theme.scrollBarHandle,
                      trackColor: theme.scrollArea,
                      thumbColor: theme.scrollBarHandle,
                      thickness: SizeConfig.getWidth(5),
                      controller: _scrollController,
                      child: CustomScrollView(controller: _scrollController, slivers: [
                        SliverFillRemaining(
                          hasScrollBody: false,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Column(
                                  children: [
                                    Container(
                                      height: SizeConfig.getHeight(90),
                                      padding: EdgeInsets.only(
                                          left: SizeConfig.getWidth(10),
                                          top: SizeConfig.getHeight(3),
                                          right: SizeConfig.getWidth(10),
                                          bottom: SizeConfig.getHeight(3)),
                                      child: Center(
                                        child: Text(
                                            MessagesProvider.get("Cancel ${widget.productName}").toUpperCase(),
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            style: theme.heading2?.copyWith(fontSize: SizeConfig.getFontSize(28))),
                                      ),
                                    ),
                                    Divider(
                                      thickness: SizeConfig.getSize(1),
                                      color: theme.dialogFooterInnerShadow,
                                      height: SizeConfig.getHeight(1),
                                    ),
                                    Container(
                                      padding: EdgeInsets.all(SizeConfig.getSize(20)),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            MessagesProvider.get("* Reason"),
                                            style: theme.heading6?.copyWith(fontSize: SizeConfig.getFontSize(20)),
                                            textAlign: TextAlign.left,
                                          ),
                                          SizedBox(height: SizeConfig.getHeight(5)),
                                          FractionallySizedBox(
                                            widthFactor: 1.0,
                                            child: SizedBox(
                                              height: SizeConfig.getSize(50),
                                              child: InputDecorator(
                                                  decoration: InputDecoration(
                                                      // focusColor: theme.cartItemCardBG,
                                                      border: OutlineInputBorder(
                                                        borderRadius: BorderRadius.all(Radius.circular(SizeConfig.getSize(8))),
                                                        borderSide: BorderSide(color: theme.secondaryColor!, width: SizeConfig.getWidth(1)),
                                                      ),
                                                      focusedBorder: OutlineInputBorder(
                                                        borderRadius: BorderRadius.circular(SizeConfig.getSize(8)),
                                                        borderSide: BorderSide(color: theme.secondaryColor!, width: SizeConfig.getWidth(1)),
                                                      ),
                                                      filled: true,
                                                      fillColor: theme.transparentColor,
                                                      contentPadding: EdgeInsets.all(SizeConfig.getSize(10))),
                                                  child: DropdownButtonHideUnderline(
                                                    child: DropdownButton(
                                                      isExpanded: true,
                                                      icon: const Icon(Icons.keyboard_arrow_down),
                                                      value: _selectedReversalReason,
                                                      iconSize: SizeConfig.getSize(24),
                                                      isDense: true,
                                                      hint: Text(
                                                        MessagesProvider.get("Select"),
                                                        style: theme.subtitle2?.copyWith(fontSize: SizeConfig.getFontSize(18)),
                                                      ),
                                                      style: theme.subtitle2?.copyWith(fontSize: SizeConfig.getFontSize(18)),
                                                      items: _reversalReasons
                                                          ?.map((e) => e.lookupValue.toString())
                                                          .toList()
                                                          .map<DropdownMenuItem<String>>((String value) {
                                                        return DropdownMenuItem<String>(
                                                          value: value,
                                                          child: Text(
                                                            value,
                                                            style: theme.subtitle2?.copyWith(fontSize: SizeConfig.getFontSize(18)),
                                                          ),
                                                        );
                                                      }).toList(),
                                                      onChanged: (String? newValue) {
                                                        _onReversalReasonSelected(newValue!);
                                                      },
                                                      dropdownColor: theme.cartItemCardBG,
                                                    ),
                                                  )),
                                            ),
                                          ),
                                          SizedBox(height: SizeConfig.getHeight(15)),
                                          Text(
                                            MessagesProvider.get("* Remarks"),
                                            style: theme.heading6?.copyWith(fontSize: SizeConfig.getFontSize(20)),
                                          ),
                                          SizedBox(height: SizeConfig.getHeight(5)),
                                          FractionallySizedBox(
                                            widthFactor: 1.0,
                                            child: SizedBox(
                                              height: SizeConfig.getSize(50),
                                              child: TextFormField(
                                                inputFormatters: [
                                                  LengthLimitingTextInputFormatter(100),
                                                ],
                                                controller: _remarksTextController,
                                                style: theme.subtitle2?.copyWith(fontSize: SizeConfig.getFontSize(18)),
                                                decoration: InputDecoration(
                                                  // errorStyle: theme.subtitle2?.copyWith(fontSize: SizeConfig.getFontSize(14), color: theme.footerBG3),
                                                  contentPadding: EdgeInsets.only(
                                                      top: SizeConfig.getHeight(5),
                                                      bottom: SizeConfig.getHeight(5),
                                                      right: SizeConfig.getWidth(5),
                                                      left: SizeConfig.getWidth(10)),
                                                  focusedBorder: OutlineInputBorder(
                                                      borderRadius: BorderRadius.circular(SizeConfig.getSize(10.0)),
                                                      borderSide: BorderSide(
                                                        width: SizeConfig.getWidth(1),
                                                        color: theme.darkTextColor!,
                                                      )),
                                                  border: OutlineInputBorder(
                                                    borderRadius: BorderRadius.circular(SizeConfig.getSize(8)),
                                                    borderSide: BorderSide(
                                                      width: SizeConfig.getWidth(1),
                                                      color: theme.darkTextColor!,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
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
                                        widget.onCancel();
                                      },
                                      text: MessagesProvider.get("CANCEL"),
                                    ),
                                    const SizedBox(width: 10),
                                    PrimaryLargeButton(
                                      onPressed: () {
                                        FocusManager.instance.primaryFocus?.unfocus();
                                        if (_remarksTextController.text.isEmpty || _remarksTextController.text.trim() == '') {
                                          _notificationBar?.showMessage(MessagesProvider.get("Remarks is required"), theme.footerBG5!);
                                        } else if (_remarksTextController.text.length > 50) {
                                          _notificationBar?.showMessage(
                                              MessagesProvider.get("A maximum of 50 characters is allowed for remarks"),
                                              theme.footerBG5!);
                                        } else if (!AppConstants.alphanumericRegExpWithSpecialChar.hasMatch(_remarksTextController.text)) {
                                          _notificationBar?.showMessage(
                                              MessagesProvider.get("Remarks should not contain any special characters"),
                                              theme.footerBG5!);
                                        } else if (_remarksTextController.text.isNotEmpty && _remarksTextController.text.trim() == '') {
                                          _notificationBar?.showMessage(MessagesProvider.get("Empty spaces are not allowed!"), theme.footerBG5!);
                                        } else if (_selectedReversalReasonId != -1) {
                                          var selectedReason = ReversalReasonData(reasonId: _selectedReversalReasonId, remarks: _remarksTextController.text);
                                          Navigator.pop(context);
                                          widget.onYes(selectedReason);
                                        } else {
                                          _notificationBar?.showMessage(MessagesProvider.get("Please enter required fields"), theme.footerBG5!);
                                        }
                                      },
                                      text: MessagesProvider.get("OK"),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        )
                      ]),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ).withLoader(
          isLoading: _isLoading,
          message: _loadingMessage,
          theme: theme,
      ),
    );
  }

  void _setLoadingStatus(bool status) {
    setState(() {
      _isLoading = status;
    });
  }

  _onReversalReasonSelected(String selectedReason) {
    setState(() {
      _selectedReversalReason = selectedReason;
      var selectedReasonList = _reversalReasons?.where((e) => e.lookupValue.toString() == selectedReason.toString()).toList() ?? [];
      _selectedReversalReasonId = selectedReasonList.isNotEmpty ? selectedReasonList[0].lookupValueId : -1;
    });
  }

  Future<void> _getTransactionReversalReasons() async {
    _setLoadingStatus(true);
    _loadingMessage = MessagesProvider.get("Please wait while we fetch details...");
    var execContextBL = await ExecutionContextBuilder.build();
    var execContextDTO = execContextBL.getExecutionContext();
    var masterDataBL = await MasterDataBuilder.build(execContextDTO!);
    _reversalReasons = await masterDataBL.getLookUpValuesByName("TRX_REVERSAL_REASONS");
    _setLoadingStatus(false);
  }
}
