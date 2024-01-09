import 'package:customer_data/builder.dart';
import 'package:customer_data/models/account_details/account_details_response.dart';
import 'package:dio/dio.dart';
import 'package:execution_context/builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logs_data/logger.dart';
import 'package:master_data/builder.dart';
import 'package:messages_data/builder.dart';
import 'package:other_function_data/builder.dart';
import 'package:other_function_data/model/balance_transfer/transfer_details_dto.dart';
import 'package:other_function_data/model/exchange_entitlement/exchange_entitlement_data.dart';
import 'package:other_function_data/model/exchange_entitlement/exchange_entitlement_response.dart';
import 'package:other_function_ui/widgets/colors.dart';
import '../../../model/multi_cards_model.dart';
import 'exchange_entitlement_state.dart';

class ExchangeEntitlementCubit extends Cubit<ExchangeEntitlementState> {
  ExchangeEntitlementCubit()
      : super(
            ExchangeEntitlementState()); // here inside Balance_transfer class,  some of the fields are already initialized

  AccountDetailsResponse? _accountsDetailsResponse;
  List<MultiCardsModel> _multiCardsData = [];
  List<TransferDetailsDto> _transferDetailsDto = [];
  ExchangeEntitlementResponse? _exchangeEntitlementResponse;
  bool _isCardAlreadyApplied = false;
  int _conversionValue = 1;
  int _availabeValue = 0;
  int _convertibleValue = 0;
  int _valueSum = 0;
  int _calculatedValue = 0;
  ExchangeEntitlementData? _exchangeEntitlementData;

  void setInitialValues(String exchangeType) {
    emit(state.copyWith(
        isLoading: false,
        isError: false,
        isSuccess: false,
        loaderMessage: '',
        isPrimaryCardApplied: false,
        exchangeType: exchangeType));
  }

  void resetValues() {
    emit(state.copyWith(
        isLoading: false, isError: false, isSuccess: false, loaderMessage: ''));
  }

  void _startLoading(String? loaderMessage) {
    emit(state.copyWith(
        isLoading: true,
        isSuccess: false,
        isError: false,
        loaderMessage: loaderMessage));
  }

  void _onErrorState(String? statusMessage) {
    emit(state.copyWith(
      isLoading: false,
      isSuccess: false,
      isError: true,
      statusMessage: statusMessage,
    ));
  }

  Future<void> addPrimaryCard(
      {required AccountDetailsResponse accountsData}) async {
    Log.printMethodStart('addPrimaryCard()','Other Functions->Tag Functions->Exchange Time for Credit','Confirm');
    try {
      // _startLoading(MessagesProvider.get('Applying card'));
      final execContextBL = await ExecutionContextBuilder.build();
      final execContext = execContextBL.getExecutionContext();
      _accountsDetailsResponse = accountsData;
      var masterDataBL = await MasterDataBuilder.build(execContext!);
      final timeConversionVale = await masterDataBL.getDefaultValuesByName(
          defaultValueName: "TIME_IN_MINUTES_PER_CREDIT");
      Log.printMethodEnd('addPrimaryCard()','Other Functions->Tag Functions->Exchange Time for Credit','Confirm');
      Log.printMethodReturn('addPrimaryCard()','Other Functions->Tag Functions->Exchange Time for Credit','Confirm');
      if ((timeConversionVale ?? '').isEmpty) {
        _conversionValue = 1;
      } else {
        try {
          _conversionValue = int.parse(timeConversionVale.toString());
        } catch (r) {
          _conversionValue = 1;
        }
      }
      if (state.exchangeType == "CTT") {
        _availabeValue = (_accountsDetailsResponse?.data?.first
                    .accountSummaryDTO?.totalGamePlayCreditsBalance ??
                0.00)
            .toInt();
      }
      if (state.exchangeType == "TTC") {
        _availabeValue = (_accountsDetailsResponse
                    ?.data?[0].accountSummaryDTO?.totalTimeBalance ??
                0.00)
            .toInt();
      }

      if (_accountsDetailsResponse?.data?[0].accountId != -1) {
        if (_availabeValue == 0) {
          emit(state.copyWith(
              isLoading: false,
              isSuccess: false,
              isError: true,
              isPrimaryCardApplied: false,
              statusMessage: _getWarning3Message()));
        } else {
          emit(state.copyWith(
              isLoading: false,
              isSuccess: true,
              isError: false,
              notificationBarColor: KColor.notificationBGLightBlueColor,
              isPrimaryCardApplied: true,
              primaryCardData: _accountsDetailsResponse,
              statusMessage: _getWarning1Message(),
              entitlementAvailableValue: _availabeValue,
              conversionValue: _conversionValue));
        }
      } else {
        emit(state.copyWith(isPrimaryCardApplied: false));
        _onErrorState(MessagesProvider.get('Please Tap Card'));
      }
    } on DioError catch (error) {
      _onErrorState(dioErrors(error));
    } catch (error) {
      _onErrorState(error.toString());
    }
  }

  String _getWarning1Message() {
    switch (state.exchangeType) {
      case "TTC":
        return MessagesProvider.get(
            'Please enter Time to be converted to Points');
      case "CTT":
        return MessagesProvider.get(
            'Please enter the points to be converted to Time');
      default:
        return '';
    }
  }

  String _getWarning2Message(int amount) {
    switch (state.exchangeType) {
      case "TTC":
        return MessagesProvider.get(
            'Time to be converted should be less than or equal to &1',
            ['$amount']);
      case "CTT":
        return MessagesProvider.get(
            'Points to be converted should be less than or equal to &1',
            ['$amount']);
      default:
        return '';
    }
  }

  String _getWarning3Message() {
    switch (state.exchangeType) {
      case "TTC":
        return MessagesProvider.get('No active time available');
      case "CTT":
        return MessagesProvider.get('No active credits available');
      default:
        return '';
    }
  }

  void incrementConvertibleValue() {
    _valueSum = state.entitlementConvertValue;
    _valueSum++;
    if (state.exchangeType == "CTT") {
      _calculatedValue = _conversionValue * _valueSum;
    }
    if (state.exchangeType == "TTC") {
      _calculatedValue = _valueSum ~/ _conversionValue;
    }
    if (_valueSum > state.entitlementAvailableValue) {
      emit(state.copyWith(
          isError: true,
          isShowConvertedValue: true,
          statusMessage: _getWarning2Message(state.entitlementAvailableValue),
          entitlementConvertValue: _valueSum,
          afterConvertedValue: _calculatedValue));
    } else {
      emit(state.copyWith(
          isError: false,
          isSuccess: true,
          isShowConvertedValue: true,
          notificationBarColor: KColor.white,
          statusMessage: '',
          entitlementConvertValue: _valueSum,
          afterConvertedValue: _calculatedValue));
    }
  }

  void decrementConvertibleValue() {
    _valueSum = state.entitlementConvertValue;
    _valueSum--;
    if (state.exchangeType == "CTT") {
      _calculatedValue = _conversionValue * _valueSum;
    }
    if (state.exchangeType == "TTC") {
      _calculatedValue = _valueSum ~/ _conversionValue;
    }
    if (_calculatedValue >= 0) {
      if (_valueSum > state.entitlementAvailableValue) {
        emit(state.copyWith(
            isError: true,
            isShowConvertedValue: true,
            entitlementConvertValue: _valueSum,
            afterConvertedValue: _calculatedValue));
      } else {
        emit(state.copyWith(
            isError: false,
            isSuccess: true,
            isShowConvertedValue: true,
            notificationBarColor: KColor.white,
            statusMessage: '',
            entitlementConvertValue: _valueSum,
            afterConvertedValue: _calculatedValue));
      }
    }
  }

  void updateConvertibleValue(int newValue) {
    // _calculatedValue = _conversionValue * newValue;
    if (state.exchangeType == "CTT") {
      _calculatedValue = _conversionValue * newValue;
    }
    if (state.exchangeType == "TTC") {
      _calculatedValue = newValue ~/ _conversionValue;
    }
    if (newValue > state.entitlementAvailableValue) {
      emit(state.copyWith(
          isError: true,
          isShowConvertedValue: true,
          statusMessage: _getWarning2Message(state.entitlementAvailableValue),
          entitlementConvertValue: _valueSum,
          afterConvertedValue: _calculatedValue));
    } else {
      emit(state.copyWith(
          isError: false,
          isSuccess: true,
          isShowConvertedValue: true,
          notificationBarColor: KColor.white,
          statusMessage: '',
          entitlementConvertValue: newValue,
          afterConvertedValue: _calculatedValue));
    }
  }

  Future<bool> applyExchange({String? remarks, int?approverId}) async {
    try {
      Log.printMethodStart('applyExchange()','Other Functions->Tag Functions-> ${state.exchangeType == "TTC" ? 'Exchange Token For Credit' : "Exchange Credit For Token"}','Confirm');
      print("mangerId: $approverId");
      _startLoading(MessagesProvider.get('Please wait ...'));
      final execContextBL = await ExecutionContextBuilder.build();
      final execContext = execContextBL.getExecutionContext();
      final otherFunctionBL =
          await OtherFunctionDataBuilder.build(execContext!);
      _transferDetailsDto = [];
      _exchangeEntitlementData = ExchangeEntitlementData(
          cardId: state.primaryCardData?.data?[0].accountId ?? -1,
          managerId: approverId??execContext.userPKId??0,
          remarks: remarks??'',
          fromValue: state.entitlementConvertValue.toDouble(),
          fromType: _getFromType(),
          toType: _getToType());
      await otherFunctionBL.exchangeEntitlements(
          exchangeEntitlementData: _exchangeEntitlementData!);
      Log.printMethodEnd('applyExchange()','Other Functions->Tag Functions-> ${state.exchangeType == "TTC" ? 'Exchange Token For Credit' : "Exchange Credit For Token"}','Confirm');
      Log.printMethodReturn('applyExchange()-Points transferred successfully','Other Functions->Tag Functions-> ${state.exchangeType == "TTC" ? 'Exchange Token For Credit' : "Exchange Credit For Token"}','Confirm');
      emit(state.copyWith(
        isLoading: false,
        isSuccess: true,
        isError: false,
        notificationBarColor: KColor.notificationBGLightBlueColor,
        statusMessage:
            '${MessagesProvider.get('Points transferred successfully to')} ${_getTransferToStringValue()} ${MessagesProvider.get('Entitlement')}',
      ));
      return true;
    } on DioError catch (error) {
      _onErrorState(dioErrors(error));
      return false;
    } catch (error) {
      _onErrorState(error.toString());
      return false;
    }
  }

  int _getFromType() {
    switch (state.exchangeType) {
      case 'CTT':
        return 2;
      case 'TTC':
        return 4;
      default:
        return -1;
    }
  }

  String _getTransferToStringValue() {
    switch (state.exchangeType) {
      case 'CTT':
        return 'Time';
      case 'TTC':
        return 'Credit';
      default:
        return '-1';
    }
  }

  String _getTransferFromStringValue() {
    switch (state.exchangeType) {
      case 'CTT':
        return 'Credit';
      case 'TTC':
        return 'Time';
      default:
        return '-1';
    }
  }

  int _getToType() {
    switch (state.exchangeType) {
      case 'CTT':
        return 4;
      case 'TTC':
        return 2;
      default:
        return -1;
    }
  }

  void clearAllState() {
    emit(state.copyWith(
      isPrimaryCardApplied: false,
      isSuccess: true,
      isLoading: false,
      isShowConvertedValue: false,
      isError: false,
      statusMessage: '',
      loaderMessage: '',
      primaryCardData: null,
      entitlementAvailableValue: 0,
      entitlementConvertValue: 0,
      conversionValue: 0,
      afterConvertedValue: 0,
      notificationBarColor: KColor.white,
    ));
  }

  void removeCardsFromMultiCards(tagNumber) {
    try {
      _multiCardsData = state.multiCardsData;

      _multiCardsData.removeWhere((element) => element.tagNumber == tagNumber);

      emit(state.copyWith(
        isLoading: false,
        isSuccess: true,
        isError: false,
        multiCardsData: _multiCardsData,
        statusMessage: MessagesProvider.get('Card applied successfully'),
      ));
    } catch (err) {
      _onErrorState(err.toString());
    }
  }

  String dioErrors(DioError e) {
    switch (e.type) {
      case DioErrorType.cancel:
        return "Request cancelled";

      case DioErrorType.connectTimeout:
        return "Connection time out";

      case DioErrorType.receiveTimeout:
        return "Connection time out";

      case DioErrorType.response:
        return e.response?.data['data'] as String ?? '';

      case DioErrorType.sendTimeout:
        return "Connection time out";

      default:
        return "Please check your connection";
    }
  }
}
