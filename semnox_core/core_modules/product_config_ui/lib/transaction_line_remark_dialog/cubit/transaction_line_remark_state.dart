import 'package:transaction_data/models/create_transaction/transaction_response.dart';

class TransactionLineRemarkDialogState{
  TransactionLineRemarkDialogState(
      {this.isLoading = false,
        this.isSuccess = false,
        this.isError = false,
        this.statusMessage = '',
        this.transactionResponse});

  bool isLoading;
  bool isSuccess;
  bool isError;
  String statusMessage;
  TransactionResponse? transactionResponse;

  TransactionLineRemarkDialogState copyWith({
    bool? isLoading,
    bool? isSuccess,
    bool? isError,
    String? statusMessage,
    TransactionResponse? transactionResponse
  }) {
    return TransactionLineRemarkDialogState(
        isLoading: isLoading ?? this.isLoading,
        isSuccess: isSuccess ?? this.isSuccess,
        isError: isError ?? this.isError,
        statusMessage: statusMessage ?? this.statusMessage,
        transactionResponse: transactionResponse ?? this.transactionResponse
    );
  }
}