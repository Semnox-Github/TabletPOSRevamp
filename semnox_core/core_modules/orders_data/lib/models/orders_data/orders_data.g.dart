// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'orders_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_OrdersData _$$_OrdersDataFromJson(Map<String, dynamic> json) =>
    _$_OrdersData(
      orderId: json['OrderId'] as int,
      tableId: json['TableId'] as int,
      orderDate: json['OrderDate'] as String,
      guestName: json['GuestName'] as String,
      guestContactNumber: json['GuestContactNumber'] as String,
      transactionIdentifier: json['TransactionIdentifier'] as String,
      tentNumber: json['TentNumber'] as String,
      orderStatus: json['OrderStatus'] as String,
      orderStatusId: json['OrderStatusId'] as int,
      orderStatusChangeDate: json['OrderStatusChangeDate'],
      transactionId: json['TransactionId'] as int,
      transactionNumber: json['TransactionNumber'] as String,
      transactionAmount: (json['TransactionAmount'] as num).toDouble(),
      transactionStatus: json['TransactionStatus'] as String,
      transactionStatusId: json['TransactionStatusId'] as int,
      transactionStatusChangeDate: json['TransactionStatusChangeDate'],
      paymentStatus: json['PaymentStatus'] as String,
      paymentStatusId: json['PaymentStatusId'] as int,
      paymentStatusChangeDate: json['PaymentStatusChangeDate'],
      isAccessible: json['IsAccessible'] as bool,
      isSelected: json['isSelected'] as bool? ?? false,
    );

Map<String, dynamic> _$$_OrdersDataToJson(_$_OrdersData instance) =>
    <String, dynamic>{
      'OrderId': instance.orderId,
      'TableId': instance.tableId,
      'OrderDate': instance.orderDate,
      'GuestName': instance.guestName,
      'GuestContactNumber': instance.guestContactNumber,
      'TransactionIdentifier': instance.transactionIdentifier,
      'TentNumber': instance.tentNumber,
      'OrderStatus': instance.orderStatus,
      'OrderStatusId': instance.orderStatusId,
      'OrderStatusChangeDate': instance.orderStatusChangeDate,
      'TransactionId': instance.transactionId,
      'TransactionNumber': instance.transactionNumber,
      'TransactionAmount': instance.transactionAmount,
      'TransactionStatus': instance.transactionStatus,
      'TransactionStatusId': instance.transactionStatusId,
      'TransactionStatusChangeDate': instance.transactionStatusChangeDate,
      'PaymentStatus': instance.paymentStatus,
      'PaymentStatusId': instance.paymentStatusId,
      'PaymentStatusChangeDate': instance.paymentStatusChangeDate,
      'IsAccessible': instance.isAccessible,
      'isSelected': instance.isSelected,
    };
