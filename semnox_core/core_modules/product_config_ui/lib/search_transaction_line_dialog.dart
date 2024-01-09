import 'package:execution_context/builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:master_data/builder.dart';
import 'package:master_data/models/segment_category_container/segment_category_container_response.dart';
import 'package:notificationbar_ui/NotificationBar.dart';
import 'package:product_config_ui/widgets/primaryLargeButton.dart';
import 'package:product_config_ui/widgets/secondaryLargeButton.dart';
import 'package:product_menu_data/builder.dart';
import 'package:product_menu_data/models/products_container/product_container_dto.dart';
import 'package:messages_data/builder.dart';
import 'package:themes_library/themes_library.dart';
import 'package:transaction_ui/cubit/transaction_cubit.dart';
import 'package:logs_data/logger.dart';
import 'package:transaction_ui/models/transaction_lines_group.dart';
import 'package:widgets_library/scroller.dart';
import 'package:widgets_library/utils/size_config.dart';

class SearchTransactionLineDialog extends StatefulWidget {
  const SearchTransactionLineDialog({Key? key, required this.onConfirm, required this.onCancel, required this.onError})
      : super(key: key);
  final Function onConfirm;
  final Function onCancel;
  final Function onError;

  @override
  State<SearchTransactionLineDialog> createState() => _SearchTransactionLineDialogState();
}

class _SearchTransactionLineDialogState extends State<SearchTransactionLineDialog> {
  late Size _screenSize;
  double? _screenHeight;
  double? _screenWidth;
  TextEditingController _searchTextController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _isSegmentProductExists = false;
  List<TransactionLinesGroup> _listTransactionLineGroup = [];
  bool _isLoading = false;
  SegmentCategoryContainerResponse? _segmentCategoryContainerResponse;
  String? _segmentDropDownValue;
  late SemnoxTheme _theme;
  List<int> _productSegmentIDs = [];
  List<String?> _segmentDropDownItems = [];
  List<String?> _segmentListItems = [];
  List<int> _selectedSegmentProductIds = [];
  int? _selectedIndex;
  List<ProductContainerDTO?> _listOftransactionLineProductContainerDTO = [];
  List<int> _lineGroupProductIds = [];
  List<int> _searchedListProductIds = [];
  final _scrollController = ScrollController();
  late NotificationBar _notificationBar;

  @override
  void initState() {
    super.initState();
    _notificationBar = NotificationBar(showHideSideBar: false);
    initDropDownList();
  }

  Future<void> initDropDownList() async {
    setState(() {
      _isLoading = true;
    });
    try {
      final TransactionCubit transactionCubit = context.read<TransactionCubit>();
      transactionCubit.state.transactionLinesGroupsBySeat?.forEach((key, value) {
        if (value.isNotEmpty || value != null) {
          for (var element in value) {
            _lineGroupProductIds.add(element.productId);
            _listTransactionLineGroup.add(element);
            if (element.transactionLines.isNotEmpty || element.transactionLines != null) {
              for (var transactionDTO in element.transactionLines) {
                if (transactionDTO.productSegmentId > 0) {
                  _isSegmentProductExists = true;
                  _productSegmentIDs.add(transactionDTO.productSegmentId);
                }
              }
            }
          }
        }
      });
      var execContextBL = await ExecutionContextBuilder.build();
      var execContextDTO = execContextBL.getExecutionContext();
      var productMenuDataBl = await ProductMenuDataBuilder.build(execContextDTO!);
      _listOftransactionLineProductContainerDTO =
          await productMenuDataBl.getListOfProductContainerDetails(_lineGroupProductIds); //to get Line products dto ...

      if (_productSegmentIDs.isNotEmpty) {
        var masterDataBl = await MasterDataBuilder.build(execContextDTO!);
        _segmentCategoryContainerResponse = await masterDataBl.getSegmentCategoryContainer();
        // Log.v("print list: ${_segmentCategoryContainerResponse}");
        for (var segmentData in _segmentCategoryContainerResponse!.data!.segmentCategoryContainerDTOList) {
          if (_productSegmentIDs.contains(segmentData.segmentCategoryId)) {
            segmentData.segmentName1 != null && segmentData.segmentValue1 != null && segmentData.segmentValue1 != ''
                ? _segmentDropDownItems.add(segmentData.segmentName1)
                : null;
            segmentData.segmentName2 != null && segmentData.segmentValue2 != null && segmentData.segmentValue2 != ''
                ? _segmentDropDownItems.add(segmentData.segmentName2)
                : null;
            segmentData.segmentName3 != null && segmentData.segmentValue3 != null && segmentData.segmentValue3 != ''
                ? _segmentDropDownItems.add(segmentData.segmentName3)
                : null;
            segmentData.segmentName4 != null && segmentData.segmentValue4 != null && segmentData.segmentValue4 != ''
                ? _segmentDropDownItems.add(segmentData.segmentName4)
                : null;
            segmentData.segmentName5 != null && segmentData.segmentValue5 != null && segmentData.segmentValue5 != ''
                ? _segmentDropDownItems.add(segmentData.segmentName5)
                : null;
            segmentData.segmentName6 != null && segmentData.segmentValue6 != null && segmentData.segmentValue6 != ''
                ? _segmentDropDownItems.add(segmentData.segmentName6)
                : null;
            segmentData.segmentName7 != null && segmentData.segmentValue7 != null && segmentData.segmentValue7 != ''
                ? _segmentDropDownItems.add(segmentData.segmentName7)
                : null;
            segmentData.segmentName8 != null && segmentData.segmentValue8 != null && segmentData.segmentValue8 != ''
                ? _segmentDropDownItems.add(segmentData.segmentName8)
                : null;
            segmentData.segmentName9 != null && segmentData.segmentValue9 != null && segmentData.segmentValue9 != ''
                ? _segmentDropDownItems.add(segmentData.segmentName9)
                : null;
            segmentData.segmentName10 != null && segmentData.segmentValue10 != null && segmentData.segmentValue10 != ''
                ? _segmentDropDownItems.add(segmentData.segmentName10)
                : null;
          }
        }
      }

      _segmentListItems = [];
      if (_segmentDropDownItems.isNotEmpty) {
        _segmentDropDownValue = _segmentDropDownItems[0];
        for (var segmentData in _segmentCategoryContainerResponse!.data!.segmentCategoryContainerDTOList) {
          if (_productSegmentIDs.contains(segmentData.segmentCategoryId)) {
            _segmentDropDownValue == segmentData.segmentName1 &&
                    segmentData.segmentValue1 != null &&
                    segmentData.segmentValue1 != ''
                ? _segmentListItems.add(segmentData.segmentValue1)
                : null;
            _segmentDropDownValue == segmentData.segmentName2 &&
                    segmentData.segmentValue2 != null &&
                    segmentData.segmentValue2 != ''
                ? _segmentListItems.add(segmentData.segmentValue2)
                : null;
            _segmentDropDownValue == segmentData.segmentName3 &&
                    segmentData.segmentValue3 != null &&
                    segmentData.segmentValue3 != ''
                ? _segmentListItems.add(segmentData.segmentValue3)
                : null;
            _segmentDropDownValue == segmentData.segmentName4 &&
                    segmentData.segmentValue4 != null &&
                    segmentData.segmentValue4 != ''
                ? _segmentListItems.add(segmentData.segmentValue4)
                : null;
            _segmentDropDownValue == segmentData.segmentName5 &&
                    segmentData.segmentValue5 != null &&
                    segmentData.segmentValue5 != ''
                ? _segmentListItems.add(segmentData.segmentValue5)
                : null;
            _segmentDropDownValue == segmentData.segmentName6 &&
                    segmentData.segmentValue6 != null &&
                    segmentData.segmentValue6 != ''
                ? _segmentListItems.add(segmentData.segmentValue6)
                : null;
            _segmentDropDownValue == segmentData.segmentName7 &&
                    segmentData.segmentValue7 != null &&
                    segmentData.segmentValue7 != ''
                ? _segmentListItems.add(segmentData.segmentValue7)
                : null;
            _segmentDropDownValue == segmentData.segmentName8 &&
                    segmentData.segmentValue8 != null &&
                    segmentData.segmentValue8 != ''
                ? _segmentListItems.add(segmentData.segmentValue8)
                : null;
            _segmentDropDownValue == segmentData.segmentName9 &&
                    segmentData.segmentValue9 != null &&
                    segmentData.segmentValue9 != ''
                ? _segmentListItems.add(segmentData.segmentValue9)
                : null;
            _segmentDropDownValue == segmentData.segmentName10 &&
                    segmentData.segmentValue10 != null &&
                    segmentData.segmentValue4 != ''
                ? _segmentListItems.add(segmentData.segmentValue10)
                : null;

            _selectedIndex = 0;

            List<int> _segmentIds = [];
            for (var segmentData in _segmentCategoryContainerResponse!.data!.segmentCategoryContainerDTOList) {
              if (_productSegmentIDs.contains(segmentData.segmentCategoryId)) {
                if (segmentData.segmentValue1 == _segmentListItems[0]) {
                  _segmentIds.add(segmentData.segmentCategoryId);
                }
                if (segmentData.segmentValue2 == _segmentListItems[0]) {
                  _segmentIds.add(segmentData.segmentCategoryId);
                }
                if (segmentData.segmentValue3 == _segmentListItems[0]) {
                  _segmentIds.add(segmentData.segmentCategoryId);
                }
                if (segmentData.segmentValue4 == _segmentListItems[0]) {
                  _segmentIds.add(segmentData.segmentCategoryId);
                }
                if (segmentData.segmentValue5 == _segmentListItems[0]) {
                  _segmentIds.add(segmentData.segmentCategoryId);
                }
                if (segmentData.segmentValue6 == _segmentListItems[0]) {
                  _segmentIds.add(segmentData.segmentCategoryId);
                }
                if (segmentData.segmentValue7 == _segmentListItems[0]) {
                  _segmentIds.add(segmentData.segmentCategoryId);
                }
                if (segmentData.segmentValue8 == _segmentListItems[0]) {
                  _segmentIds.add(segmentData.segmentCategoryId);
                }
                if (segmentData.segmentValue9 == _segmentListItems[0]) {
                  _segmentIds.add(segmentData.segmentCategoryId);
                }
                if (segmentData.segmentValue10 == _segmentListItems[0]) {
                  _segmentIds.add(segmentData.segmentCategoryId);
                }
              }
            }
            Log.v("_segmentIds :$_segmentIds");
            final TransactionCubit transactionCubit = context.read<TransactionCubit>();
            transactionCubit.state.transactionLinesGroupsBySeat?.forEach((key, value) {
              if (value.isNotEmpty || value != null) {
                for (var element in value) {
                  _listTransactionLineGroup.add(element);
                  if (element.transactionLines.isNotEmpty || element.transactionLines != null) {
                    for (var transactionDTO in element.transactionLines) {
                      if (transactionDTO.productSegmentId > 0) {
                        if (_segmentIds.contains(transactionDTO.productSegmentId)) {
                          _selectedSegmentProductIds.add(transactionDTO.productId);
                        }
                      }
                    }
                  }
                }
              }
            });
            _selectedSegmentProductIds = _selectedSegmentProductIds.toSet().toList();
          }
        }
      }
    } catch (e) {}
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    _theme = Theme.of(context).extension<SemnoxTheme>()!;
    _screenSize = MediaQuery.of(context).size;
    _screenHeight = _screenSize.height;
    _screenWidth = _screenSize.width;
    SizeConfig.init(context);
    return WillPopScope(
      onWillPop: () async => false,
      child: Material(
        color: _theme.transparentColor,
        child: SizedBox(
          child: Scaffold(
              resizeToAvoidBottomInset: false,
              bottomNavigationBar: SizedBox(child: _notificationBar),
              backgroundColor: _theme.transparentColor,
              body: Center(
                child: Container(
                  width: SizeConfig.getWidth(600),
                  height: SizeConfig.getHeight(470),
                  decoration:
                      BoxDecoration(color: _theme.backGroundColor, borderRadius: BorderRadius.circular(SizeConfig.getSize(8))),
                  child: _isLoading
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : Padding(
                          padding: EdgeInsets.only(right: SizeConfig.getSize(5), left: SizeConfig.getSize(5)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              SizedBox(
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.all(
                                        SizeConfig.getSize(10),
                                      ),
                                      child: Text(
                                        MessagesProvider.get('Search Transaction Lines').toUpperCase(),
                                        style: _theme.heading3!.copyWith(fontSize: SizeConfig.getFontSize(22)),
                                      ),
                                    ),
                                    Container(
                                      height: 1,
                                      width: _screenWidth,
                                      color: _theme.dialogFooterInnerShadow,
                                    ),
                                    Form(
                                      key: _formKey,
                                      child: Padding(
                                        padding: EdgeInsets.all(
                                          SizeConfig.getSize(10),
                                        ),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            Align(
                                              alignment: Alignment.centerLeft,
                                              child: Text(
                                                MessagesProvider.get('Product Search'),
                                                style: _theme.heading6!.copyWith(fontSize: SizeConfig.getFontSize(18)),
                                              ),
                                            ),
                                            SizedBox(
                                              height: SizeConfig.getSize(10),
                                            ),
                                            SizedBox(
                                              height: SizeConfig.getHeight(42),
                                              child: TextFormField(
                                                inputFormatters: [
                                                  LengthLimitingTextInputFormatter(100),
                                                ],
                                                onChanged: (value) {
                                                  setState(() {});
                                                },
                                                autovalidateMode: AutovalidateMode.onUserInteraction,
                                                controller: _searchTextController,
                                                style: _theme.title1!.copyWith(fontSize: SizeConfig.getFontSize(18)),
                                                decoration: InputDecoration(
                                                  fillColor: _theme.primaryColor,
                                                  filled: true,
                                                  hintText: MessagesProvider.get(
                                                      "Search Product Name / Description / Search Description / HsnSacCode / BarCode"),
                                                  hintStyle: _theme.textFieldHintStyle!
                                                      .copyWith(fontSize: SizeConfig.getFontSize(16)),
                                                  contentPadding: const EdgeInsets.only(left: 5, right: 5),
                                                  focusedBorder: OutlineInputBorder(
                                                      borderRadius: BorderRadius.circular(SizeConfig.getSize(10)),
                                                      borderSide: BorderSide(
                                                        width: 1,
                                                        color: _theme.secondaryColor!,
                                                      )),
                                                  enabledBorder: OutlineInputBorder(
                                                      borderRadius: BorderRadius.circular(SizeConfig.getSize(10)),
                                                      borderSide: BorderSide(
                                                        width: 1,
                                                        color: _theme.secondaryColor!,
                                                      )),
                                                  border: OutlineInputBorder(
                                                    borderRadius: BorderRadius.circular(SizeConfig.getSize(10)),
                                                    borderSide: BorderSide(
                                                      width: 1,
                                                      color: _theme.secondaryColor!,
                                                    ),
                                                  ),
                                                  suffixIcon: _searchTextController.text.isNotEmpty
                                                      ? InkWell(
                                                          onTap: () {
                                                            setState(() {
                                                              _searchTextController.clear();
                                                              _selectedIndex = 0;
                                                            });
                                                          },
                                                          child: Icon(Icons.cancel_outlined,
                                                              size: SizeConfig.getSize(25), color: _theme.secondaryColor))
                                                      : const SizedBox(),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: SizeConfig.getSize(10),
                                            ),
                                            _isLoading
                                                ? const Center(
                                                    child: CircularProgressIndicator(),
                                                  )
                                                : _isSegmentProductExists
                                                    ? Column(
                                                        children: [
                                                          SizedBox(
                                                            child: Text(
                                                              MessagesProvider.get('OR').toUpperCase(),
                                                              style: _theme.heading6!
                                                                  .copyWith(fontSize: SizeConfig.getFontSize(18)),
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            height: SizeConfig.getSize(5),
                                                          ),
                                                          Align(
                                                            alignment: Alignment.centerLeft,
                                                            child: Text(
                                                              MessagesProvider.get('Select Segment'),
                                                              style: _theme.heading6!
                                                                  .copyWith(fontSize: SizeConfig.getFontSize(18)),
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            height: SizeConfig.getSize(10),
                                                          ),
                                                          SizedBox(
                                                            height: SizeConfig.getHeight(42),
                                                            child: DropdownButtonFormField<String>(
                                                              isExpanded: true,
                                                              value: _segmentDropDownValue,
                                                              autovalidateMode: AutovalidateMode.onUserInteraction,
                                                              decoration: InputDecoration(
                                                                hintStyle: _theme.textFieldHintStyle!
                                                                    .copyWith(fontSize: SizeConfig.getFontSize(16)),
                                                                enabledBorder: OutlineInputBorder(
                                                                    borderRadius:
                                                                        BorderRadius.circular(SizeConfig.getSize(10)),
                                                                    borderSide: BorderSide(
                                                                      width: 1,
                                                                      color: _theme.secondaryColor!,
                                                                    )),
                                                                focusedBorder: OutlineInputBorder(
                                                                    borderRadius:
                                                                        BorderRadius.circular(SizeConfig.getSize(10)),
                                                                    borderSide: BorderSide(
                                                                      width: 1,
                                                                      color: _theme.secondaryColor!,
                                                                    )),
                                                                contentPadding: const EdgeInsets.only(
                                                                    left: 5, right: 5, bottom: 5, top: 5),
                                                                labelText: "",
                                                                floatingLabelBehavior: FloatingLabelBehavior.always,
                                                                border: OutlineInputBorder(
                                                                  // <--- this line

                                                                  borderRadius: BorderRadius.circular(10),
                                                                ),
                                                              ),
                                                              icon: Icon(Icons.keyboard_arrow_down_rounded,
                                                                  size: SizeConfig.getSize(25), color: _theme.secondaryColor),
                                                              hint: Padding(
                                                                padding: EdgeInsets.fromLTRB(
                                                                    SizeConfig.getSize(8), 0, SizeConfig.getSize(8), 0),
                                                                child: Text(MessagesProvider.get("Select"),
                                                                    style: _theme.textFieldHintStyle!
                                                                        .copyWith(fontSize: SizeConfig.getFontSize(16))),
                                                              ),
                                                              style: _theme.title3!
                                                                  .copyWith(fontSize: SizeConfig.getFontSize(18)),
                                                              iconDisabledColor: _theme.dialogFooterInnerShadow,
                                                              iconEnabledColor: _theme.secondaryColor!,
                                                              onChanged: (String? newValue) {
                                                                setState(() {
                                                                  _segmentListItems = [];
                                                                  _segmentDropDownValue = newValue!;
                                                                  for (var segmentData in _segmentCategoryContainerResponse!
                                                                      .data!.segmentCategoryContainerDTOList) {
                                                                    if (_productSegmentIDs
                                                                        .contains(segmentData.segmentCategoryId)) {
                                                                      newValue == segmentData.segmentName1 &&
                                                                              segmentData.segmentValue1 != null &&
                                                                              segmentData.segmentValue1 != ''
                                                                          ? _segmentListItems.add(segmentData.segmentValue1)
                                                                          : null;
                                                                      newValue == segmentData.segmentName2 &&
                                                                              segmentData.segmentValue2 != null &&
                                                                              segmentData.segmentValue2 != ''
                                                                          ? _segmentListItems.add(segmentData.segmentValue2)
                                                                          : null;
                                                                      newValue == segmentData.segmentName3 &&
                                                                              segmentData.segmentValue3 != null &&
                                                                              segmentData.segmentValue3 != ''
                                                                          ? _segmentListItems.add(segmentData.segmentValue3)
                                                                          : null;
                                                                      newValue == segmentData.segmentName4 &&
                                                                              segmentData.segmentValue4 != null &&
                                                                              segmentData.segmentValue4 != ''
                                                                          ? _segmentListItems.add(segmentData.segmentValue4)
                                                                          : null;
                                                                      newValue == segmentData.segmentName5 &&
                                                                              segmentData.segmentValue5 != null &&
                                                                              segmentData.segmentValue5 != ''
                                                                          ? _segmentListItems.add(segmentData.segmentValue5)
                                                                          : null;
                                                                      newValue == segmentData.segmentName6 &&
                                                                              segmentData.segmentValue6 != null &&
                                                                              segmentData.segmentValue6 != ''
                                                                          ? _segmentListItems.add(segmentData.segmentValue6)
                                                                          : null;
                                                                      newValue == segmentData.segmentName7 &&
                                                                              segmentData.segmentValue7 != null &&
                                                                              segmentData.segmentValue7 != ''
                                                                          ? _segmentListItems.add(segmentData.segmentValue7)
                                                                          : null;
                                                                      newValue == segmentData.segmentName8 &&
                                                                              segmentData.segmentValue8 != null &&
                                                                              segmentData.segmentValue8 != ''
                                                                          ? _segmentListItems.add(segmentData.segmentValue8)
                                                                          : null;
                                                                      newValue == segmentData.segmentName9 &&
                                                                              segmentData.segmentValue9 != null &&
                                                                              segmentData.segmentValue9 != ''
                                                                          ? _segmentListItems.add(segmentData.segmentValue9)
                                                                          : null;
                                                                      newValue == segmentData.segmentName10 &&
                                                                              segmentData.segmentValue10 != null &&
                                                                              segmentData.segmentValue4 != ''
                                                                          ? _segmentListItems.add(segmentData.segmentValue10)
                                                                          : null;
                                                                    }
                                                                  }
                                                                });
                                                              },
                                                              items: _segmentDropDownItems
                                                                  .toSet()
                                                                  .toList()
                                                                  .map<DropdownMenuItem<String>>((String? value) {
                                                                return DropdownMenuItem<String>(
                                                                  value: value,
                                                                  child: Padding(
                                                                    padding: const EdgeInsets.fromLTRB(8.0, 0, 8, 0),
                                                                    child: Text(value ?? ''),
                                                                  ),
                                                                );
                                                              }).toList(),
                                                            ),
                                                          )
                                                        ],
                                                      )
                                                    : const SizedBox(),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              _segmentListItems.isNotEmpty
                                  ? Expanded(
                                      child: Padding(
                                        padding: EdgeInsets.all(SizeConfig.getSize(10)),
                                        child: Scroller(
                                          controller: _scrollController,
                                          child: Padding(
                                            padding: const EdgeInsets.only(right: 30),
                                            child: GridView.builder(
                                                controller: _scrollController,
                                                // physics:const NeverScrollableScrollPhysics(),
                                                // shrinkWrap: true,
                                                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                                    childAspectRatio: 2 / 1,
                                                    mainAxisSpacing: SizeConfig.getSize(10),
                                                    crossAxisSpacing: SizeConfig.getSize(10),
                                                    crossAxisCount: 4),
                                                itemCount: _segmentListItems.length,
                                                itemBuilder: (context, index) {
                                                  return ElevatedButton(
                                                      style: ElevatedButton.styleFrom(
                                                        padding: EdgeInsets.all(SizeConfig.getSize(4)),
                                                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                                        maximumSize: Size(SizeConfig.getSize(92), SizeConfig.getSize(42)),
                                                        minimumSize: Size(SizeConfig.getSize(92), SizeConfig.getSize(42)),
                                                        shape: RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius.circular(SizeConfig.getSize(8)), // <-- Radius
                                                        ),
                                                        backgroundColor: _selectedIndex == index
                                                            ? _theme.button2InnerShadow1
                                                            : _theme.button1BG1,
                                                      ),
                                                      onPressed: () {
                                                        setState(() {
                                                          _selectedIndex = index;
                                                          _segmentListItems[index];
                                                          List<int> _segmentIds = [];
                                                          for (var segmentData in _segmentCategoryContainerResponse!
                                                              .data!.segmentCategoryContainerDTOList) {
                                                            if (_productSegmentIDs.contains(segmentData.segmentCategoryId)) {
                                                              if (segmentData.segmentValue1 == _segmentListItems[index]) {
                                                                _segmentIds.add(segmentData.segmentCategoryId);
                                                              }
                                                              if (segmentData.segmentValue2 == _segmentListItems[index]) {
                                                                _segmentIds.add(segmentData.segmentCategoryId);
                                                              }
                                                              if (segmentData.segmentValue3 == _segmentListItems[index]) {
                                                                _segmentIds.add(segmentData.segmentCategoryId);
                                                              }
                                                              if (segmentData.segmentValue4 == _segmentListItems[index]) {
                                                                _segmentIds.add(segmentData.segmentCategoryId);
                                                              }
                                                              if (segmentData.segmentValue5 == _segmentListItems[index]) {
                                                                _segmentIds.add(segmentData.segmentCategoryId);
                                                              }
                                                              if (segmentData.segmentValue6 == _segmentListItems[index]) {
                                                                _segmentIds.add(segmentData.segmentCategoryId);
                                                              }
                                                              if (segmentData.segmentValue7 == _segmentListItems[index]) {
                                                                _segmentIds.add(segmentData.segmentCategoryId);
                                                              }
                                                              if (segmentData.segmentValue8 == _segmentListItems[index]) {
                                                                _segmentIds.add(segmentData.segmentCategoryId);
                                                              }
                                                              if (segmentData.segmentValue9 == _segmentListItems[index]) {
                                                                _segmentIds.add(segmentData.segmentCategoryId);
                                                              }
                                                              if (segmentData.segmentValue10 == _segmentListItems[index]) {
                                                                _segmentIds.add(segmentData.segmentCategoryId);
                                                              }
                                                            }
                                                          }
                                                          final TransactionCubit transactionCubit =
                                                              context.read<TransactionCubit>();
                                                          transactionCubit.state.transactionLinesGroupsBySeat
                                                              ?.forEach((key, value) {
                                                            if (value.isNotEmpty || value != null) {
                                                              for (var element in value) {
                                                                _listTransactionLineGroup.add(element);
                                                                if (element.transactionLines.isNotEmpty ||
                                                                    element.transactionLines != null) {
                                                                  for (var transactionDTO in element.transactionLines) {
                                                                    if (transactionDTO.productSegmentId > 0) {
                                                                      if (_segmentIds
                                                                          .contains(transactionDTO.productSegmentId)) {
                                                                        _selectedSegmentProductIds
                                                                            .add(transactionDTO.productId);
                                                                      }
                                                                    }
                                                                  }
                                                                }
                                                              }
                                                            }
                                                          });
                                                          _selectedSegmentProductIds =
                                                              _selectedSegmentProductIds.toSet().toList();
                                                        });
                                                      },
                                                      child: Text(
                                                        "${_segmentListItems[index]}",
                                                        maxLines: 2,
                                                        overflow: TextOverflow.ellipsis,
                                                        style: _selectedIndex == index
                                                            ? _theme.subtitleLight3!.copyWith(
                                                                color: _theme.light1, fontSize: SizeConfig.getFontSize(16))
                                                            : _theme.subtitle3!.copyWith(fontSize: SizeConfig.getFontSize(16)),
                                                      ));
                                                }),
                                          ),
                                        ),
                                      ),
                                    )
                                  : const SizedBox(),
                              _isSegmentProductExists
                                  ? const SizedBox()
                                  : SizedBox(
                                      height: SizeConfig.getSize(100),
                                    ),
                              SizedBox(
                                child: Column(
                                  children: [
                                    Container(height: 1, width: _screenWidth, color: _theme.dialogFooterInnerShadow),
                                    Padding(
                                      padding: EdgeInsets.all(SizeConfig.getSize(10)),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          SecondaryLargeButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              text: MessagesProvider.get('cancel').toUpperCase()),
                                          const SizedBox(
                                            width: 16,
                                          ),
                                          PrimaryLargeButton(
                                              onPressed: () {
                                                try {
                                                  if ((_searchTextController.text.isEmpty && !_isSegmentProductExists)) {
                                                    _notificationBar.showMessage(
                                                        MessagesProvider.get('Please enter search input'), _theme.footerBG5!);
                                                  } else {
                                                    final TransactionCubit transactionCubit = context.read<TransactionCubit>();
                                                    List<TransactionLinesGroup> _searchedFilterLists = [];
                                                    //
                                                    if (transactionCubit
                                                        .state.transactionData!.transactionLineDTOList.isNotEmpty) {
                                                      if (transactionCubit.state.seatNames != null) {
                                                        for (var i = 0;
                                                            i <
                                                                int.parse(
                                                                    transactionCubit.state.seatNames?.length.toString() ??
                                                                        "0");
                                                            i++) {
                                                          String _seatName = transactionCubit.state.seatNames?[i] ?? '';
                                                          if (_listOftransactionLineProductContainerDTO.isNotEmpty) {
                                                            for (var value in _listOftransactionLineProductContainerDTO) {
                                                              if (value != null) {
                                                                if (value.searchDescription.toString().toLowerCase().contains(
                                                                    _searchTextController.text.toString().toLowerCase())) {
                                                                  _searchedListProductIds.add(value.productId);
                                                                }
                                                                if (value.description.toString().toLowerCase().contains(
                                                                    _searchTextController.text.toString().toLowerCase())) {
                                                                  _searchedListProductIds.add(value.productId);
                                                                }
                                                                if (value.hsnSacCode.toString().toLowerCase().contains(
                                                                    _searchTextController.text.toString().toLowerCase())) {
                                                                  _searchedListProductIds.add(value.productId);
                                                                }
                                                                if (value.inventoryItemContainerDTO != null) {
                                                                  if (value.inventoryItemContainerDTO!
                                                                          .productBarcodeContainerDtoList !=
                                                                      null) {
                                                                    if (value.inventoryItemContainerDTO!
                                                                        .productBarcodeContainerDtoList!.isNotEmpty) {
                                                                      for (var element in value.inventoryItemContainerDTO!
                                                                          .productBarcodeContainerDtoList!) {
                                                                        if (element.barCode.toString().toLowerCase().contains(
                                                                            _searchTextController.text
                                                                                .toString()
                                                                                .toLowerCase())) {
                                                                          _searchedListProductIds.add(value.productId);
                                                                        }
                                                                      }
                                                                    }
                                                                  }
                                                                }
                                                              }
                                                            }
                                                          }
                                                          _searchedListProductIds = _searchedListProductIds.toSet().toList();
                                                          final _data = transactionCubit
                                                              .state.transactionLinesGroupsBySeat?[_seatName]
                                                              ?.where((element) => _searchTextController.text != ''
                                                                  ? (element.productName.toString().toLowerCase().contains(
                                                                          _searchTextController.text
                                                                              .toString()
                                                                              .toLowerCase()) ||
                                                                      _searchedListProductIds
                                                                          .toSet()
                                                                          .toList()
                                                                          .contains(element.productId))
                                                                  : _selectedSegmentProductIds.contains(element.productId))
                                                              .toList();

                                                          if (_data != null) {
                                                            if (_data.isNotEmpty) {
                                                              for (var element in _data) {
                                                                _searchedFilterLists.add(element);
                                                              }
                                                            } else {
                                                              _searchedFilterLists = [];
                                                              widget.onError(
                                                                  "0 ${MessagesProvider.get("line(s) matches the search criteria.")}");
                                                            }
                                                          }
                                                        }
                                                      }

                                                      if (_searchedFilterLists.isNotEmpty) {
                                                        transactionCubit.updateSearchListTransactionData(
                                                            _searchedFilterLists.toSet().toList());
                                                        transactionCubit.changeSearchResultsStatus(true);
                                                        widget.onConfirm(
                                                            "${_searchedFilterLists.length} ${MessagesProvider.get("line(s) matches the search criteria.")}");
                                                      } else {
                                                        transactionCubit.updateSearchListTransactionData(
                                                            _searchedFilterLists.toSet().toList());
                                                        transactionCubit.changeSearchResultsStatus(true);
                                                        widget.onConfirm(
                                                            "0 ${MessagesProvider.get("line(s) matches the search criteria.")}");
                                                      }
                                                    }
                                                    Navigator.pop(context);
                                                  }
                                                } catch (err) {
                                                  Navigator.pop(context);
                                                  widget.onError(
                                                      MessagesProvider.get('Something went wrong could not able to search'));
                                                }
                                              },
                                              text: MessagesProvider.get("Confirm").toUpperCase())
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                ),
              )),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _productSegmentIDs = [];
    _segmentListItems = [];
    _segmentDropDownItems = [];
    _segmentCategoryContainerResponse = null;
    _listTransactionLineGroup = [];
    _searchTextController.clear();
    super.dispose();
  }
}
