import 'package:customer_data/models/account_details/account_details_response.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:other_function_ui/widgets/of_content_widgets/general/card_balance.dart';
import 'package:other_function_ui/widgets/of_content_widgets/general/card_details_column.dart';

class CardDetails extends StatelessWidget {
  final AccountDetailsResponse? accounts;
  const CardDetails({super.key, this.accounts});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: SizedBox(
          // color: Colors.yellow,
          width: MediaQuery.of(context).size.width * 0.80,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CardDetailsColumn(
                text1: accounts!.data!.first.tagNumber,
                image2: Image.asset('assets/calendar.png'),
                text2: DateFormat('dd MMM yyyy, hh:mm:ss a')
                    .format(DateTime.parse(accounts!.data!.first.issueDate!))
                    .toString(),
                text3: accounts?.data?.first.customerName,
                image1: Image.asset('assets/card.png'),
              ),
              CardDetailsColumn(
                text1: 'Issued Card',
                text2: '',
                image3: Image.asset('assets/star.png'),
                text3: 'Normal',
              ),
              CardBalance(
                firsttitle: 'Credits',
                firstdesc: '${accounts!.data!.first.totalCreditsBalance}',
                secondtitle: 'Play Credits',
                seconddesc: '${accounts!.data!.first.creditsPlayed}',
              ),
              CardBalance(
                firsttitle: 'Tickets',
                firstdesc: '${accounts!.data!.first.ticketCount}',
                secondtitle: 'Counter items',
                seconddesc: '${accounts!.data!.first.totalTicketsBalance}',
              ),
              CardBalance(
                firsttitle: 'Time',
                firstdesc: '${accounts!.data!.first.time}',
                secondtitle: 'Bonus',
                seconddesc: '${accounts!.data!.first.totalBonusBalance}',
              ),
              CardBalance(
                firsttitle: 'Games',
                firstdesc: '${accounts!.data!.first.totalGamesBalance}',
                secondtitle: 'Courtesy',
                seconddesc: '${accounts!.data!.first.courtesy}',
              ),
              CardBalance(
                firsttitle: 'Loyalty Points',
                firstdesc: '${accounts!.data!.first.loyaltyPoints}',
                secondtitle: 'Card Deposit',
                seconddesc: '${accounts!.data!.first.faceValue}',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
