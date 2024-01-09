// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_modifier_product_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AddModifierProductRequest _$$_AddModifierProductRequestFromJson(
        Map<String, dynamic> json) =>
    _$_AddModifierProductRequest(
      seatName: json['SeatName'] as String,
      seatNumber: json['SeatNumber'] as int,
      viewGroupingNumber: json['ViewGroupingNumber'] as int?,
      productId: json['ProductId'] as int,
      quantity: (json['Quantity'] as num).toDouble(),
      productName: json['ProductName'] as String,
      transactionLineDTOList: (json['TransactionLineDTOList'] as List<dynamic>)
          .map((e) =>
              TransactionLineDTORequest.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_AddModifierProductRequestToJson(
        _$_AddModifierProductRequest instance) =>
    <String, dynamic>{
      'SeatName': instance.seatName,
      'SeatNumber': instance.seatNumber,
      'ViewGroupingNumber': instance.viewGroupingNumber,
      'ProductId': instance.productId,
      'Quantity': instance.quantity,
      'ProductName': instance.productName,
      'TransactionLineDTOList': instance.transactionLineDTOList,
    };
