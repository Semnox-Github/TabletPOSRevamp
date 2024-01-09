// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_transaction_lines_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_OrderTransactionLinesState _$$_OrderTransactionLinesStateFromJson(
        Map<String, dynamic> json) =>
    _$_OrderTransactionLinesState(
      loadingStatus: json['loadingStatus'] as int? ?? -1,
      seats:
          (json['seats'] as List<dynamic>?)?.map((e) => e as String).toList(),
      course:
          (json['course'] as List<dynamic>?)?.map((e) => e as String).toList(),
      products: (json['products'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      transactionLinesGroup: (json['transactionLinesGroup'] as List<dynamic>?)
          ?.map(
              (e) => TransactionLinesGroup.fromJson(e as Map<String, dynamic>))
          .toList(),
      isSuccess: json['isSuccess'] as bool?,
      isError: json['isError'] as bool?,
      statusMessage: json['statusMessage'] as String?,
      transactionResponse: json['transactionResponse'] == null
          ? null
          : TransactionResponse.fromJson(
              json['transactionResponse'] as Map<String, dynamic>),
      transactionLinesGroupsBySeat:
          (json['transactionLinesGroupsBySeat'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(
            k,
            (e as List<dynamic>)
                .map((e) =>
                    TransactionLinesGroup.fromJson(e as Map<String, dynamic>))
                .toList()),
      ),
      selectedTransactionLinesGroup: (json['selectedTransactionLinesGroup']
              as List<dynamic>?)
          ?.map(
              (e) => TransactionLinesGroup.fromJson(e as Map<String, dynamic>))
          .toList(),
      shouldClearSearchFilter: json['shouldClearSearchFilter'] as bool?,
    );

Map<String, dynamic> _$$_OrderTransactionLinesStateToJson(
        _$_OrderTransactionLinesState instance) =>
    <String, dynamic>{
      'loadingStatus': instance.loadingStatus,
      'seats': instance.seats,
      'course': instance.course,
      'products': instance.products,
      'transactionLinesGroup': instance.transactionLinesGroup,
      'isSuccess': instance.isSuccess,
      'isError': instance.isError,
      'statusMessage': instance.statusMessage,
      'transactionResponse': instance.transactionResponse,
      'transactionLinesGroupsBySeat': instance.transactionLinesGroupsBySeat,
      'selectedTransactionLinesGroup': instance.selectedTransactionLinesGroup,
      'shouldClearSearchFilter': instance.shouldClearSearchFilter,
    };
