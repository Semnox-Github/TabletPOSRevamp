// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_line_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TransactionLineDTORequest _$$_TransactionLineDTORequestFromJson(
        Map<String, dynamic> json) =>
    _$_TransactionLineDTORequest(
      modifierSetId: json['ModifierSetId'] as int,
      modifierSetDetailId: json['ModifierSetDetailId'] as int,
      productId: json['ProductId'] as int,
      productName: json['ProductName'] as String,
      remarks: json['Remarks'] as String?,
      approvedBy: json['ApprovedBy'] as String?,
      quantity: (json['Quantity'] as num?)?.toDouble() ?? 0.0,
      isParentModifier: json['IsParentModifier'] as bool? ?? false,
      transactionLineDTOList: (json['TransactionLineDTOList'] as List<dynamic>?)
              ?.map((e) =>
                  TransactionLineDTORequest.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_TransactionLineDTORequestToJson(
        _$_TransactionLineDTORequest instance) =>
    <String, dynamic>{
      'ModifierSetId': instance.modifierSetId,
      'ModifierSetDetailId': instance.modifierSetDetailId,
      'ProductId': instance.productId,
      'ProductName': instance.productName,
      'Remarks': instance.remarks,
      'ApprovedBy': instance.approvedBy,
      'Quantity': instance.quantity,
      'IsParentModifier': instance.isParentModifier,
      'TransactionLineDTOList': instance.transactionLineDTOList,
    };
