// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_line_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AddLineRequest _$$_AddLineRequestFromJson(Map<String, dynamic> json) =>
    _$_AddLineRequest(
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
      transactionProfileId: json['TransactionProfileId'] as int?,
      lineNumber: json['LineNumber'] as int,
      productId: json['ProductId'] as int,
      quantity: json['Quantity'] as int,
      remarks: json['Remarks'] as String?,
      tagNumber: json['TagNumber'] as String?,
      transactionAccountDTO: (json['TransactionAccountDTOList']
              as List<dynamic>?)
          ?.map(
              (e) => TransactionAccountDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      approvedBy: json['ApprovedBy'] as String?,
      lineDate: json['LineDate'] as String?,
    );

Map<String, dynamic> _$$_AddLineRequestToJson(_$_AddLineRequest instance) =>
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
      'TransactionProfileId': instance.transactionProfileId,
      'LineNumber': instance.lineNumber,
      'ProductId': instance.productId,
      'Quantity': instance.quantity,
      'Remarks': instance.remarks,
      'TagNumber': instance.tagNumber,
      'TransactionAccountDTOList': instance.transactionAccountDTO,
      'ApprovedBy': instance.approvedBy,
      'LineDate': instance.lineDate,
    };
