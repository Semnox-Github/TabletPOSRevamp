library context_menu_ui;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:themes_library/themes_library.dart';
import 'package:transaction_functions/context_menu/context_menu_items_row.dart';
import 'package:transaction_functions/context_menu/page_index_enum.dart';
import 'package:transaction_functions/context_menu/scroll_index_value_listenable_builder.dart';
import 'package:transaction_functions/cubit/transaction_functions_cubit.dart';
import 'package:transaction_functions/cubit/transaction_functions_cubit_state.dart';
import 'package:widgets_library/utils/size_config.dart';
import '../transaction_function_dto.dart';

class ContextMenuView extends StatefulWidget {
  final Function(TransactionFunctionDTO tappedContextMenuItem) tappedItemCallback;

  const ContextMenuView(this.tappedItemCallback, {super.key});

  @override
  State<ContextMenuView> createState() => _ContextMenuViewState();
}

class _ContextMenuViewState extends State<ContextMenuView> {
  final ValueNotifier<bool> isList1 = ValueNotifier<bool>(true);
  final ValueNotifier<bool> isList2 = ValueNotifier<bool>(false);
  final ValueNotifier<bool> isList3 = ValueNotifier<bool>(false);
  final ValueNotifier<bool> isList4 = ValueNotifier<bool>(false);
  final ValueNotifier<bool> isList5 = ValueNotifier<bool>(false);
  final ValueNotifier<bool> isList6 = ValueNotifier<bool>(false);
  final ValueNotifier<bool> isList7 = ValueNotifier<bool>(false);
  final ValueNotifier<bool> isList8 = ValueNotifier<bool>(false);
  final ValueNotifier<bool> isList9 = ValueNotifier<bool>(false);
  final ValueNotifier<bool> isList10 = ValueNotifier<bool>(false);

  List<List<TransactionFunctionDTO>?> listChunks = [];
  var initialStepIndex = 3;

  List<TransactionFunctionDTO>? list1 = [];
  List<TransactionFunctionDTO>? list2 = [];
  List<TransactionFunctionDTO>? list3 = [];
  List<TransactionFunctionDTO>? list4 = [];
  List<TransactionFunctionDTO>? list5 = [];
  List<TransactionFunctionDTO>? list6 = [];
  List<TransactionFunctionDTO>? list7 = [];
  List<TransactionFunctionDTO>? list8 = [];
  List<TransactionFunctionDTO>? list9 = [];
  List<TransactionFunctionDTO>? list10 = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SemnoxTheme theme = Theme.of(context).extension<SemnoxTheme>()!;
    SizeConfig.init(context);
    var screenWidth = SizeConfig.screenWidth;
    /*initialStepIndex = (screenWidth <= 700)
        ? 3
        : (screenWidth <= 880) //Cilico Tablet
            ? 4
            : (screenWidth <= 1060)
                ? 5
                : (screenWidth <= 1240) //iPad
                    ? 6
                    : 7;*/

    initialStepIndex = 5;

    return BlocBuilder<TransactionFunctionsCubit, TransactionFunctionsState>(
        builder: (context, TransactionFunctionsState transactionFunctionsState) {
      _clear();
      var listCount = transactionFunctionsState.contextMenuFunctions?.length ?? 0;
      int menusChunksCount = 0;

      if (listCount > 0) {
        var loopStepIndex = initialStepIndex;
        for (var i = 0; i < listCount; i += loopStepIndex) {
          if (i == 0) {
            loopStepIndex = loopStepIndex;
          } else if (i == initialStepIndex) {
            loopStepIndex = loopStepIndex - 1;
          } else if ((i + loopStepIndex) <= listCount) {
            if (listCount - (i + loopStepIndex) == 1) {
              loopStepIndex = initialStepIndex;
            }
          }

          listChunks.add(transactionFunctionsState.contextMenuFunctions
              ?.sublist(i, i + loopStepIndex > listCount ? listCount : i + loopStepIndex));
        }

        menusChunksCount = listChunks.length;
        for (var i = 0; i < menusChunksCount; i++) {
          switch (i) {
            case 0:
              list1 = listChunks[i];
              break;
            case 1:
              list2 = listChunks[i];
              break;
            case 2:
              list3 = listChunks[i];
              break;
            case 3:
              list4 = listChunks[i];
              break;
            case 4:
              list5 = listChunks[i];
              break;
            case 5:
              list6 = listChunks[i];
              break;
            case 6:
              list7 = listChunks[i];
              break;
            case 7:
              list8 = listChunks[i];
              break;
            case 8:
              list9 = listChunks[i];
              break;
            case 9:
              list10 = listChunks[i];
              break;
          }
        }
      }

      return ScrollIndexValueListenableBuilder<bool, bool, bool, bool, bool, bool, bool, bool, bool, bool>(
          first: isList1,
          second: isList2,
          third: isList3,
          forth: isList4,
          fifth: isList5,
          sixth: isList6,
          seventh: isList7,
          eighth: isList8,
          ninth: isList9,
          tenth: isList10,
          builder:
              (context, isList1, isList2, isList3, isList4, isList5, isList6, isList7, isList8, isList9, isList10, child) {
            return Container(
              color: theme.tableRow1,
              padding: EdgeInsets.only(bottom: SizeConfig.getHeight(8)),
              child: isList1
                  ? list1?.isNotEmpty == true
                      ? ContextMenuItemsRow(
                          items: list1,
                          shouldShowLeftScroll: false,
                          shouldShowRightScroll: list2?.isEmpty == true ? false : true,
                          onLeftScrollTappedCallback: () {},
                          onItemTappedCallback: (TransactionFunctionDTO item) {
                            widget.tappedItemCallback(item);
                          },
                          onRightScrollTappedCallback: () {
                            _scrollList(PageIndexEnum.two);
                          })
                      : null
                  : isList2
                      ? list2?.isNotEmpty == true
                          ? ContextMenuItemsRow(
                              items: list2,
                              shouldShowLeftScroll: true,
                              shouldShowRightScroll: list3?.isEmpty == true ? false : true,
                              onLeftScrollTappedCallback: () {
                                _scrollList(PageIndexEnum.one);
                              },
                              onItemTappedCallback: (TransactionFunctionDTO item) {
                                widget.tappedItemCallback(item);
                              },
                              onRightScrollTappedCallback: () {
                                _scrollList(PageIndexEnum.three);
                              })
                          : null
                      : isList3
                          ? list3?.isNotEmpty == true
                              ? ContextMenuItemsRow(
                                  items: list3,
                                  shouldShowLeftScroll: true,
                                  shouldShowRightScroll: list4?.isEmpty == true ? false : true,
                                  onLeftScrollTappedCallback: () {
                                    _scrollList(PageIndexEnum.two);
                                  },
                                  onItemTappedCallback: (TransactionFunctionDTO item) {
                                    widget.tappedItemCallback(item);
                                  },
                                  onRightScrollTappedCallback: () {
                                    _scrollList(PageIndexEnum.four);
                                  })
                              : null
                          : isList4
                              ? list4?.isNotEmpty == true
                                  ? ContextMenuItemsRow(
                                      items: list4,
                                      shouldShowLeftScroll: true,
                                      shouldShowRightScroll: list5?.isEmpty == true ? false : true,
                                      onLeftScrollTappedCallback: () {
                                        _scrollList(PageIndexEnum.three);
                                      },
                                      onItemTappedCallback: (TransactionFunctionDTO item) {
                                        widget.tappedItemCallback(item);
                                      },
                                      onRightScrollTappedCallback: () {
                                        _scrollList(PageIndexEnum.five);
                                      })
                                  : null
                              : isList5
                                  ? list5?.isNotEmpty == true
                                      ? ContextMenuItemsRow(
                                          items: list5,
                                          shouldShowLeftScroll: true,
                                          shouldShowRightScroll: list6?.isEmpty == true ? false : true,
                                          onLeftScrollTappedCallback: () {
                                            _scrollList(PageIndexEnum.four);
                                          },
                                          onItemTappedCallback: (TransactionFunctionDTO item) {
                                            widget.tappedItemCallback(item);
                                          },
                                          onRightScrollTappedCallback: () {
                                            _scrollList(PageIndexEnum.six);
                                          })
                                      : null
                                  : isList6
                                      ? list6?.isNotEmpty == true
                                          ? ContextMenuItemsRow(
                                              items: list6,
                                              shouldShowLeftScroll: true,
                                              shouldShowRightScroll: list7?.isEmpty == true ? false : true,
                                              onLeftScrollTappedCallback: () {
                                                _scrollList(PageIndexEnum.five);
                                              },
                                              onItemTappedCallback: (TransactionFunctionDTO item) {
                                                widget.tappedItemCallback(item);
                                              },
                                              onRightScrollTappedCallback: () {
                                                _scrollList(PageIndexEnum.seven);
                                              })
                                          : null
                                      : isList7
                                          ? list7?.isNotEmpty == true
                                              ? ContextMenuItemsRow(
                                                  items: list7,
                                                  shouldShowLeftScroll: true,
                                                  shouldShowRightScroll: list8?.isEmpty == true ? false : true,
                                                  onLeftScrollTappedCallback: () {
                                                    _scrollList(PageIndexEnum.six);
                                                  },
                                                  onItemTappedCallback: (TransactionFunctionDTO item) {
                                                    widget.tappedItemCallback(item);
                                                  },
                                                  onRightScrollTappedCallback: () {
                                                    _scrollList(PageIndexEnum.eight);
                                                  })
                                              : null
                                          : isList8
                                              ? list8?.isNotEmpty == true
                                                  ? ContextMenuItemsRow(
                                                      items: list8,
                                                      shouldShowLeftScroll: true,
                                                      shouldShowRightScroll: list9?.isEmpty == true ? false : true,
                                                      onLeftScrollTappedCallback: () {
                                                        _scrollList(PageIndexEnum.seven);
                                                      },
                                                      onItemTappedCallback: (TransactionFunctionDTO item) {
                                                        widget.tappedItemCallback(item);
                                                      },
                                                      onRightScrollTappedCallback: () {
                                                        _scrollList(PageIndexEnum.nine);
                                                      })
                                                  : null
                                              : isList9
                                                  ? list9?.isNotEmpty == true
                                                      ? ContextMenuItemsRow(
                                                          items: list9,
                                                          shouldShowLeftScroll: true,
                                                          shouldShowRightScroll: list10?.isEmpty == true ? false : true,
                                                          onLeftScrollTappedCallback: () {
                                                            _scrollList(PageIndexEnum.eight);
                                                          },
                                                          onItemTappedCallback: (TransactionFunctionDTO item) {
                                                            widget.tappedItemCallback(item);
                                                          },
                                                          onRightScrollTappedCallback: () {
                                                            _scrollList(PageIndexEnum.ten);
                                                          })
                                                      : null
                                                  : isList10
                                                      ? list10?.isNotEmpty == true
                                                          ? ContextMenuItemsRow(
                                                              items: list10,
                                                              shouldShowLeftScroll: true,
                                                              shouldShowRightScroll: false,
                                                              onLeftScrollTappedCallback: () {
                                                                _scrollList(PageIndexEnum.nine);
                                                              },
                                                              onItemTappedCallback: (TransactionFunctionDTO item) {
                                                                widget.tappedItemCallback(item);
                                                              },
                                                              onRightScrollTappedCallback: () {})
                                                          : null
                                                      : null,
            );
          });
    });
  }

  _scrollList(PageIndexEnum pageIndex) {
    isList1.value = PageIndexEnum.one == pageIndex;
    isList2.value = PageIndexEnum.two == pageIndex;
    isList3.value = PageIndexEnum.three == pageIndex;
    isList4.value = PageIndexEnum.four == pageIndex;
    isList5.value = PageIndexEnum.five == pageIndex;
    isList6.value = PageIndexEnum.six == pageIndex;
    isList7.value = PageIndexEnum.seven == pageIndex;
    isList8.value = PageIndexEnum.eight == pageIndex;
    isList9.value = PageIndexEnum.nine == pageIndex;
    isList10.value = PageIndexEnum.ten == pageIndex;
  }

  _clear() {
    list1?.clear();
    list2?.clear();
    list3?.clear();
    list4?.clear();
    list5?.clear();
    list6?.clear();
    list7?.clear();
    list8?.clear();
    list9?.clear();
    list10?.clear();

    listChunks.clear();

    _scrollList(PageIndexEnum.one);
  }
}
