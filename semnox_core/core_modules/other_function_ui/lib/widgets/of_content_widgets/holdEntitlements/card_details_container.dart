import 'package:customer_data/models/account_details/account_details_data.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:messages_data/builder.dart';
import 'package:other_function_ui/widgets/colors.dart';
import 'package:themes_library/themes_library.dart';
import 'package:widgets_library/utils/size_config.dart';

class CardDetailsContainer extends StatefulWidget {
  final bool? isRefund;
  final int? itemLength;
  final bool? isAdded;
  final int? itemIndex;
  final bool? isDeactivate;
  final bool? isSelected;
  final Function()? onDelete;
  final bool? isExpanded;
  final AccountDetailsData? data;
  final bool? selectAllCollapse;
  final String? dateFormat;
  const CardDetailsContainer(
      {super.key,
      this.data,
      this.itemLength,
      this.selectAllCollapse,
      this.isSelected,
      this.isAdded,
      this.isRefund,
      this.dateFormat,
      this.itemIndex,
      this.isExpanded,
      this.onDelete,
      this.isDeactivate});

  @override
  State<CardDetailsContainer> createState() => _CardDetailsContainerState();
}

class _CardDetailsContainerState extends State<CardDetailsContainer> {
  int _collapseValue = 1;

  @override
  Widget build(BuildContext context) {
    SemnoxTheme theme = Theme.of(context).extension<SemnoxTheme>()!;
    SizeConfig.init(context);
    return Container(
      width: MediaQuery.of(context).size.width * 0.30,
      decoration: BoxDecoration(
        color: theme.backGroundColor,
        border: Border.all(
          color:
              (widget.isSelected ?? false) ? KColor.primaryBlack : Colors.grey,
        ),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.data?.tagNumber ?? "0",
                        style: const TextStyle(
                            fontSize: 12, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Status: ${_getCardType(widget.data!)}',
                        style: const TextStyle(
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Visibility(
                    visible: (widget.isDeactivate ?? false) ||
                        (widget.isRefund ?? false),
                    child: Padding(
                      padding: const EdgeInsets.all(1),
                      child: SizedBox(
                        height: SizeConfig.getSize(30),
                        width: SizeConfig.getSize(30),
                        child: IconButton(
                          padding: const EdgeInsets.all(0),
                          icon: Image.asset(
                            'assets/DeleteIcon.png',
                            color: theme.secondaryColor,
                            height: SizeConfig.getSize(30),
                            width: SizeConfig.getSize(30),
                          ),
                          onPressed: widget.onDelete,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(1),
                    child: Container(
                      height: SizeConfig.getSize(35),
                      width: SizeConfig.getSize(35),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        border:
                            Border.all(color: theme.secondaryColor!, width: 2),
                      ),
                      child: RotatedBox(
                        quarterTurns: widget.isDeactivate ?? false
                            ? ((widget.selectAllCollapse ?? false))
                                ? (widget.itemIndex ==
                                            ((widget.itemLength ?? 0) - 1) &&
                                        (widget.isAdded ?? false))
                                    ? 3
                                    : (widget.isExpanded ?? false)
                                        ? (widget.isAdded ?? false)
                                            ? 3
                                            : 1
                                        : 3
                                : (widget.itemIndex ==
                                            ((widget.itemLength ?? 0) - 1) &&
                                        (widget.isAdded ?? false))
                                    ? 1
                                    : (widget.isExpanded ?? false)
                                        ? (widget.isAdded ?? false)
                                            ? 3
                                            : 1
                                        : 3
                            : _collapseValue,
                        child: IconButton(
                          padding: const EdgeInsets.all(0),
                          icon: Image.asset(
                            'assets/back_arrow_white.png',
                            color: theme.secondaryColor,
                            height: SizeConfig.getSize(15),
                            width: SizeConfig.getSize(15),
                          ),
                          onPressed: () {
                            if (!(widget.isDeactivate ?? false)) {
                              setState(() {
                                _collapseValue = _collapseValue == 1 ? 3 : 1;
                              });
                            }
                          },
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Text(
                'Valid Till - ${DateFormat(widget.dateFormat ?? 'dd-MMM-yyyy HH:mm:ss a').format(DateTime.parse(widget.data?.issueDate ?? ''))}',
                style: const TextStyle(fontSize: 12),
              ),
              const Divider(
                color: Colors.grey,
                height: 10,
                thickness: 1.5,
                indent: 0,
                endIndent: 0,
              ),
              Visibility(
                visible: widget.isDeactivate ?? false
                    ? ((widget.selectAllCollapse ?? false))
                        ? (widget.itemIndex == ((widget.itemLength ?? 0) - 1) &&
                                (widget.isAdded ?? false))
                            ? false
                            : (widget.isExpanded ?? false)
                                ? (widget.isAdded ?? false)
                                    ? false
                                    : true
                                : false
                        : (widget.itemIndex == ((widget.itemLength ?? 0) - 1) &&
                                (widget.isAdded ?? false))
                            ? true
                            : (widget.isExpanded ?? false)
                                ? (widget.isAdded ?? false)
                                    ? false
                                    : true
                                : false
                    : _collapseValue == 1
                        ? true
                        : false,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Credits',
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          ),
                          Text(
                            (widget.data?.accountSummaryDTO
                                    ?.creditPlusCardBalance
                                    .toStringAsFixed(2))
                                .toString(),
                            style: const TextStyle(
                                fontSize: 12, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          const Text(
                            'Time',
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          ),
                          Text(
                            (widget.data?.accountSummaryDTO?.totalTimeBalance ??
                                    0.00)
                                .toStringAsFixed(2),
                            style: const TextStyle(
                                fontSize: 12, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          const Text(
                            'Loyalty Points',
                            maxLines: 2,
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          ),
                          Text(
                            (widget.data?.accountSummaryDTO
                                    ?.totalLoyaltyPointBalance
                                    .toStringAsFixed(2))
                                .toString(),
                            style: const TextStyle(
                                fontSize: 12, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          const Text(
                            'Counter Item',
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          ),
                          Text(
                            (widget.data?.accountSummaryDTO
                                        ?.creditPlusItemPurchase ??
                                    0.00)
                                .toStringAsFixed(2),
                            style: const TextStyle(
                                fontSize: 12, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          const Text(
                            'Courtesy',
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          ),
                          Text(
                            (widget.data?.courtesy?.toStringAsFixed(2))
                                .toString(),
                            style: const TextStyle(
                                fontSize: 12, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 40,
                    ),
                    Flexible(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Tickets',
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          ),
                          Text(
                            (widget.data?.totalTicketsBalance
                                    ?.toStringAsFixed(2))
                                .toString(),
                            style: const TextStyle(
                                fontSize: 12, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          const Text(
                            'Games',
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          ),
                          Text(
                            '${widget.data?.totalGamesBalance?.toStringAsFixed(2)}',
                            style: const TextStyle(
                                fontSize: 12, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          const Text(
                            'Play Credits',
                            maxLines: 2,
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          ),
                          Text(
                            '${widget.data?.accountSummaryDTO?.creditPlusGamePlayCredits.toStringAsFixed(2)}',
                            style: const TextStyle(
                                fontSize: 12, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          const Text(
                            'Bonus',
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          ),
                          Text(
                            (widget.data?.accountSummaryDTO
                                        ?.totalBonusBalance ??
                                    0.00)
                                .toStringAsFixed(2),
                            style: const TextStyle(
                                fontSize: 12, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          const Text(
                            'Card Deposite',
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          ),
                          Text(
                            ' ${widget.data?.faceValue?.toStringAsFixed(2)}',
                            style: const TextStyle(
                                fontSize: 12, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ]),
      ),
    );
  }

  String _getCardType(AccountDetailsData accountsData) {
    if (accountsData.accountId == -1) {
      return MessagesProvider.get("New Card");
    } else if (accountsData.accountId > 0 &&
        accountsData.obligationStatus == "HELD") {
      return MessagesProvider.get("HELD");
    } else if (accountsData.accountId > 0 &&
        accountsData.obligationStatus == "ACTIVATED") {
      return MessagesProvider.get("Issued Card");
    } else if (accountsData.accountId > 0 &&
        accountsData.obligationStatus == "ADDED") {
      return MessagesProvider.get("Not Activated");
    } else {
      return '';
    }
  }
}
