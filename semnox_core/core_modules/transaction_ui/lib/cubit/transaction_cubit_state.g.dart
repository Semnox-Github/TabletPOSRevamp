// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_cubit_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TransactionCubitState _$$_TransactionCubitStateFromJson(
        Map<String, dynamic> json) =>
    _$_TransactionCubitState(
      selectedSeat: json['selectedSeat'] as int? ?? 0,
      transactionData: json['transactionData'] == null
          ? null
          : TransactionData.fromJson(
              json['transactionData'] as Map<String, dynamic>),
      isSeatBased: json['isSeatBased'] as bool? ?? false,
      showOrderDetailsWhileInitiatingOrder:
          json['showOrderDetailsWhileInitiatingOrder'] as bool? ?? false,
      selectedSeatName: json['selectedSeatName'] as String? ?? "Shared Order",
      transactionLinesGroupsBySeat:
          (json['transactionLinesGroupsBySeat'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(
            k,
            (e as List<dynamic>)
                .map((e) =>
                    TransactionLinesGroup.fromJson(e as Map<String, dynamic>))
                .toList()),
      ),
      seatNames: (json['seatNames'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      seatNumbers: (json['seatNumbers'] as List<dynamic>?)
          ?.map((e) => e as int)
          .toList(),
      isTransactionLineGroupSelected:
          json['isTransactionLineGroupSelected'] as int?,
      loaderStatus: json['loaderStatus'] == null
          ? null
          : LoaderStatus.fromJson(json['loaderStatus'] as Map<String, dynamic>),
      isRemarksUpdated: json['isRemarksUpdated'] as bool?,
      isProfileUpdatedToTransactionLine:
          json['isProfileUpdatedToTransactionLine'] as bool?,
      isNewTransactionInitiated: json['isNewTransactionInitiated'] as bool?,
      remarksUpdateErrorString: json['remarksUpdateErrorString'] as String?,
      transactionUpdateStatusEnum: $enumDecodeNullable(
          _$TransactionUpdateStatusEnumEnumMap,
          json['transactionUpdateStatusEnum']),
      transactionErrorString: json['transactionErrorString'] as String? ?? "",
      transactionDetailsUpdateStatusEnum: $enumDecodeNullable(
          _$TransactionDetailsUpdateStatusEnumEnumMap,
          json['transactionDetailsUpdateStatusEnum']),
      transactionDetailsUpdateErrorString:
          json['transactionDetailsUpdateErrorString'] as String? ?? "",
      status: json['status'] == null
          ? null
          : Status.fromJson(json['status'] as Map<String, dynamic>),
      linkCustomerToTransactionError:
          json['linkCustomerToTransactionError'] as String?,
      deLinkCustomerFromTransactionError:
          json['deLinkCustomerFromTransactionError'] as String?,
      hasCustomerDelinkedFromTransaction:
          json['hasCustomerDelinkedFromTransaction'] as bool?,
      completeTransactionStatus: json['completeTransactionStatus'] == null
          ? null
          : TransactionStatus.fromJson(
              json['completeTransactionStatus'] as Map<String, dynamic>),
      isInSearchMode: json['isInSearchMode'] as bool? ?? false,
      searchResultsTransactionLineGroups:
          (json['searchResultsTransactionLineGroups'] as List<dynamic>?)
              ?.map((e) =>
                  TransactionLinesGroup.fromJson(e as Map<String, dynamic>))
              .toList(),
      isRemarksMandatoryProductAdded:
          json['isRemarksMandatoryProductAdded'] as bool?,
      remarksMandatoryProductErrorString:
          json['remarksMandatoryProductErrorString'] as String?,
      isTransactionLinesSeatUpdated:
          json['isTransactionLinesSeatUpdated'] as bool?,
      seats: (json['seats'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(int.parse(k), e as String),
      ),
      isTransactionLineRepeated: json['isTransactionLineRepeated'] as int?,
      shouldPopAfterSave: json['shouldPopAfterSave'] as bool? ?? false,
      transactionPrintReceipt: json['transactionPrintReceipt'] == null
          ? null
          : TransactionPrintReceiptResponse.fromJson(
              json['transactionPrintReceipt'] as Map<String, dynamic>),
      shouldTriggerPopAfterSave: json['shouldTriggerPopAfterSave'] as bool?,
      isBluetoothConnectivitySession:
          json['isBluetoothConnectivitySession'] as bool?,
      isLoading: json['isLoading'] as bool? ?? false,
      isSuccess: json['isSuccess'] as bool? ?? false,
      isError: json['isError'] as bool? ?? false,
      messageString: json['messageString'] as String?,
      isPrintReceiptReceived: json['isPrintReceiptReceived'] as bool? ?? false,
      updatedTransactionProfile: json['updatedTransactionProfile'] as bool?,
      updateTransactionProfileError:
          json['updateTransactionProfileError'] as String?,
      updateTransactionLineProfileError:
          json['updateTransactionLineProfileError'] as String?,
      updateTransactionLinesSeatError:
          json['updateTransactionLinesSeatError'] as String?,
      transactionSeatNameUpdateError:
          json['transactionSeatNameUpdateError'] as String?,
      isInProductSearchMode: json['isInProductSearchMode'] as bool?,
      isCardFunctionalityDialogShown:
          json['isCardFunctionalityDialogShown'] as bool?,
      isCustomerIDDialogShown: json['isCustomerIDDialogShown'] as bool?,
      barcodeReadData: json['barcodeReadData'] as String?,
    );

Map<String, dynamic> _$$_TransactionCubitStateToJson(
        _$_TransactionCubitState instance) =>
    <String, dynamic>{
      'selectedSeat': instance.selectedSeat,
      'transactionData': instance.transactionData,
      'isSeatBased': instance.isSeatBased,
      'showOrderDetailsWhileInitiatingOrder':
          instance.showOrderDetailsWhileInitiatingOrder,
      'selectedSeatName': instance.selectedSeatName,
      'transactionLinesGroupsBySeat': instance.transactionLinesGroupsBySeat,
      'seatNames': instance.seatNames,
      'seatNumbers': instance.seatNumbers,
      'isTransactionLineGroupSelected': instance.isTransactionLineGroupSelected,
      'loaderStatus': instance.loaderStatus,
      'isRemarksUpdated': instance.isRemarksUpdated,
      'isProfileUpdatedToTransactionLine':
          instance.isProfileUpdatedToTransactionLine,
      'isNewTransactionInitiated': instance.isNewTransactionInitiated,
      'remarksUpdateErrorString': instance.remarksUpdateErrorString,
      'transactionUpdateStatusEnum': _$TransactionUpdateStatusEnumEnumMap[
          instance.transactionUpdateStatusEnum],
      'transactionErrorString': instance.transactionErrorString,
      'transactionDetailsUpdateStatusEnum':
          _$TransactionDetailsUpdateStatusEnumEnumMap[
              instance.transactionDetailsUpdateStatusEnum],
      'transactionDetailsUpdateErrorString':
          instance.transactionDetailsUpdateErrorString,
      'status': instance.status,
      'linkCustomerToTransactionError': instance.linkCustomerToTransactionError,
      'deLinkCustomerFromTransactionError':
          instance.deLinkCustomerFromTransactionError,
      'hasCustomerDelinkedFromTransaction':
          instance.hasCustomerDelinkedFromTransaction,
      'completeTransactionStatus': instance.completeTransactionStatus,
      'isInSearchMode': instance.isInSearchMode,
      'searchResultsTransactionLineGroups':
          instance.searchResultsTransactionLineGroups,
      'isRemarksMandatoryProductAdded': instance.isRemarksMandatoryProductAdded,
      'remarksMandatoryProductErrorString':
          instance.remarksMandatoryProductErrorString,
      'isTransactionLinesSeatUpdated': instance.isTransactionLinesSeatUpdated,
      'seats': instance.seats?.map((k, e) => MapEntry(k.toString(), e)),
      'isTransactionLineRepeated': instance.isTransactionLineRepeated,
      'shouldPopAfterSave': instance.shouldPopAfterSave,
      'transactionPrintReceipt': instance.transactionPrintReceipt,
      'shouldTriggerPopAfterSave': instance.shouldTriggerPopAfterSave,
      'isBluetoothConnectivitySession': instance.isBluetoothConnectivitySession,
      'isLoading': instance.isLoading,
      'isSuccess': instance.isSuccess,
      'isError': instance.isError,
      'messageString': instance.messageString,
      'isPrintReceiptReceived': instance.isPrintReceiptReceived,
      'updatedTransactionProfile': instance.updatedTransactionProfile,
      'updateTransactionProfileError': instance.updateTransactionProfileError,
      'updateTransactionLineProfileError':
          instance.updateTransactionLineProfileError,
      'updateTransactionLinesSeatError':
          instance.updateTransactionLinesSeatError,
      'transactionSeatNameUpdateError': instance.transactionSeatNameUpdateError,
      'isInProductSearchMode': instance.isInProductSearchMode,
      'isCardFunctionalityDialogShown': instance.isCardFunctionalityDialogShown,
      'isCustomerIDDialogShown': instance.isCustomerIDDialogShown,
      'barcodeReadData': instance.barcodeReadData,
    };

const _$TransactionUpdateStatusEnumEnumMap = {
  TransactionUpdateStatusEnum.initial: 'initial',
  TransactionUpdateStatusEnum.loading: 'loading',
  TransactionUpdateStatusEnum.success: 'success',
  TransactionUpdateStatusEnum.error: 'error',
};

const _$TransactionDetailsUpdateStatusEnumEnumMap = {
  TransactionDetailsUpdateStatusEnum.initial: 'initial',
  TransactionDetailsUpdateStatusEnum.loading: 'loading',
  TransactionDetailsUpdateStatusEnum.success: 'success',
  TransactionDetailsUpdateStatusEnum.error: 'error',
};
