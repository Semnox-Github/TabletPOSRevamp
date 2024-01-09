
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:orders_data/models/transaction_status_container/transaction_status_container_dto.dart';
part 'transaction_status_container_data.freezed.dart';
part 'transaction_status_container_data.g.dart';

@freezed
class TransacationStatusContainerData with _$TransacationStatusContainerData{
  const factory TransacationStatusContainerData({
    @JsonKey(name: 'TransactionStatusContainerDTOList')
    required List<TransactionStatusContainerDTO> transactionStatusContainerDTO,
    String? hash,
  }) =_TransacationStatusContainerData;

  factory TransacationStatusContainerData.fromJson(Map<String, dynamic> json) => _$TransacationStatusContainerDataFromJson(json);
}