
import 'package:freezed_annotation/freezed_annotation.dart';
part 'orders_data.freezed.dart';
part 'orders_data.g.dart';
@freezed
class OrdersData with _$OrdersData{
  const factory OrdersData({
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
    dynamic? orderStatusChangeDate,
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
    dynamic? transactionStatusChangeDate,
    @JsonKey(name: 'PaymentStatus')
    required String paymentStatus,
    @JsonKey(name: 'PaymentStatusId')
    required int paymentStatusId,
    @JsonKey(name: 'PaymentStatusChangeDate')
    dynamic? paymentStatusChangeDate,
    @JsonKey(name: 'IsAccessible')
    required bool isAccessible,
    @Default(false) bool isSelected,
  }) = _OrdersData;

  factory OrdersData.fromJson(Map<String,dynamic> json) => _$OrdersDataFromJson(json);
}
