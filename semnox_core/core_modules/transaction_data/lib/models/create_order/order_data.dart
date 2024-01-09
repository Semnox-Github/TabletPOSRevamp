// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_data.freezed.dart';
part 'order_data.g.dart';

@freezed
class OrderData with _$OrderData {
  const factory OrderData({
    @JsonKey(name: 'OrderId')
    required int orderId,
    @JsonKey(name: 'TableId')
    required int tableId,
    @JsonKey(name: 'OrderDate')
    required String orderDate,
    @JsonKey(name: 'GuestName')
    required String guestName,
    @JsonKey(name: 'GuestContactNumber')
    required String guestContactNumber,
    @JsonKey(name: 'TransactionIdentifier')
    required String transactionIdentifier,
    @JsonKey(name: 'TentNumber')
    required String tentNumber,
    @JsonKey(name: 'OrderStatus')
    required String orderStatus,
    @JsonKey(name: 'OrderStatusId')
    required int orderStatusId,
    @JsonKey(name: 'OrderStatusChangeDate')
    required String orderStatusChangeDate,
    @JsonKey(name: 'TransactionId')
    required int transactionId,
    @JsonKey(name: 'TransactionNumber')
    required String transactionNumber,
    @JsonKey(name: 'TransactionAmount')
    required double transactionAmount,
    @JsonKey(name: 'TransactionStatus')
    required String transactionStatus,
    @JsonKey(name: 'TransactionStatusId')
    required int transactionStatusId,
    @JsonKey(name: 'TransactionStatusChangeDate')
    dynamic transactionStatusChangeDate,
    @JsonKey(name: 'PaymentStatus')
    required String paymentStatus,
    @JsonKey(name: 'PaymentStatusId')
    required int paymentStatusId,
    @JsonKey(name: 'PaymentStatusChangeDate')
    dynamic paymentStatusChangeDate,
    @JsonKey(name: 'IsAccessible')
    required bool isAccessible,
  }) = _OrderData;

  factory OrderData.fromJson(Map<String, dynamic> json) => _$OrderDataFromJson(json);
}