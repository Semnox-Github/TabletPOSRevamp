import 'package:customer_data/models/account_details/account_details_data.dart';
import 'package:customer_data/models/account_details/account_details_response.dart';
import 'package:execution_context/builder.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:master_data/builder.dart';
import 'package:messages_data/builder.dart';
import 'package:themes_library/themes_library.dart';
import 'package:widgets_library/utils/size_config.dart';
import '../../widgets/of_content_widgets/general/card_balance.dart';

class CardDetailsWidget extends StatelessWidget {
  final double? textSize;
  final AccountDetailsResponse? accounts;
  CardDetailsWidget({super.key, this.accounts,this.textSize});
  late SemnoxTheme _theme;

  @override
  Widget build(BuildContext context) {
    _theme = Theme.of(context).extension<SemnoxTheme>()!;
    SizeConfig.init(context);
    return  Padding(
      padding:  EdgeInsets.all(SizeConfig.getSize(8)),
      child: SizedBox(
        width: double.infinity,
        height: SizeConfig.getSize(96),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FutureBuilder(
                future: _getDatDefaultFormat(),
                builder: (context, snapshot) {
                  if(snapshot.hasData){
                    print("accounts?.data?.first.issueDate ${accounts?.data?.first.issueDate}");
                    return CardDetailsColumn(
                      textSize: textSize,
                      text1: accounts?.data?.first.tagNumber ?? '0',
                      image2: Image.asset('assets/calendar.png',color: _theme.secondaryColor,),
                      text2: accounts?.data?.first.issueDate == null
                          ? ''
                      // :DateFormat.yMEd().add_jms().format(DateFormat(snapshot.data).parse(_formatDateTime(accounts?.data?.first.issueDate))).toString(),
                          : DateFormat(_formatDateTime(snapshot.data))
                          .format(DateTime.parse(accounts?.data?.first.issueDate??DateTime.now().toIso8601String()))
                          .toString(),
                      text3: (accounts?.data?.first.customerName == ' ' ||
                          accounts?.data?.first.customerName == '')
                          ? accounts?.data?.first.tagNumber ?? '0'
                          : accounts?.data?.first.customerName,
                      image1: Image.asset('assets/card.png',color: _theme.secondaryColor,),
                    );
                  }else{
                    return CardDetailsColumn(
                      textSize: textSize,
                      text1: accounts?.data?.first.tagNumber ?? '0',
                      image2: Image.asset('assets/calendar.png',color: _theme.secondaryColor,),
                      text2: accounts?.data?.first.issueDate == null
                          ? ''
                          : DateFormat('dd MMM yyyy, hh:mm:ss a')
                          .format(DateTime.parse(accounts?.data?.first.issueDate??DateTime.now().toIso8601String()))
                          .toString(),
                      text3: (accounts?.data?.first.customerName == ' ' ||
                          accounts?.data?.first.customerName == '')
                          ? accounts?.data?.first.tagNumber ?? '0'
                          : accounts?.data?.first.customerName,
                      image1: Image.asset('assets/card.png',color: _theme.secondaryColor,),
                    );
                  }

                }
            ),

            CardDetailsColumn(
              textSize: textSize,
              text1: _getCardType(accounts!.data!.first),
              text2: '',
              image3: Image.asset('assets/star.png',color: _theme.secondaryColor,),
              text3: (accounts?.data?.first.vipCustomer ?? false)
                  ? MessagesProvider.get("VIP Member")
                  : MessagesProvider.get("Normal"),
            ),
            CardBalance(
              textSize: textSize,
              firsttitle: MessagesProvider.get('Credits'),
              firstdesc: (accounts?.data?[0].accountSummaryDTO
                  ?.creditPlusCardBalance ??
                  0.00)
                  .toStringAsFixed(2),
              secondtitle: MessagesProvider.get('Play Credits'),
              seconddesc: (accounts?.data?[0].accountSummaryDTO
                  ?.creditPlusGamePlayCredits ??
                  0.00)
                  .toStringAsFixed(2),
            ),
            CardBalance(
              textSize: textSize,
              firsttitle: MessagesProvider.get('Tickets'),
              firstdesc: (accounts?.data?[0].accountSummaryDTO
                  ?.totalTicketsBalance ??
                  0.00)
                  .toStringAsFixed(2),
              secondtitle: MessagesProvider.get('Counter Items'),
              seconddesc: (accounts?.data?[0].accountSummaryDTO
                  ?.creditPlusItemPurchase ??
                  0.00)
                  .toStringAsFixed(2),
            ),
            CardBalance(
              textSize: textSize,
              firsttitle: MessagesProvider.get('Time'),
              firstdesc: (accounts?.data?.first.accountSummaryDTO
                  ?.totalTimeBalance ??
                  0.00)
                  .toStringAsFixed(2),
              secondtitle: MessagesProvider.get('Bonus'),
              seconddesc: (accounts
                  ?.data?[0].accountSummaryDTO?.totalBonusBalance ??
                  0.00)
                  .toStringAsFixed(2),
            ),
            CardBalance(
              textSize: textSize,
              firsttitle: MessagesProvider.get('Games'),
              firstdesc: (accounts
                  ?.data?[0].accountSummaryDTO?.totalGamesBalance ??
                  0.00)
                  .toStringAsFixed(2),
              secondtitle: MessagesProvider.get('Courtesy'),
              seconddesc: (accounts?.data?[0].accountSummaryDTO
                  ?.totalCourtesyBalance ??
                  0.00)
                  .toStringAsFixed(2),
            ),
            CardBalance(
              textSize: textSize,
              firsttitle: MessagesProvider.get('Loyalty Points'),
              firstdesc: (accounts?.data?[0].accountSummaryDTO
                  ?.totalLoyaltyPointBalance ??
                  0.00)
                  .toStringAsFixed(2),
              secondtitle: MessagesProvider.get('Card Deposit'),
              seconddesc:
              '${(accounts?.data?.first.faceValue ?? 0.00).toStringAsFixed(2)}',
            ),
          ],
        ),
      ),
    );

  }


  String _formatDateTime(dateFormatString) {
    print("incomingat $dateFormatString");
    if (dateFormatString.contains("tt")) {
      final newModifiedString = dateFormatString.replaceAll("tt", "a");
      print("modifiedIf $newModifiedString");

      return newModifiedString;
    } else {
      print("modifiedElse $dateFormatString");

      return dateFormatString;
    }
  }

  Future<String> _getDatDefaultFormat() async {
    String dateTimeFormat = 'dd-MMM-yyyy hh:mm:ss tt';
    final execContextBL = await ExecutionContextBuilder.build();
    final execContextDTO = execContextBL.getExecutionContext();
    final masterDataBL = await MasterDataBuilder.build(execContextDTO!);
    dateTimeFormat = await masterDataBL.getDefaultValuesByName(
        defaultValueName: "DATETIME_FORMAT") ??
        'dd-MMM-yyyy hh:mm:ss tt';
    return dateTimeFormat;
  }

  String _getCardType(AccountDetailsData accountsData){
   if(accountsData.accountId == -1){
     return MessagesProvider.get("New Card");
   }else if(accountsData.accountId > 0 && accountsData.obligationStatus == "HELD"){
     return MessagesProvider.get("HELD");
   }else if(accountsData.accountId > 0 && accountsData.obligationStatus == "ACTIVATED"){
     return MessagesProvider.get("Issued Card");
   }else if(accountsData.accountId > 0 && accountsData.obligationStatus == "ADDED"){
     return MessagesProvider.get("Not Activated");
   }else{
     return '';
   }
  }
}

class CardDetailsColumn extends StatelessWidget {
  final double? textSize;
  final String text1, text2;
  final String? text3;
  final Image? image1, image2, image3;
  const CardDetailsColumn(
      {super.key,
      required this.text1,
      this.text3,
        this.textSize,
      required this.text2,
      this.image1,
      this.image3,
      this.image2});

  @override
  Widget build(BuildContext context) {
    SemnoxTheme _theme = Theme.of(context).extension<SemnoxTheme>()!;
    SizeConfig.init(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: image3 !=null ? MainAxisAlignment.start:MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            SizedBox(
                height: SizeConfig.getSize(20),
                width:SizeConfig.getSize(20),
                child: image1 ?? const SizedBox.shrink()),
             SizedBox(width: SizeConfig.getSize(10)),
            Text(text1, style: _theme.subtitle3!.copyWith(fontSize: SizeConfig.getFontSize(textSize ?? 16))),
          ],
        ),
        text3 == null
            ? const SizedBox.shrink()
            : Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            image3 !=null ? SizedBox(
                height: SizeConfig.getSize(20),
                width:SizeConfig.getSize(20),
                child: image3):const SizedBox(),
            image3 != null ?  SizedBox(width: SizeConfig.getSize(10)) : const SizedBox(),
            Text(text3 ?? '', style:_theme.subtitle3!.copyWith(fontSize: SizeConfig.getFontSize(textSize ?? 16))),
          ],
        ),
        Row(
          children: [
            SizedBox(
                height: SizeConfig.getSize(20),
                width:SizeConfig.getSize(20),
                child: image2 ?? const SizedBox.shrink()),
             SizedBox(width: SizeConfig.getSize(10)),
            Text(text2, style:_theme.subtitle3!.copyWith(fontSize: SizeConfig.getFontSize(textSize ?? 16))),
          ],
        )
      ],
    );
  }
}
