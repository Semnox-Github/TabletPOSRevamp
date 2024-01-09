import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:messages_data/builder.dart';
import 'package:themes_library/themes_library.dart';
import 'package:flutter/material.dart';
import 'package:widgets_library/utils/size_config.dart';

class CreditPlusItemHeader extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    SemnoxTheme theme = Theme.of(context).extension<SemnoxTheme>()!;
    SizeConfig.init(context);
    return Row(
      children: [
        Container(
            width: 150,
            margin: const EdgeInsets.only(left: 12.0,),
            alignment: Alignment.center,
            child: Text(MessagesProvider.get("Name"), style: theme.heading6?.copyWith(fontSize: SizeConfig.getFontSize(18)),)),
        Container(
            width: 120,
            margin: const EdgeInsets.only(left: 8.0,),
            alignment: Alignment.center,
            child: Text(MessagesProvider.get("Type"), style: theme.heading6?.copyWith(fontSize: SizeConfig.getFontSize(18)),)),
        Container(
            width: 60,
            margin: const EdgeInsets.only(left: 8.0,),
            alignment: Alignment.center,
            child: Text(MessagesProvider.get("Amount"), style: theme.heading6?.copyWith(fontSize: SizeConfig.getFontSize(18)),)),
        Container(
            width: 80,
            margin: const EdgeInsets.only(left: 8.0,),
            alignment: Alignment.center,
            child: Text(MessagesProvider.get("Refundable"), style: theme.heading6?.copyWith(fontSize: SizeConfig.getFontSize(18)),)),
        Container(
            width: 80,
            margin: const EdgeInsets.only(left: 8.0,),
            alignment: Alignment.center,
            child: Text(MessagesProvider.get("Balance"), style: theme.heading6?.copyWith(fontSize: SizeConfig.getFontSize(18)),)),
        Container(
            width: 100,
            margin: const EdgeInsets.only(left: 8.0,),
            alignment: Alignment.center,
            child: Text(MessagesProvider.get("Min Purchase"), style: theme.heading6?.copyWith(fontSize: SizeConfig.getFontSize(18)),)),
        Container(
            width: 150,
            margin: const EdgeInsets.only(left: 8.0,),
            alignment: Alignment.center,
            child: Text(MessagesProvider.get("Period From"), style: theme.heading6?.copyWith(fontSize: SizeConfig.getFontSize(18)),)),
        Container(
            width: 150,
            margin: const EdgeInsets.only(left: 8.0,),
            alignment: Alignment.center,
            child: Text(MessagesProvider.get("Period To"), style: theme.heading6?.copyWith(fontSize: SizeConfig.getFontSize(18)),)),
        Container(
            width: 140,
            margin: const EdgeInsets.only(left: 8.0,),
            alignment: Alignment.center,
            child: Text(MessagesProvider.get("Extended On Reload"), style: theme.heading6?.copyWith(fontSize: SizeConfig.getFontSize(18)),)),
        Container(
            width: 100,
            margin: const EdgeInsets.only(left: 8.0,),
            alignment: Alignment.center,
            child: Text(MessagesProvider.get("Start Time"), style: theme.heading6?.copyWith(fontSize: SizeConfig.getFontSize(18)),)),
        Container(
            width: 100,
            margin: const EdgeInsets.only(left: 8.0,),
            alignment: Alignment.center,
            child: Text(MessagesProvider.get("Time From"), style: theme.heading6?.copyWith(fontSize: SizeConfig.getFontSize(18)),)),
        Container(
            width: 100,
            margin: const EdgeInsets.only(left: 8.0,),
            alignment: Alignment.center,
            child: Text(MessagesProvider.get("Time To"), style:  theme.heading6?.copyWith(fontSize: SizeConfig.getFontSize(18)),)),
        Container(
            width: 100,
            margin: const EdgeInsets.only(left: 8.0,),
            alignment: Alignment.center,
            child: Text(MessagesProvider.get("Valid Days"), style:  theme.heading6?.copyWith(fontSize: SizeConfig.getFontSize(18)),)),
        Container(
            width: 100,
            alignment: Alignment.center,
            margin: const EdgeInsets.only(left: 8.0,),
            child: Text(MessagesProvider.get("Monday"), style:  theme.heading6?.copyWith(fontSize: SizeConfig.getFontSize(18)),)),
        Container(
            width: 100,
            margin: const EdgeInsets.only(left: 8.0,),
            alignment: Alignment.center,
            child: Text(MessagesProvider.get("Tuesday"), style:  theme.heading6?.copyWith(fontSize: SizeConfig.getFontSize(18)),)),
        Container(
            width: 100,
            margin: const EdgeInsets.only(left: 8.0,),
            alignment: Alignment.center,
            child: Text(MessagesProvider.get("Wednesday"), style:  theme.heading6?.copyWith(fontSize: SizeConfig.getFontSize(18)),)),
        Container(
            width: 100,
            margin: const EdgeInsets.only(left: 8.0,),
            alignment: Alignment.center,
            child: Text(MessagesProvider.get("Thursday"), style:  theme.heading6?.copyWith(fontSize: SizeConfig.getFontSize(18)),)),
        Container(
            width: 100,
            margin: const EdgeInsets.only(left: 8.0,),
            alignment: Alignment.center,
            child: Text(MessagesProvider.get("Friday"), style:  theme.heading6?.copyWith(fontSize: SizeConfig.getFontSize(18)),)),
        Container(
            width: 100,
            margin: const EdgeInsets.only(left: 8.0,),
            alignment: Alignment.center,
            child: Text(MessagesProvider.get("Saturday"), style:  theme.heading6?.copyWith(fontSize: SizeConfig.getFontSize(18)),)),
        Container(
            width: 100,
            margin: const EdgeInsets.only(left: 8.0,),
            alignment: Alignment.center,
            child: Text(MessagesProvider.get("Sunday"), style:  theme.heading6?.copyWith(fontSize: SizeConfig.getFontSize(18)),)),
        Container(
            width: 100,
            margin: const EdgeInsets.only(left: 8.0,),
            alignment: Alignment.center,
            child: Text(MessagesProvider.get("Ticket Allowed"), style:  theme.heading6?.copyWith(fontSize: SizeConfig.getFontSize(18)),)),
        Container(
            width: 100,
            margin: const EdgeInsets.only(left: 8.0,),
            alignment: Alignment.center,
            child: Text(MessagesProvider.get("Pause Allowed"), style:  theme.heading6?.copyWith(fontSize: SizeConfig.getFontSize(18)),)),
        Container(
            width: 150,
            margin: const EdgeInsets.only(left: 8.0,),
            alignment: Alignment.center,
            child: Text(MessagesProvider.get("Created On"), style:  theme.heading6?.copyWith(fontSize: SizeConfig.getFontSize(18)),)),
        Container(
            width: 100,
            margin: const EdgeInsets.only(left: 8.0,),
            alignment: Alignment.center,
            child: Text(MessagesProvider.get("Validity"), style:  theme.heading6?.copyWith(fontSize: SizeConfig.getFontSize(18)),)),
        Container(
            width: 120,
            margin: const EdgeInsets.only(left: 8.0,),
            alignment: Alignment.center,
            child: Text(MessagesProvider.get("Obligation Status"), style:  theme.heading6?.copyWith(fontSize: SizeConfig.getFontSize(18)),)),
        Container(
            width: 100,
            margin: const EdgeInsets.only(left: 8.0,),
            alignment: Alignment.center,
            child: Text("", style:  theme.heading6?.copyWith(fontSize: SizeConfig.getFontSize(18)),)),
        Container(
            width: 100,
            margin: const EdgeInsets.only(left: 8.0,),
            alignment: Alignment.center,
            child: Text("", style:  theme.heading6?.copyWith(fontSize: SizeConfig.getFontSize(18)),)),
      ],
    );
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20,right: 20,bottom: 8,top: 10),
          child: Row(
            children: [
              Column(
                children: [
                  Text("Name", style: GoogleFonts.robotoCondensed(
                        fontSize: 12,fontWeight: FontWeight.w600
                    ),),
                  Text("",//accounts!.data!.first.accountCreditPlusDTOList.first.accountCreditPlusId.toString(),
                    style: GoogleFonts.robotoCondensed(
                        fontSize: 12,fontWeight: FontWeight.w600
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 10,),
              Column(
                children: [
                  Text("Type",
                    style: GoogleFonts.robotoCondensed(
                        fontSize: 12,fontWeight: FontWeight.w600
                    ),
                  ),
                  Text("",//accounts!.data!.first.accountCreditPlusDTOList.first.creditPlusType.toString(),
                    style: GoogleFonts.robotoCondensed(
                        fontSize: 12,fontWeight: FontWeight.w600
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 10,),
              Column(
                children: [
                  Text("Amount",
                    style: GoogleFonts.robotoCondensed(
                        fontSize: 12,fontWeight: FontWeight.w600
                    ),
                  ),
                  Text("",//accounts!.data!.first.accountCreditPlusDTOList.first.creditPlusBalance.toString(),
                    style: GoogleFonts.robotoCondensed(
                        fontSize: 12,fontWeight: FontWeight.w600
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 10,),
              Column(
                children: [
                  Text("Refundable",
                    style: GoogleFonts.robotoCondensed(
                        fontSize: 12,fontWeight: FontWeight.w600
                    ),
                  ),
                  Text("",//accounts!.data!.first.accountCreditPlusDTOList.first.refundable.toString(),
                    style: GoogleFonts.robotoCondensed(
                        fontSize: 12,fontWeight: FontWeight.w600
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 10,),
              Column(
                children: [
                  Text("Balance",
                    style: GoogleFonts.robotoCondensed(
                        fontSize: 12,fontWeight: FontWeight.w600
                    ),
                  ),
                  Text("",//accounts!.data!.first.accountCreditPlusDTOList.first.creditPlusBalance.toString(),
                    style: GoogleFonts.robotoCondensed(
                        fontSize: 12,fontWeight: FontWeight.w600
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 10,),
              Text("Min Purchase",
                style: GoogleFonts.robotoCondensed(
                    fontSize: 12,fontWeight: FontWeight.w600
                ),
              ),
              const SizedBox(width: 10,),
              Text("Period From",
                style: GoogleFonts.robotoCondensed(
                    fontSize: 12,fontWeight: FontWeight.w600
                ),
              ),
              const SizedBox(width: 10,),
              Text("Period To",
                style: GoogleFonts.robotoCondensed(
                    fontSize: 12,fontWeight: FontWeight.w600
                ),
              ),
              const SizedBox(width: 10,),
              Text("Extend on Reload",
                style: GoogleFonts.robotoCondensed(
                    fontSize: 12,fontWeight: FontWeight.w600
                ),
              ),
              const SizedBox(width: 10,),
              Text("Start Time",
                style: GoogleFonts.robotoCondensed(
                    fontSize: 12,fontWeight: FontWeight.w600
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

}