import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:messages_data/builder.dart';
import 'package:notificationbar_ui/NotificationBar.dart';
import 'package:product_config_ui/order_transaction_lines_dialog/search_header_view.dart';
import 'package:product_config_ui/order_transaction_lines_dialog/search_result_view.dart';
import 'package:themes_library/themes_library.dart';
import 'package:transaction_data/models/create_transaction/transaction_line_dto.dart';
import 'package:transaction_ui/cubit/transaction_cubit.dart';
import 'package:transaction_ui/models/transaction_lines_group.dart';
import 'package:widgets_library/utils/size_config.dart';
import 'cubit/order_transaction_lines_cubit.dart';
import 'cubit/order_transaction_lines_state.dart';
import 'search_menu_view.dart';
import 'package:login_ui/loader_dialog.dart' as loader;
import 'package:widgets_library/scroller.dart';

///
/// Fulfill Transaction
///
class OrderTransactionLinesDialog extends StatefulWidget {
  const OrderTransactionLinesDialog(
      {super.key,
      required this.transactionId,
      required this.transactionLinesGroupsBySeat,
      required this.showNotification,
        required this.onCardProductExists,
        required this.isFutureDatedTransaction,
      this.approverID});

  final int transactionId;
  final int? approverID;
  final Map<String, List<TransactionLinesGroup>>? transactionLinesGroupsBySeat;
  final Function(String value, Color color) showNotification;
  final Function onCardProductExists;
  final bool isFutureDatedTransaction;

  @override
  State<OrderTransactionLinesDialog> createState() => _OrderTransactionLinesDialogState();
}

class _OrderTransactionLinesDialogState extends State<OrderTransactionLinesDialog> {
  NotificationBar? _notificationBar;
  final ScrollController _scrollController = ScrollController();
  List<TransactionLinesGroup>? _selectedTransactionLinesGroup;
  bool _isAllSelected = false;
  String _selectedSeatName = 'All';
  String _selectedCourseName = 'All';
  String _selectedProductName = 'All';
  late SemnoxTheme theme;
  bool _isCardProductExists = false;

  @override
  void initState() {
    _selectedTransactionLinesGroup = [];
    _notificationBar = NotificationBar(showHideSideBar: false);
    final cubit = context.read<OrderTransactionLinesCubit>();
    cubit.initData(widget.transactionLinesGroupsBySeat);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    theme = Theme.of(context).extension<SemnoxTheme>()!;
    SizeConfig.init(context);
    final cubit = context.read<OrderTransactionLinesCubit>();

    return BlocBuilder<OrderTransactionLinesCubit, OrderTransactionLinesState>(
      builder: (context, OrderTransactionLinesState orderTransactionLinesState) {
        if (orderTransactionLinesState.isSuccess == true) {
          loader.hideLoaderDialog(context);
          context
              .read<TransactionCubit>()
              .onTransactionDataUpdated(orderTransactionLinesState.transactionResponse?.data);
          WidgetsBinding.instance.addPostFrameCallback((_) {
            cubit.clear();
            Navigator.pop(context);
            widget.showNotification(
                MessagesProvider.get("Selected Line(s) are fulfilled successfully."),
                theme.footerBG4!);
          });
        }
        if (orderTransactionLinesState.isError == true) {
          loader.hideLoaderDialog(context);
        }

        return WillPopScope(
          onWillPop: () async => false,
          child: Material(
            color: theme.transparentColor,
            child: Stack(
              children: [
                Scaffold(
                  resizeToAvoidBottomInset: true,
                  backgroundColor: theme.transparentColor,
                  bottomNavigationBar: Container(
                    child: _notificationBar,
                  ),
                  body: Padding(
                    padding: EdgeInsets.all(SizeConfig.getSize(8.0)),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(
                              SizeConfig.getWidth(0),
                              SizeConfig.getHeight(0),
                              SizeConfig.getWidth(0),
                              SizeConfig.getHeight(0)),
                          child: Container(
                            height: SizeConfig.getHeight(64),
                            decoration: BoxDecoration(
                                color: theme.cartItemCardBG,
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
                                    decoration: BoxDecoration(
                                        color: theme.button2BG1,
                                        borderRadius: BorderRadius.only(
                                            bottomRight: Radius.circular(SizeConfig.getSize(8)),
                                            topLeft: Radius.circular(SizeConfig.getSize(8)))),
                                    constraints: const BoxConstraints(
                                      minHeight: double.infinity,
                                      maxHeight: double.infinity,
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.only(left: SizeConfig.getWidth(21.0), right: SizeConfig.getWidth(20)),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.arrow_back_ios,
                                            color: Colors.white,
                                            size: SizeConfig.getSize(30),
                                          ),
                                          SizedBox(width: SizeConfig.getWidth(10),),
                                          Text(
                                            MessagesProvider.get("FULFILL ${widget.transactionId}"),
                                            style: theme.headingLight4?.copyWith(color: Colors.white, fontSize: SizeConfig.getFontSize(24)),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: SizeConfig.getWidth(8),),
                                Expanded(
                                  child: Container(
                                    constraints: const BoxConstraints(
                                      minHeight: double.infinity,
                                      maxHeight: double.infinity,
                                    ),
                                    decoration:  BoxDecoration(
                                        color: theme.tableRow1,
                                        borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(SizeConfig.getSize(8)),
                                            bottomLeft: Radius.circular(SizeConfig.getSize(8)))),
                                    height: SizeConfig.getHeight(64),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(
                              SizeConfig.getWidth(0),
                              SizeConfig.getHeight(0),
                              SizeConfig.getWidth(0),
                              SizeConfig.getHeight(0)),
                          child: Container(
                            padding: EdgeInsets.only(right: SizeConfig.getWidth(21.0), bottom: SizeConfig.getHeight(3)),
                            color: theme.cartItemCardBG,
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Expanded(
                                    flex: 10,
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: SearchMenuView(
                                            title: MessagesProvider.get("Seats"),
                                            dropdownValues: orderTransactionLinesState.seats ?? [],
                                            selectedValueCallback: (String value) {
                                              _selectedSeatName = value;
                                            },
                                          ),
                                        ),
                                        (orderTransactionLinesState.course?.length == 1)
                                            ? const SizedBox()
                                            : Expanded(
                                                child: SearchMenuView(
                                                  title: MessagesProvider.get("Course"),
                                                  dropdownValues: orderTransactionLinesState.course ?? [],
                                                  selectedValueCallback: (String value) {
                                                    _selectedCourseName = value;
                                                  },
                                                ),
                                              ),
                                        Expanded(
                                          child: SearchMenuView(
                                            title: MessagesProvider.get("Product"),
                                            dropdownValues: orderTransactionLinesState.products ?? [],
                                            selectedValueCallback: (String value) {
                                              _selectedProductName = value;
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(width: SizeConfig.getWidth(24)),
                                  ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          padding: EdgeInsets.all(SizeConfig.getWidth(4)),
                                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                          minimumSize: Size(SizeConfig.getWidth(100), SizeConfig.getHeight(42)),
                                          maximumSize: Size(SizeConfig.getWidth(100), SizeConfig.getHeight(42)),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(SizeConfig.getSize(8)),
                                          ),
                                          backgroundColor: theme.button1BG1),
                                      onPressed: () async {
                                        await cubit.initData(widget.transactionLinesGroupsBySeat);
                                        cubit.shouldClearSearchFilter();
                                      },
                                      child: Text(
                                        MessagesProvider.get("CLEAR"),
                                        style: theme.description1?.copyWith(fontSize: SizeConfig.getFontSize(16)),
                                      )),
                                  SizedBox(width: SizeConfig.getWidth(12),),
                                  ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          padding: EdgeInsets.all(SizeConfig.getWidth(4)),
                                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                          minimumSize: Size(SizeConfig.getWidth(100), SizeConfig.getHeight(42)),
                                          maximumSize: Size(SizeConfig.getWidth(100), SizeConfig.getHeight(42)),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(SizeConfig.getSize(8)),
                                          ),
                                          backgroundColor: theme.button2BG1),
                                      onPressed: () async {
                                        await cubit.filterTransactionData(
                                            widget.transactionLinesGroupsBySeat!,
                                            _selectedSeatName,
                                            _selectedCourseName,
                                            _selectedProductName);
                                      },
                                      child: Text(
                                        MessagesProvider.get("SEARCH"),
                                        style: theme.descriptionLight1?.copyWith(color: Colors.white, fontSize: SizeConfig.getFontSize(16)),
                                      ))
                                ]),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.only(
                              top: SizeConfig.getHeight(25),
                              right: SizeConfig.getWidth(5),
                              bottom: SizeConfig.getHeight(10),),
                            color: theme.cartItemCardBG,
                            child: Scroller(
                              controller: _scrollController,
                              child: SingleChildScrollView(
                                controller: _scrollController,
                                child: Container(
                                  padding: EdgeInsets.only(right: SizeConfig.isBigDevice() ? SizeConfig.getWidth(25.0) : SizeConfig.getWidth(50.0),),
                                  color: theme.cartItemCardBG,
                                  child: Column(
                                    children: [
                                      SearchResultHeaderView(
                                        hasCourse: (orderTransactionLinesState.course?.length != 1),
                                        isCheckedCallback: (bool isChecked) {
                                          _onAllTransactionLinesGroupTapped(isChecked);
                                        },
                                        isAllSelected: _isAllSelected,
                                      ),
                                      ...?orderTransactionLinesState.transactionLinesGroup?.map((transactionLineGroup) {
                                        return GestureDetector(
                                          onTap: () {
                                            _onTransactionLineGroupTapped(transactionLineGroup);
                                          },
                                          child: SearchResultView(
                                            transactionLineGroup: transactionLineGroup,
                                            isSelected: _selectedTransactionLinesGroup?.contains(transactionLineGroup) == true,
                                            hasCourse: orderTransactionLinesState.course?.length != 1,
                                            isCheckedCallback: (bool isChecked) {
                                              _onTransactionLineGroupTapped(transactionLineGroup);
                                            },
                                          ),
                                        );
                                      }),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(
                              SizeConfig.getWidth(0),
                              SizeConfig.getHeight(0),
                              SizeConfig.getWidth(0),
                              SizeConfig.getHeight(0)),
                          child: Container(
                            height: SizeConfig.getHeight(55),
                            decoration:  BoxDecoration(
                                color: theme.cartItemCardBG,
                                borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(SizeConfig.getSize(8)),
                                    bottomLeft: Radius.circular(SizeConfig.getSize(8)))),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        padding: EdgeInsets.all(SizeConfig.getWidth(4)),
                                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                        minimumSize: Size(SizeConfig.getWidth(100), SizeConfig.getHeight(42)),
                                        maximumSize: Size(SizeConfig.getWidth(100), SizeConfig.getHeight(42)),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(SizeConfig.getSize(8)),
                                        ),
                                        backgroundColor: theme.button1BG1),
                                    onPressed: () {
                                      Future.microtask(
                                          () => Navigator.pop(context));
                                    },
                                    child: Text(
                                      MessagesProvider.get("CANCEL"),
                                      style:  theme.descriptionLight1?.copyWith(color: theme.secondaryColor, fontSize: SizeConfig.getFontSize(16)),
                                    )),
                                SizedBox(width: SizeConfig.getWidth(12),),
                                ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        padding: EdgeInsets.all(SizeConfig.getWidth(4)),
                                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                        minimumSize: Size(SizeConfig.getWidth(100), SizeConfig.getHeight(42)),
                                        maximumSize: Size(SizeConfig.getWidth(100), SizeConfig.getHeight(42)),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(SizeConfig.getSize(8)),
                                        ),
                                        backgroundColor: theme.button2BG1),
                                    onPressed: () async {
                                      if (_selectedTransactionLinesGroup?.isEmpty == true) {
                                        _notificationBar?.showMessage(
                                            MessagesProvider.get("Please select any item(s) to fullfill."),
                                            theme.footerBG5!);
                                      } else {
                                        loader.showLoaderDialog(context, MessagesProvider.get("Ordering transaction lines..."));
                                        final transactionLines  = getSelectedTransactionLines();
                                        _isCardProductExists =  false;
                                        for (TransactionLineDTO element in transactionLines) {
                                          if((element.transactionAccountDTOList??[]).isNotEmpty){
                                            _isCardProductExists = true;
                                          }
                                        }if(_isCardProductExists && widget.isFutureDatedTransaction){
                                          widget.onCardProductExists(transactionLines);
                                          Navigator.pop(context);
                                          loader.hideLoaderDialog(context);
                                        }else{
                                          cubit.orderTransactionLines(transactionLines, approverID:widget.approverID);
                                        }
                                      }
                                    },
                                    child: Text(
                                      MessagesProvider.get("CONFIRM"),
                                      style: theme.descriptionLight1?.copyWith(color: Colors.white, fontSize: SizeConfig.getFontSize(16)),
                                    )),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _notificationBar = null;
    super.dispose();
  }

  void _onTransactionLineGroupTapped(TransactionLinesGroup transactionLinesGroup) {
    final cubit = context.read<OrderTransactionLinesCubit>();
    if (_selectedTransactionLinesGroup?.contains(transactionLinesGroup) == true) {
      _selectedTransactionLinesGroup?.removeWhere((element) => element == transactionLinesGroup);
    } else {
      _selectedTransactionLinesGroup?.add(transactionLinesGroup);
    }

    if(_selectedTransactionLinesGroup?.length == cubit.state.transactionLinesGroup?.length) {
      _isAllSelected = true;
    } else {
      _isAllSelected = false;
    }
    setState(() {});
  }

  void _onAllTransactionLinesGroupTapped(bool isSelected) {
    final orderTransactionLinesState = context.read<OrderTransactionLinesCubit>();
    _selectedTransactionLinesGroup = [];
    if (isSelected) {
      _isAllSelected = true;
      orderTransactionLinesState.state.transactionLinesGroup?.forEach((transactionLineGroup) {
        _selectedTransactionLinesGroup?.add(transactionLineGroup);
      });
    } else {
      _isAllSelected = false;
    }
    setState(() {});
  }

  List<TransactionLineDTO> getSelectedTransactionLines() {
    List<TransactionLineDTO>? transactionLinesList = [];
    _selectedTransactionLinesGroup?.forEach((transactionLine) {
      transactionLinesList.addAll(transactionLine.transactionLines);
    });
    return transactionLinesList;
  }
}
