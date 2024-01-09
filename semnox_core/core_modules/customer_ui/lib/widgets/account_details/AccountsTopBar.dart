import 'package:customer_data/models/account_details/account_details_data.dart';
import 'package:execution_context/builder.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:master_data/builder.dart';
import 'package:master_data/models/configurations/configuration_response.dart';
import 'package:master_data/models/configurations/parafait_default_container_dto.dart';
import 'package:messages_data/builder.dart';
import 'package:themes_library/themes_library.dart';
import 'package:widgets_library/utils/size_config.dart';

class AccountsTopBar extends StatefulWidget {
  AccountDetailsData? accountsData;

  AccountsTopBar({super.key, this.accountsData});

  @override
  State<AccountsTopBar> createState() => _AccountsTopBarState();
}

class _AccountsTopBarState extends State<AccountsTopBar> {

  String? _dateFormat;

  @override
  void initState() {
    super.initState();
    _getConfigurations(context);
  }

  @override
  Widget build(BuildContext context) {
    SemnoxTheme theme = Theme.of(context).extension<SemnoxTheme>()!;
    SizeConfig.init(context);
    return Padding(
      padding: const EdgeInsets.only(left: 8.0,right: 8.0),
      child: SizedBox(
        height: 90,
        child: Card(
          elevation: 1,
          color: theme.tableRow1,
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.payment,
                            color: theme.secondaryColor,
                            size: 20,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            widget.accountsData?.tagNumber ?? "",
                            style: theme.description1?.copyWith(fontSize: SizeConfig.getFontSize(16)),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Visibility(
                        visible: (widget.accountsData?.customerName) == " ",
                        child: Text(
                          widget.accountsData?.tagNumber ?? '',
                          style:theme.description2?.copyWith(fontWeight: FontWeight.w600,fontSize: SizeConfig.getFontSize(16)),
                        ),
                      ),
                      Visibility(
                        visible: (widget.accountsData?.customerName) != " ",
                        child: Text(
                          widget.accountsData?.customerName ?? '',
                          style: theme.description2?.copyWith(fontWeight: FontWeight.w600,fontSize: SizeConfig.getFontSize(16)),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                             Icon(
                              Icons.calendar_today_outlined,
                              color: theme.secondaryColor,
                              size: 20,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              DateFormat(_dateFormat).format(
                                  DateTime.parse(widget.accountsData?.issueDate ??
                                      '0001-01-01T00:00:00')),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: theme.description2?.copyWith(fontWeight: FontWeight.w600,fontSize: SizeConfig.getFontSize(16)),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                    widget.accountsData  != null ? _isDateGreater(widget.accountsData?.expiryDate) ? MessagesProvider.get("Issued Card") : MessagesProvider.get("Expired Card") : "",
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: theme.description2?.copyWith(fontWeight: FontWeight.w600,fontSize: SizeConfig.getFontSize(16)),
                    ),
                    const SizedBox(height: 5,),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                           Icon(Icons.star_border,color: theme.secondaryColor,size: 20,),
                          const SizedBox(width: 0,),
                          Text((widget.accountsData?.membershipName == null || widget.accountsData?.membershipName == "") ? (widget.accountsData?.vipCustomer == true) ? "VIP" : "Normal" :
                          widget.accountsData?.membershipName ?? "",
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: theme.description2?.copyWith(fontWeight: FontWeight.w600,fontSize: SizeConfig.getFontSize(16)),
                          ),
                        ],
                      ),
                    ),
                  ],
                )),
                const SizedBox(width: 4.0,),
                Expanded(
                  flex: 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Credits",
                        style: theme.description2?.copyWith(fontSize: SizeConfig.getFontSize(16)),
                      ),
                      Text(
                        widget.accountsData?.accountSummaryDTO?.totalGamePlayCreditsBalance.toStringAsFixed(2) ?? "",
                        style: theme.description2?.copyWith(fontWeight: FontWeight.w600,fontSize: SizeConfig.getFontSize(16)),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Play Credits",
                       style: theme.description2?.copyWith(fontSize: SizeConfig.getFontSize(16)),
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        widget.accountsData?.accountSummaryDTO?.creditPlusGamePlayCredits.toStringAsFixed(2) ?? "",
                        style: theme.description2?.copyWith(fontWeight: FontWeight.w600,fontSize: SizeConfig.getFontSize(16)),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Tickets",
                       style: theme.description2?.copyWith(fontSize: SizeConfig.getFontSize(16)),
                      ),
                      Text(
                        widget.accountsData?.totalTicketsBalance?.toStringAsFixed(2) ?? "",
                        style: theme.description2?.copyWith(fontWeight: FontWeight.w600, fontSize: SizeConfig.getFontSize(16)),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Counter Items",
                       style: theme.description2?.copyWith(fontSize: SizeConfig.getFontSize(16)),
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        widget.accountsData?.accountSummaryDTO?.creditPlusItemPurchase.toStringAsFixed(2) ?? "",
                        style: theme.description2?.copyWith(fontWeight: FontWeight.w600,fontSize: SizeConfig.getFontSize(16)),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Time",
                       style: theme.description2?.copyWith(fontSize: SizeConfig.getFontSize(16)),
                      ),
                      Text(
                        widget.accountsData?.time?.toStringAsFixed(2) ?? "",
                        style: theme.description2?.copyWith(fontWeight: FontWeight.w600,fontSize: SizeConfig.getFontSize(16)),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Bonus",
                       style: theme.description2?.copyWith(fontSize: SizeConfig.getFontSize(16)),
                      ),
                      Text(
                        widget.accountsData?.totalBonusBalance?.toStringAsFixed(2) ?? "",
                        style: theme.description2?.copyWith(fontWeight: FontWeight.w600,fontSize: SizeConfig.getFontSize(16)),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Games",
                       style: theme.description2?.copyWith(fontSize: SizeConfig.getFontSize(16)),
                      ),
                      Text(
                        widget.accountsData?.totalGamesBalance?.toStringAsFixed(2) ?? "",
                        style: theme.description2?.copyWith(fontWeight: FontWeight.w600,fontSize: SizeConfig.getFontSize(16)),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Courtesy",
                       style: theme.description2?.copyWith(fontSize: SizeConfig.getFontSize(16)),
                      ),
                      Text(
                        widget.accountsData?.totalCourtesyBalance?.toStringAsFixed(2) ?? "",
                        style: theme.description2?.copyWith(fontWeight: FontWeight.w600,fontSize: SizeConfig.getFontSize(16)),
                      ),
                    ],
                  ),
                ),
                Expanded(
                    flex: 1,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Loyalty Points",
                         style: theme.description2?.copyWith(fontSize: SizeConfig.getFontSize(16)),
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          widget.accountsData?.loyaltyPoints?.toStringAsFixed(2) ?? "",
                          style: theme.description2?.copyWith(fontWeight: FontWeight.w600,fontSize: SizeConfig.getFontSize(16)),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Card Deposit",
                         style: theme.description2?.copyWith(fontSize: SizeConfig.getFontSize(16)),
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          widget.accountsData?.faceValue?.toStringAsFixed(2) ?? "",
                          style: theme.description2?.copyWith(fontWeight: FontWeight.w600,fontSize: SizeConfig.getFontSize(16)),
                        ),
                      ],
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }

  bool _isDateGreater(String? date){
    if(date != null) {
      DateTime dt1 = DateTime.parse(date); //from
      DateTime dt2 = DateTime.now();
      return dt1.compareTo(dt2) > 0 ? true : false;
    }else{
      return true;
    }
  }

  Future _getConfigurations(BuildContext context) async {
    var execContextBL = await ExecutionContextBuilder.build();
    var sysExecContext = execContextBL.getExecutionContext();
    var masterDataBl = await MasterDataBuilder.build(sysExecContext!);
    _dateFormat = await masterDataBl.getDefaultValuesByName(defaultValueName: "DATETIME_FORMAT");
    _dateFormat = _dateFormat?.replaceAll('tt', 'a');
  }
}
