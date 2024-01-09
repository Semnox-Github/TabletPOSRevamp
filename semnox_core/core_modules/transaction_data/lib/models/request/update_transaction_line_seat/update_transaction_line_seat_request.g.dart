// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_transaction_line_seat_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UpdateTransactionLineSeatRequest
    _$$_UpdateTransactionLineSeatRequestFromJson(Map<String, dynamic> json) =>
        _$_UpdateTransactionLineSeatRequest(
          transactionLineId: json['TransactionLineId'] as int,
          seatName: json['SeatName'] as String,
          seatNumber: json['SeatNumber'] as String,
          lineRemarks: json['LineRemarks'] as String,
          approvalDto:
              ApprovalDTO.fromJson(json['ApprovalDTO'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$$_UpdateTransactionLineSeatRequestToJson(
        _$_UpdateTransactionLineSeatRequest instance) =>
    <String, dynamic>{
      'TransactionLineId': instance.transactionLineId,
      'SeatName': instance.seatName,
      'SeatNumber': instance.seatNumber,
      'LineRemarks': instance.lineRemarks,
      'ApprovalDTO': instance.approvalDto,
    };
