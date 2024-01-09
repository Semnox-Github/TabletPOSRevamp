import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:orders_data/models/transactions/transaction_data.dart';
import 'package:intl/intl.dart';
import 'package:themes_library/themes_library.dart';
import 'package:flutter/material.dart';
import 'package:widgets_library/utils/size_config.dart';

class TransactionDetailItem extends  StatelessWidget{

  TransactionsData? data;
  int index;
  String? dateFormat;

  TransactionDetailItem({super.key, this.data, required this.index,this.dateFormat});
  late SemnoxTheme theme;
  @override
  Widget build(BuildContext context) {
     theme = Theme.of(context).extension<SemnoxTheme>()!;
    SizeConfig.init(context);
     log(data.toString());
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        detailsText('TransactionStatus', data?.transactionStatus ?? ''),
        detailsText('TransactionNetAmount', data?.transactionNetAmount.toString() ?? ''),
        detailsText('TransactionPaymentTotal', data?.transactionPaymentTotal.toString() ?? ''),
        detailsText('CreatedBy', data?.createdBy.toString() ?? ''),
        detailsText('TransactionId', data?.transactionId.toString() ?? ''),
        detailsText('TransactionNumber', data?.transactionNumber.toString() ?? ''),
        detailsText('ApprovedBy', data?.approvedBy.toString() ?? '-'),
        detailsText('TransactionReopenedCount', data?.TransactionReopenedCount.toString() ?? '-'),
        detailsText('TransactionInitiatedTime',data?.transactionInitiatedTime != null ? DateFormat('dd-MM-yyyy hh:mm:ss a').format(DateTime.parse(data?.transactionInitiatedTime)) : '-'),
        detailsText('TransactionClosedTime',data?.transactionClosedTime != null ? DateFormat('dd-MM-yyyy hh:mm:ss a').format(DateTime.parse(data?.transactionClosedTime)) : '-'),
        detailsText('TransactionCancelledTime',data?.transactionCancelledTime != null ? DateFormat('dd-MM-yyyy hh:mm:ss a').format(DateTime.parse(data?.transactionCancelledTime)) : '-'),
        detailsText('TransactionReopenedTime',data?.transactionReopenedTime != null ? DateFormat('dd-MM-yyyy hh:mm:ss a').format(DateTime.parse(data?.transactionReopenedTime)) : '-'),
        detailsText('SessionId', data?.sessionId.toString() ?? '-'),
        detailsText('TentNumber', data?.tentNumber.toString() ?? '-'),
        detailsText('GuestContactEmail', data?.guestContactEmail.toString() ?? ''),
        detailsText('LockStatus', data?.lockStatus.toString() ?? ''),
        detailsText('LockedByPOSMachineId', data?.lockedByPOSMachineId.toString() ?? '-'),
        detailsText('LockedBySiteId', data?.lockedBySiteId.toString() ?? '-'),
        detailsText('LockedByUserId', data?.lockedByUserId.toString() ?? '-'),
        detailsText('LockedTime',data?.lockedTime != null ? DateFormat('dd-MM-yyyy hh:mm:ss a').format(DateTime.parse(data?.lockedTime)) : '-'),
        detailsText('ProcessedForLoyalty', data?.processedForLoyalty.toString() ?? '-'),
        detailsText('TransactionTypeId', data?.transactionTypeId.toString() ?? '-'),
        detailsText('IsActive', data?.isActive.toString() ?? '-'),
        detailsText('TransactionPaymentStatus', data?.transactionPaymentStatus.toString() ?? '-'),
        detailsText('TransactionPaymentStatusId', data?.transactionPaymentStatusId.toString() ?? '-'),
        detailsText('TransactionPaymentStatusChangeDate',data?.transactionPaymentStatusChangeDate != null ? DateFormat('dd-MM-yyyy hh:mm:ss a').format(DateTime.parse(data?.transactionPaymentStatusChangeDate)) : '-'),
        detailsText('IsNonChargeable', data?.isNonChargeable.toString() ?? '-'),
        detailsText('GuestCount', data?.guestCount.toString() ?? '-'),
        detailsText('GuestContactNumber', data?.guestContactNumber.toString() ?? '-'),
        detailsText('GuestName', data?.guestName.toString() ?? '-'),
        detailsText('TransactionIdentifier', data?.transactionIdentifier.toString() ?? '-'),
        detailsText('TransactionTaxTotal', data?.transactionTaxTotal.toString() ?? '-'),
        detailsText('Channel', data?.channel.toString() ?? '-'),
        detailsText('TransactionPaymentTotal', data?.transactionPaymentTotal.toString() ?? '-'),
        detailsText('TransactionDate',data == null ? '' : data?.transactionDate != null ? DateFormat('dd-MM-yyyy hh:mm:ss a').format(DateTime.parse(data!.transactionDate)) : '-'),
        detailsText('TransactionAmount', data?.transactionAmount.toString() ?? '-'),
        detailsText('TransactionNetAmount', data?.transactionNetAmount.toString() ?? '-'),
        detailsText('UserId', data?.userId.toString() ?? '-'),
        detailsText('PrimaryCardId', data?.primaryCardId.toString() ?? '-'),
        detailsText('OrderId', data?.orderId.toString() ?? '-'),
        detailsText('POSTypeId', data?.postTypeId.toString() ?? '-'),
        detailsText('TransactionNumber', data?.transactionNumber.toString() ?? '-'),
        detailsText('TransactionOTP', data?.transactionOTP.toString() ?? ''),
        detailsText('Remarks', data?.remarks.toString() ?? ''),
        detailsText('POSMachineId', data?.posMachineId.toString() ?? ''),
        detailsText('TransactionStatus', data?.transactionStatus.toString() ?? ''),
        detailsText('TransactionStatusId', data?.transactionStatusId.toString() ?? ''),
        detailsText('TransactionStatusChangeDate',data?.transactionStatusChangeDate != null ? DateFormat('dd-MM-yyyy hh:mm:ss a').format(DateTime.parse(data?.transactionStatusChangeDate)) : '-'),
        detailsText('TransactionProfileId', data?.transactionProfileId.toString() ?? ''),
        detailsText('TransactionProfileName', data?.transactionProfileName.toString() ?? ''),
        detailsText('LastUpdateDate',data == null? "" : data?.lastUpdateDate != null ? DateFormat('dd-MM-yyyy hh:mm:ss a').format(DateTime.parse(data!.lastUpdateDate)) : '-'),
        detailsText('LastUpdatedBy', data?.tastUpdatedBy.toString() ?? ''),
        detailsText('TokenNumber', data?.tokenNumber.toString() ?? ''),
        detailsText('CustomerId', data?.customerId.toString() ?? ''),
        detailsText('ExternalSystemReference', data?.externalSystemReference.toString() ?? ''),
        detailsText('ReprintCount', data?.ReprintCount.toString() ?? ''),
        detailsText('OriginalTransactionId', data?.originalTransactionId.toString() ?? ''),
        detailsText('OrderTypeGroupId', data?.orderTypeGroupId.toString() ?? ''),
        detailsText('ProvisionalBillPrintCount', data?.provisionalBillPrintCount.toString() ?? ''),
        detailsText('PrintCount', data?.printCount.toString() ?? ''),
        detailsText('SaveStartTime',data == null? "" : data?.saveStartTime != null ? DateFormat('dd-MM-yyyy hh:mm:ss a').format(DateTime.parse(data!.saveStartTime)) : '-'),
        detailsText('SaveEndTime',data == null? "" : data?.saveEndTime != null ? DateFormat('dd-MM-yyyy hh:mm:ss a').format(DateTime.parse(data!.saveEndTime)) : '-'),
        detailsText('PrintStartTime',data == null? "" : data?.printStartTime != null ? DateFormat('dd-MM-yyyy hh:mm:ss a').format(DateTime.parse(data!.printStartTime)) : '-'),
        detailsText('PrintEndTime',data == null? "" : data?.printEndTime != null ? DateFormat('dd-MM-yyyy hh:mm:ss a').format(DateTime.parse(data!.printEndTime)) : '-'),
        detailsText('TransactionDiscountTotal', data?.transactionDiscountTotal.toString() ?? ''),
        detailsText('TransactionDiscountDTOList',''),
        detailsText('TransactionPaymentDTOList', ''),
        detailsText('TransactionLineDTOList',''),
        detailsText('TrxLinePaymentMappingDTOList',''),
        detailsText('CreationDate',data == null? "" : data?.creationDate != null ? DateFormat('dd-MM-yyyy hh:mm:ss a').format(DateTime.parse(data!.creationDate)) : '-'),
        detailsText('Guid', data?.guid.toString() ?? ''),
        detailsText('SiteId', data?.SiteId.toString() ?? ''),
        detailsText('MasterEntityId', data?.masterEntityId.toString() ?? ''),
        detailsText('SynchStatus', data?.synchStatus.toString() ?? ''),
        detailsText('IsAccessible', data?.isAccessible.toString() ?? ''),
        detailsText('IsChanged', data?.isChanged.toString() ?? ''),
        detailsText('IsChangedRecursive', data?.isChangedRecursive.toString() ?? ''),
      ],
    );
  }

  Widget detailsText(String title , String content){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(title, style: theme.subtitle3?.copyWith(color: theme.secondaryColor,fontWeight: FontWeight.w500, fontSize: SizeConfig.getFontSize(16)),textAlign: TextAlign.start,),
        Text(content, style: theme.heading5?.copyWith(fontSize: SizeConfig.getFontSize(20)), textAlign: TextAlign.start),
        const SizedBox(height: 8,),
      ],
    );

  }

}