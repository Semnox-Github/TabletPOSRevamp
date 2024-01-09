library transaction_id_ui;

import 'package:auto_size_text/auto_size_text.dart';
import 'package:execution_context/builder.dart';
import 'package:master_data/builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:widgets_library/utils/time_zones.dart';
import 'package:themes_library/themes_library.dart';
import 'package:transaction_ui/cubit/transaction_cubit.dart';
import 'package:transaction_ui/cubit/transaction_cubit_state.dart';
import 'package:instant/instant.dart';
import 'package:messages_data/builder.dart';
import 'package:widgets_library/utils/size_config.dart';

class TransactionHeaderView extends StatefulWidget {
  const TransactionHeaderView({super.key});

  @override
  State<StatefulWidget> createState() => _TransactionHeaderViewState();
}

class _TransactionHeaderViewState extends State<TransactionHeaderView> {
  String? _timeZoneName;
  String? _serverDateTime;
  String? _serverTime;
  String? _serverDate;
  String? _dateFormat = "dd-MMM-yyyy ";
  String? _timeFormat = "hh:mm:ss a";
  String? _dateTimeFormat;

  @override
  void initState() {
    super.initState();
    Future.microtask(() => _getServerTime());
  }

  @override
  Widget build(BuildContext context) {
    SemnoxTheme theme = Theme.of(context).extension<SemnoxTheme>()!;
    SizeConfig.init(context);
    return BlocBuilder<TransactionCubit, TransactionCubitState>(
        builder: (context, TransactionCubitState transactionCubitState) {
      ///
      /// Transaction Lines Item Count  logic.
      ///
      int itemsCount = transactionCubitState.transactionData?.transactionLineDTOList.length ?? 0;
      transactionCubitState.transactionData?.transactionLineDTOList.forEach((transactionLine) {
        itemsCount = (itemsCount + (transactionLine.transactionLineDTOList.length ?? 0));
      });

      return Container(
        padding: EdgeInsets.only(left: SizeConfig.getWidth(8), top: SizeConfig.getHeight(8), right: SizeConfig.getWidth(10)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              overflow: TextOverflow.ellipsis,
              (transactionCubitState.transactionData != null && transactionCubitState.transactionData?.status != "CANCELLED")
                  ? "${transactionCubitState.transactionData?.transactionNumber} ${MessagesProvider.get("(&1 items)", [itemsCount])}"
                  : (transactionCubitState.transactionData != null)
                      ? "${transactionCubitState.transactionData?.transactionNumber} ${MessagesProvider.get("(&1 items)", [0])}"
                      : MessagesProvider.get("(&1 items)", [0]),
              textAlign: TextAlign.start,
              style: theme.subtitle3?.copyWith(fontSize: SizeConfig.getFontSize(18)),
              maxLines: 2,
            ),
            Flexible(
              child: AutoSizeText.rich(
                textAlign: TextAlign.end,
                overflow: TextOverflow.ellipsis,
                TextSpan(children: [
                  TextSpan(
                    text: (transactionCubitState.transactionData != null)
                        ? DateFormat(_dateFormat)
                            .format(DateTime.parse((transactionCubitState.transactionData?.transactionDate).toString()))
                        : _serverDate ?? DateFormat(_dateFormat).format(DateTime.now()),
                    style: theme.subtitle3?.copyWith(fontSize: SizeConfig.getFontSize(18)),
                  ),
                  TextSpan(
                    text: (transactionCubitState.transactionData != null)
                        ? DateFormat(_timeFormat)
                            .format(DateTime.parse((transactionCubitState.transactionData?.transactionDate).toString()))
                        : _serverTime ?? DateFormat(_timeFormat).format(DateTime.now()),
                    style: theme.subtitle2?.copyWith(fontSize: SizeConfig.getFontSize(19)),
                  )
                ]),
              ),
            ),
          ],
        ),
      );
    });
  }

  _getServerTime() async {
    final execContextBL = await ExecutionContextBuilder.build();
    final execContextDTO = execContextBL.getExecutionContext();
    final masterDataBL = await MasterDataBuilder.build(execContextDTO!);
    final dateTimeFormat = await masterDataBL.getDefaultValuesByName(defaultValueName: "DATETIME_FORMAT");
    _dateTimeFormat = (dateTimeFormat!.contains("tt")) ? dateTimeFormat.replaceAll("tt", "a") : dateTimeFormat;

    final dateTimeSplits = _dateTimeFormat?.split(" ");
    _dateFormat = dateTimeSplits?[0];
    _timeFormat = " ${dateTimeSplits![1]} ${dateTimeSplits[2]}";

    final sites = await masterDataBL.getSites();

    final item = sites?.data?.siteContainerDTOList.where((element) => element.siteId == execContextDTO.siteId);
    if (item?.isNotEmpty == true) {
      final zone = item!.first.timeZoneName;
      _timeZoneName = timeZoneMap[zone];
    }

    final currentZone = curDateTimeByZone(zone: _timeZoneName ?? 'GMT');
    String dateTime = DateFormat("EEEE, dd-MMM-yyyy hh:mm:ss a").format(currentZone);
    _serverTime = DateFormat(_timeFormat).format(currentZone);
    _serverDate = DateFormat(_dateFormat).format(currentZone);

    if (dateTime != _serverDateTime) {
      setState(() {
        _serverDateTime = dateTime;
      });
    }
  }
}
