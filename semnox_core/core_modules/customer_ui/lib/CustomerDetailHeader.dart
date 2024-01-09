import 'dart:convert';
import 'package:customer_data/models/account_details/account_details_data.dart';
import 'package:customer_data/models/customer_data.dart';
import 'package:customer_ui/providers/SelectedCardDetailsProvider.dart';
import 'package:customer_ui/providers/SelectedCustomerProvider.dart';
import 'package:execution_context/builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:membership_data/builder.dart';
import 'package:membership_data/models/membership_container_dto.dart';
import 'package:messages_data/builder.dart';
import 'package:themes_library/themes_library.dart';
import 'package:widgets_library/utils/size_config.dart';
import 'CustomerChangeAlert.dart';
import 'package:provider/provider.dart';
import 'package:logs_data/logger.dart';

class CustomerDetailHeader extends StatefulWidget {
  @override
  State<CustomerDetailHeader> createState() => _CustomerDetailHeaderState();
}

class _CustomerDetailHeaderState extends State<CustomerDetailHeader> {
  CustomerData? data;
  AccountDetailsData? cardData;
  String _membershipCtr = "";

  @override
  void initState() {
    super.initState();
    _initDropDownList();
  }

  @override
  void didChangeDependencies() {
    data = context.watch<SelectedCustomer>().selectedData;
    cardData = context.watch<SelectedCardDetails>().selectedData;
    if (cardData?.membershipName == null || cardData?.membershipName == "") {
      if ((cardData?.vipCustomer ?? false) == true) {
        _membershipCtr = "VIP";
      } else {
        _membershipCtr = "Normal";
      }
    } else {
      _membershipCtr = cardData?.membershipName ?? "";
    }
    print("card membership ${cardData?.membershipName} $_membershipCtr");
  }

  @override
  Widget build(BuildContext context) {
    SemnoxTheme theme = Theme.of(context).extension<SemnoxTheme>()!;
    SizeConfig.init(context);
    return Container(
      margin: EdgeInsets.all(SizeConfig.getSize(4)),
      padding: EdgeInsets.all(SizeConfig.getSize(3)),
      decoration: BoxDecoration(
          color: theme.primaryColor,
          borderRadius: BorderRadius.all(
            Radius.circular(SizeConfig.getSize(4.0)),
          )),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              crossAxisAlignment: cardData == null ? CrossAxisAlignment.start : CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        data?.firstName.toString() ?? "",
                        style:  theme.heading6?.copyWith(fontSize: SizeConfig.getFontSize(16)),
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.start,
                      ),
                    ),
                    SizedBox(
                      width: SizeConfig.getWidth(16),
                    ),
                    Visibility(
                      visible: cardData != null,
                      child: Row(
                        children: [
                          Icon(
                            Icons.star_border,
                            color: theme.secondaryColor,
                            size: SizeConfig.getSize(20),
                          ),
                          SizedBox(
                            width: SizeConfig.getWidth(0),
                          ),
                          Text(
                            _membershipCtr,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: theme.subtitle3?.copyWith(fontSize: SizeConfig.getFontSize(14)),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Container(
                  height: SizeConfig.getHeight(1),
                  width: SizeConfig.getWidth(170),
                  color: theme.dividerColor,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Visibility(
                      visible: cardData != null,
                      child: Row(
                        children: [
                          Icon(
                            Icons.payment,
                            color: theme.secondaryColor,
                            size: SizeConfig.getSize(20),
                          ),
                          SizedBox(
                            width: SizeConfig.getWidth(5),
                          ),
                          Text(
                            cardData?.tagNumber ?? "",
                            style: theme.subtitle3?.copyWith(fontSize: SizeConfig.getFontSize(14)),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: SizeConfig.getWidth(16),
                    ),
                    Text(
                      cardData != null
                          ? _isDateGreater(cardData?.expiryDate)
                              ? MessagesProvider.get("Issued Card")
                              : MessagesProvider.get("Expired Card")
                          : "",
                      style: theme.subtitle3?.copyWith(fontSize: SizeConfig.getFontSize(14)),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                )
              ],
            ),
            SizedBox(
              width: SizeConfig.getWidth(8.0),
            ),
            IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (context) {
                    return CustomerChangeAlert(
                      data: data,
                    );
                  },
                );
              },
              icon: Image.asset(
                "assets/ic_edit.png",
                /*height: 50,*/
                width: SizeConfig.getWidth(30),
                color: theme.secondaryColor,
              ),
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
            )
          ],
        ),
      ),
    );
  }

  Future<void> _initDropDownList() async {
    var execContextBL = await ExecutionContextBuilder.build();
    var execContextDTO = execContextBL.getExecutionContext();
    var membershipDataBl = await MembershipDataBuilder.build(execContextDTO!);
    var memberShip = await membershipDataBl.callMembershipDataApi();
    List<MembershipContainerDTO>? _membershipList = memberShip.data?.membershipContainerDTOList;
    /*if(data?.membershipId != -1){
      _membershipCtr = _membershipList?.firstWhere((element) => element.membershipId == data?.membershipId).membershipName ?? "Normal";
    }else{
      _membershipCtr = "";
    }*/
  }

  bool _isDateGreater(String? date) {
    if (date != null) {
      DateTime dt1 = DateTime.parse(date); //from
      DateTime dt2 = DateTime.now();
      return dt1.compareTo(dt2) > 0 ? true : false;
    } else {
      return true;
    }
  }
}
