
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:orders_data/models/transaction_status_container/transaction_status_container_data.dart';

part 'transaction_status_container_response.freezed.dart';
part 'transaction_status_container_response.g.dart';
@freezed
class TransactionStatusContainerResponse with _$TransactionStatusContainerResponse{
  const factory TransactionStatusContainerResponse({
    TransacationStatusContainerData? data,
    String? exception,
  }) = _TransactionStatusContainerResponse;


  factory TransactionStatusContainerResponse.fromJson(Map<String,dynamic> json) => _$TransactionStatusContainerResponseFromJson(json);
}