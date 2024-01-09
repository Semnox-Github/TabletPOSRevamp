import 'package:dio/dio.dart';
import 'package:execution_context/builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:master_data/models/discount_container/discount_container_dto.dart';
import 'package:messages_data/builder.dart';
import 'package:notificationbar_ui/NotificationBar.dart';
import 'package:product_config_ui/transaction_discount_and_coupon_dialog/widgets/discount_details_section.dart';
import 'package:product_config_ui/widgets/primaryMediumButton.dart';
import 'package:product_config_ui/widgets/secondaryMediumButton.dart';
import 'package:themes_library/themes_library.dart';
import 'package:transaction_data/builder.dart';
import 'package:transaction_data/models/discount_coupon_summary/discount_coupon_summary_response.dart';
import 'package:intl/intl.dart';
import 'package:widgets_library/utils/size_config.dart';

class CouponsDialog extends StatefulWidget {
  const CouponsDialog(
      {Key? key,
        required this.dateTimeFormat,
        required this.couponName,
      required this.discountContainerDto,
      required this.discountCouponSummaryResponse,
      required this.discountsList})
      : super(key: key);
  final DiscountContainerDto? discountContainerDto;
  final DiscountCouponSummaryResponse? discountCouponSummaryResponse;
  final List<DiscountContainerDto>? discountsList;
  final String? couponName;
  final String? dateTimeFormat;

  @override
  State<CouponsDialog> createState() => _CouponsDialogState();
}

class _CouponsDialogState extends State<CouponsDialog> {
  NotificationBar? _notificationBar;
  Size? _screenSize;
  double _screenHeight = 0.0;
  double _screenWidth = 0.0;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _horizontalScroll = ScrollController();
  bool _isCouponLoading = false;
  bool _isDiscountCouponSummarySuccess = false;
  DiscountCouponSummaryResponse? _discountCouponSummaryResponse;
  TextEditingController _couponTextController = TextEditingController();
  DiscountContainerDto? discountContainerDto;
  bool _isClear = false;
  late SemnoxTheme _theme;



  @override
  void initState() {
    _couponTextController.text = widget.couponName??'';
    _notificationBar = NotificationBar(showHideSideBar: false);
    discountContainerDto = widget.discountContainerDto;
    _discountCouponSummaryResponse = widget.discountCouponSummaryResponse;
    super.initState();
  }

  _getDiscountCouponDetails() async {
    setState(() {
      _isCouponLoading = true;
    });
    // loader.showLoaderDialog(context,StringsProvider.get("fetching_coupon_details"));
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
      discountContainerDto = widget.discountsList!
          .where((element) =>
              element.discountId ==
              _discountCouponSummaryResponse?.data?.discountId)
          .toList().isNotEmpty ? widget.discountsList!
          .where((element) =>
      element.discountId ==
          _discountCouponSummaryResponse?.data?.discountId)
          .toList()
          .first:null;
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
      _notificationBar?.showMessage(
          errorString.toString(),_theme.footerBG3!);
    } catch (err) {
      _notificationBar?.showMessage(MessagesProvider.get('Something went Wrong!'),
          _theme.footerBG3!);
      setState(() {
        _isCouponLoading = false;
        _isDiscountCouponSummarySuccess = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    _screenSize = MediaQuery.of(context).size;
    _screenHeight = _screenSize!.height;
    _screenWidth = _screenSize!.width;
    _theme = Theme.of(context).extension<SemnoxTheme>()!;
    SizeConfig.init(context);
    return Material(
      color: _theme.transparentColor,
      child: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                Expanded(
                  child: Container(
                    margin:  EdgeInsets.all(SizeConfig.getSize(8)),
                    decoration: BoxDecoration(
                      color: _theme.backGroundColor,
                      borderRadius: BorderRadius.circular(SizeConfig.getSize(8)),
                    ),
                    child: Form(
                      key: _formKey,
                      child: Container(
                        decoration: BoxDecoration(
                          color:_theme.backGroundColor,
                          borderRadius: BorderRadius.circular(SizeConfig.getSize(8)),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                              child: Container(
                                height: SizeConfig.getSize(64),
                                decoration:  BoxDecoration(
                                    color:_theme.backGroundColor,
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(SizeConfig.getSize(8)),
                                        topLeft: Radius.circular(SizeConfig.getSize(8)))),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        Navigator.pop(context);
                                      },
                                      child: Container(
                                        decoration:  BoxDecoration(
                                            color: _theme.button2InnerShadow1,
                                            borderRadius: BorderRadius.only(
                                                bottomRight: Radius.circular(SizeConfig.getSize(8)),
                                                topLeft: Radius.circular(SizeConfig.getSize(8)))),
                                        constraints: const BoxConstraints(
                                          minHeight: double.infinity,
                                          maxHeight: double.infinity,
                                        ),
                                        child: Padding(
                                          padding:  EdgeInsets.only(
                                              left: SizeConfig.getSize(20), right: SizeConfig.getSize(20)),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                               Icon(
                                                Icons.arrow_back_ios,
                                                color: Colors.white,
                                                size: SizeConfig.getSize(30),
                                              ),
                                               SizedBox(
                                                width: SizeConfig.getSize(21),
                                              ),
                                              Text(
                                                MessagesProvider.get(
                                                        'Coupon Status')
                                                    .toUpperCase(),
                                                style:  _theme.headingLight4!.copyWith(color:_theme.light1,fontSize: SizeConfig.getFontSize(24)),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                     SizedBox(
                                      width: SizeConfig.getSize(8),
                                    ),
                                     Expanded(
                                      child: Container(
                                        constraints: const BoxConstraints(
                                          minHeight: double.infinity,
                                          maxHeight: double.infinity,
                                        ),
                                        decoration:  BoxDecoration(
                                            color: _theme
                                                .button1BG1,
                                            borderRadius: BorderRadius.only(
                                                topRight: Radius.circular(SizeConfig.getSize(8)),
                                                bottomLeft:
                                                    Radius.circular(SizeConfig.getSize(8)))),
                                        height: SizeConfig.getSize(64),
                                        child:  _isClear ? const SizedBox(): Scrollbar(
                                          controller: _horizontalScroll,
                                          thumbVisibility: true,
                                          interactive: true,
                                          child: SingleChildScrollView(
                                            controller: _horizontalScroll,
                                            scrollDirection: Axis.horizontal,
                                            child: Padding(
                                              padding:  EdgeInsets.all(SizeConfig.getSize(4)),
                                              child: IntrinsicHeight(
                                                child: Row(
                                                  children: [
                                                    Container(
                                                      height: 64,
                                                      decoration:  BoxDecoration(
                                                          color: _theme.checkboxLight,
                                                          borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  SizeConfig.getSize(8)))),
                                                      child: Padding(
                                                        padding:
                                                         EdgeInsets.all(SizeConfig.getSize(8)),
                                                        child: Column(
                                                          mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                          children: [
                                                            Text(
                                                                MessagesProvider.get(
                                                                    'Coupon Status'),
                                                                style: _theme.description2!.copyWith(fontSize: SizeConfig.getFontSize(16))),
                                                            Text(
                                                                '${_discountCouponSummaryResponse?.data?.status ?? ''}',
                                                                style:_theme.description1!.copyWith(fontSize: SizeConfig.getFontSize(16))),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                     SizedBox(
                                                      width: SizeConfig.getSize(4),
                                                    ),
                                                    Container(
                                                      height: SizeConfig.getSize(64),
                                                      decoration:  BoxDecoration(
                                                          color:  _theme.checkboxLight,
                                                          borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  SizeConfig.getSize(8)))),
                                                      child: Padding(
                                                        padding:
                                                         EdgeInsets.all(SizeConfig.getSize(8)),
                                                        child: Column(
                                                          mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                          children: [
                                                            Text(
                                                                MessagesProvider.get(
                                                                    'Coupon Number'),
                                                                style:_theme.description2!.copyWith(fontSize: SizeConfig.getFontSize(16))),
                                                            Text(
                                                                '${_discountCouponSummaryResponse?.data?.couponNumber ?? ''}',
                                                                style:_theme.description1!.copyWith(fontSize: SizeConfig.getFontSize(16))),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                     SizedBox(
                                                      width: SizeConfig.getSize(4),
                                                    ),
                                                    Container(
                                                      height: SizeConfig.getSize(64),
                                                      decoration:  BoxDecoration(
                                                          color:  _theme.checkboxLight,
                                                          borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  SizeConfig.getSize(8)))),
                                                      child: Padding(
                                                        padding:
                                                         EdgeInsets.all(SizeConfig.getSize(8)),
                                                        child: Column(
                                                          mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                          children: [
                                                            Text(
                                                                MessagesProvider.get(
                                                                    'Effective Date'),
                                                                style: _theme.description2!.copyWith(fontSize: SizeConfig.getFontSize(16))),
                                                            Text(
                                                                '${_discountCouponSummaryResponse?.data?.startDate == null? '':DateFormat(_getDateTimeFormat(widget.dateTimeFormat)).format(DateTime.parse(_discountCouponSummaryResponse?.data?.startDate??DateTime.now().toIso8601String()))}',
                                                                style:_theme.description1!.copyWith(fontSize: SizeConfig.getFontSize(16))),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                     SizedBox(
                                                      width: SizeConfig.getSize(4),
                                                    ),
                                                    Container(
                                                      height: SizeConfig.getSize(64),
                                                      decoration:  BoxDecoration(
                                                          color:  _theme.checkboxLight!,
                                                          borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  SizeConfig.getSize(8)))),
                                                      child: Padding(
                                                        padding:
                                                         EdgeInsets.all(SizeConfig.getSize(8)),
                                                        child: Column(
                                                          mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                          children: [
                                                            Text(
                                                                MessagesProvider.get(
                                                                    'Expiry Date'),
                                                                style:_theme.description2!.copyWith(fontSize: SizeConfig.getFontSize(16))),
                                                            Text(
                                                                '${_discountCouponSummaryResponse?.data?.expiryDate == null? '':DateFormat(_getDateTimeFormat(widget.dateTimeFormat)).format(DateTime.parse(_discountCouponSummaryResponse?.data?.expiryDate ?? DateTime.now().toIso8601String()))}',
                                                                style:_theme.description1!.copyWith(fontSize: SizeConfig.getFontSize(16))),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Padding(
                                padding:  EdgeInsets.fromLTRB(SizeConfig.getSize(8), 0, SizeConfig.getSize(8), 0),
                                child: Text(
                                  MessagesProvider.get("Coupon Number") ?? '',
                                  style:_theme.heading4!.copyWith(fontSize:SizeConfig.getFontSize(20)),
                                ),
                              ),
                            ),
                            Padding(
                              padding:  EdgeInsets.all(SizeConfig.getSize(8)),
                              child: Row(
                                children: [
                                  SizedBox(
                                    height: SizeConfig.getSize(42),
                                    width: SizeConfig.getSize(260),
                                    child: TextFormField(
                                      inputFormatters: [
                                        LengthLimitingTextInputFormatter(50),
                                      ],
                                      onChanged: (String value) {
                                        setState(() {});
                                      },
                                      style: _theme.title1!.copyWith(fontSize: SizeConfig.getFontSize(18)),
                                      controller: _couponTextController,
                                      decoration: InputDecoration(
                                        fillColor: _theme.primaryColor,
                                        filled: true,
                                        hintText: MessagesProvider.get(
                                            "Enter Text"),
                                        hintStyle:_theme.textFieldHintStyle!.copyWith(fontSize:SizeConfig.getFontSize(18)),
                                        contentPadding:  EdgeInsets.only(
                                            top: SizeConfig.getSize(5),
                                            bottom: SizeConfig.getSize(5),
                                            right: SizeConfig.getSize(5),
                                            left: SizeConfig.getSize(10)),
                                        focusedBorder:  OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(SizeConfig.getSize(8))),
                                            borderSide: BorderSide(
                                                color: _theme.secondaryColor!)),
                                        border:  OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(SizeConfig.getSize(8))),
                                            borderSide: BorderSide(
                                                color:_theme.secondaryColor!)),
                                        prefixText: ' ',
                                        suffixText: '',
                                        suffixStyle:_theme.textFieldHintStyle,
                                        suffixIcon: _couponTextController
                                                .text.isNotEmpty
                                            ? InkWell(
                                                onTap: () {
                                                  setState(() {
                                                    _couponTextController
                                                        .clear();
                                                  });
                                                },
                                                child:  Icon(
                                                    Icons.cancel_outlined,
                                                    size:SizeConfig.getSize(30),
                                                    color: _theme.secondaryColor))
                                            : const SizedBox(),
                                      ),
                                    ),
                                  ),
                                   SizedBox(
                                    width: SizeConfig.getSize(10),
                                  ),
                                  InkWell(
                                    onTap: () async {
                                      FocusScope.of(context).unfocus();
                                      if (_formKey.currentState!.validate()) {
                                        await _getDiscountCouponDetails();
                                        setState(() {
                                          _isClear = false;
                                        });
                                        if (_isDiscountCouponSummarySuccess) {

                                        }
                                      }
                                    },
                                    child: Container(
                                      height: SizeConfig.getSize(44),
                                      width: SizeConfig.getSize(44),
                                      decoration:  BoxDecoration(
                                          color: _theme.button1BG1,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(SizeConfig.getSize(8)))),
                                      child:  Center(
                                        child: Icon(
                                          Icons.search,
                                          size:SizeConfig.getSize(30)
                                        ),
                                      ),
                                    ),
                                  ),
                                   SizedBox(
                                    width: SizeConfig.getSize(10),
                                  ),
                                   PrimaryMediumButton(onPressed: (){
                                     showDialog(
                                         context: context,
                                         builder: (BuildContext context) {
                                           return FeatureNotImplementedViewDialog(
                                               MessagesProvider.get('Scan').toUpperCase());
                                         });
                                   }, text: MessagesProvider.get('Scan').toUpperCase()),
                                   SizedBox(
                                    width: SizeConfig.getSize(10),
                                  ),
                                  SecondaryMediumButton(onPressed: () async {
                                    setState(() {
                                      _discountCouponSummaryResponse = null;
                                      discountContainerDto = null;
                                      _couponTextController.clear();
                                      _isClear = true;
                                    });
                                  }, text:  MessagesProvider.get('Clear').toUpperCase(),)

                                ],
                              ),
                            ),
                            DiscountDetailsSection(
                              discountContainerDto: discountContainerDto,
                            ),
                            Container(
                              height: 1,
                            ),
                          ],
                        ),
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
                        color: Colors.black.withOpacity(.3),
                      ),
                      child: Center(
                        child: Container(
                          decoration:  BoxDecoration(
                              color:_theme.backGroundColor,
                              borderRadius:const
                                  BorderRadius.all(Radius.circular(6))),
                          width: _screenWidth * .28,
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Row(children: [
                              const SizedBox(width: 8),
                              const CircularProgressIndicator(),
                              const SizedBox(width: 24),
                              Expanded(
                                child: Text(
                                  MessagesProvider.get(
                                      "Fetching Coupon Details"),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ]),
                          ),
                        ),
                      ),
                    ))
                : const SizedBox(),

            
          ],
        ),
      ),
    );
  }

  _getDateTimeFormat(dateFormatString){
    if(dateFormatString.contains("tt")){
      final newModifiedString =  dateFormatString.replaceAll("tt", "a");
      return newModifiedString;
    }else{
      return  dateFormatString;
    }
  }

  @override
  void dispose() {
//closing cubit
    _notificationBar = null;
    super.dispose();
  }
}

class FeatureNotImplementedViewDialog extends StatefulWidget {
  final String title;

  const FeatureNotImplementedViewDialog(this.title, {super.key});

  @override
  State<StatefulWidget> createState() =>
      _FeatureNotImplementedViewDialogState();
}

class _FeatureNotImplementedViewDialogState
    extends State<FeatureNotImplementedViewDialog> {
  _FeatureNotImplementedViewDialogState();

  @override
  Widget build(BuildContext context) {
    SemnoxTheme _theme = Theme.of(context).extension<SemnoxTheme>()!;
    return AlertDialog(
      title: Text(widget.title),
      titleTextStyle: _theme.heading4,
      actions: [
        ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor:_theme.button2BG1,
              foregroundColor: _theme.primaryColor,
              textStyle:_theme.description1,
            ),
            child: Text(MessagesProvider.get("OK"))),
      ],
      content: Text(
        MessagesProvider.get("Feature not implemented."),
        style: _theme.subtitle2!.copyWith(color: _theme.light1),
      ),
    );
  }
}
