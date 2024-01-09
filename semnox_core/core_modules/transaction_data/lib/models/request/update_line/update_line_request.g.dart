// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_line_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UpdateLineRequest _$$_UpdateLineRequestFromJson(Map<String, dynamic> json) =>
    _$_UpdateLineRequest(
      seatName: json['SeatName'] as String,
      courseName: json['CourseName'],
      comboProductId: json['ComboProductId'] as int?,
      modifierSetId: json['ModifierSetId'] as int?,
      isNonChargeable: json['IsNonChargeable'] as bool?,
      orderTypeId: json['OrderTypeId'] as int?,
      isReversed: json['IsReversed'] as bool?,
      onPrintHold: json['OnPrintHold'] as bool?,
      is9999Product: json['Is9999Product'] as bool?,
      isCrossSellProduct: json['IsCrossSellProduct'] as bool?,
      isUpsellProduct: json['IsUpsellProduct'] as bool?,
      userOverriddenPrice: json['UserOverriddenPrice'],
      seatNumber: json['SeatNumber'] as int,
      transactionLineId: json['TransactionLineId'] as int,
      transactionProfileId: json['TransactionProfileId'] as int?,
      lineNumber: json['LineNumber'] as int,
      productId: json['ProductId'] as int,
      quantity: json['Quantity'] as int,
      remarks: json['Remarks'] as String?,
    );

Map<String, dynamic> _$$_UpdateLineRequestToJson(
        _$_UpdateLineRequest instance) =>
    <String, dynamic>{
      'SeatName': instance.seatName,
      'CourseName': instance.courseName,
      'ComboProductId': instance.comboProductId,
      'ModifierSetId': instance.modifierSetId,
      'IsNonChargeable': instance.isNonChargeable,
      'OrderTypeId': instance.orderTypeId,
      'IsReversed': instance.isReversed,
      'OnPrintHold': instance.onPrintHold,
      'Is9999Product': instance.is9999Product,
      'IsCrossSellProduct': instance.isCrossSellProduct,
      'IsUpsellProduct': instance.isUpsellProduct,
      'UserOverriddenPrice': instance.userOverriddenPrice,
      'SeatNumber': instance.seatNumber,
      'TransactionLineId': instance.transactionLineId,
      'TransactionProfileId': instance.transactionProfileId,
      'LineNumber': instance.lineNumber,
      'ProductId': instance.productId,
      'Quantity': instance.quantity,
      'Remarks': instance.remarks,
    };
