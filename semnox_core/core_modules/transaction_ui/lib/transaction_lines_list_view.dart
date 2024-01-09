import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:themes_library/themes_library.dart';
import 'package:transaction_data/models/create_transaction/transaction_data.dart';
import 'package:transaction_data/models/create_transaction/transaction_line_dto.dart';
import 'package:transaction_ui/cubit/transaction_cubit.dart';
import 'package:transaction_ui/cubit/transaction_cubit_state.dart';
import 'package:transaction_ui/models/transaction_lines_group.dart';
import 'package:transaction_ui/transaction_lines_group_view.dart';
import 'package:widgets_library/scroller.dart';
import 'package:widgets_library/utils/size_config.dart';
import 'name_transaction_seat/name_transaction_seat_dialog.dart';

class TransactionLinesListView extends StatefulWidget {
  final Function(TransactionLinesGroup tappedTransactionLinesGroup, bool isSelected) onTransactionLinesGroupTapped;
  final Function() onTransactionSeatNameUpdated;
  final String currency;
  final String amountFmt;

  const TransactionLinesListView({
    super.key,
    required this.onTransactionLinesGroupTapped,
    required this.onTransactionSeatNameUpdated,
    required this.currency,
    required this.amountFmt,
  });

  @override
  State<StatefulWidget> createState() => _TransactionLinesListViewState();
}

class _TransactionLinesListViewState extends State<TransactionLinesListView> {
  final ScrollController _scrollController = ScrollController();
  TransactionLinesGroup? _selectedTransactionLinesGroup;
  late Map<String, List<TransactionLineDTO>> _transactionLinesBySeat = {};
  SemnoxTheme? theme;

  @override
  Widget build(BuildContext context) {
    theme = Theme.of(context).extension<SemnoxTheme>()!;
    SizeConfig.init(context);
    return BlocBuilder<TransactionCubit, TransactionCubitState>(
        builder: (context, TransactionCubitState transactionCubitState) {
      return Container(
          child: (transactionCubitState.transactionData != null)
              ? (transactionCubitState.isInSearchMode)
                  ? _createSearchResultsTransactionLinesList()
                  : (transactionCubitState.isSeatBased)
                      ? _createSeatBasedTransactionLinesList(transactionCubitState.transactionData!)
                      : (transactionCubitState.transactionData?.transactionLineDTOList != null /*&& (transactionCubitState.transactionData?.transactionLineDTOList?.isNotEmpty)*/)
                          ? _createNonSeatBasedTransactionLinesList(transactionCubitState.transactionData!)
                          : null
              : null);
    });
  }

  void _onTransactionLinesGroupTapped(TransactionLinesGroup transactionLinesGroup) {
    if (_selectedTransactionLinesGroup == transactionLinesGroup) {
      _selectedTransactionLinesGroup = null;
    } else {
      _selectedTransactionLinesGroup = transactionLinesGroup;
    }
    widget.onTransactionLinesGroupTapped(transactionLinesGroup, _selectedTransactionLinesGroup != null);
  }

  Widget _createNonSeatBasedTransactionLinesList(TransactionData transaction) {
    TransactionCubit transactionCubit = context.read<TransactionCubit>();
    return Scroller(
      controller: _scrollController,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: transactionCubit.state.transactionLinesGroupsBySeat?[""]?.length ?? 0,
        physics: const AlwaysScrollableScrollPhysics(),
        controller: _scrollController,
        padding: EdgeInsets.only(
            right: SizeConfig.isBigDevice() ? SizeConfig.getWidth(33.0) : SizeConfig.getWidth(55.0),
            bottom: SizeConfig.getHeight(1.0),
            left: SizeConfig.getWidth(7.0),
            top: SizeConfig.getHeight(5.0)),
        itemBuilder: (context, position) {
          TransactionLinesGroup? transactionLinesGroup = transactionCubit.state.transactionLinesGroupsBySeat?[""]?[position];
          return GestureDetector(
            onTap: () {
              _onTransactionLinesGroupTapped(transactionLinesGroup);
              setState(() {});
            },
            child: TransactionLinesGroupView(
                transactionLinesGroup!,
                _selectedTransactionLinesGroup == transactionLinesGroup,
                transactionCubit.state.transactionData!,
                widget.currency,
                widget.amountFmt
            ),
          );
        },
      ),
    );
  }

  Widget _createSeatBasedTransactionLinesList(TransactionData transaction) {
    TransactionCubit transactionCubit = context.read<TransactionCubit>();
    _transactionLinesBySeat = {};
    List<TransactionLineDTO> transactionLineDTOList = transactionCubit.state.transactionData?.transactionLineDTOList??[];

    for (var transactionLine in transactionLineDTOList) {
      List<TransactionLineDTO>? transactionLinesBySeat = _transactionLinesBySeat[transactionLine.seatName];
      transactionLinesBySeat ??= [];
      transactionLinesBySeat.add(transactionLine);
      _transactionLinesBySeat[transactionLine.seatName ?? ''] = transactionLinesBySeat;
    }

    return Scroller(
        controller: _scrollController,
        child: BlocBuilder<TransactionCubit, TransactionCubitState>(
            builder: (context, TransactionCubitState transactionCubitState) {
          return ListView.builder(
            shrinkWrap: true,
            physics: const AlwaysScrollableScrollPhysics(),
            itemCount: transactionCubitState.seatNames?.length ?? 0,
            controller: _scrollController,
            padding: EdgeInsets.only(
                right: SizeConfig.isBigDevice() ? SizeConfig.getWidth(33.0) : SizeConfig.getWidth(55.0),
                bottom: SizeConfig.getHeight(1.0),
                left: SizeConfig.getWidth(7.0),
                top: SizeConfig.getHeight(5.0)),
            itemBuilder: (context, position) {
              String seatName = transactionCubitState.seatNames?[position] ?? "";
              return GestureDetector(
                onTap: () {
                  context.read<TransactionCubit>().changeSeat(position);
                },
                child: Column(
                  children: [
                    ConstrainedBox(
                      constraints: const BoxConstraints(
                        minWidth: double.infinity,
                      ),
                      child: Container(
                        margin: EdgeInsets.only(
                            left: SizeConfig.getWidth(1.0),
                            top: SizeConfig.getHeight(2.0),
                            right: SizeConfig.getWidth(1.0)),
                        padding: EdgeInsets.symmetric(horizontal: SizeConfig.getWidth(12.0), vertical: SizeConfig.getHeight(6.0)),
                        height: SizeConfig.getHeight(40),
                        decoration: BoxDecoration(
                          color: (position == transactionCubitState.selectedSeat)
                                  ? theme?.primaryButtonColor
                                  : theme?.cartItemCardInnerShadow1,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              (position == transactionCubitState.selectedSeat)
                                  ? "*  $seatName"
                                  : seatName,
                              textAlign: TextAlign.left,
                              style: theme?.subtitleLight2?.copyWith(
                                  color: Colors.white,
                                  fontSize: SizeConfig.getFontSize(18)),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            position != 0
                                ? (position == transactionCubitState.selectedSeat)
                                    ? (transactionCubitState.transactionLinesGroupsBySeat?[seatName]) != null
                                        ? InkWell(
                                            onTap: () {
                                              showDialog(
                                                  context: context,
                                                  builder: (BuildContext context) {
                                                    return NameTransactionSeatDialog(
                                                        seatName: seatName,
                                                        seatNamesList: transactionCubitState.seatNames,
                                                        transactionLines:
                                                            transactionCubitState.transactionLinesGroupsBySeat?[seatName],
                                                        onComplete: () {
                                                          widget.onTransactionSeatNameUpdated();
                                                        });
                                                  });
                                            },
                                            child: Image.asset(
                                              'assets/ic_edit_seat_name.png',
                                              color: theme?.light1,
                                              width: SizeConfig.getWidth(24),
                                              height: SizeConfig.getHeight(24),
                                            ),
                                          )
                                        : SizedBox(width: SizeConfig.getWidth(0))
                                    : SizedBox(width: SizeConfig.getWidth(0))
                                : SizedBox(width: SizeConfig.getWidth(0)),
                          ],
                        ),
                      ),
                    ),
                    ...?transactionCubitState.transactionLinesGroupsBySeat?[seatName]?.map((transactionLinesGroup) {
                      return GestureDetector(
                        onTap: () {
                          _onTransactionLinesGroupTapped(transactionLinesGroup);
                          setState(() {});
                        },
                        child: TransactionLinesGroupView(
                            transactionLinesGroup,
                            _selectedTransactionLinesGroup == transactionLinesGroup,
                            transactionCubitState.transactionData!,
                            widget.currency,
                            widget.amountFmt
                        ),
                      );
                    })
                  ],
                ),
              );
            },
          );
        }));
  }

  Widget _createSearchResultsTransactionLinesList() {
    return Scrollbar(
        thumbVisibility: true,
        radius: Radius.circular(SizeConfig.getSize(5)),
        thickness: SizeConfig.getWidth(5),
        controller: _scrollController,
        child: BlocBuilder<TransactionCubit, TransactionCubitState>(
            builder: (context, TransactionCubitState transactionCubitState) {
          return Column(
            children: [
              ListView.builder(
                shrinkWrap: true,
                physics: const AlwaysScrollableScrollPhysics(),
                itemCount: transactionCubitState.searchResultsTransactionLineGroups?.length ?? 0,
                controller: _scrollController,
                padding: EdgeInsets.only(
                    right: SizeConfig.getWidth(1.5),
                    bottom: SizeConfig.getHeight(1.5)),
                itemBuilder: (context, position) {
                  return GestureDetector(
                    onTap: () {
                      context.read<TransactionCubit>().changeSeat(position);
                    },
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            _onTransactionLinesGroupTapped(transactionCubitState.searchResultsTransactionLineGroups![position]);
                            setState(() {});
                          },
                          child: TransactionLinesGroupView(
                              transactionCubitState.searchResultsTransactionLineGroups![position],
                              _selectedTransactionLinesGroup == transactionCubitState.searchResultsTransactionLineGroups![position],
                              transactionCubitState.transactionData!,
                              widget.currency,
                              widget.amountFmt
                          ),
                        ),
                        // }),
                      ],
                    ),
                  );
                },
              ),
            ],
          );
        }));
  }
}
