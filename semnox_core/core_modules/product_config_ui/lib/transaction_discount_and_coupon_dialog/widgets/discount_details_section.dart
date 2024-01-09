import 'package:execution_context/builder.dart';
import 'package:flutter/material.dart';
import 'package:master_data/models/discount_container/dicounted_products_container_dto.dart';
import 'package:master_data/models/discount_container/discount_container_dto.dart';
import 'package:product_menu_data/builder.dart';
import 'package:product_menu_data/models/products_container/product_container_dto.dart';
import 'package:messages_data/builder.dart';
import 'package:themes_library/themes_library.dart';
import 'package:widgets_library/scroller.dart';
import 'package:widgets_library/utils/size_config.dart';

class DiscountDetailsSection extends StatefulWidget {
  const DiscountDetailsSection({Key? key, required this.discountContainerDto})
      : super(key: key);
  final DiscountContainerDto? discountContainerDto;

  @override
  State<DiscountDetailsSection> createState() => _DiscountDetailsSectionState();
}

class _DiscountDetailsSectionState extends State<DiscountDetailsSection> {
  final _discountDetailsVerticalScrollController = ScrollController();
  final _discountDetailsHorizontalScrollController = ScrollController();
  final _productPurchaseHorizontalScrollController = ScrollController();
  bool isLoading = false;
  List<ProductContainerDTO?> _listOftransactionLineProductContainerDTO = [];
  Map<int, String> _mappedtransactionLineProductContainerDTO = {};
  List<int> _productIds = [];
  final ScrollController _horizontal = ScrollController(),
      _vertical = ScrollController();
  int? _selectedIndex ;
  late SemnoxTheme _theme;

  @override
  void initState() {
    _initProductsList();
    super.initState();
  }

  _initProductsList() async {
    setState(() {
      isLoading = true;
    });
    try {
      final execContextBL = await ExecutionContextBuilder.build();
      final execContextDTO = execContextBL.getExecutionContext();
      final productMenuDataBl =
          await ProductMenuDataBuilder.build(execContextDTO!);
      for (DiscountedProductsContainerDto element
          in widget.discountContainerDto?.discountedProductsContainerDtoList ??
              []) {
        _productIds.add(element.productId ?? -1);
      }
      _listOftransactionLineProductContainerDTO =
          await productMenuDataBl.getListOfProductContainerDetails(_productIds);
      for (var element in _listOftransactionLineProductContainerDTO) {
        _mappedtransactionLineProductContainerDTO[element?.productId??0] =
            element?.productName??'';
      }
    } catch (e) {}
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    _theme = Theme.of(context).extension<SemnoxTheme>()!;
    SizeConfig.init(context);
    return isLoading
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : Expanded(
            child: Padding(
              padding:  EdgeInsets.fromLTRB(SizeConfig.getSize(8), 0, SizeConfig.getSize(8), 0),
              child: Column(
                children: [
                  Expanded(
                      flex: 9,
                      child: SizedBox(
                        child: IntrinsicHeight(
                          child: Row(
                            children: [
                              Expanded(
                                flex: 2,
                                child: Scroller(
                                  controller:
                                      _discountDetailsVerticalScrollController,
                                  child: SingleChildScrollView(
                                    controller:
                                        _discountDetailsVerticalScrollController,
                                    scrollDirection: Axis.vertical,
                                    child: Scroller(
                                      // interactive: true,
                                      // radius: const Radius.circular(10),
                                      // thumbVisibility: true,
                                      controller:
                                          _discountDetailsHorizontalScrollController,
                                      child: SingleChildScrollView(
                                        controller:
                                            _discountDetailsHorizontalScrollController,
                                        scrollDirection: Axis.horizontal,
                                        child:widget.discountContainerDto == null ? const SizedBox(): SizedBox(
                                          width: SizeConfig.getSize(150),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              _discountDetailsTitle(
                                                  'Discount Name'),
                                              _discountDetailsDescription(widget
                                                      .discountContainerDto
                                                      ?.discountName ??
                                                  '-'),
                                               SizedBox(
                                                height: SizeConfig.getSize(12),
                                              ),
                                              _discountDetailsTitle(
                                                  'Discount Percentage'),
                                              _discountDetailsDescription(widget
                                                      .discountContainerDto
                                                      ?.discountPercentage ??
                                                  '-'),
                                               SizedBox(
                                                height: SizeConfig.getSize(12),
                                              ),
                                              _discountDetailsTitle(
                                                  'Discount Amount'),
                                              _discountDetailsDescription(
                                                  '${widget.discountContainerDto?.discountAmount ?? '-'}'),
                                              SizedBox(
                                                height: SizeConfig.getSize(12),
                                              ),
                                              _discountDetailsTitle(
                                                  'Minimum Sale Amount'),
                                              _discountDetailsDescription(widget
                                                      .discountContainerDto
                                                      ?.minimumSaleAmount ??
                                                  '-'),
                                              SizedBox(
                                                height: SizeConfig.getSize(12),
                                              ),
                                              _discountDetailsTitle(
                                                  'Discount Id'),
                                              _discountDetailsDescription(widget
                                                      .discountContainerDto
                                                      ?.discountId ??
                                                  '-'),
                                              SizedBox(
                                                height: SizeConfig.getSize(12),
                                              ),
                                              _discountDetailsTitle(
                                                  'Manager Approval Required'),
                                              _discountDetailsDescription(widget
                                                      .discountContainerDto
                                                      ?.managerApprovalRequired ??
                                                  '-'),
                                              SizedBox(
                                                height: SizeConfig.getSize(12),
                                              ),
                                              _discountDetailsTitle(
                                                  'Remarks Mandatory'),
                                              _discountDetailsDescription(widget
                                                      .discountContainerDto
                                                      ?.remarksMandatory ??
                                                  '-'),
                                              SizedBox(
                                                height: SizeConfig.getSize(12),
                                              ),
                                              _discountDetailsTitle(
                                                  'Minimum Credits'),
                                              _discountDetailsDescription(widget
                                                      .discountContainerDto
                                                      ?.minimumCredits ??
                                                  '-'),
                                              SizedBox(
                                                height: SizeConfig.getSize(12),
                                              ),
                                              _discountDetailsTitle(
                                                  'Coupon Mandatory'),
                                              _discountDetailsDescription(widget
                                                      .discountContainerDto
                                                      ?.couponMandatory ??
                                                  '-'),
                                              SizedBox(
                                                height: SizeConfig.getSize(12),
                                              ),
                                              _discountDetailsTitle(
                                                  'Discount Type'),
                                              _discountDetailsDescription(widget
                                                      .discountContainerDto
                                                      ?.discountType ??
                                                  '-'),
                                              SizedBox(
                                                height: SizeConfig.getSize(12),
                                              ),
                                              _discountDetailsTitle(
                                                  'Application Limit'),
                                              _discountDetailsDescription(widget
                                                      .discountContainerDto
                                                      ?.applicationLimit ??
                                                  '-'),
                                              SizedBox(
                                                height: SizeConfig.getSize(12),
                                              ),
                                              _discountDetailsTitle(
                                                  'Automatic Apply'),
                                              _discountDetailsDescription(widget
                                                      .discountContainerDto
                                                      ?.automaticApply ??
                                                  '-'),
                                              SizedBox(
                                                height: SizeConfig.getSize(12),
                                              ),
                                              _discountDetailsTitle(
                                                  'Display In POS'),
                                              _discountDetailsDescription(widget
                                                      .discountContainerDto
                                                      ?.displayInPos ??
                                                  '-'),
                                              SizedBox(
                                                height: SizeConfig.getSize(12),
                                              ),
                                              _discountDetailsTitle(
                                                  'Allow Multiple Application'),
                                              _discountDetailsDescription(widget
                                                      .discountContainerDto
                                                      ?.allowMultipleApplication ??
                                                  '-'),
                                              SizedBox(
                                                height: SizeConfig.getSize(12),
                                              ),
                                              _discountDetailsTitle(
                                                  'Transaction Profile Id'),
                                              _discountDetailsDescription(widget
                                                      .discountContainerDto
                                                      ?.transactionProfileId ??
                                                  '-'),
                                              SizedBox(
                                                height: SizeConfig.getSize(12),
                                              ),
                                              _discountDetailsTitle(
                                                  'Variable Discount'),
                                              _discountDetailsDescription(widget
                                                      .discountContainerDto
                                                      ?.variableDiscounts ??
                                                  '-'),
                                              SizedBox(
                                                height: SizeConfig.getSize(12),
                                              ),
                                              _discountDetailsTitle(
                                                  'Discount Criteria lines'),
                                              _discountDetailsDescription(widget
                                                      .discountContainerDto
                                                      ?.discountCriteriaLines ??
                                                  '-'),
                                              SizedBox(
                                                height: SizeConfig.getSize(12),
                                              ),
                                              _discountDetailsTitle('Scheduled'),
                                              _discountDetailsDescription(widget
                                                      .discountContainerDto
                                                      ?.scheduleId ??
                                                  '-'),
                                              SizedBox(
                                                height: SizeConfig.getSize(12),
                                              ),
                                              _discountDetailsTitle(
                                                  'Discount Purchase Criteria Count'),
                                              _discountDetailsDescription(widget
                                                      .discountContainerDto
                                                      ?.discountPurchaseCriteriaCount ??
                                                  '-'),
                                              SizedBox(
                                                height: SizeConfig.getSize(12),
                                              ),
                                              _discountDetailsTitle(
                                                  'Discount Purchase Criteria Quantity Count'),
                                              _discountDetailsDescription(widget
                                                      .discountContainerDto
                                                      ?.discountPurchaseCriteriaQuantityCount ??
                                                  '-'),
                                              SizedBox(
                                                height: SizeConfig.getSize(12),
                                              ),
                                              _discountDetailsTitle(
                                                  'Discount Purchase Criteria Validity Count'),
                                              _discountDetailsDescription(widget
                                                      .discountContainerDto
                                                      ?.discountPurchaseCriteriaValidityQuantityCount ??
                                                  '-'),
                                              SizedBox(
                                                height: SizeConfig.getSize(12),
                                              ),
                                              _discountDetailsTitle(
                                                  'Override Discount Amount Exists'),
                                              _discountDetailsDescription(widget
                                                      .discountContainerDto
                                                      ?.overridingDiscountAmountExists ??
                                                  '-'),
                                              SizedBox(
                                                height: SizeConfig.getSize(12),
                                              ),
                                              _discountDetailsTitle(
                                                  'Override Discount Price Exists'),
                                              _discountDetailsDescription(widget
                                                      .discountContainerDto
                                                      ?.overridingDiscountedPriceExists ??
                                                  '-'),
                                              SizedBox(
                                                height: SizeConfig.getSize(12),
                                              ),
                                              _discountDetailsTitle(
                                                  'Override Discount Percentage Exists'),
                                              _discountDetailsDescription(widget
                                                      .discountContainerDto
                                                      ?.overridingDiscountPercentageExists ??
                                                  '-'),
                                              SizedBox(
                                                height: SizeConfig.getSize(12),
                                              ),
                                              _discountDetailsTitle('Sort Order'),
                                              _discountDetailsDescription(widget
                                                      .discountContainerDto
                                                      ?.sortOrder ??
                                                  '-'),
                                              SizedBox(
                                                height: SizeConfig.getSize(12),
                                              ),
                                              _discountDetailsTitle(
                                                  'Transaction Discount Type'),
                                              _discountDetailsDescription(widget
                                                      .discountContainerDto
                                                      ?.transactionDiscountType ??
                                                  '-'),
                                              SizedBox(
                                                height: SizeConfig.getSize(12),
                                              ),
                                              _discountDetailsTitle(
                                                  'All Products are Discounted'),
                                              _discountDetailsDescription(widget
                                                      .discountContainerDto
                                                      ?.allProductsAreDiscounted ??
                                                  '-'),
                                              SizedBox(
                                                height: SizeConfig.getSize(40),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                width: SizeConfig.getWidth(4),
                                color:_theme.light2,
                              ),
                              Expanded(
                                  flex: 3,
                                  child: Column(
                                    // shrinkWrap: true,
                                    // physics: NeverScrollableScrollPhysics(),
                                    children: [
                                      Container(
                                        height: SizeConfig.getSize(40),
                                        width: double.infinity,
                                        decoration:  BoxDecoration(
                                            color:_theme.button1BG1,
                                            borderRadius: BorderRadius.only(
                                                bottomRight: Radius.circular( SizeConfig.getSize(8)),
                                                bottomLeft:
                                                    Radius.circular( SizeConfig.getSize(8)))),
                                        child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: Padding(
                                            padding:  EdgeInsets.only(left: SizeConfig.getSize(24)),
                                            child: Text(
                                              MessagesProvider.get(
                                                  'Product Purchase Criteria'),
                                              style: _theme.heading5!.copyWith(fontSize:SizeConfig.getFontSize(18)),
                                            ),
                                          ),
                                        ),
                                      ),
                                       SizedBox(height:  SizeConfig.getSize(5),),
                                      IntrinsicHeight(
                                        child: Row(
                                          children: [
                                            Expanded(
                                              flex: 60,
                                              child: Column(
                                                children: [
                                                  Padding(
                                                    padding:
                                                         EdgeInsets.all(SizeConfig.getSize(6)),
                                                    child: Row(
                                                      children: [
                                                        Expanded(
                                                            flex: 2,
                                                            child: Text(
                                                              MessagesProvider
                                                                  .get(
                                                                      'Product'),
                                                              style:_theme.heading5!.copyWith(fontSize: SizeConfig.getSize(18)),
                                                            )),
                                                        Expanded(
                                                            flex: 2,
                                                            child: Text(
                                                              MessagesProvider.get(
                                                                  'Category'),
                                                              style:_theme.heading5!.copyWith(fontSize: SizeConfig.getSize(18)),
                                                            )),
                                                        const SizedBox(
                                                          width: 10,
                                                        ),
                                                        Expanded(
                                                            flex: 2,
                                                            child: Text(
                                                              MessagesProvider.get(
                                                                  'Min\nQuantity'),
                                                              maxLines: 2,
                                                              style:_theme.heading5!.copyWith(fontSize: SizeConfig.getSize(18)),
                                                            ))
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                       SizedBox(height: SizeConfig.getSize(10),),
                                      Expanded(
                                        child: Scrollbar(
                                          interactive: true,
                                          radius:  Radius.circular(SizeConfig.getSize(8)),
                                          thumbVisibility: true,
                                          controller:
                                              _productPurchaseHorizontalScrollController,
                                          child: Row(
                                            children: [
                                              Expanded(
                                                flex: 60,
                                                child: Padding(
                                                  padding:
                                                       EdgeInsets.only(
                                                          left:SizeConfig.getSize(6), right: SizeConfig.getSize(6)),
                                                  child: ListView.builder(
                                                      controller:
                                                          _productPurchaseHorizontalScrollController,
                                                      itemCount: widget
                                                              .discountContainerDto
                                                              ?.discountPurchaseCriteriaContainerDtoList
                                                              .length ??
                                                          0,
                                                      physics: ScrollPhysics(),
                                                      itemBuilder:
                                                          (context, index) {
                                                        final purchaseList = widget
                                                            .discountContainerDto
                                                            ?.discountPurchaseCriteriaContainerDtoList;
                                                        return Padding(
                                                          padding:
                                                               EdgeInsets
                                                                      .only(
                                                                  bottom: SizeConfig.getSize(6)),
                                                          child:
                                                              IntrinsicHeight(
                                                            child: Container(
                                                              decoration:  BoxDecoration(
                                                                  color:_theme.button1BG1,
                                                                  borderRadius:
                                                                      BorderRadius.all(
                                                                          Radius.circular(
                                                                              SizeConfig.getSize(8)))),
                                                              child: Padding(
                                                                padding:
                                                                     EdgeInsets
                                                                            .all(
                                                                        SizeConfig.getSize(8)),
                                                                child: Row(
                                                                  children: [
                                                                    Expanded(
                                                                        flex: 2,
                                                                        child:
                                                                            Text(
                                                                          "${_mappedtransactionLineProductContainerDTO[purchaseList![index].productId]}",
                                                                          style:_theme.subtitle2!.copyWith(fontSize:SizeConfig.getFontSize(16))!.copyWith(fontSize:SizeConfig.getFontSize(16)),
                                                                              maxLines: 2,
                                                                              overflow: TextOverflow.ellipsis,
                                                                        )),
                                                                    Expanded(
                                                                        flex: 2,
                                                                        child: Text(
                                                                            "${purchaseList![index].categoryId == -1 ? '-ALL-' : '-'}",
                                                                            style:_theme.subtitle2!.copyWith(fontSize:SizeConfig.getFontSize(16)))),
                                                                    Expanded(
                                                                        flex: 2,
                                                                        child: Text(
                                                                            "${purchaseList![index].minQuantity}",
                                                                            style:_theme.subtitle2!.copyWith(fontSize:SizeConfig.getFontSize(16)))),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        );
                                                      }),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  )),
                              Container(
                                width: SizeConfig.getSize(4),
                                color:_theme.dialogFooterInnerShadow,
                              ),
                              Container(
                                width: SizeConfig.getSize(4),
                              ),
                              Expanded(
                                  flex:5,
                                  child: Column(children: [
                                    Container(
                                      height: SizeConfig.getSize(40),
                                      width: double.infinity,
                                      decoration:  BoxDecoration(
                                          color: _theme.button1BG1,
                                          borderRadius:
                                          BorderRadius.only(
                                              bottomRight: Radius
                                                  .circular(SizeConfig.getSize(8)),
                                              bottomLeft:
                                              Radius.circular(
                                                  SizeConfig.getSize(8)))),
                                      child:
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: Padding(
                                          padding:  EdgeInsets.only(left:SizeConfig.getSize(24)),
                                          child: Text(
                                            MessagesProvider.get(
                                                'Discounted Products'),
                                            style:_theme.heading5!.copyWith(fontSize: SizeConfig.getSize(18)),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height:  SizeConfig.getSize(5),),
                                    IntrinsicHeight(
                                      child: Row(
                                        children: [
                                          SizedBox(
                                            width: SizeConfig.getSize(97),
                                            child: Text(MessagesProvider.get('Category'),
                                              overflow: TextOverflow.ellipsis,
                                              style:_theme.heading5!.copyWith(fontSize: SizeConfig.getSize(18)),
                                            ),
                                          ),
                                          SizedBox(
                                            width: SizeConfig.getSize(97),
                                            child: Text(
                                              MessagesProvider.get(
                                                  'Product'),
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                              style: _theme.heading5!.copyWith(fontSize: SizeConfig.getSize(18)),
                                            ),
                                          ),
                                          SizedBox(
                                            width: SizeConfig.getSize(97),
                                            child:Text(
                                              MessagesProvider.get(
                                                  'Quantity'),
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                              style:_theme.heading5!.copyWith(fontSize: SizeConfig.getSize(18)),
                                            ),
                                          ),
                                          SizedBox(
                                            width: SizeConfig.getSize(97),
                                            child:Text(
                                              MessagesProvider.get(
                                                  'Discount percent'),
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                              style:_theme.heading5!.copyWith(fontSize: SizeConfig.getSize(18)),
                                            ),
                                          ),
                                          SizedBox(
                                            width: SizeConfig.getSize(97),
                                            child:Text(
                                              MessagesProvider.get(
                                                  'Discount amount'),
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                              style:_theme.heading5!.copyWith(fontSize: SizeConfig.getSize(18)),
                                            ),
                                          ),
                                          SizedBox(
                                            width: SizeConfig.getSize(97),
                                            child:Text(
                                              MessagesProvider.get(
                                                  'Discount price'),
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                              style:_theme.heading5!.copyWith(fontSize: SizeConfig.getSize(18)),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height:  SizeConfig.getSize(20),),
                                    Expanded(
                                      child: Scroller(
                                        controller: _vertical,
                                        child: ListView.builder(
                                            controller: _vertical,
                                            itemCount:( widget
                                                .discountContainerDto
                                                ?.discountedProductsContainerDtoList ??
                                                []).length,
                                            physics: ScrollPhysics(),
                                            itemBuilder:
                                                (context, index) {
                                              final discountData = (widget
                                                  .discountContainerDto
                                                  ?.discountedProductsContainerDtoList ??
                                                  [])[index];
                                              return InkWell(
                                                onTap:(){
                                                  setState(() {
                                                    _selectedIndex = index;
                                                  });
                                                },
                                                child: Container(
                                                  decoration:  BoxDecoration(
                                                      color:_theme.button1BG1,
                                                      border: Border.all(width: 1,color: _selectedIndex == index ? _theme.secondaryColor!: Colors.transparent ),
                                                      borderRadius:
                                                      BorderRadius.all(
                                                        Radius
                                                            .circular(SizeConfig.getSize(8)),
                                                      )),
                                                  child: Padding(
                                                    padding:  EdgeInsets.all(SizeConfig.getSize(6)),
                                                    child: Row(
                                                      children: [
                                                        SizedBox(
                                                          width: SizeConfig.getSize(97),
                                                          child: Text(
                                                            "${discountData.categoryId == -1 ? '-ALL-' : '-'}",
                                                            maxLines: 2,
                                                            overflow: TextOverflow.ellipsis,
                                                            style:_theme.subtitle2!.copyWith(fontSize:SizeConfig.getFontSize(16))!,
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: SizeConfig.getSize(97),
                                                          child: Text(
                                                            "${_mappedtransactionLineProductContainerDTO[discountData.productId] == null?'':_mappedtransactionLineProductContainerDTO[discountData.productId]}",
                                                            maxLines: 2,
                                                            overflow: TextOverflow.ellipsis,
                                                            style:_theme.subtitle2!.copyWith(fontSize:SizeConfig.getFontSize(16))!,
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: SizeConfig.getSize(97),
                                                          child: Text(
                                                            "${discountData.quantity ?? ''}",
                                                            maxLines: 2,
                                                            overflow: TextOverflow.ellipsis,
                                                            style:_theme.subtitle2!.copyWith(fontSize:SizeConfig.getFontSize(16))!,
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: SizeConfig.getSize(97),
                                                          child: Text(
                                                            "${discountData.discountPercentage ?? ''}",
                                                            maxLines: 2,
                                                            overflow: TextOverflow.ellipsis,
                                                            style: _theme.subtitle2!.copyWith(fontSize:SizeConfig.getFontSize(16))!,
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: SizeConfig.getSize(97),
                                                          child: Text(
                                                            "${discountData.discountAmount ?? ''}",
                                                            maxLines: 2,
                                                            overflow: TextOverflow.ellipsis,
                                                            style:_theme.subtitle2!.copyWith(fontSize:SizeConfig.getFontSize(16))!,
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: SizeConfig.getSize(97),
                                                          child: Text(
                                                            "${discountData.discountedPrice ?? ''}",
                                                            maxLines: 2,
                                                            overflow: TextOverflow.ellipsis,
                                                            style:_theme.subtitle2!.copyWith(fontSize:SizeConfig.getFontSize(16))!,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              );
                                            }),
                                      ),
                                    ),
                                  ],)),
                            ],
                          ),
                        ),
                      )),
                ],
              ),
            ),
          );
  }

  Widget _discountDetailsTitle(String? text) {
    return Text(
      text ?? '',
      textAlign: TextAlign.left,
      style:_theme.description2!.copyWith(fontSize: SizeConfig.getFontSize(16))
    );
  }

  Widget _discountDetailsDescription(text) {
    return Text(
      '${text.toString().toCapitalized() ?? ' - '}',
      textAlign: TextAlign.left,
      style: _theme.description1!.copyWith(fontSize: SizeConfig.getFontSize(16)),
    );
  }
}

extension StringCasingExtension on String {
  String toCapitalized() => length > 0 ?'${this[0].toUpperCase()}${substring(1).toLowerCase()}':'';
  String toTitleCase() => replaceAll(RegExp(' +'), ' ').split(' ').map((str) => str.toCapitalized()).join(' ');
}
