// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'purchase_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PurchaseData _$$_PurchaseDataFromJson(Map<String, dynamic> json) =>
    _$_PurchaseData(
      accountId: json['AccountId'] as int?,
      date: json['Date'] as String?,
      product: json['Product'] as String?,
      amount: (json['Amount'] as num?)?.toDouble(),
      credits: (json['Credits'] as num?)?.toDouble(),
      courtesy: (json['Courtesy'] as num?)?.toDouble(),
      bonus: (json['Bonus'] as num?)?.toDouble(),
      time: (json['Time'] as num?)?.toDouble(),
      tokens: (json['Tokens'] as num?)?.toDouble(),
      tickets: json['Tickets'] as int?,
      loyaltyPoints: (json['LoyaltyPoints'] as num?)?.toDouble(),
      virtualPoints: (json['VirtualPoints'] as num?)?.toDouble(),
      site: json['Site'] as String?,
      POS: json['POS'] as String?,
      userName: json['UserName'] as String?,
      quantity: (json['Quantity'] as num?)?.toDouble(),
      price: (json['Price'] as num?)?.toDouble(),
      refId: json['RefId'] as int?,
      rowNumber: json['RowNumber'] as int?,
      activityType: json['ActivityType'] as String?,
      status: json['Status'] as String?,
      playCredits: (json['PlayCredits'] as num?)?.toDouble(),
      counterItems: (json['CounterItems'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$_PurchaseDataToJson(_$_PurchaseData instance) =>
    <String, dynamic>{
      'AccountId': instance.accountId,
      'Date': instance.date,
      'Product': instance.product,
      'Amount': instance.amount,
      'Credits': instance.credits,
      'Courtesy': instance.courtesy,
      'Bonus': instance.bonus,
      'Time': instance.time,
      'Tokens': instance.tokens,
      'Tickets': instance.tickets,
      'LoyaltyPoints': instance.loyaltyPoints,
      'VirtualPoints': instance.virtualPoints,
      'Site': instance.site,
      'POS': instance.POS,
      'UserName': instance.userName,
      'Quantity': instance.quantity,
      'Price': instance.price,
      'RefId': instance.refId,
      'RowNumber': instance.rowNumber,
      'ActivityType': instance.activityType,
      'Status': instance.status,
      'PlayCredits': instance.playCredits,
      'CounterItems': instance.counterItems,
    };
