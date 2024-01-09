import 'package:customer_data/builder.dart';
import 'package:customer_data/models/account_details/account_details_response.dart';
import 'package:dio/dio.dart';
import 'package:execution_context/builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_data/models/login_response.dart';
import 'package:logs_data/logger.dart';
import 'package:messages_data/builder.dart';
import 'package:other_function_data/builder.dart';
import 'package:other_function_data/model/balance_transfer/balance_transfer_response.dart';
import 'package:other_function_data/model/balance_transfer/transfer_balance_data.dart';

import '../../../model/multi_cards_model.dart';
import 'balance_transfer_state.dart';

class BalanceTransferCubit extends Cubit<BalanceTransferState>{
  BalanceTransferCubit(): super(BalanceTransferState()); // here inside Balance_transfer class,  some of the fields are already initialized


  AccountDetailsResponse? _accountsDetailsResponse;
  List<MultiCardsModel> _multiCardsData = [];
  List<TransferBalanceData> _transferBalanceDto = [];
  bool _isCardAlreadyApplied = false;


  void setInitialValues(){
  emit(state.copyWith(
    multiCardsData: [],
    isLoading:false,
    isError: false,
    isSuccess:false,
    loaderMessage: '',
      isPrimaryCardApplied:false,
  ));
}

  void resetValues(){
    emit(state.copyWith(
        isLoading:false,
        isError: false,
        isSuccess:false,
        loaderMessage: ''
    ));
  }

void _startLoading(String? loaderMessage){
  emit(state.copyWith(
    isLoading: true,
    isSuccess: false,
    isError: false,
    loaderMessage: loaderMessage
  ));
}

  void _onErrorState(String? statusMessage){
emit(state.copyWith(
    isLoading: false,
    isSuccess: false,
    isError: true,
    statusMessage:statusMessage ,
   ));
  }

  Future<void> addPrimaryCard({required AccountDetailsResponse accountData}) async{
    try{
      // _startLoading(MessagesProvider.get('Applying card'));
      // final execContextBL = await ExecutionContextBuilder.build();
      // final execContext = execContextBL.getExecutionContext();
      // final customerDataBl = await CustomerDataBuilder.build(execContext!);
      _accountsDetailsResponse = accountData;

      if(_accountsDetailsResponse?.data?[0].accountId != -1){
        emit(state.copyWith(
          isLoading: false,
          isSuccess: true,
          isError: false,
          isPrimaryCardApplied: true,
          primaryCardData: _accountsDetailsResponse,
          statusMessage: MessagesProvider.get('Card applied successfully'),

        ));
      }else{
        emit(state.copyWith(isPrimaryCardApplied:false));
      _onErrorState(MessagesProvider.get('Please Tap an Issued Card...'));
      }

    } on DioError catch (error) {
      _onErrorState( dioErrors(error));
    }
    catch(error){
      _onErrorState(error.toString());
    }
  }

Future<bool> applyBalanceTransfer({required List<MultiCardsModel> multiCardsData, String? remarks, LoginResponse? loginResponse})async{
  try{
    Log.printMethodStart('applyBalanceTransfer()','Other Functions->Tag Functions->Balance Transfer','Confirm');
    _startLoading(MessagesProvider.get('Transferring Balance...'));
    final execContextBL = await ExecutionContextBuilder.build();
    final execContext = execContextBL.getExecutionContext();
    final otherFunctionBL = await OtherFunctionDataBuilder.build(execContext!);
    _transferBalanceDto = [];
    for (var element in multiCardsData) {
      List<Map<String, dynamic>> entitlementControllers = [
        {"controller": element.bonusController, "type": EntitlementType.gamePlayBonus},
        {"controller": element.creditsController, "type": EntitlementType.cardBalance},
        {"controller": element.ticketsController, "type": EntitlementType.ticket},
        {"controller": element.timeController, "type": EntitlementType.time},
        {"controller": element.courtesyController, "type": EntitlementType.courtesy},
        {"controller": element.counterItemsController, "type": EntitlementType.counterItem},
        {"controller": element.playCreditsController, "type": EntitlementType.gamePlayCredit},
      ];

      for (var entitlementControllerEntry in entitlementControllers) {
        TextEditingController? controller = entitlementControllerEntry["controller"];
        EntitlementType type = entitlementControllerEntry["type"];

        final text = controller?.text ?? "";
        if (text.isNotEmpty && double.tryParse(text) != 0.00) {
          _transferBalanceDto.add(
            TransferBalanceData(
              sourceAccountId: state.primaryCardData?.data?[0].accountId ?? -1,
              destinationAccountId: element.cardId,
              valueLoaded: double.tryParse(text),
              activityDate: DateTime.now().toString(),
              sourceAccountNumber: state.primaryCardData?.data?[0].tagNumber,
              destinationAccountNumber: element.tagNumber,
              userId: execContext.userPKId,
              approvedBy: loginResponse?.data?.userId ?? execContext.userId,
              approvalDate: DateTime.now().toString(),
              pOSMachineId: execContext.machineId,
              entitlementType: entitlementMap[type],
              remarks: remarks,
            ),
          );
        }
      }
    }
    bool response = await otherFunctionBL.transferBalance( transferBalanceData:_transferBalanceDto);
    Log.printMethodEnd('applyBalanceTransfer()','Other Functions->Tag Functions->Balance Transfer','Confirm');
    Log.printMethodReturn('applyBalanceTransfer()-Balance Transferred Successfully','Other Functions->Tag Functions->Balance Transfer','Confirm');
    emit(state.copyWith(
      isLoading: false,
      isSuccess: true,
      isError: false,
      statusMessage: MessagesProvider.get('Balance Transferred Successfully'),
    ));

    return response;
  } on DioError catch (error) {
    _onErrorState( dioErrors(error));
    return false;
  }
  catch(error){
    _onErrorState(error.toString());
    return false;
  }
}


Future<void> addMultiCard({required String tagNumber, required AccountDetailsResponse accountData})async{
 try{
   // _startLoading(MessagesProvider.get('Applying card'));
   _multiCardsData = state.multiCardsData;
   _isCardAlreadyApplied = false;
   for (var element in _multiCardsData) {
     if(element.tagNumber !=null){
       if(element.tagNumber?.toUpperCase() == tagNumber.toUpperCase()){
         _isCardAlreadyApplied = true;
       }
     }

   }
   final primaryCardData = state.primaryCardData;
   if(primaryCardData?.data?[0].tagNumber.toUpperCase() == tagNumber.toUpperCase()){
     _isCardAlreadyApplied = true;
   }
   if(_isCardAlreadyApplied){
     _onErrorState(MessagesProvider.get('Card already added'));
   }else {
     // final execContextBL = await ExecutionContextBuilder.build();
     // final execContext = execContextBL.getExecutionContext();
     // final customerDataBl = await CustomerDataBuilder.build(execContext!);
     _accountsDetailsResponse = accountData;
     // _multiCardsData = state.multiCardsData;
     if (_accountsDetailsResponse?.data?[0].accountId != -1) {
       _multiCardsData.add(MultiCardsModel(
           accountDetailsResponse: _accountsDetailsResponse,
           tagNumber: _accountsDetailsResponse?.data?[0].tagNumber.toString() ??
               "",
           cardId: _accountsDetailsResponse?.data?[0].accountId ?? -1,
           creditsController: TextEditingController(),
           playCreditsController: TextEditingController(),
           bonusController: TextEditingController(),
           ticketsController: TextEditingController(),
           courtesyController: TextEditingController(),
           timeController: TextEditingController(),
           counterItemsController: TextEditingController()));
       emit(state.copyWith(
         isLoading: false,
         isSuccess: true,
         isError: false,
         multiCardsData: _multiCardsData,
         statusMessage: MessagesProvider.get('Card applied successfully'),

       ));
     }
     else{
       _onErrorState(MessagesProvider.get("Please Tap an Issued Card..."));
     }
   }

 } on DioError catch (error) {
  _onErrorState( dioErrors(error));
 }
 catch(error){
   _onErrorState(error.toString());
 }
}

void clearAllState(){
    emit(BalanceTransferState());
    setInitialValues();
}

void removeCardsFromMultiCards(tagNumber){
    try{
      _multiCardsData = state.multiCardsData;

      _multiCardsData.removeWhere((element) => element.tagNumber ==tagNumber);

      emit(state.copyWith(
        isLoading: false,
        isSuccess: true,
        isError: false,
        multiCardsData: _multiCardsData,
        statusMessage: MessagesProvider.get('Card applied successfully'),

      ));
    }catch(err){
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

enum EntitlementType{
  cardBalance,
  loyaltyPoint,
  ticket,
  gamePlayCredit,
  counterItem,
  gamePlayBonus,
  time,
  virtualPoint,
  courtesy,
}

const Map<EntitlementType,String> entitlementMap= {
  EntitlementType.cardBalance : "0" ,
  EntitlementType.loyaltyPoint : "1",
  EntitlementType.ticket : "2",
  EntitlementType.gamePlayCredit:"3",
  EntitlementType.counterItem:"4" ,
  EntitlementType.gamePlayBonus:"5" ,
  EntitlementType.time :"6",
  EntitlementType.virtualPoint: "7",
  EntitlementType.courtesy:"8" ,
};



