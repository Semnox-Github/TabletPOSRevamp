import 'package:customer_data/models/account_details/account_details_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:messages_data/builder.dart';
import 'package:themes_library/themes_library.dart';
import 'package:widgets_library/scroller.dart';
import 'package:widgets_library/utils/size_config.dart';

class CardDetailsWidget extends StatefulWidget {
  AccountDetailsData? _selectedData;
  String? _dateTimeFormat ;


  @override
  State<CardDetailsWidget> createState() => _CardDetailsWidgetState();

  CardDetailsWidget(AccountDetailsData? selectedData, String dateTimeFormat){
    this._selectedData = selectedData;
    this._dateTimeFormat = dateTimeFormat;
  }


}

class _CardDetailsWidgetState extends State<CardDetailsWidget>  {
  final ScrollController _horizontal = ScrollController(),
      _vertical = ScrollController();
  int _colapseValue = 1;



  @override
  Widget build(BuildContext context) {
    SemnoxTheme theme = Theme.of(context).extension<SemnoxTheme>()!;
    SizeConfig.init(context);
    print("creditsss ${widget._selectedData?.totalTimeBalance}");
    return SizedBox(
      height: SizeConfig.isBigDevice()?SizeConfig.getSize(400):SizeConfig.getSize(300),
      width: MediaQuery.of(context).size.width * 0.28,
      child: Scroller(
        controller: _vertical,
        child: SizedBox(
          height: SizeConfig.isBigDevice()?SizeConfig.getSize(400):SizeConfig.getSize(300),
          width: MediaQuery.of(context).size.width * 0.28,
          child: RawScrollbar(
            controller: _horizontal,
            thumbVisibility: true,
            trackVisibility: true,
            interactive: true,
            thickness: 20,
            notificationPredicate: (notif) => notif.depth == 1,
            child: Padding(
              padding: EdgeInsets.only(bottom: 20),
              child: SingleChildScrollView(
                controller: _vertical,
                child: SingleChildScrollView(
                  controller: _horizontal,
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding: EdgeInsets.only(right: 20),
                    child: Column(
                      children:[
                        Container(
                          width: SizeConfig.getSize(380),
                          decoration: BoxDecoration(color:theme.backGroundColor ,borderRadius: BorderRadius.circular(5)),
                          child:Padding(
                            padding: EdgeInsets.all(SizeConfig.getSize(40)),
                            child:Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children:[
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(widget._selectedData?.tagNumber ?? "0",style:TextStyle(color:theme.secondaryColor,fontSize: SizeConfig.getFontSize(18),fontWeight: FontWeight.bold),),
                                          Text( MessagesProvider.get('Status: Issued Card'),style:TextStyle(color:theme.secondaryColor,fontSize: SizeConfig.getFontSize(18),),),
                                        ],
                                      ),
                                      const SizedBox(width: 30,),
                                      Padding(
                                        padding: const EdgeInsets.all(1),
                                        child: Container(
                                          height: SizeConfig.getSize(50),
                                          width: SizeConfig.getSize(50),
                                          decoration: BoxDecoration( borderRadius: BorderRadius.circular(30), border: Border.all(color: theme.secondaryColor!,width: 2),),
                                          child: RotatedBox(
                                            quarterTurns: _colapseValue,
                                            child: IconButton(
                                              padding: const EdgeInsets.all(0),
                                              icon: Image.asset('assets/back_arrow_white.png',color : theme.secondaryColor,height: SizeConfig.getSize(30),width: SizeConfig.getSize(30),),
                                              onPressed: () {
                                                setState(() {
                                                  _colapseValue = _colapseValue == 1?3:1;
                                                });
                                              },),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  Text(MessagesProvider.get('Valid Till - ')+(DateFormat(widget._dateTimeFormat).format(DateTime.parse(widget._selectedData?.issueDate ?? '')) ?? '').toString() ?? "0.0",style:TextStyle(color:theme.secondaryColor,fontSize: SizeConfig.getFontSize(18)),),
                                  Divider(
                                    color:  theme.dividerColor,
                                    height: 10,
                                    thickness: 1.5,
                                    indent: 0,
                                    endIndent: 0,
                                  ),
                                  Visibility(
                                    visible: _colapseValue == 1 ?true:false,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(MessagesProvider.get('Credits'),style:TextStyle(color:theme.secondaryColor,fontSize: SizeConfig.getFontSize(18),),),
                                            Text((widget._selectedData?.totalCreditsBalance?.toStringAsFixed(2)).toString() ?? "0.0",style:TextStyle(color:theme.secondaryColor,fontSize: SizeConfig.getFontSize(18),fontWeight: FontWeight.bold),),
                                            const SizedBox(height: 5,),
                                            Text(MessagesProvider.get('Time'),style:TextStyle(color:theme.secondaryColor,fontSize: SizeConfig.getFontSize(18),),),
                                            Text((widget._selectedData?.totalTimeBalance?.toStringAsFixed(2)).toString() ?? "0.0",style:TextStyle(color:theme.secondaryColor,fontSize: SizeConfig.getFontSize(18),fontWeight: FontWeight.bold),),
                                            const SizedBox(height: 5,),
                                            Text(MessagesProvider.get('Loyalty Points'),style:TextStyle(color:theme.secondaryColor,fontSize: SizeConfig.getFontSize(18),),),
                                            Text((widget._selectedData?.loyaltyPoints?.toStringAsFixed(2)).toString() ?? "0.0",style:TextStyle(color:theme.secondaryColor,fontSize: SizeConfig.getFontSize(18),fontWeight: FontWeight.bold),),
                                            const SizedBox(height: 5,),
                                            Text(MessagesProvider.get('Counter Item'),style:TextStyle(color:theme.secondaryColor,fontSize: SizeConfig.getFontSize(18),),),
                                            Text('0.00',style:TextStyle(color:theme.secondaryColor,fontSize: SizeConfig.getFontSize(18),fontWeight: FontWeight.bold),),
                                            const SizedBox(height: 5,),
                                            Text(MessagesProvider.get('Courtesy'),style:TextStyle(color:theme.secondaryColor,fontSize: SizeConfig.getFontSize(18),),),
                                            Text((widget._selectedData?.totalCourtesyBalance?.toStringAsFixed(2)).toString() ?? "0.0",style:TextStyle(color:theme.secondaryColor,fontSize: SizeConfig.getFontSize(18),fontWeight: FontWeight.bold),),
                                          ],
                                        ),
                                        const SizedBox(width: 40,),
                                        Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [

                                            Text(MessagesProvider.get('Tickets'),style:TextStyle(color:theme.secondaryColor,fontSize: SizeConfig.getFontSize(18),),),
                                            Text((widget._selectedData?.totalTicketsBalance?.toStringAsFixed(2)).toString() ?? "0.0",style:TextStyle(color:theme.secondaryColor,fontSize: SizeConfig.getFontSize(18),fontWeight: FontWeight.bold),),
                                            const SizedBox(height: 5,),
                                            Text(MessagesProvider.get('Games'),style:TextStyle(color:theme.secondaryColor,fontSize: SizeConfig.getFontSize(18),),),
                                            Text('',style:TextStyle(color:theme.secondaryColor,fontSize: SizeConfig.getFontSize(18),fontWeight: FontWeight.bold),),
                                            const SizedBox(height: 5,),
                                            Text(MessagesProvider.get('Play Credits'),style:TextStyle(color:theme.secondaryColor,fontSize: SizeConfig.getFontSize(18),),),
                                            Text('0.00',style:TextStyle(color:theme.secondaryColor,fontSize: SizeConfig.getFontSize(18),fontWeight: FontWeight.bold),),
                                            const SizedBox(height: 5,),
                                            Text(MessagesProvider.get('Bonus'),style:TextStyle(color:theme.secondaryColor,fontSize: SizeConfig.getFontSize(18),),),
                                            Text((widget._selectedData?.totalBonusBalance?.toStringAsFixed(2)).toString() ?? "0.0",style:TextStyle(color:theme.secondaryColor,fontSize: SizeConfig.getFontSize(18),fontWeight: FontWeight.bold),),
                                            const SizedBox(height: 5,),
                                            Text(MessagesProvider.get('Card Deposit'),style:TextStyle(color:theme.secondaryColor,fontSize: SizeConfig.getFontSize(18),),),
                                            Text("0.0",style:TextStyle(color:theme.secondaryColor,fontSize: SizeConfig.getFontSize(18),fontWeight: FontWeight.bold),),


                                          ],
                                        ),
                                      ],
                                    ),
                                  )
                                ]
                            ),
                          ),
                        ),
                         Padding(
                          padding: EdgeInsets.all(10),
                          child:  Text(MessagesProvider.get('Additional Info'),style:TextStyle(color:theme.secondaryColor,fontSize: SizeConfig.getFontSize(18),fontWeight: FontWeight.bold),),
                        ),
                        Container(
                          width: SizeConfig.getSize(380),
                          decoration: BoxDecoration(color:theme.backGroundColor ,borderRadius: BorderRadius.circular(5)),
                          child:Padding(
                            padding:const EdgeInsets.all(10),
                            child:Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children:[
                                  Text(MessagesProvider.get('AccountId'),style:TextStyle(color:theme.secondaryColor,fontSize: SizeConfig.getFontSize(18),),),
                                  Text((NumberFormat('#,##,000').format(widget._selectedData?.accountId)).toString() ?? "0.0",style:TextStyle(color:theme.secondaryColor,fontSize: SizeConfig.getFontSize(18),fontWeight: FontWeight.bold),),
                                  const SizedBox(height: 10,),
                                  Text(MessagesProvider.get('CustomerName'),style:TextStyle(color:theme.secondaryColor,fontSize: SizeConfig.getFontSize(18),),),
                                  Text((widget._selectedData?.customerName).toString() ?? "0.0",style:TextStyle(color:theme.secondaryColor,fontSize: SizeConfig.getFontSize(18),fontWeight: FontWeight.bold),),
                                  const SizedBox(height: 10,),
                                  Text(MessagesProvider.get('IssueDate'),style:TextStyle(color:theme.secondaryColor,fontSize: SizeConfig.getFontSize(18),),),
                                  Text((DateFormat(widget._dateTimeFormat).format(DateTime.parse(widget._selectedData?.issueDate ?? ''))).toString() ?? "0.0",style:TextStyle(color:theme.secondaryColor,fontSize: SizeConfig.getFontSize(18),fontWeight: FontWeight.bold),),
                                  const SizedBox(height: 10,),
                                  Text(MessagesProvider.get('FaceValue'),style:TextStyle(color:theme.secondaryColor,fontSize: SizeConfig.getFontSize(18),),),
                                  Text((widget._selectedData?.faceValue).toString() ?? "0.0",style:TextStyle(color:theme.secondaryColor,fontSize: SizeConfig.getFontSize(18),fontWeight: FontWeight.bold),),
                                  const SizedBox(height: 10,),
                                  Text(MessagesProvider.get('TicketCount'),style:TextStyle(color:theme.secondaryColor,fontSize: SizeConfig.getFontSize(18),),),
                                  Text((widget._selectedData?.ticketCount).toString() ?? "0.0",style:TextStyle(color:theme.secondaryColor,fontSize: SizeConfig.getFontSize(18),fontWeight: FontWeight.bold),),
                                  const SizedBox(height: 10,),
                                  Text(MessagesProvider.get('LoyaltyPoints'),style:TextStyle(color:theme.secondaryColor,fontSize: SizeConfig.getFontSize(18),),),
                                  Text((widget._selectedData?.loyaltyPoints).toString() ?? "0.0",style:TextStyle(color:theme.secondaryColor,fontSize: SizeConfig.getFontSize(18),fontWeight: FontWeight.bold),),
                                  const SizedBox(height: 10,),
                                  Text(MessagesProvider.get('CreditsPlayed'),style:TextStyle(color:theme.secondaryColor,fontSize: SizeConfig.getFontSize(18),),),
                                  Text((widget._selectedData?.creditsPlayed).toString() ?? "0.0",style:TextStyle(color:theme.secondaryColor,fontSize: SizeConfig.getFontSize(18),fontWeight: FontWeight.bold),),
                                  const SizedBox(height: 10,),
                                  Text(MessagesProvider.get('RealTicketMode'),style:TextStyle(color:theme.secondaryColor,fontSize: SizeConfig.getFontSize(18),),),
                                  Text((widget._selectedData?.realTicketMode).toString() ?? "0.0",style:TextStyle(color:theme.secondaryColor,fontSize: SizeConfig.getFontSize(18),fontWeight: FontWeight.bold),),
                                  const SizedBox(height: 10,),
                                  Text(MessagesProvider.get('VipCustomer'),style:TextStyle(color:theme.secondaryColor,fontSize: SizeConfig.getFontSize(18),),),
                                  Text((widget._selectedData?.vipCustomer).toString() ?? "0.0",style:TextStyle(color:theme.secondaryColor,fontSize: SizeConfig.getFontSize(18),fontWeight: FontWeight.bold),),
                                  const SizedBox(height: 10,),
                                  Text(MessagesProvider.get('TicketAllowed'),style:TextStyle(color:theme.secondaryColor,fontSize: SizeConfig.getFontSize(18),),),
                                  Text((widget._selectedData?.ticketAllowed).toString() ?? "0.0",style:TextStyle(color:theme.secondaryColor,fontSize: SizeConfig.getFontSize(18),fontWeight: FontWeight.bold),),
                                  const SizedBox(height: 10,),
                                  Text(MessagesProvider.get('TechnicianCard'),style:TextStyle(color:theme.secondaryColor,fontSize: SizeConfig.getFontSize(18),),),
                                  Text((widget._selectedData?.technicianCard).toString() ?? "0.0",style:TextStyle(color:theme.secondaryColor,fontSize: SizeConfig.getFontSize(18),fontWeight: FontWeight.bold),),
                                  const SizedBox(height: 10,),
                                  Text(MessagesProvider.get('TimerResetCard'),style:TextStyle(color:theme.secondaryColor,fontSize: SizeConfig.getFontSize(18),),),
                                  Text((widget._selectedData?.timerResetCard).toString() ?? "0.0",style:TextStyle(color:theme.secondaryColor,fontSize: SizeConfig.getFontSize(18),fontWeight: FontWeight.bold),),
                                  const SizedBox(height: 10,),
                                  Text(MessagesProvider.get('TechGames'),style:TextStyle(color:theme.secondaryColor,fontSize: SizeConfig.getFontSize(18),),),
                                  Text((widget._selectedData?.techGames??"-").toString() ?? "0.0",style:TextStyle(color:theme.secondaryColor,fontSize: SizeConfig.getFontSize(18),fontWeight: FontWeight.bold),),
                                  const SizedBox(height: 10,),
                                  Text(MessagesProvider.get('ValidFlag'),style:TextStyle(color:theme.secondaryColor,fontSize: SizeConfig.getFontSize(18),),),
                                  Text((widget._selectedData?.validFlag).toString() ?? "0.0",style:TextStyle(color:theme.secondaryColor,fontSize: SizeConfig.getFontSize(18),fontWeight: FontWeight.bold),),
                                  const SizedBox(height: 10,),
                                  Text(MessagesProvider.get('RefundFlag'),style:TextStyle(color:theme.secondaryColor,fontSize: SizeConfig.getFontSize(18),),),
                                  Text((widget._selectedData?.refundFlag).toString() ?? "0.0",style:TextStyle(color:theme.secondaryColor,fontSize: SizeConfig.getFontSize(18),fontWeight: FontWeight.bold),),
                                  const SizedBox(height: 10,),
                                  Text(MessagesProvider.get('RefundAmount'),style:TextStyle(color:theme.secondaryColor,fontSize: SizeConfig.getFontSize(18),),),
                                  Text((widget._selectedData?.refundAmount??"-").toString() ?? "0.0",style:TextStyle(color:theme.secondaryColor,fontSize: SizeConfig.getFontSize(18),fontWeight: FontWeight.bold),),
                                  const SizedBox(height: 10,),
                                  Text(MessagesProvider.get('RefundDate'),style:TextStyle(color:theme.secondaryColor,fontSize: SizeConfig.getFontSize(18),),),
                                  Text((widget._selectedData?.refundDate??"-").toString() ?? "0.0",style:TextStyle(color:theme.secondaryColor,fontSize: SizeConfig.getFontSize(18),fontWeight: FontWeight.bold),),
                                  const SizedBox(height: 10,),
                                  Text(MessagesProvider.get('ExpireDate'),style:TextStyle(color:theme.secondaryColor,fontSize: SizeConfig.getFontSize(18),),),
                                  Text((widget._selectedData?.expiryDate??"-").toString() ?? "0.0",style:TextStyle(color:theme.secondaryColor,fontSize: SizeConfig.getFontSize(18),fontWeight: FontWeight.bold),),
                                  const SizedBox(height: 10,),
                                  Text(MessagesProvider.get('StartTime'),style:TextStyle(color:theme.secondaryColor,fontSize: SizeConfig.getFontSize(18),),),
                                  Text((DateFormat(widget._dateTimeFormat).format(DateTime.parse(widget._selectedData?.startTime ?? '0001-01-01T00:00:00')) ?? '').toString() ?? "0.0",style:TextStyle(color:theme.secondaryColor,fontSize: SizeConfig.getFontSize(18),fontWeight: FontWeight.bold),),
                                  const SizedBox(height: 10,),
                                  Text(MessagesProvider.get('LastPlayedTime'),style:TextStyle(color:theme.secondaryColor,fontSize: SizeConfig.getFontSize(18),),),
                                  Text((DateFormat(widget._dateTimeFormat).format(DateTime.parse(widget._selectedData?.lastPlayedTime ?? '0001-01-01T00:00:00')) ?? '').toString()?? "0.0",style:TextStyle(color:theme.secondaryColor,fontSize: SizeConfig.getFontSize(18),fontWeight: FontWeight.bold),),
                                  const SizedBox(height: 10,),
                                  Text(MessagesProvider.get('Notes'),style:TextStyle(color:theme.secondaryColor,fontSize: SizeConfig.getFontSize(18),),),
                                  Text((widget._selectedData?.notes).toString() ?? "0.0",style:TextStyle(color:theme.secondaryColor,fontSize: SizeConfig.getFontSize(18),fontWeight: FontWeight.bold),),
                                  const SizedBox(height: 10,),
                                  Text(MessagesProvider.get('LastUpdateDate'),style:TextStyle(color:theme.secondaryColor,fontSize: SizeConfig.getFontSize(18),),),
                                  Text((DateFormat(widget._dateTimeFormat).format(DateTime.parse(widget._selectedData?.lastUpdateDate ?? '0001-01-01T00:00:00')) ?? '').toString()?? "0.0",style:TextStyle(color:theme.secondaryColor,fontSize: SizeConfig.getFontSize(18),fontWeight: FontWeight.bold),),
                                  const SizedBox(height: 10,),
                                  Text(MessagesProvider.get('LastUpdatedBy'),style:TextStyle(color:theme.secondaryColor,fontSize: SizeConfig.getFontSize(18),),),
                                  Text((widget._selectedData?.lastUpdatedBy).toString() ?? "0.0",style:TextStyle(color:theme.secondaryColor,fontSize: SizeConfig.getFontSize(18),fontWeight: FontWeight.bold),),
                                  const SizedBox(height: 10,),
                                  Text(MessagesProvider.get('PrimaryAccount'),style:TextStyle(color:theme.secondaryColor,fontSize: SizeConfig.getFontSize(18),),),
                                  Text((widget._selectedData?.primaryAccount).toString() ?? "0.0",style:TextStyle(color:theme.secondaryColor,fontSize: SizeConfig.getFontSize(18),fontWeight: FontWeight.bold),),
                                  const SizedBox(height: 10,),
                                  Text(MessagesProvider.get('AccountIdentifier'),style:TextStyle(color:theme.secondaryColor,fontSize: SizeConfig.getFontSize(18),),),
                                  Text((widget._selectedData?.accountIdentifier).toString() ?? "0.0",style:TextStyle(color:theme.secondaryColor,fontSize: SizeConfig.getFontSize(18),fontWeight: FontWeight.bold),),
                                  const  SizedBox(height: 10,),
                                  Text(MessagesProvider.get('MembershipName'),style:TextStyle(color:theme.secondaryColor,fontSize: SizeConfig.getFontSize(18),),),
                                  Text((widget._selectedData?.membershipName).toString() ?? "0.0",style:TextStyle(color:theme.secondaryColor,fontSize: SizeConfig.getFontSize(18),fontWeight: FontWeight.bold),),
                                  const  SizedBox(height: 10,),
                                  Text(MessagesProvider.get('ObligationStatus'),style:TextStyle(color:theme.secondaryColor,fontSize: SizeConfig.getFontSize(18),),),
                                  Text((widget._selectedData?.obligationStatus).toString() ?? "0.0",style:TextStyle(color:theme.secondaryColor,fontSize: SizeConfig.getFontSize(18),fontWeight: FontWeight.bold),),
                                  const  SizedBox(height: 10,),
                                  Text(MessagesProvider.get('AccountType'),style:TextStyle(color:theme.secondaryColor,fontSize: SizeConfig.getFontSize(18),),),
                                  Text(' ',style:TextStyle(color:theme.secondaryColor,fontSize: SizeConfig.getFontSize(18),fontWeight: FontWeight.bold),),
                                  const  SizedBox(height: 10,),
                                  Text(MessagesProvider.get('ObligationStatusId'),style:TextStyle(color:theme.secondaryColor,fontSize: SizeConfig.getFontSize(18),),),
                                  Text((widget._selectedData?.obligationStatusId).toString() ?? "0.0",style:TextStyle(color:theme.secondaryColor,fontSize: SizeConfig.getFontSize(18),fontWeight: FontWeight.bold),),

                                  const  SizedBox(height: 10,),
                                  Text(MessagesProvider.get('ObligationStatusChangeDate'),style:TextStyle(color:theme.secondaryColor,fontSize: SizeConfig.getFontSize(18),),),
                                  Text((widget._selectedData?.obligationStatusChangeDate ?? "-").toString() ?? "0.0",style:TextStyle(color:theme.secondaryColor,fontSize: SizeConfig.getFontSize(18),fontWeight: FontWeight.bold),),
                                  const  SizedBox(height: 10,),
                                  Text(MessagesProvider.get('MembershipId'),style:TextStyle(color:theme.secondaryColor,fontSize: SizeConfig.getFontSize(18),),),
                                  Text((widget._selectedData?.membershipId).toString() ?? "0.0",style:TextStyle(color:theme.secondaryColor,fontSize: SizeConfig.getFontSize(18),fontWeight: FontWeight.bold),),
                                  const  SizedBox(height: 10,),
                                  Text(MessagesProvider.get('CustomerId'),style:TextStyle(color:theme.secondaryColor,fontSize: SizeConfig.getFontSize(18),),),
                                  Text((widget._selectedData?.customerId).toString() ?? "0.0",style:TextStyle(color:theme.secondaryColor,fontSize: SizeConfig.getFontSize(18),fontWeight: FontWeight.bold),),
                                  const  SizedBox(height: 10,),
                                  Text(MessagesProvider.get('UploadSiteId'),style:TextStyle(color:theme.secondaryColor,fontSize: SizeConfig.getFontSize(18),),),
                                  Text((widget._selectedData?.uploadSiteId).toString() ?? "0.0",style:TextStyle(color:theme.secondaryColor,fontSize: SizeConfig.getFontSize(18),fontWeight: FontWeight.bold),),
                                  const  SizedBox(height: 10,),
                                  Text(MessagesProvider.get('UploadTime'),style:TextStyle(color:theme.secondaryColor,fontSize: SizeConfig.getFontSize(18),),),
                                  Text((DateFormat(widget._dateTimeFormat).format(DateTime.parse(widget._selectedData?.uploadTime ?? '0001-01-01T00:00:00')) ?? '').toString() ?? "0.0",style:TextStyle(color:theme.secondaryColor,fontSize: SizeConfig.getFontSize(18),fontWeight: FontWeight.bold),),
                                  const  SizedBox(height: 10,),
                                  Text(MessagesProvider.get('DownloadBatchId'),style:TextStyle(color:theme.secondaryColor,fontSize: SizeConfig.getFontSize(18),),),
                                  Text((widget._selectedData?.downloadBatchId == -1? '-':widget._selectedData?.downloadBatchId).toString() ?? "0.0",style:TextStyle(color:theme.secondaryColor,fontSize: SizeConfig.getFontSize(18),fontWeight: FontWeight.bold),),
                                  const  SizedBox(height: 10,),
                                  Text(MessagesProvider.get('RefreshFromHQTime'),style:TextStyle(color:theme.secondaryColor,fontSize: SizeConfig.getFontSize(18),),),
                                  Text((DateFormat(widget._dateTimeFormat).format(DateTime.parse(widget._selectedData?.refreshFromHqTime ?? '0001-01-01T00:00:00')) ?? '').toString() ?? "0.0",style:TextStyle(color:theme.secondaryColor,fontSize: SizeConfig.getFontSize(18),fontWeight: FontWeight.bold),),
                                  const  SizedBox(height: 10,),
                                  Text(MessagesProvider.get('SiteId'),style:TextStyle(color:theme.secondaryColor,fontSize: SizeConfig.getFontSize(18),),),
                                  Text((widget._selectedData?.siteId).toString() ?? "0.0",style:TextStyle(color:theme.secondaryColor,fontSize: SizeConfig.getFontSize(18),fontWeight: FontWeight.bold),),
                                  const SizedBox(height: 10,),
                                  Text(MessagesProvider.get('MasterEntityId'),style:TextStyle(color:theme.secondaryColor,fontSize: SizeConfig.getFontSize(18),),),
                                  Text((widget._selectedData?.masterEntityId== -1? '-':widget._selectedData?.masterEntityId).toString() ?? "0.0",style:TextStyle(color:theme.secondaryColor,fontSize: SizeConfig.getFontSize(18),fontWeight: FontWeight.bold),),
                                  const SizedBox(height: 10,),
                                  Text(MessagesProvider.get('SynchStatus'),style:TextStyle(color:theme.secondaryColor,fontSize: SizeConfig.getFontSize(18),),),
                                  Text((widget._selectedData?.synchStatus).toString() ?? "0.0",style:TextStyle(color:theme.secondaryColor,fontSize: SizeConfig.getFontSize(18),fontWeight: FontWeight.bold),),
                                  const SizedBox(height: 10,),
                                  Text(MessagesProvider.get('CreationDate'),style:TextStyle(color:theme.secondaryColor,fontSize: SizeConfig.getFontSize(18),),),
                                  Text(widget._selectedData?.creationDate =="0001-01-01T00:00:00" ? "-" :widget._selectedData?.creationDate ?? "-",style:TextStyle(color:theme.secondaryColor,fontSize: SizeConfig.getFontSize(18),fontWeight: FontWeight.bold),),
                                  const SizedBox(height: 10,),
                                  Text(MessagesProvider.get('CreatedBy'),style:TextStyle(color:theme.secondaryColor,fontSize: SizeConfig.getFontSize(18),),),
                                  Text((widget._selectedData?.createdBy ?? '').toString() ?? "0.0",style:TextStyle(color:theme.secondaryColor,fontSize: SizeConfig.getFontSize(18),fontWeight: FontWeight.bold),),
                                  const SizedBox(height: 10,),
                                  Text(MessagesProvider.get('AccountActivityDTOList'),style:TextStyle(color:theme.secondaryColor,fontSize: SizeConfig.getFontSize(18),),),
                                  Text((widget._selectedData?.accountActivityDTOList ?? "-").toString() ?? "0.0",style:TextStyle(color:theme.secondaryColor,fontSize: SizeConfig.getFontSize(18),fontWeight: FontWeight.bold),),
                                  const SizedBox(height: 10,),
                                  Text(MessagesProvider.get('IsChanged'),style:TextStyle(color:theme.secondaryColor,fontSize: SizeConfig.getFontSize(18),),),
                                  Text((widget._selectedData?.isChanged).toString() ?? "0.0",style:TextStyle(color:theme.secondaryColor,fontSize: SizeConfig.getFontSize(18),fontWeight: FontWeight.bold),),
                                  const SizedBox(height: 10,),
                                  Text(MessagesProvider.get('TotalCreditsBalance'),style:TextStyle(color:theme.secondaryColor,fontSize: SizeConfig.getFontSize(18),),),
                                  Text((widget._selectedData?.totalCreditsBalance).toString() ?? "0.0",style:TextStyle(color:theme.secondaryColor,fontSize: SizeConfig.getFontSize(18),fontWeight: FontWeight.bold),),
                                  const SizedBox(height: 10,),
                                  Text(MessagesProvider.get('TotalBonusBalence'),style:TextStyle(color:theme.secondaryColor,fontSize: SizeConfig.getFontSize(18),),),
                                  Text((widget._selectedData?.totalBonusBalance).toString() ?? "0.0",style:TextStyle(color:theme.secondaryColor,fontSize: SizeConfig.getFontSize(18),fontWeight: FontWeight.bold),),
                                  const SizedBox(height: 10,),
                                  Text(MessagesProvider.get('TotalCourtesyBalance'),style:TextStyle(color:theme.secondaryColor,fontSize: SizeConfig.getFontSize(18),),),
                                  Text((widget._selectedData?.totalCourtesyBalance).toString() ?? "0.0",style:TextStyle(color:theme.secondaryColor,fontSize: SizeConfig.getFontSize(18),fontWeight: FontWeight.bold),),
                                  const SizedBox(height: 10,),
                                  Text(MessagesProvider.get('TotalTimeBalance'),style:TextStyle(color:theme.secondaryColor,fontSize: SizeConfig.getFontSize(18),),),
                                  Text((widget._selectedData?.totalTimeBalance).toString() ?? "0.0",style:TextStyle(color:theme.secondaryColor,fontSize: SizeConfig.getFontSize(18),fontWeight: FontWeight.bold),),
                                  const SizedBox(height: 10,),
                                  Text(MessagesProvider.get('TotalGameBalence'),style:TextStyle(color:theme.secondaryColor,fontSize: SizeConfig.getFontSize(18),),),
                                  Text((widget._selectedData?.totalGamesBalance).toString() ?? "0.0",style:TextStyle(color:theme.secondaryColor,fontSize: SizeConfig.getFontSize(18),fontWeight: FontWeight.bold),),
                                  const SizedBox(height: 10,),
                                  Text(MessagesProvider.get('TotalTicketsBalance'),style:TextStyle(color:theme.secondaryColor,fontSize: SizeConfig.getFontSize(18),),),
                                  Text((widget._selectedData?.totalTicketsBalance).toString() ?? "0.0",style:TextStyle(color:theme.secondaryColor,fontSize: SizeConfig.getFontSize(18),fontWeight: FontWeight.bold),),
                                  const SizedBox(height: 10,),
                                  Text(MessagesProvider.get('TotalVirtualPointsBalance'),style:TextStyle(color:theme.secondaryColor,fontSize: SizeConfig.getFontSize(18),),),
                                  Text((widget._selectedData?.totalVirtualPointBalance).toString() ?? "0.0",style:TextStyle(color:theme.secondaryColor,fontSize: SizeConfig.getFontSize(18),fontWeight: FontWeight.bold),),
                                  const SizedBox(height: 10,),
                                  Text(MessagesProvider.get('IsChangedRecursive'),style:TextStyle(color:theme.secondaryColor,fontSize: SizeConfig.getFontSize(18),),),
                                  Text((widget._selectedData?.isChangedRecursive).toString() ?? "0.0",style:TextStyle(color:theme.secondaryColor,fontSize: SizeConfig.getFontSize(18),fontWeight: FontWeight.bold),),
                                ]
                            ),
                          ),
                        ),
                        const SizedBox(height: 20,)
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}