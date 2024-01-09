// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_open_line_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AddOpenLineRequest _$$_AddOpenLineRequestFromJson(
        Map<String, dynamic> json) =>
    _$_AddOpenLineRequest(
      productId: json['ProductId'] as int,
      description: json['Description'] as String,
      price: (json['Price'] as num).toDouble(),
      printerId: json['PrinterId'] as int,
      remarks: json['Remarks'] as String,
      approvalDTO:
          ApprovalDTO.fromJson(json['ApprovalDTO'] as Map<String, dynamic>),
      seatNo: json['SeatNumber'] as int,
      seatName: json['SeatName'] as String,
    );

Map<String, dynamic> _$$_AddOpenLineRequestToJson(
        _$_AddOpenLineRequest instance) =>
    <String, dynamic>{
      'ProductId': instance.productId,
      'Description': instance.description,
      'Price': instance.price,
      'PrinterId': instance.printerId,
      'Remarks': instance.remarks,
      'ApprovalDTO': instance.approvalDTO,
      'SeatNumber': instance.seatNo,
      'SeatName': instance.seatName,
    };
