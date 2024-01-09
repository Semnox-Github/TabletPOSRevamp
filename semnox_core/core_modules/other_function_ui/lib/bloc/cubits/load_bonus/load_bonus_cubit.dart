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
import 'package:other_function_data/model/exchange_entitlement/exchange_entitlement_data.dart';
import 'package:other_function_data/model/load_bonus/load_bonus_data.dart';
import 'package:other_function_ui/widgets/colors.dart';
import 'load_bonus_state.dart';

class LoadBonusCubit extends Cubit<LoadBonusState> {
  LoadBonusCubit()
      : super(
      LoadBonusState()); // here inside Balance_transfer class,  some of the fields are already initialized

  AccountDetailsResponse? _accountsDetailsResponse;
  ExchangeEntitlementData? _exchangeEntitlementData;
  String? _isRemarksMandatory = "N";
  String? _loadBonusLimit =  '300';
  String? _isAllowManualEntryCard = "Y";

  void setInitialValues(String loadBonusType) async{
    final execContextBL = await ExecutionContextBuilder.build();
    final execContext = execContextBL.getExecutionContext();
    final masterDataBl =
        await MasterDataBuilder.build(execContext!);
    _isRemarksMandatory = await masterDataBl.getDefaultValuesByName(
        defaultValueName: "LOAD_BONUS_REMARKS_MANDATORY") ??
        'N';
    _loadBonusLimit =  await masterDataBl.getDefaultValuesByName(
       defaultValueName: "LOAD_BONUS_LIMIT") ??
       '300';
    _isAllowManualEntryCard = await masterDataBl.getDefaultValuesByName(defaultValueName: "ALLOW_MANUAL_CARD_IN_LOAD_BONUS");
    emit(state.copyWith(
        isLoading: false,
        isError: false,
        isSuccess: false,
        loaderMessage: '',
        bonusValue: 0.00,
        loadBonusLimit: double.parse(_loadBonusLimit??'300'),
        isRemarksMandatory: _isRemarksMandatory??"N",
        allowManualEntryCard: _isAllowManualEntryCard,
        isPrimaryCardApplied: false,
        loadBonusType: loadBonusType));
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

  void onUpdateValue(double? newValue){
    emit(state.copyWith(bonusValue: newValue, notificationBarColor: KColor.white, statusMessage: '', isSuccess: true, isError: false, isLoading: false));
  }

  Future<void> addPrimaryCard({required AccountDetailsResponse accountsData}) async {
    try {
      // _startLoading(StringsProvider.get('applying_card'));
      // final execContextBL = await ExecutionContextBuilder.build();
      // final execContext = execContextBL.getExecutionContext();
      // final customerDataBl = await CustomerDataBuilder.build(execContext!);
      _accountsDetailsResponse = accountsData;
      if (_accountsDetailsResponse?.data?[0].accountId != -1) {
          emit(state.copyWith(
              isLoading: false,
              isSuccess: true,
              isError: false,
              notificationBarColor: KColor.notificationBGLightBlueColor,
              isPrimaryCardApplied: true,
              primaryCardData: _accountsDetailsResponse,
              statusMessage:
              '${MessagesProvider.get('Cards Added Successfully')}',
          ));
      } else {
        emit(state.copyWith(isPrimaryCardApplied: false));
        _onErrorState(MessagesProvider.get("Please Tap Card"));
      }
    } on DioError catch (error) {
      _onErrorState(dioErrors(error));
    } catch (error) {
      _onErrorState(error.toString());
    }
  }

   int _getBonusType(bonusString){
    switch (bonusString){
      case "CB":
        return 1;
      case "LP":
        return 2;
      case "GC":
        return 3;
      case "GB":
        return 4;
      default:
        return 1;
    }
   }

  Future<bool> addLoadBonus({required String remarks,  int? approverId}) async {
    try {
      Log.printMethodStart('addLoadBonus()','Other Functions->Tag functions->Load Bonus','Confirm');
      _startLoading(MessagesProvider.get('Loading Bonus....'));
      final execContextBL = await ExecutionContextBuilder.build();
      final execContext = execContextBL.getExecutionContext();
      final otherFunctionBL =
      await OtherFunctionDataBuilder.build(execContext!);
      await otherFunctionBL.loadBonus(
          loadBonusData: LoadBonusData(
              accountId: state.primaryCardData?.data?.first.accountId??-1,
              bonusType: _getBonusType(state.loadBonusType),
              bonusValue:state.bonusValue,
              remarks: remarks,
              managerId: approverId??execContext.userPKId,
              gamePlayId: -1,
              trxId: -1
          ));
      Log.printMethodEnd('addLoadBonus()','Other Functions->Tag functions->Load Bonus','Confirm');
      Log.printMethodReturn('addLoadBonus()-Bonus loaded successfully','Other Functions->Tag functions->Load Bonus','Confirm');
      emit(state.copyWith(
        isLoading: false,
        isSuccess: true,
        isError: false,
        notificationBarColor: KColor.notificationBGLightBlueColor,
        statusMessage:
        '${MessagesProvider.get('Bonus loaded successfully')}',
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


  void onSelectBonusType(String newState){
    emit(state.copyWith(loadBonusType: newState));
  }

  void clearAllState() {
    emit(state.copyWith(
      isPrimaryCardApplied: false,
      isSuccess: true,
      isLoading: false,
      isError: false,
      loaderMessage: '',
      statusMessage: '',
      bonusValue: 0.00,
      primaryCardData: null,
      notificationBarColor: KColor.white,
    ));
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
