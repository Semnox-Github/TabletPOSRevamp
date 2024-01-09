import 'package:dio/dio.dart';
import 'package:execution_context/builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:master_data/builder.dart';
import 'package:master_data/models/discount_container/discount_container_dto.dart';
import 'package:messages_data/builder.dart';
import 'package:notificationbar_ui/NotificationBar.dart';
import 'package:product_config_ui/transaction_discount_and_coupon_dialog/remark_or_coupon_dialog.dart';
import 'package:product_config_ui/transaction_discount_and_coupon_dialog/variable_discount_dialog.dart';
import 'package:product_config_ui/utils/constants.dart';
import 'package:themes_library/themes_library.dart';
import 'package:transaction_data/builder.dart';
import 'package:transaction_data/models/discount_coupon_summary/discount_coupon_summary_response.dart';
import 'package:transaction_ui/cubit/transaction_cubit.dart';
import 'package:transaction_ui/cubit/transaction_cubit_state.dart';
import 'package:transaction_ui/models/transaction_lines_group.dart';
import 'package:widgets_library/error_alert_dialog.dart';
import 'package:widgets_library/scroller.dart';
import 'package:widgets_library/utils/size_config.dart';
import 'coupons_dialog.dart';
import 'discount_details_page.dart';

class AddDiscountDialog extends StatefulWidget {
  const AddDiscountDialog(
      {Key? key,
      this.approverID,
      required this.islineDiscount,
      required this.showNotification,
      required this.transactionNumber,
      this.selectedTransactionLinesGroup})
      : super(key: key);
  final Function(String value) showNotification;
  final bool islineDiscount;
  final int transactionNumber;
  final TransactionLinesGroup? selectedTransactionLinesGroup;
  final int? approverID;

  @override
  State<AddDiscountDialog> createState() => _AddDiscountDialogState();
}

class _AddDiscountDialogState extends State<AddDiscountDialog> {
  final TextEditingController _searchTextController = TextEditingController();

  Size? _screenSize;
  double _screenHeight = 0.0;
  double _screenWidth = 0.0;
  bool _isLoading = false;
  List<DiscountContainerDto>? _discountsList = [];
  List<DiscountContainerDto>? _filteredDiscountList = [];
  List<DiscountContainerDto>? _discountListValues = [];
  int _selectedIndex = 0;
  late NotificationBar _notificationBar;
  String _remarkOrCouponString = '';
  bool _isOkPressed = false;
  final _scrollController = ScrollController();
  bool _isDiscountTab = true;
  TextEditingController _couponTextController = TextEditingController();
  DiscountCouponSummaryResponse? _discountCouponSummaryResponse;
  bool _isCouponLoading = false;
  bool _isDiscountCouponSummarySuccess = false;
  var execContextBL;
  var sysExecContext;
  var transactionDataBl;
  var masterDataBl;
  String _dateTimeFormat = 'dd-MMM-yyyy h:mm:ss tt';
  late SemnoxTheme _theme;
  late InputDecoration _textInputDecoration ;

  @override
  void initState() {
    _notificationBar = NotificationBar(showHideSideBar: false);
    initUpdateStatus();
    super.initState();
  }

  initUpdateStatus() async {
    setState(() {
      _isLoading = true;
    });
    _initUpdateTransUpdateEnums();
    execContextBL = await ExecutionContextBuilder.build();
    sysExecContext = execContextBL.getExecutionContext();
    //  transactionDataBl = await TransactionDataBuilder.build(sysExecContext!);
    masterDataBl = await MasterDataBuilder.build(sysExecContext!);
    _dateTimeFormat = await masterDataBl.getDefaultValuesByName(
        defaultValueName: "DATETIME_FORMAT");
    _discountListValues = await masterDataBl.getDiscounts();
    _discountsList = (_discountListValues ?? [])
            .where((e) => e.displayInPos == "Y" && e.isActive == true)
            .toList() ??
        [];
    (_discountsList ?? [])
        .sort((a, b) => (a.sortOrder ?? 0).compareTo((b.sortOrder ?? 0)));
    if (widget.islineDiscount) {
      _filteredDiscountList = (_discountsList ?? [])
          .where((e) => e.discountedProductsContainerDtoList.isEmpty)
          .toList();
    } else {
      _filteredDiscountList = _discountsList;
    }
    setState(() {
      _isLoading = false;
    });
  }

  _getDiscountCouponDetails() async {
    setState(() {
      _isCouponLoading = true;
    });
    try {
      _theme = Theme.of(context).extension<SemnoxTheme>()!;
      var execContextBL = await ExecutionContextBuilder.build();
      var sysExecContext = execContextBL.getExecutionContext();
      var transactionDataBl =
          await TransactionDataBuilder.build(sysExecContext!);
      // var masterDataBl = await MasterDataBuilder.build(sysExecContext!);
      _discountCouponSummaryResponse =
          await transactionDataBl.getDiscountCouponSummary(
              couponNumber: _couponTextController.text ?? '');
      setState(() {
        _isCouponLoading = false;
        _isDiscountCouponSummarySuccess = true;
      });
    } on DioError catch (error) {
      setState(() {
        _isCouponLoading = false;
        _isDiscountCouponSummarySuccess = false;
      });
      var errorString = error.response?.data['data'] as String?;
      _notificationBar.showMessage(errorString.toString(), _theme.footerBG3!);
    } catch (err) {
      _notificationBar.showMessage(
          MessagesProvider.get('Something went Wrong!'), _theme.footerBG3!);
      setState(() {
        _isCouponLoading = false;
        _isDiscountCouponSummarySuccess = false;
      });
    }
  }

  _initUpdateTransUpdateEnums() {
    final transactionState = context.read<TransactionCubit>();
    transactionState.initUpdateTransactionOrderDetailsSection();
    transactionState.initTransactionOrderDetailsErrorString();
  }

  _initInputDecoration(){
    _textInputDecoration = InputDecoration(
      fillColor: _theme.primaryColor,
      filled: true,
      hintText: MessagesProvider.get("Enter Text"),
      hintStyle: _theme.textFieldHintStyle!.copyWith(
          fontSize: SizeConfig.getFontSize(20)),
      contentPadding: const EdgeInsets.only(
          left: 5),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(SizeConfig.getSize(8)),
          borderSide: BorderSide(
            width: 1,
            color: _theme.secondaryColor!,
          )),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(SizeConfig.getSize(8)),
        borderSide: BorderSide(
          width: 1,
          color: _theme.secondaryColor!,
        ),
      ),

    );
  }

  @override
  Widget build(BuildContext context) {
    _screenSize = MediaQuery.of(context).size;
    _screenHeight = _screenSize!.height;
    _screenWidth = _screenSize!.width;
    _theme = Theme.of(context).extension<SemnoxTheme>()!;
    SizeConfig.init(context);
    _initInputDecoration();
    return WillPopScope(
      onWillPop: () async => false,
      child: Material(
        color: _theme.transparentColor,
        child: Stack(
          children: [
            Column(
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(SizeConfig.getSize(8)),
                    decoration: BoxDecoration(
                      color: _theme.backGroundColor,
                      borderRadius: BorderRadius.circular(SizeConfig.getSize(8)),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        color: _theme.backGroundColor,
                        borderRadius:
                            BorderRadius.circular(SizeConfig.getSize(8)),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _header(),
                          SizedBox(
                            height: SizeConfig.getHeight(8),
                          ),
                          _tabButtons(),
                          _enterDiscountTitle(),
                          _searchTextField(),
                          _body(),
                          _customDivider(),
                          _bottomButtons()
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  child: _notificationBar,
                )
              ],
            ),
            _isCouponLoading
                ? Positioned(
                    bottom: 0,
                    left: 0,
                    child: Container(
                      width: _screenWidth,
                      height: _screenHeight,
                      decoration: BoxDecoration(
                        color: _theme.secondaryColor!.withOpacity(.3),
                      ),
                      child: Center(
                        child: Container(
                          decoration: BoxDecoration(
                              color: _theme.backGroundColor!,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(6))),
                          width: _screenWidth * .28,
                          child: Padding(
                            padding:  EdgeInsets.all(SizeConfig.getSize(25)),
                            child: Row(children: [
                               SizedBox(width: SizeConfig.getSize(8)),
                               SizedBox(
                                   height: SizeConfig.getSize(35),
                                   width: SizeConfig.getSize(35),
                                   child: const CircularProgressIndicator()),
                               SizedBox(width: SizeConfig.getSize(24)),
                              Expanded(
                                child: Text(
                                  MessagesProvider.get("Fetching Coupon Details"),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: _theme.title1!.copyWith(fontSize: SizeConfig.getSize(18)),
                                ),
                              ),
                            ]),
                          ),
                        ),
                      ),
                    ))
                : const SizedBox(),
            BlocBuilder<TransactionCubit, TransactionCubitState>(
                builder: (context, transactionState) {
              if (transactionState.transactionDetailsUpdateStatusEnum ==
                  TransactionDetailsUpdateStatusEnum.error) {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  _notificationBar.showMessage(
                      transactionState.transactionDetailsUpdateErrorString
                          .toString(),
                      _theme.footerBG3!);
                  _initUpdateTransUpdateEnums();
                });
              }
              return transactionState.transactionDetailsUpdateStatusEnum ==
                      TransactionDetailsUpdateStatusEnum.loading
                  ? Positioned(
                      bottom: 0,
                      left: 0,
                      child: Container(
                        width: _screenWidth,
                        height: _screenHeight,
                        decoration: BoxDecoration(
                          color: _theme.secondaryColor!.withOpacity(.3),
                        ),
                        child: Center(
                          child: Container(
                            decoration: BoxDecoration(
                                color: _theme.backGroundColor!,
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(6))),
                            width: _screenWidth * .28,
                            child: Padding(
                              padding:  EdgeInsets.all(SizeConfig.getSize(25)),
                              child: Row(children: [
                                SizedBox(width: SizeConfig.getSize(8)),
                                SizedBox(
                                    height: SizeConfig.getSize(35),
                                    width: SizeConfig.getSize(35),
                                    child: const CircularProgressIndicator()),
                                SizedBox(width: SizeConfig.getSize(24)),
                                Expanded(
                                  child: Text(
                                    MessagesProvider.get("Applying discount"),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: _theme.title1!.copyWith(fontSize: SizeConfig.getSize(18)),
                                  ),
                                ),
                              ]),
                            ),
                          ),
                        ),
                      ))
                  : const SizedBox();
            }),
          ],
        ),
      ),
    );
  }

  Widget _header() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            decoration: BoxDecoration(
                color: _theme.button2InnerShadow1,
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(SizeConfig.getSize(8)),
                    topLeft: Radius.circular(SizeConfig.getSize(8)))),
            height: SizeConfig.getHeight(64),
            // width:5,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: SizeConfig.getWidth(10),
                ),
                Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                  size: SizeConfig.getFontSize(24),
                ),
                SizedBox(
                  width: SizeConfig.getWidth(10),
                ),
                Text(
                  widget.islineDiscount
                      ? '${MessagesProvider.get('Apply Discount For ')} ${widget.selectedTransactionLinesGroup?.productName ?? ''}'
                          .toUpperCase()
                      : "${MessagesProvider.get('Apply Discount For Transaction')} (${widget.transactionNumber})"
                          .toUpperCase(),
                  style: _theme.headingLight4!.copyWith(
                      color: _theme.light1,
                      fontSize: SizeConfig.getFontSize(22)),
                ),
                SizedBox(
                  width: SizeConfig.getWidth(10),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          width: 8,
        ),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
                color: _theme.button1BG1,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(SizeConfig.getSize(8)),
                    topRight: Radius.circular(SizeConfig.getSize(8)))),
            height: SizeConfig.getHeight(64),
          ),
        )
      ],
    );
  }

  Widget _tabButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
            style: ElevatedButton.styleFrom(
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                padding: EdgeInsets.only(
                    left: SizeConfig.getWidth(4),
                    right: SizeConfig.getWidth(4)),
                minimumSize:
                    Size(SizeConfig.getWidth(100), SizeConfig.getHeight(42)),
                maximumSize:
                    Size(SizeConfig.getWidth(100), SizeConfig.getHeight(42)),
                backgroundColor: _isDiscountTab
                    ? _theme.button2InnerShadow1
                    : _theme.button1BG1),
            onPressed: () {
              setState(() {
                _isDiscountTab = true;
              });
            },
            child: Padding(
              padding: const EdgeInsets.all(2),
              child: Text(
                MessagesProvider.get('Discounts').toUpperCase(),
                style: _isDiscountTab
                    ? _theme.subtitleLight3!.copyWith(
                        color: _theme.light1,
                        fontSize: SizeConfig.getFontSize(16))
                    : _theme.subtitle3!
                        .copyWith(fontSize: SizeConfig.getFontSize(16)),
              ),
            )),
        const SizedBox(
          width: 10,
        ),
        ElevatedButton(
            style: ElevatedButton.styleFrom(
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              padding: EdgeInsets.only(
                  left: SizeConfig.getWidth(4), right: SizeConfig.getWidth(4)),
              minimumSize:
                  Size(SizeConfig.getWidth(100), SizeConfig.getHeight(42)),
              maximumSize:
                  Size(SizeConfig.getWidth(100), SizeConfig.getHeight(42)),
              backgroundColor: _isDiscountTab
                  ? _theme.button1BG1
                  : _theme.button2InnerShadow1,
            ),
            onPressed: () {
              setState(() {
                _isDiscountTab = false;
              });
            },
            child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: Text(
                MessagesProvider.get('Coupons').toUpperCase(),
                style: _isDiscountTab
                    ? _theme.subtitle3!
                        .copyWith(fontSize: SizeConfig.getFontSize(16))
                    : _theme.subtitleLight3!.copyWith(
                        color: _theme.light1,
                        fontSize: SizeConfig.getFontSize(16)),
              ),
            )),
      ],
    );
  }

  Widget _enterDiscountTitle() {
    return _isDiscountTab
        ? Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(5, 0, 5, 5),
              child: Text(MessagesProvider.get("Enter Discount Name") ?? '',
                  style: _theme.heading5!
                      .copyWith(fontSize: SizeConfig.getFontSize(18))),
            ),
          )
        : const SizedBox();
  }

  Widget _searchTextField() {
    return _isDiscountTab
        ? SizedBox(
            height: SizeConfig.getHeight(34),
            child: Padding(
              padding: const EdgeInsets.only(left: 4, right: 4),
              child: TextFormField(
                onChanged: (String value) {
                  setState(() {
                    if (value.isNotEmpty) {
                      _selectedIndex = 0;
                      _filteredDiscountList = _discountsList!
                          .where((element) => element.discountName!
                              .toLowerCase()
                              .contains(value.toLowerCase()))
                          .toList();
                    } else {
                      _selectedIndex = 0;
                      _filteredDiscountList = _discountsList;
                    }
                  });
                },
                style: _theme.title1!
                    .copyWith(fontSize: SizeConfig.getFontSize(18)),
                controller: _searchTextController,
                decoration:_textInputDecoration.copyWith(
                    suffixIcon: _searchTextController.text.isNotEmpty
                        ? InkWell(
                        onTap: () {
                          setState(() {
                            _searchTextController.clear();
                            _selectedIndex = 0;
                            _filteredDiscountList = _discountsList;
                          });
                        },
                        child: Icon(Icons.cancel_outlined,
                            size: SizeConfig.getSize(25),
                            color: _theme.secondaryColor))
                        : const SizedBox(),
                    suffixStyle:
                    TextStyle(color: _theme.dialogFooterInnerShadow)
                )
              ),
            ),
          )
        : const SizedBox();
  }

  Widget _body() {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.fromLTRB(SizeConfig.getSize(8),
            SizeConfig.getSize(4), SizeConfig.getSize(8), 0),
        child: Column(
          children: [
            SizedBox(
              height: SizeConfig.getHeight(10),
            ),
            _isDiscountTab ? _discountTabBody() : _couponTabBody(),
          ],
        ),
      ),
    );
  }

  Widget _discountTabBody() {
    return _isLoading
        ? Expanded(
            // flex: 9,
            child: Center(
                child: CircularProgressIndicator(color: _theme.secondaryColor)),
          )
        : Expanded(
            // flex: 9,
            child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 6),
            child: SizedBox(
              child: Scroller(
                controller: _scrollController,
                child: Padding(
                  padding: const EdgeInsets.only(right: 28.0),
                  child: GridView.builder(
                      controller: _scrollController,
                      shrinkWrap: true,
                      itemCount: _filteredDiscountList?.length ?? 0,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              childAspectRatio: 3 / 1,
                              mainAxisSpacing: 5,
                              crossAxisSpacing: 5,
                              crossAxisCount: 6),
                      itemBuilder: (context, index) {
                        return Opacity(
                          opacity:
                              _filteredDiscountList?[index].automaticApply ==
                                      "Y"
                                  ? 0.4
                                  : 1,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                disabledForegroundColor:
                                    _theme.dialogFooterInnerShadow!,
                                disabledBackgroundColor:
                                    _theme.dialogFooterInnerShadow!,
                                backgroundColor: _selectedIndex == index
                                    ? _theme.button2InnerShadow1
                                    : _theme.button1BG1,
                              ),
                              onPressed: _filteredDiscountList?[index]
                                          .automaticApply ==
                                      "Y"
                                  ? null
                                  : () {
                                      setState(() {
                                        _selectedIndex = index;
                                      });
                                    },
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Text(
                                      "${_filteredDiscountList?[index].discountName}",
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: _selectedIndex == index
                                          ? _theme.descriptionLight1!.copyWith(
                                              fontSize:
                                                  SizeConfig.getFontSize(18),
                                              color: _theme.light1)
                                          : _theme.description1!.copyWith(
                                              fontSize:
                                                  SizeConfig.getFontSize(18)),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: _filteredDiscountList?[index]
                                                .automaticApply ==
                                            "Y"
                                        ? () {}
                                        : () {
                                            showGeneralDialog(
                                                context: context,
                                                barrierDismissible: true,
                                                barrierLabel:
                                                    MaterialLocalizations.of(
                                                            context)
                                                        .modalBarrierDismissLabel,
                                                barrierColor: _theme
                                                    .dialogFooterInnerShadow!,
                                                transitionDuration:
                                                    const Duration(
                                                        milliseconds: 200),
                                                pageBuilder: (BuildContext
                                                        buildContext,
                                                    Animation animation,
                                                    Animation
                                                        secondaryAnimation) {
                                                  return DiscountDetailsDialog(
                                                      discountContainerDto:
                                                          _filteredDiscountList?[
                                                              index]);
                                                });
                                          },
                                    child: Icon(
                                      Icons.info_outline,
                                      color: _selectedIndex == index
                                          ? _theme.light1
                                          : _theme.secondaryColor,
                                      size: SizeConfig.getFontSize(30),
                                    ),
                                  )
                                ],
                              )),
                        );
                      }),
                ),
              ),
            ),
          ));
  }

  Widget _couponTabBody() {
    return SizedBox(
      child: Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding:  EdgeInsets.all(SizeConfig.getSize(5)),
              child: Text(MessagesProvider.get("Scan Coupon Number") ?? '',
                  style: _theme.heading5!
                      .copyWith(fontSize: SizeConfig.getFontSize(18))),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: SizedBox(
                  height:SizeConfig.getHeight(42),
                  child: TextFormField(
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(16),
                    ],
                    onChanged: (v){
                      setState(() {
                      });
                    },
                    style: _theme.title1!
                        .copyWith(fontSize: SizeConfig.getFontSize(18)),
                    controller: _couponTextController,
                    decoration: _textInputDecoration.copyWith(
                        suffixIcon: _couponTextController.text.isNotEmpty
                            ? InkWell(
                            onTap: () {
                              setState(() {
                                _couponTextController.clear();
                              });
                            },
                            child: Icon(Icons.cancel_outlined,
                                color: _theme.secondaryColor,
                              size: SizeConfig.getFontSize(30),))
                            : const SizedBox(),
                        suffixStyle: _theme.textFieldHintStyle
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding:const EdgeInsets.only(left :4),
                      maximumSize: Size(
                          SizeConfig.getWidth(100), SizeConfig.getHeight(42)),
                      minimumSize: Size(
                          SizeConfig.getWidth(100), SizeConfig.getHeight(42)),
                      backgroundColor: _theme.button2InnerShadow1),
                  onPressed: () async {
                    if(FocusScope.of(context).hasFocus) {
                      FocusScope.of(context).unfocus();
                    }

                    if(validateCouponText()){
                      await _getDiscountCouponDetails();

                      if (_isDiscountCouponSummarySuccess) {
                        showGeneralDialog(
                            context: context,
                            barrierDismissible: true,
                            barrierLabel: MaterialLocalizations.of(context)
                                .modalBarrierDismissLabel,
                            barrierColor: _theme.dialogFooterInnerShadow!,
                            transitionDuration:
                            const Duration(milliseconds: 200),
                            pageBuilder: (BuildContext buildContext,
                                Animation animation,
                                Animation secondaryAnimation) {
                              return CouponsDialog(
                                couponName: _couponTextController.text ?? '',
                                discountsList: _filteredDiscountList,
                                discountCouponSummaryResponse:
                                _discountCouponSummaryResponse,
                                discountContainerDto: _filteredDiscountList!
                                    .where((element) =>
                                element.discountId ==
                                    _discountCouponSummaryResponse
                                        ?.data?.discountId)
                                    .toList().isNotEmpty?_filteredDiscountList!
                                    .where((element) =>
                                element.discountId ==
                                    _discountCouponSummaryResponse
                                        ?.data?.discountId)
                                    .toList().first:null,
                                dateTimeFormat: _dateTimeFormat,
                              );
                            });
                      }
                    }


                  },
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Text(
                      MessagesProvider.get('Details').toUpperCase(),
                      style: _theme.descriptionLight1!
                          .copyWith(color: _theme.light1, fontSize: SizeConfig.getFontSize(16)),
                    ),
                  )),
            ],
          )
        ],
      ),
    );
  }

  Widget _customDivider() {
    return Container(
      height: 1,
      color: _theme.dialogFooterInnerShadow,
    );
  }

  Widget _bottomButtons() {
    return SizedBox(
      child: Padding(
        padding: EdgeInsets.all(SizeConfig.getSize(8)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.only(
                        left: SizeConfig.getWidth(4),
                        right: SizeConfig.getWidth(4)),
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    minimumSize: Size(
                        SizeConfig.getWidth(100), SizeConfig.getHeight(42)),
                    maximumSize: Size(
                        SizeConfig.getWidth(100), SizeConfig.getHeight(42)),
                    backgroundColor: _theme.button1BG1),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Text(
                    MessagesProvider.get('Cancel').toUpperCase(),
                    style: _theme.description1!
                        .copyWith(fontSize: SizeConfig.getFontSize(16)),
                  ),
                )),
            const SizedBox(
              width: 8,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    padding: EdgeInsets.only(
                        left: SizeConfig.getWidth(4),
                        right: SizeConfig.getWidth(4)),
                    minimumSize: Size(
                        SizeConfig.getWidth(100), SizeConfig.getHeight(42)),
                    maximumSize: Size(
                        SizeConfig.getWidth(100), SizeConfig.getHeight(42)),
                    backgroundColor: _theme.button2InnerShadow1),
                onPressed: _isDiscountTab
                    ? () async {
                        try {
                          if ( _filteredDiscountList![_selectedIndex].variableDiscounts == "Y") {
                            showDialog(context: context, builder: (newContext){
                              return VariableAmountDialog(title: "Variable Discount Amount", enteredText: (String? variableAmount) async{
                                Navigator.pop(newContext);
                                final transactionState =
                                context.read<TransactionCubit>();
                                transactionState
                                    .initTransactionOrderDetailsErrorString();
                                _filteredDiscountList![_selectedIndex]
                                    .couponMandatory ==
                                    "Y" ||
                                    _filteredDiscountList![_selectedIndex]
                                        .remarksMandatory ==
                                        "Y"
                                    ? showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return RemarksOrCouponDialog(
                                        title: _filteredDiscountList![
                                        _selectedIndex]
                                            .couponMandatory ==
                                            "Y"
                                            ? MessagesProvider.get(
                                            'Coupon Number')
                                            : MessagesProvider.get('Remarks'),
                                        isOkPressed: (bool? value) {
                                          _isOkPressed = value!;
                                        },
                                        enteredText: (String? value) async {
                                          setState(() {
                                            _remarkOrCouponString = value ?? '';
                                          });
                                        },
                                      );
                                    }).then((value) async {
                                  _isOkPressed
                                      ? widget.islineDiscount
                                      ? await transactionState
                                      .addDiscountForTransactionLine(
                                    approverID: widget.approverID,
                                    transactionLineId: widget
                                        .selectedTransactionLinesGroup!
                                        .transactionLines[0]
                                        .transactionLineId,
                                    discountAmount: double.parse(variableAmount??'0.00'),
                                    discountId: _filteredDiscountList!
                                        .isNotEmpty
                                        ? _filteredDiscountList![
                                    _selectedIndex]
                                        .discountId ??
                                        -1
                                        : -1,
                                    couponNumber: _filteredDiscountList![
                                    _selectedIndex]
                                        .couponMandatory ==
                                        "Y"
                                        ? _remarkOrCouponString ??
                                        ''
                                        : '',
                                    // if coupon mandatory passing coupon text
                                    remarks: _filteredDiscountList![
                                    _selectedIndex]
                                        .couponMandatory ==
                                        "N"
                                        ? _remarkOrCouponString ??
                                        ''
                                        : '', // if coupon mandatory passing remark text
                                    // transactionDiscountId:-1
                                  )
                                      : await transactionState
                                      .addDiscountForTransaction(
                                    approverID: widget.approverID,
                                    transactionDiscountId: -1,
                                    discountAmount: double.parse(variableAmount??'0.00'),
                                    discountId: _filteredDiscountList!
                                        .isNotEmpty
                                        ? _filteredDiscountList![
                                    _selectedIndex]
                                        .discountId ??
                                        -1
                                        : -1,
                                    couponNumber: _filteredDiscountList![
                                    _selectedIndex]
                                        .couponMandatory ==
                                        "Y"
                                        ? _remarkOrCouponString ??
                                        ''
                                        : '',

                                    // transactionDiscountId:-1
                                  )
                                      : null;
                                  if (transactionState.state
                                      .transactionDetailsUpdateStatusEnum ==
                                      TransactionDetailsUpdateStatusEnum
                                          .success) {
                                    Future.microtask(
                                            () => Navigator.pop(context));
                                    widget.showNotification(
                                        MessagesProvider.get(
                                            "Discount Applied"));
                                  }
                                })
                                    : widget.islineDiscount
                                    ? await transactionState
                                    .addDiscountForTransactionLine(
                                  approverID: widget.approverID,
                                  transactionLineId: widget
                                      .selectedTransactionLinesGroup!
                                      .transactionLines[0]
                                      .transactionLineId,
                                  discountAmount: double.parse(variableAmount??'0.00'),
                                  discountId:
                                  _filteredDiscountList!.isNotEmpty
                                      ? _filteredDiscountList![
                                  _selectedIndex]
                                      .discountId ??
                                      -1
                                      : -1,
                                  couponNumber: _filteredDiscountList![
                                  _selectedIndex]
                                      .couponMandatory ==
                                      "Y"
                                      ? _remarkOrCouponString ?? ''
                                      : '',
                                  // if coupon mandatory passing coupon text
                                  remarks: _filteredDiscountList![
                                  _selectedIndex]
                                      .couponMandatory ==
                                      "N"
                                      ? _remarkOrCouponString ?? ''
                                      : '', // if coupon mandatory passing remark text
                                  // transactionDiscountId:-1
                                )
                                    : await transactionState
                                    .addDiscountForTransaction(
                                approverID: widget.approverID,
                                transactionDiscountId: -1,
                                discountAmount: double.parse(variableAmount??'0.00'),
                                discountId:
                                _filteredDiscountList!.isNotEmpty
                                ? _filteredDiscountList![
                                _selectedIndex]
                                    .discountId ??
                                -1
                                    : -1,
                                couponNumber: _filteredDiscountList![
                                _selectedIndex]
                                    .couponMandatory ==
                                "Y"
                                ? _remarkOrCouponString ?? ''
                                    : '',

                                // transactionDiscountId:-1
                                );
                                if (transactionState
                                    .state.transactionDetailsUpdateStatusEnum ==
                                TransactionDetailsUpdateStatusEnum.success) {
                                Future.microtask(() => Navigator.pop(context));
                                widget.showNotification(
                                MessagesProvider.get("Discount Applied"));
                                }
                              }, );
                            });
                          }else{
                            final transactionState =
                            context.read<TransactionCubit>();
                            transactionState
                                .initTransactionOrderDetailsErrorString();
                            _filteredDiscountList![_selectedIndex]
                                .couponMandatory ==
                                "Y" ||
                                _filteredDiscountList![_selectedIndex]
                                    .remarksMandatory ==
                                    "Y"
                                ? showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return RemarksOrCouponDialog(
                                    title: _filteredDiscountList![
                                    _selectedIndex]
                                        .couponMandatory ==
                                        "Y"
                                        ? MessagesProvider.get(
                                        'Coupon Number')
                                        : MessagesProvider.get('Remarks'),
                                    isOkPressed: (bool? value) {
                                      _isOkPressed = value!;
                                    },
                                    enteredText: (String? value) async {
                                      setState(() {
                                        _remarkOrCouponString = value ?? '';
                                      });
                                    },
                                  );
                                }).then((value) async {
                              _isOkPressed
                                  ? widget.islineDiscount
                                  ? await transactionState
                                  .addDiscountForTransactionLine(
                                approverID: widget.approverID,
                                transactionLineId: widget
                                    .selectedTransactionLinesGroup!
                                    .transactionLines[0]
                                    .transactionLineId,
                                discountAmount: 0.00,
                                discountId: _filteredDiscountList!
                                    .isNotEmpty
                                    ? _filteredDiscountList![
                                _selectedIndex]
                                    .discountId ??
                                    -1
                                    : -1,
                                couponNumber: _filteredDiscountList![
                                _selectedIndex]
                                    .couponMandatory ==
                                    "Y"
                                    ? _remarkOrCouponString ??
                                    ''
                                    : '',
                                // if coupon mandatory passing coupon text
                                remarks: _filteredDiscountList![
                                _selectedIndex]
                                    .couponMandatory ==
                                    "N"
                                    ? _remarkOrCouponString ??
                                    ''
                                    : '', // if coupon mandatory passing remark text
                                // transactionDiscountId:-1
                              )
                                  : await transactionState
                                  .addDiscountForTransaction(
                                approverID: widget.approverID,
                                transactionDiscountId: -1,
                                discountAmount: 0.00,
                                remarks: _remarkOrCouponString ?? '',
                                discountId: _filteredDiscountList!
                                    .isNotEmpty
                                    ? _filteredDiscountList![
                                _selectedIndex]
                                    .discountId ??
                                    -1
                                    : -1,
                                couponNumber: _filteredDiscountList![
                                _selectedIndex]
                                    .couponMandatory ==
                                    "Y"
                                    ? _remarkOrCouponString ??
                                    ''
                                    : '',

                                // transactionDiscountId:-1
                              )
                                  : null;
                              if (transactionState.state
                                  .transactionDetailsUpdateStatusEnum ==
                                  TransactionDetailsUpdateStatusEnum
                                      .success) {
                                Future.microtask(
                                        () => Navigator.pop(context));
                                widget.showNotification(
                                    MessagesProvider.get(
                                        "Discount Applied"));
                              }
                            })
                                : widget.islineDiscount
                                ? await transactionState
                                .addDiscountForTransactionLine(
                              approverID: widget.approverID,
                              transactionLineId: widget
                                  .selectedTransactionLinesGroup!
                                  .transactionLines[0]
                                  .transactionLineId,
                              discountAmount: 0,
                              discountId:
                              _filteredDiscountList!.isNotEmpty
                                  ? _filteredDiscountList![
                              _selectedIndex]
                                  .discountId ??
                                  -1
                                  : -1,
                              couponNumber: _filteredDiscountList![
                              _selectedIndex]
                                  .couponMandatory ==
                                  "Y"
                                  ? _remarkOrCouponString ?? ''
                                  : '',
                              // if coupon mandatory passing coupon text
                              remarks: _filteredDiscountList![
                              _selectedIndex]
                                  .couponMandatory ==
                                  "N"
                                  ? _remarkOrCouponString ?? ''
                                  : '', // if coupon mandatory passing remark text
                              // transactionDiscountId:-1
                            )
                                : await transactionState
                                .addDiscountForTransaction(
                              approverID: widget.approverID,
                              transactionDiscountId: -1,
                              discountAmount: 0,
                              discountId:
                              _filteredDiscountList!.isNotEmpty
                                  ? _filteredDiscountList![
                              _selectedIndex]
                                  .discountId ??
                                  -1
                                  : -1,
                              couponNumber: _filteredDiscountList![
                              _selectedIndex]
                                  .couponMandatory ==
                                  "Y"
                                  ? _remarkOrCouponString ?? ''
                                  : '',
                              remarks: _remarkOrCouponString ?? ''
                              // transactionDiscountId:-1
                            );
                            if (transactionState
                                .state.transactionDetailsUpdateStatusEnum ==
                                TransactionDetailsUpdateStatusEnum.success) {
                              Future.microtask(() => Navigator.pop(context));
                              widget.showNotification(
                                  MessagesProvider.get("Discount Applied"));
                            }
                          }
                        } catch (e) {
                          _notificationBar.showMessage(
                              "Something went wrong!", _theme.footerBG3!);
                        }
                      }
                    : () async {
                        FocusScope.of(context).unfocus();
                        try {
                          if (validateCouponText()) {
                            await _getDiscountCouponDetails();
                            if (_isDiscountCouponSummarySuccess) {
                              if(_discountCouponSummaryResponse?.data?.status == "Used coupon" ||_discountCouponSummaryResponse?.data?.status == "Expired coupon"){
                                _notificationBar.showMessage(MessagesProvider.get("Cannot apply coupon. The status is '${_discountCouponSummaryResponse?.data?.status}' "), _theme.footerBG5!);
                              }else{
                                try {
                                  final transactionState =
                                  context.read<TransactionCubit>();
                                  transactionState
                                      .initTransactionOrderDetailsErrorString();
                                  widget.islineDiscount
                                      ? await transactionState
                                      .addDiscountForTransactionLine(
                                    approverID: widget.approverID,
                                    transactionLineId: widget
                                        .selectedTransactionLinesGroup!
                                        .transactionLines[0]
                                        .transactionLineId,
                                    discountAmount: 0,
                                    discountId:
                                    _discountCouponSummaryResponse
                                        ?.data?.discountId ??
                                        -1,
                                    couponNumber:
                                    _couponTextController.text,
                                    remarks: '',
                                  )
                                      : await transactionState
                                      .addDiscountForTransaction(
                                    approverID: widget.approverID,
                                    transactionDiscountId: -1,
                                    discountAmount: 0,
                                    discountId:
                                    _discountCouponSummaryResponse
                                        ?.data?.discountId ??
                                        -1,
                                    couponNumber:
                                    _couponTextController.text,
                                    remarks: _remarkOrCouponString ?? ''
                                  );
                                  print("text");

                                  if (transactionState.state
                                      .transactionDetailsUpdateStatusEnum ==
                                      TransactionDetailsUpdateStatusEnum
                                          .success) {
                                    Future.microtask(
                                            () => Navigator.pop(context));
                                    widget.showNotification(
                                        MessagesProvider.get("Discount Applied"));
                                  }
                                } catch (e) {
                                  _notificationBar.showMessage(
                                      "Something went wrong!", _theme.footerBG3!);
                                }
                              }

                            }

                            // if (_isDiscountCouponSummarySuccess) {
                            //   showGeneralDialog(
                            //       context: context,
                            //       barrierDismissible:
                            //           true,
                            //       barrierLabel:
                            //           MaterialLocalizations
                            //                   .of(
                            //                       context)
                            //               .modalBarrierDismissLabel,
                            //       barrierColor: _theme
                            //           .dialogFooterInnerShadow!,
                            //       transitionDuration:
                            //           const Duration(
                            //               milliseconds:
                            //                   200),
                            //       pageBuilder: (BuildContext
                            //               buildContext,
                            //           Animation
                            //               animation,
                            //           Animation
                            //               secondaryAnimation) {
                            //         return CouponsDialog(
                            //           couponName:
                            //               _couponTextController
                            //                   .text,
                            //           discountsList:
                            //               _filteredDiscountList,
                            //           discountCouponSummaryResponse:
                            //               _discountCouponSummaryResponse,
                            //           discountContainerDto: _filteredDiscountList!
                            //               .where((element) =>
                            //                   element
                            //                       .discountId ==
                            //                   _discountCouponSummaryResponse
                            //                       ?.data
                            //                       ?.discountId)
                            //               .toList()
                            //               .first,
                            //           dateTimeFormat:
                            //               _dateTimeFormat,
                            //         );
                            //       });
                            // }
                          }
                        } catch (e) {
                          _notificationBar.showMessage(
                              "Something went wrong!", _theme.footerBG3!);
                        }
                      },
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Text(
                    MessagesProvider.get('OK').toUpperCase(),
                    style: _theme.descriptionLight1!.copyWith(
                        color: _theme.light1,
                        fontSize: SizeConfig.getFontSize(16)),
                  ),
                ))
          ],
        ),
      ),
    );
  }

 bool validateCouponText(){
   if ( (_couponTextController.text.trim() == '') &&_couponTextController.text.isEmpty) {
     _notificationBar.showMessage(MessagesProvider.get('Coupon number required'), _theme.footerBG3!);
     return false;
   }
   else if ((_couponTextController.text.trim() != '') &&_couponTextController.text!.length > 15) {
     _notificationBar.showMessage(MessagesProvider.get(
         "Coupon Number must be 15 characters"), _theme.footerBG3!);
     return false;
   } else if ((_couponTextController.text.trim() != '') &&!AppConstants.alphanumericRegExpWithSpecialChar
       .hasMatch(_couponTextController.text ?? '')) {
     _notificationBar.showMessage( MessagesProvider.get(
         "Coupon should not contain any special characters"), _theme.footerBG3!);
     return false;
   } else if (_couponTextController.text.isNotEmpty && _couponTextController.text.trim() == '') {
     _notificationBar.showMessage( MessagesProvider.get(
         "Empty spaces are not allowed!"), _theme.footerBG3!);
     return false;
   }else{
     return true;
   }
  }

}


