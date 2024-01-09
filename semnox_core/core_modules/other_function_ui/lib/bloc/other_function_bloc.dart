import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:customer_data/builder.dart';
import 'package:customer_data/models/account_details/account_details_response.dart';
import 'package:customer_data/models/customer_data.dart';
import 'package:customer_ui/utils/AppColors.dart';
import 'package:dio/dio.dart';
import 'package:execution_context/builder.dart';
import 'package:flutter/material.dart';
import 'package:logs_data/logger.dart';
import 'package:master_data/builder.dart';
import 'package:master_data/master_data_bl.dart';
import 'package:messages_data/builder.dart';
import 'package:other_function_data/builder.dart';
import 'package:other_function_data/model/account_relation_ships/link_cards_request_model.dart';
import 'package:other_function_data/model/card_details_response.dart/loyalty_attribute_container.dart';
import 'package:other_function_data/model/consolidate_cards/consolidate_card_request_model.dart';
import 'package:other_function_data/model/decativate_card/deactivate_request_model.dart';
import 'package:other_function_data/model/entitlement_model/entitlement_model.dart';
import 'package:other_function_data/model/exchangeCreditForToken/credit_for_token_request.dart';
import 'package:other_function_data/model/master_cards_model/free_play_request_model.dart';
import 'package:other_function_data/model/pause_time/request/pause_time_request.dart';
import 'package:other_function_data/model/redeemEntitlements/redeem_request.dart';
import 'package:other_function_data/model/redeemLotaltyPoints/redeem_loyalty_points_request_body.dart';
import 'package:other_function_data/model/redemptionRuleModel/redemption_rule_model.dart';
import 'package:other_function_data/model/refund_card/refund_card_request_model.dart';
import 'package:other_function_data/model/ticketModel/ticket_mode_request.dart';
import 'package:other_function_data/model/transfer_card/transfer_card_model.dart';
import 'package:other_function_data/other_functions_data_bl.dart';
import 'package:other_function_ui/widgets/colors.dart';

part 'other_function_event.dart';
part 'other_function_state.dart';

class OtherFunctionBloc extends Bloc<OtherFunctionEvent, OtherFunctionState> {
  late MasterDataBLContract masterDataBL;
  late OtherFunctionDataBLContract otherFunctionBL;
  late CreditForTokenRequest creditForTokenRequest;
  late LoyaltyPointsRequestModel loyaltyPointsRequestModel;
  late TransferCardRequestModel transferCardRequestModel;
  late EntitlementModel entitlementModel;
  late RedeemRequest redeemRequest;
  CustomerData? customerData;
  ValueNotifier<int> tokenCount = ValueNotifier(0);
  ValueNotifier<double> redeemPoints = ValueNotifier(0);
  ValueNotifier<double> redeemVirtualPoints = ValueNotifier(0);
  double virtualpointsMultiple = 0.0;
  ValueNotifier<double> redeemTickets = ValueNotifier(0);
  ValueNotifier<double?> redeemBonus = ValueNotifier(null);
  TextEditingController remarkController = TextEditingController();
  TextEditingController redeemTicketController = TextEditingController();
  TextEditingController customerSearchController = TextEditingController();
  TextEditingController cardController = TextEditingController();
  double display = 0.0;
  AccountDetailsResponse? accounts;
  List<int?>? relatedAccountId;
  List<int?>? accountIds;
  AccountDetailsResponse? transferFromCard;
  AccountDetailsResponse? customerDetails;
  AccountDetailsResponse? transfertoCard;
  RedemptionRuleModel? ruleModel;
  bool isApplied = false;
  bool showChildCards = false;
  String selectedCard = 'Bonus';
  String ticketMode = '';
  int pointsToRedeem = 0;
  int selectedRow = 1;
  int redemptionValue = 0;
  String entitlementStatus = '';
  int? entitlementStatusId;
  bool isLoading = false;
  int? index;
  bool isFromApplied = false;
  bool isToApplied = false;
  List<LoyaltyRedemptionRuleContainerDtoList>? virtualRule;
  List<LoyaltyRedemptionRuleContainerDtoList>? loyaltyRule;
  List<LoyaltyRedemptionRuleContainerDtoList>? loyaltyRuleList;
  List<AccountDetailsResponse>? linkedCardList;
  List<AccountDetailsResponse>? deactivatedCardList;
  LoyaltyAttributeContainer? attributes;
  String otherFunctionType = '';
  String? ticketsPerCredit;
  String? ticketsPerBonux;
  List<LinkCardsRequestModel>? linkedCardRequestList = [];
  String? splitType = '';
  int cFirst = 50;
  ValueNotifier tapStatus = ValueNotifier<String?>(null);
  List<int> selectedAccounts = [];
  bool isAdded = true;
  ValueNotifier<double> refundValue = ValueNotifier(0.0);
  ValueNotifier<double> taxAmt = ValueNotifier(0.0);
  ValueNotifier<bool> isMakeNew = ValueNotifier(true);
  double creditPlus = 0.0;
  double cardDeposit = 0.0;
  double refundApiValue = 0.0;
  bool isCreditPlusRefundAllowed = false;
  bool isDepositRefundAllowed = false;
  bool isRefundOngoing = false;
  String dateTimeFormat = '';

  OtherFunctionBloc() : super(OtherFunctionInitial()) {
    on<CreditForToken>(_creditForToken);
    on<CardDetailEvent>(cardDetails);
    on<ClearEvent>(clearBloc);
    on<TokenForCredit>(_tokenForCredit);
    on<RedeemTickets>(redeemEntitlement);
    on<RedeemBonusT>(redeemBonusTickets);
    on<UpdateDisplayValue>(updateDisplayVaue);
    on<RealEToken>(realetoken);
    on<RedeemPoints>(redeemLoyaltyPoints);
    on<CardEntitlement>(cardEntitlement);
    on<TransferFromCardDetails>(transferFromCardDetails);
    on<TransferToCardDetails>(transferToCardDetails);
    on<CardDetailsByAccNumber>(cardDetailsByAccNumber);
    on<CardTransfer>(cardTransfer);
    on<CardChangeEvent>(updateCard);
    on<GetLinkedCards>(getLinkedCards);
    on<LinkCardEvent>(linkCardEvent);
    on<RemoveLinkedCard>(removeLinkedCard);
    on<AddLinkCard>(addLinkCard);
    on<AddCardsToList>(addCardstoList);
    on<PostLinkCard>(postLinkCard);
    on<DeactivateCardEvent>(deactivateCard);
    on<MergeCardEvent>(mergeCards);
    on<MasterCardEvent>(masterCardEvent);
    on<RefundCardEvent>(refundCard);
    on<PauseTimeEvent>(pauseTime);
    on<RequestPauseTimeEvent>(requestPauseTime);
    on<MessageEvent>(addMessage);
    on<SetSelectedRow>(
        (event, emit) => emit(SelectedRowState(rowId: event.rowId)));

    on<TokenMode>(
        (event, emit) => emit(TokenSetMode(tokenMode: 'Real Ticket')));
    on<ETokenMode>((event, emit) => emit(TokenSetMode(tokenMode: 'E-Ticket')));
    on<SetBonusCard>(
      (event, emit) => emit(RedeemContainerState(
        setCard: 'Bonus',
      )),
    );
    on<BalanceCard>((event, emit) => emit(RedeemContainerState(
          setCard: 'Card Balance',
        )));
  }

  updateDisplayVaue(
      OtherFunctionEvent event, Emitter<OtherFunctionState> emit) {
    emit(UpdateDisplayState());
  }

  updateIndex(int? index) {
    this.index = index;
  }

  updateCustomerData(CustomerData? data) {
    customerData = data;
  }

  updateCard(CardChangeEvent event, Emitter<OtherFunctionState> emit) async {
    emit(BodyLoader());
    final execContextBL = await ExecutionContextBuilder.build();
    final execContext = execContextBL.getExecutionContext();
    otherFunctionBL = await OtherFunctionDataBuilder.build(execContext!);
    final customerDataBl = await CustomerDataBuilder.build(execContext);
    try {
      transferFromCard = await customerDataBl.getCardDetailsByAccountId(
          accountId: event.tagNumber?.toUpperCase());
      if (transferFromCard?.data?.first.accountId == -1) {
        cardController.clear();
        isFromApplied = false;
        emit(ErrorState('New Card', color: Colors.yellow));
      } else {
        isFromApplied = true;
        emit(CardDetailsState(
            transferFromCard ?? const AccountDetailsResponse()));
      }
    } on DioError catch (error) {
      dioErrors(error);
    }
    emit(CardDetailsState(
      transferFromCard ?? const AccountDetailsResponse(),
    ));
  }

  realetoken(OtherFunctionEvent event, Emitter<OtherFunctionState> emit) async {
    emit(BodyLoader());
    final execContextBL = await ExecutionContextBuilder.build();
    final execContext = execContextBL.getExecutionContext();

    otherFunctionBL = await OtherFunctionDataBuilder.build(execContext!);

    TicketModeRequestModel ticketModeRequestModel = TicketModeRequestModel(
      cardId: accounts?.data?.first.accountId,
      managerId: execContext.userPKId,
      ticketMode: ticketMode == 'Real Ticket' ? true : false,
    );
    Log.printMethodStart('realEtoken()','Other Function->Tag Function->Real e-Tickets','E-Ticket');
    try {
      final response =
          await otherFunctionBL.postTicketMode(ticketModeRequestModel);
      Log.printMethodEnd('realEtoken()','Other Function->Tag Function->Real e-Tickets','E-Ticket');
      Log.printMethodReturn('realEtoken()-Ticket mode changed successfully','Other Function->Tag Function->Real e-Tickets','E-Ticket');
      emit(SuccessState(
          message: MessagesProvider.get('Ticket mode changed successfully')));
    } on DioError catch (e) {
      dioErrors(e);
      emit(ApiErrorState(e.toString()));
    } catch (e) {
      emit(ApiErrorState(e.toString()));
    }
  }

  void requestPauseTime(
      RequestPauseTimeEvent event, Emitter<OtherFunctionState> emit) async {
    emit(BodyLoader());
    final execContextBL = await ExecutionContextBuilder.build();
    final execContext = execContextBL.getExecutionContext();

    otherFunctionBL = await OtherFunctionDataBuilder.build(execContext!);

    final pauseTimeRequest = PauseTimeRequest(
      cardId: accounts?.data?.first.accountId,
      managerId: execContext.userPKId,
      remarks: event.remarks,
      timeStatus: 0,
    );
    Log.printMethodStart('requestPauseTime()','Pause Time','Confirm');
    try {
      final response =
          await otherFunctionBL.pauseTime(pauseTimeRequest: pauseTimeRequest);
      Log.printMethodEnd('requestPauseTime()','Pause Time','Confirm');
      Log.printMethodReturn('requestPauseTime()-Paused Time','Pause Time','Confirm');
      emit(SuccessState(message: MessagesProvider.get('Paused Time')));
    } on DioError catch (e) {
      final errorString = e.response?.data['data'] as String?;
      emit(ApiErrorState(errorString ?? ''));
    } catch (e) {
      emit(ApiErrorState(e.toString()));
    }
  }

  getLinkedCards(GetLinkedCards event, Emitter<OtherFunctionState> emit) async {
    final execContextBL = await ExecutionContextBuilder.build();
    final execContext = execContextBL.getExecutionContext();
    final customerDataBl = await CustomerDataBuilder.build(execContext!);
    int pCount = 0;
    String tagNumber = '';
    List<AccountDetailsResponse>? linkedCardDetailsList = [];

    try {
      relatedAccountId = accounts?.data?.first.accountRelationshipDTOList
          ?.map((e) => e.relatedAccountId)
          .toList();
      accountIds = accounts?.data?.first.accountRelationshipDTOList
          ?.map((e) => e.accountId)
          .toList();
      accountIds?.forEach((element) {
        if (element == accounts?.data?.first.accountId) {
          pCount = pCount + 1;
        }
      });
      if ((pCount ==
              accounts?.data?.first.accountRelationshipDTOList?.length) ||
          accounts?.data?.first.accountRelationshipDTOList == null) {
        for (int i = 0; i < (relatedAccountId?.length ?? 0); i++) {
          var response = await customerDataBl.getCardDetailsByAccountNumber(
              accountId: relatedAccountId?[i].toString());
          linkedCardDetailsList.add(response);
        }

        linkedCardList = linkedCardDetailsList;
        showChildCards = true;

        if (accounts?.data?.first.accountRelationshipDTOList == null) {
          linkedCardList?.forEach((element) {
            linkedCardRequestList?.add(LinkCardsRequestModel(
              cardNumber: accounts?.data?.first.tagNumber,
              accountRelationShipDto: AccountRelationShipDto(
                accountRelationshipId: -1,
                accountId: accounts?.data?.first.accountId,
                relatedAccountId: element.data?.first.accountId,
                guid: element.data?.first.guid,
                dailyLimitPercentage: 100 ~/ linkedCardList!.length,
                siteId: execContext.siteId,
                isChanged: true,
                isActive: true,
              ),
            ));
          });
        } else {
          for (int i = 0; i < linkedCardList!.length; i++) {
            linkedCardRequestList?.add(LinkCardsRequestModel(
              accountRelationShipDto: AccountRelationShipDto(
                accountRelationshipId: accounts?.data?.first
                    .accountRelationshipDTOList?[i].accountRelationId,
                accountId: accounts?.data?.first.accountId,
                relatedAccountId: linkedCardList?[i].data?.first.accountId,
                guid: linkedCardList?[i].data?.first.guid,
                dailyLimitPercentage: accounts?.data?.first
                    .accountRelationshipDTOList?[i].dailyLimitPercentage,
                siteId: execContext.siteId,
                isChanged: true,
                isActive: true,
              ),
            ));
          }
        }

        emit(LinkedCardState(linkedCardList));
      } else {
        var response = await customerDataBl.getCardDetailsByAccountNumber(
          accountId: accounts
                  ?.data?.first.accountRelationshipDTOList?.first.accountId
                  .toString() ??
              '',
        );
        tagNumber = response.data?.first.tagNumber ?? '';
        isApplied = false;
        emit(ErrorState(
            MessagesProvider.get(
                'Tapped card is already a child card of $tagNumber'),
            color: Colors.yellow));
      }
    } on DioError catch (error) {
      dioErrors(error);
      emit(ApiErrorState(error.toString()));
    }
  }

  linkCardEvent(LinkCardEvent event, Emitter<OtherFunctionState> emit) async {
    final execContextBL = await ExecutionContextBuilder.build();
    final execContext = execContextBL.getExecutionContext();
    final customerDataBl = await CustomerDataBuilder.build(execContext!);
    otherFunctionBL = await OtherFunctionDataBuilder.build(execContext);
    try {
      List<AccountDetailsResponse>? linkedCardDetailsList = [];

      for (int i = 0; i < (relatedAccountId?.length ?? 0); i++) {
        var response = await customerDataBl.getCardDetailsByAccountNumber(
            accountId: relatedAccountId?[i].toString());
        linkedCardDetailsList.add(response);
      }
      linkedCardList = linkedCardDetailsList;

      emit(LinkedCardState(linkedCardList, isDelete: false));
    } on DioError catch (error) {
      dioErrors(error);
      emit(ApiErrorState(error.toString()));
    }
  }

  removeLinkedCard(RemoveLinkedCard event, Emitter<OtherFunctionState> emit) {
    int listLength = 0;
    linkedCardRequestList?.forEach((element) {
      if (element.accountRelationShipDto?.relatedAccountId == event.accountId) {
        element.accountRelationShipDto?.isActive = false;
      }
    });
    linkedCardList?.removeWhere(
        (element) => element.data?.first.accountId == event.accountId);
    for (int i = 0; i < linkedCardRequestList!.length; i++) {
      if (linkedCardRequestList?[i].accountRelationShipDto?.isActive ?? false) {
        listLength = listLength + 1;
      }
    }

    if (linkedCardList?.isNotEmpty ?? false) {
      for (int i = 0; i < linkedCardRequestList!.length; i++) {
        if (splitType == 'equal' || splitType == "") {
          linkedCardRequestList?[i]
              .accountRelationShipDto
              ?.dailyLimitPercentage = 100 ~/ listLength;
        } else if (splitType == 'first') {
          if (i == 0) {
            linkedCardRequestList?[i]
                .accountRelationShipDto
                ?.dailyLimitPercentage = 50;
          } else {
            linkedCardRequestList?[i]
                .accountRelationShipDto
                ?.dailyLimitPercentage = (50 ~/ (listLength - 1));
          }
        } else if (splitType == 'cFirst') {
          if (i == 0) {
            linkedCardRequestList?[i]
                .accountRelationShipDto
                ?.dailyLimitPercentage = cFirst;
          } else {
            linkedCardRequestList?[i]
                .accountRelationShipDto
                ?.dailyLimitPercentage = ((100 - cFirst) ~/ (listLength - 1));
          }
        }
      }
    }

    emit(LinkedCardState(linkedCardList, isDelete: true));
  }

  addLinkCard(AddLinkCard event, Emitter<OtherFunctionState> emit) async {
    final validCharacters = RegExp(r'^[a-zA-Z0-9_\-=@,\.;]+$');
    if (cardController.text.length != 8 ||
        !(validCharacters.hasMatch(cardController.text))) {
      emit(ErrorState(
          MessagesProvider.get('Invalid Card Number length (&1). Should be &2',
              ['${cardController.text.length}', '8']),
          color: AppColors.notificationBGRedColor));
    } else {
      emit(LoadingState());
      final execContextBL = await ExecutionContextBuilder.build();
      final execContext = execContextBL.getExecutionContext();
      otherFunctionBL = await OtherFunctionDataBuilder.build(execContext!);
      final customerDataBl = await CustomerDataBuilder.build(execContext);
      var masterDataBL = await MasterDataBuilder.build(execContext);
      dateTimeFormat = await masterDataBL.getDefaultValuesByName(
              defaultValueName: "DATETIME_FORMAT") ??
          '';

      try {
        if (linkedCardList!.any(
            (element) => element.data?.first.tagNumber == event.accNumber)) {
          emit(ErrorState(MessagesProvider.get('Child card already entered')));
        } else {
          var cardResponse = await customerDataBl.getCardDetailsByAccountId(
              accountId: event.accNumber);

          List<int?>? relatedAccountId = [];
          List<int?>? accountIds = [];
          int pCount = 0;
          String tagNumber = '';
          List<AccountDetailsResponse>? linkedCardDetailsList = [];
          int listLength = 0;

          relatedAccountId = cardResponse.data?.first.accountRelationshipDTOList
              ?.map((e) => e.relatedAccountId)
              .toList();
          accountIds = cardResponse.data?.first.accountRelationshipDTOList
              ?.map((e) => e.accountId)
              .toList();
          accountIds?.forEach((element) {
            if (element == cardResponse.data?.first.accountId) {
              pCount = pCount + 1;
            }
          });
          if (cardResponse.data?.first.accountId == -1) {
            emit(ErrorState(
                MessagesProvider.get('Please tap an issued Child Card'),
                color: AppColors.notoficationBGLightYellowColor));
          } else if (cardResponse.data?.first.technicianCard == 'Y') {
            emit(ErrorState(
                MessagesProvider.get(
                    'Technician card(${event.accNumber}) not allowed for transaction'),
                color: AppColors.notoficationBGLightYellowColor));
            cardController.clear();
          } else {
            if (pCount ==
                cardResponse.data?.first.accountRelationshipDTOList?.length) {
              emit(LinkedCardState(linkedCardList,
                  isError: true, isDelete: false, message: 'Parent Card'));
            } else if (cardResponse.data?.first.accountRelationshipDTOList ==
                null) {
              linkedCardList?.add(cardResponse);

              if (accounts?.data?.first.accountRelationshipDTOList == null) {
                linkedCardRequestList?.add(
                  LinkCardsRequestModel(
                      cardNumber: accounts?.data?.first.accountId.toString(),
                      accountRelationShipDto: AccountRelationShipDto(
                        accountRelationshipId: -1,
                        isActive: true,
                        accountId: accounts?.data?.first.accountId,
                        relatedAccountId: cardResponse.data?.first.accountId,
                        guid: cardResponse.data?.first.guid,
                        dailyLimitPercentage: 100 ~/ linkedCardList!.length,
                        siteId: execContext.siteId,
                        isChanged: true,
                      )),
                );
              } else {
                linkedCardRequestList?.add(
                  LinkCardsRequestModel(
                      cardNumber: accounts?.data?.first.accountId.toString(),
                      accountRelationShipDto: AccountRelationShipDto(
                        accountRelationshipId: -1,
                        isActive: true,
                        accountId: accounts?.data?.first.accountId,
                        relatedAccountId: cardResponse.data?.first.accountId,
                        guid: cardResponse.data?.first.guid,
                        dailyLimitPercentage: 100 ~/ linkedCardList!.length,
                        siteId: execContext.siteId,
                        isChanged: true,
                      )),
                );
              }

              for (int i = 0; i < linkedCardRequestList!.length; i++) {
                if (linkedCardRequestList?[i]
                        .accountRelationShipDto
                        ?.isActive ??
                    false) {
                  listLength = listLength + 1;
                }
              }

              for (int i = 0; i < linkedCardRequestList!.length; i++) {
                if (splitType == 'equal' || splitType == "") {
                  linkedCardRequestList?[i]
                      .accountRelationShipDto
                      ?.dailyLimitPercentage = 100 ~/ listLength;
                } else if (splitType == 'first') {
                  if (i == 0) {
                    linkedCardRequestList?[i]
                        .accountRelationShipDto
                        ?.dailyLimitPercentage = 50;
                  } else {
                    linkedCardRequestList?[i]
                        .accountRelationShipDto
                        ?.dailyLimitPercentage = (50 ~/ (listLength - 1));
                  }
                } else if (splitType == 'cFirst') {
                  if (i == 0) {
                    linkedCardRequestList?[i]
                        .accountRelationShipDto
                        ?.dailyLimitPercentage = cFirst;
                  } else {
                    linkedCardRequestList?[i]
                            .accountRelationShipDto
                            ?.dailyLimitPercentage =
                        ((100 - cFirst) ~/ (listLength - 1));
                  }
                }
              }

              emit(LinkedCardState(linkedCardList, isDelete: false));
            } else {
              var response = await customerDataBl.getCardDetailsByAccountNumber(
                accountId: cardResponse
                        .data?.first.accountRelationshipDTOList?.first.accountId
                        .toString() ??
                    '',
              );
              tagNumber = response.data?.first.tagNumber ?? '';
              emit(LinkedCardState(linkedCardList,
                  isDelete: false,
                  isError: true,
                  message:
                      'Tapped card is already a child card of $tagNumber'));
            }
          }
        }
      } on DioError catch (e) {
        dioErrors(e);
        emit(ApiErrorState(e.toString()));
      } catch (e) {
        emit(ApiErrorState(e.toString()));
      }
    }
  }

  postLinkCard(PostLinkCard event, Emitter<OtherFunctionState> emit) async {
    Log.printMethodStart('PostLinkCard()','Other Function->Tag Function->Link Cards','Confirm');
    emit(BodyLoader());
    final execContextBL = await ExecutionContextBuilder.build();
    final execContext = execContextBL.getExecutionContext();
    otherFunctionBL = await OtherFunctionDataBuilder.build(execContext!);
    int listLength = 0;

    for (int i = 0; i < linkedCardRequestList!.length; i++) {
      if (linkedCardRequestList?[i].accountRelationShipDto?.isActive ?? false) {
        listLength = listLength + 1;
      }
    }

    for (int i = 0; i < linkedCardRequestList!.length; i++) {
      if (splitType == 'equal') {
        linkedCardRequestList?[i].accountRelationShipDto?.dailyLimitPercentage =
            100 ~/ linkedCardRequestList!.length;
      } else if (splitType == 'first') {
        if (i == 0) {
          linkedCardRequestList?[i]
              .accountRelationShipDto
              ?.dailyLimitPercentage = 50;
        } else {
          linkedCardRequestList?[i]
              .accountRelationShipDto
              ?.dailyLimitPercentage = (50 ~/ (listLength - 1));
        }
      } else if (splitType == 'cFirst') {
        if (i == 0) {
          linkedCardRequestList?[i]
              .accountRelationShipDto
              ?.dailyLimitPercentage = cFirst;
        } else {
          linkedCardRequestList?[i]
              .accountRelationShipDto
              ?.dailyLimitPercentage = ((100 - cFirst) ~/ (listLength - 1));
        }
      }
    }

    try {
      var response = await otherFunctionBL.postAccountRelations(
          linkedCardRequestList ?? <LinkCardsRequestModel>[]);
      Log.printMethodEnd('PostLinkCard()','Other Function->Tag Function->Link Cards','Confirm');
      Log.printMethodReturn('PostLinkCard()-Success','Other Function->Tag Function->Link Cards','Confirm');
      emit(SuccessState());
    } on DioError catch (e) {
      dioErrors(e);
      emit(ApiErrorState(e.toString()));
    } catch (e) {
      emit(ApiErrorState(e.toString()));
    }
  }

  addCardstoList(AddCardsToList event, Emitter<OtherFunctionState> emit) async {
    final validCharacters = RegExp(r'^[a-zA-Z0-9_\-=@,\.;]+$');
    if (cardController.text.length != 8 ||
        !(validCharacters.hasMatch(cardController.text))) {
      tapStatus.value = MessagesProvider.get(
          'Invalid Card Number length (&1). Should be &2',
          ['${cardController.text.length}', '8']);
      emit(ErrorState(
          MessagesProvider.get('Invalid Card Number length (&1). Should be &2',
              ['${cardController.text.length}', '8']),
          color: AppColors.notificationBGRedColor));

      cardController.clear();
    } else {
      emit(LoadingState());
      final execContextBL = await ExecutionContextBuilder.build();
      final execContext = execContextBL.getExecutionContext();
      otherFunctionBL = await OtherFunctionDataBuilder.build(execContext!);
      final customerDataBl = await CustomerDataBuilder.build(execContext);
      var masterDataBL = await MasterDataBuilder.build(execContext);
      dateTimeFormat = await masterDataBL.getDefaultValuesByName(
              defaultValueName: "DATETIME_FORMAT") ??
          '';
      List<AccountDetailsResponse>? cardData = [];

      try {
        if ((deactivatedCardList?.isNotEmpty ?? false) &&
            (deactivatedCardList!.any((element) =>
                element.data?.first.tagNumber.toLowerCase() ==
                event.accNumber.toLowerCase()))) {
          emit(ErrorState(MessagesProvider.get('Card already added'),
              color: KColor.notoficationBGLightYellowColor));
        } else {
          tapStatus.value =
              MessagesProvider.get('Card identified. Authenticating...');
          var cardResponse = await customerDataBl.getCardDetailsByAccountId(
              accountId: event.accNumber);

          if (deactivatedCardList?.isNotEmpty ?? false) {
            cardData = deactivatedCardList;
          }

          if (cardResponse.data?.first.accountId == -1) {
            emit(ErrorState(
                MessagesProvider.get('Please tap an issued Child Card'),
                color: AppColors.notoficationBGLightYellowColor));
          } else if (cardResponse.data?.first.technicianCard == 'Y') {
            emit(ErrorState(
                MessagesProvider.get(
                    'Technician card(${event.accNumber}) not allowed for transaction'),
                color: AppColors.notoficationBGLightYellowColor));
            cardController.clear();
          } else {
            cardData?.add(cardResponse);
            deactivatedCardList = cardData;
            cardResponse.data?.forEach((element) {
              if(isCreditPlusRefundAllowed) {
                creditPlus = creditPlus +
                    (element.accountSummaryDTO
                        ?.creditPlusRefundableBalance ??
                        0.0);
              }
              if(isDepositRefundAllowed) {
                cardDeposit =
                    cardDeposit + (element.faceValue ?? 0.0);
              }
            });
            isRefundOngoing = false;
            refundValue.value = cardDeposit + creditPlus;
            refundApiValue = creditPlus;
            showChildCards = true;
            isAdded = true;
            cardController.clear();
            emit(DeactivateCardListState(deactivatedCardList));
          }
        }
      } on DioError catch (e) {
        dioErrors(e);
        emit(ApiErrorState(e.toString()));
      } catch (e) {
        emit(ApiErrorState(e.toString()));
      }
    }
  }

  void removeRefundValue(AccountDetailsResponse item) {
    if(isDepositRefundAllowed) {
      cardDeposit -= (item.data?.first.faceValue ?? 0);
    }
    if(isCreditPlusRefundAllowed) {
      creditPlus -= (item.data?.first.accountSummaryDTO?.creditPlusRefundableBalance ?? 0.0);
    }
    refundApiValue = creditPlus;
    refundValue.value = cardDeposit + creditPlus;
  }

  cardDetails(CardDetailEvent event, Emitter<OtherFunctionState> emit) async {
    final validCharacters = RegExp(r'^[a-zA-Z0-9_\-=@,\.;]+$');
    if (cardController.text.length != 8 ||
        !(validCharacters.hasMatch(cardController.text))) {
      tapStatus.value = MessagesProvider.get(
          'Invalid Card Number length (&1). Should be &2',
          ['${cardController.text.length}', '8']);
      emit(ErrorState(
          MessagesProvider.get('Invalid Card Number length (&1). Should be &2',
              ['${cardController.text.length}', '8']),
          color: AppColors.notificationBGRedColor));
      cardController.clear();
    } else {
      emit(LoadingState());
      final execContextBL = await ExecutionContextBuilder.build();
      final execContext = execContextBL.getExecutionContext();
      otherFunctionBL = await OtherFunctionDataBuilder.build(execContext!);
      final customerDataBl = await CustomerDataBuilder.build(execContext);
      var masterDataBL = await MasterDataBuilder.build(execContext);
      ticketsPerCredit = await masterDataBL.getDefaultValuesByName(
          defaultValueName: "TICKETS_TO_REDEEM_PER_CREDIT");
      ticketsPerBonux = await masterDataBL.getDefaultValuesByName(
          defaultValueName: "TICKETS_TO_REDEEM_PER_BONUS");
      dateTimeFormat = await masterDataBL.getDefaultValuesByName(
              defaultValueName: "DATETIME_FORMAT") ??
          '';
      dateTimeFormat = (dateTimeFormat.contains("tt"))
          ? dateTimeFormat.replaceAll("tt", "a")
          : dateTimeFormat;
      try {
        tapStatus.value =
            MessagesProvider.get('Card identified. Authenticating...');
        accounts = await customerDataBl.getCardDetails(
            accountNo: event.cardNo.toUpperCase());

        if (otherFunctionType == 'virtual points' ||
            otherFunctionType == 'loyalty points') {
          redeemPoints.value = accounts
                  ?.data?.first.accountSummaryDTO?.totalLoyaltyPointBalance ??
              0.0;
          redeemVirtualPoints.value =
              accounts?.data?.first.totalVirtualPointBalance ?? 0.0;
          ruleModel = await otherFunctionBL.getRedeemRule();
          attributes = await otherFunctionBL.getAttributes();
          for (var e
              in (ruleModel?.data.loyaltyRedemptionRuleContainerDtoList ??
                  [])) {
            for (var element
                in (attributes?.data?.loyaltyAttributeContainerDtoList ?? [])) {
              if (e.loyaltyAttributeId == element.loyaltyAttributeId) {
                e.attributeName = element.attribute;
              }
            }
          }

          ruleModel?.data.loyaltyRedemptionRuleContainerDtoList
              .removeWhere((element) => element.redemptionRuleId == 2);

          virtualRule = ruleModel?.data.loyaltyRedemptionRuleContainerDtoList
              .where((element) => element.virtualLoyaltyPoints != 0)
              .toList();

          if (otherFunctionType == 'virtual points') {
            selectedRow = virtualRule?.first.redemptionRuleId ?? 4;
          }

          loyaltyRule = ruleModel?.data.loyaltyRedemptionRuleContainerDtoList
              .where((element) => element.loyaltyPoints != 0)
              .toList();
        }

        redeemTickets.value = accounts?.data?.first.totalTicketsBalance ?? 0.0;
        redeemBonus.value =
            accounts?.data?.first.accountSummaryDTO?.totalBonusBalance ?? 0.0;
        if (accounts?.data == null) {
          cardController.clear();
          emit(ErrorState('Issued Card', color: Colors.red));
        }
        if(accounts?.data?.first.accountId==-1){
          cardController.clear();
          emit(ErrorState('Please Tap an Issued Card...', color: Colors.red));
        }

        // else if (accounts?.data?.first.technicianCard == 'Y') {
        //   emit(ApiErrorState(
        //       MessagesProvider.get(
        //           "Technician card(${cardController.text}) not allowed for transaction"),
        //       color: Colors.yellow));
        //   cardController.clear();
        // }
        else if (otherFunctionType == 'hold entitlements') {
          if (accounts?.data?.first.technicianCard == 'Y') {
            emit(
              ApiErrorState(
                "Technician card(${cardController.text}) not allowed for transaction",
                color: Colors.yellow,
              ),
            );
            cardController.clear();
          } else if (accounts?.data?.first.accountDiscountDTOList?.first
                  .obligationStatus ==
              null) {
            emit(CardDetailsState(accounts ?? const AccountDetailsResponse(),
                message: MessagesProvider.get(
                    'No entitlements availabale for the card'),
                color: Colors.yellow));
          } else {
            emit(CardDetailsState(accounts ?? const AccountDetailsResponse()));
          }
        } else {
          if (accounts?.data?.first.technicianCard == 'Y') {
            emit(
              CardDetailsState(accounts ?? const AccountDetailsResponse(),
                  color: Colors.yellow,
                  message:
                      "Technician card(${cardController.text}) not allowed for transaction"),
            );
          } else {
            emit(CardDetailsState(accounts ?? const AccountDetailsResponse()));
          }
          cardController.clear();
        }
      } on DioError catch (error) {
        dioErrors(error);
      } catch (error) {
        cardController.clear();
        emit(ApiErrorState(error.toString()));
      }
    }
  }

  transferFromCardDetails(
      TransferFromCardDetails event, Emitter<OtherFunctionState> emit) async {
    if (event.accId == 'no card linked') {
      transferFromCard = null;
      customerDetails = null;
      isFromApplied = false;
      emit(ErrorState(
          MessagesProvider.get(
              'Selected Customer is not linked to any card. Please add card and then proceed'),
          color: Colors.yellow));
    } else {
      emit(BodyLoader());
      final execContextBL = await ExecutionContextBuilder.build();
      final execContext = execContextBL.getExecutionContext();
      otherFunctionBL = await OtherFunctionDataBuilder.build(execContext!);
      final customerDataBl = await CustomerDataBuilder.build(execContext);
      try {
        transferFromCard = await customerDataBl.getCardDetailsByAccountId(
            accountId: event.tagNo);
        customerDetails = await customerDataBl.getCardDetailsByAccountId(
            customerId: event.accId);
        isFromApplied = true;

        emit(CardDetailsState(accounts ?? const AccountDetailsResponse(),
            index: index));
      } on DioError catch (error) {
        dioErrors(error);
        emit(ApiErrorState(error.message));
      } catch (error) {
        emit(ApiErrorState(error.toString()));
      }
    }
  }

  cardDetailsByAccNumber(
      CardDetailsByAccNumber event, Emitter<OtherFunctionState> emit) async {
    emit(LoadingState());
    final execContextBL = await ExecutionContextBuilder.build();
    final execContext = execContextBL.getExecutionContext();
    otherFunctionBL = await OtherFunctionDataBuilder.build(execContext!);
    final customerDataBl = await CustomerDataBuilder.build(execContext);
    final validCharacters = RegExp(r'^[a-zA-Z0-9_\-=@,\.;]+$');
    try {
      if (cardController.text.length != 8 ||
          !(validCharacters.hasMatch(cardController.text))) {
        emit(
            ErrorState("Card Length", color: AppColors.notificationBGRedColor));
      } else {
        tapStatus.value =
            MessagesProvider.get('Card identified. Authenticating...');
        transferFromCard = await customerDataBl.getCardDetailsByAccountId(
            accountId: event.cardNo.toUpperCase());
        if (transferFromCard?.data?.first.accountId == -1) {
          cardController.clear();
          isFromApplied = false;
          transferFromCard = null;
          emit(ErrorState('New Card', color: Colors.yellow));
        } else if (transferFromCard?.data?.first.technicianCard == 'Y') {
          emit(
            ErrorState(
                color: Colors.yellow,
                "Technician card(${cardController.text}) not allowed for transaction"),
          );
        } else {
          isFromApplied = true;
          emit(CardDetailsState(
              transferFromCard ?? const AccountDetailsResponse()));
        }
      }
    } on DioError catch (error) {
      dioErrors(error);
    } catch (error) {
      cardController.clear();
      emit(ApiErrorState(error.toString()));
    }
  }

  transferToCardDetails(
      TransferToCardDetails event, Emitter<OtherFunctionState> emit) async {
    emit(LoadingState());
    final execContextBL = await ExecutionContextBuilder.build();
    final execContext = execContextBL.getExecutionContext();
    otherFunctionBL = await OtherFunctionDataBuilder.build(execContext!);
    final customerDataBl = await CustomerDataBuilder.build(execContext);
    final validCharacters = RegExp(r'^[a-zA-Z0-9_\-=@,\.;]+$');
    try {
      if (cardController.text.length != 8 ||
          !(validCharacters.hasMatch(cardController.text))) {
        emit(
            ErrorState("Card Length", color: AppColors.notificationBGRedColor));
      } else {
        transfertoCard = await customerDataBl.getCardDetailsByAccountId(
            accountId: event.cardNo.toUpperCase());
        if (transfertoCard?.data?.first.accountId != -1) {
          transfertoCard = null;
          cardController.clear();
          isToApplied = false;
          emit(ErrorState(
              MessagesProvider.get('Please tap a NEW card to transfer'),
              color: Colors.yellow));
        } else {
          isToApplied = true;
          emit(CardDetailsState(
              transfertoCard ?? const AccountDetailsResponse()));
        }
      }
    } on DioError catch (error) {
      dioErrors(error);
    }
  }

  _creditForToken(
      OtherFunctionEvent event, Emitter<OtherFunctionState> emit) async {
    emit(BodyLoader());
    final execContextBL = await ExecutionContextBuilder.build();
    final execContext = execContextBL.getExecutionContext();
    otherFunctionBL = await OtherFunctionDataBuilder.build(execContext!);
    creditForTokenRequest = CreditForTokenRequest(
      tokenValue: tokenCount.value.toDouble(),
      managerId: -1,
      fromType: 2,
      toType: 1,
      remarks: remarkController.text,
      cardId: accounts?.data?.first.accountId,
    );
    Log.printMethodStart('creditForToken()','Other Function->Tag Function->Exchange Credits For Token','Confirm');
    try {
      if (!isApplied) {
        emit(ErrorState(MessagesProvider.get('Please Tap a card'),
            color: Colors.yellow));
      } else if (tokenCount.value == 0) {
        emit(ErrorState(MessagesProvider.get('Enter integer value for Token'),
            color: Colors.red));
      } else if (accounts!.data!.first.totalCreditsBalance! <
          tokenCount.value) {
        emit(ErrorState(MessagesProvider.get('Insufficient Credits'),
            color: Colors.red));
      } else {
        final response =
            await otherFunctionBL.creditForTokenPost(creditForTokenRequest);
        Log.printMethodEnd('creditForToken()','Other Function->Tag Function->Exchange Credits For Token','Confirm');
        Log.printMethodReturn('creditForToken()-Credits exchanged successfully','Other Function->Tag Function->Exchange Credits For Token','Confirm');
        emit(SuccessState(
            message: MessagesProvider.get('Credits exchanged successfully')));
      }
    } on DioError catch (error) {
      var errorString = dioErrors(error);
      emit(ApiErrorState(errorString));
    } catch (e) {
      emit(ApiErrorState(e.toString()));
    }
  }

  _tokenForCredit(
      OtherFunctionEvent event, Emitter<OtherFunctionState> emit) async {
    emit(BodyLoader());
    final execContextBL = await ExecutionContextBuilder.build();
    final execContext = execContextBL.getExecutionContext();
    otherFunctionBL = await OtherFunctionDataBuilder.build(execContext!);
    creditForTokenRequest = CreditForTokenRequest(
      tokenValue: tokenCount.value.toDouble(),
      managerId: -1,
      fromType: 1,
      toType: 2,
      remarks: remarkController.text,
      cardId: accounts?.data?.first.accountId,
    );
    Log.printMethodStart('tokenForCredit()','Other Function->Tag Function->Exchange Token For Credit','Confirm');
    try {
      if (!isApplied) {
        emit(ErrorState(MessagesProvider.get('Please Tap card'),
            color: Colors.yellow));
      } else if (tokenCount.value == 0) {
        emit(ErrorState(
            MessagesProvider.get(
                'Please enter an Integer value (>0) for Tokens'),
            color: KColor.notificationBGRedColor));
      } else if (accounts?.data?.first.obligationStatus == "HELD") {
        emit(ErrorState(
            MessagesProvider.get(
                "AC_00014 - Account ${accounts?.data?.first.tagNumber} is HELD. Operation cannot be performed ",
                [accounts?.data?.first.tagNumber]),
            color: KColor.notificationBGRedColor));
      } else {
        final response =
            await otherFunctionBL.creditForTokenPost(creditForTokenRequest);
        Log.printMethodEnd('tokenForCredit()','Other Function->Tag Function->Exchange Token For Credit','Confirm');
        Log.printMethodReturn('tokenForCredit()-Tokens exchanged successfully','Other Function->Tag Function->Exchange Token For Credit','Confirm');
        emit(SuccessState(
            message: MessagesProvider.get('Tokens exchanged successfully')));
      }
    } on DioError catch (error) {
      dioErrors(error);
      emit(ApiErrorState('${error.response?.data['data']}'));
    } catch (error) {
      emit(ApiErrorState(error.toString()));
    }
  }

  redeemEntitlement(
      RedeemTickets event, Emitter<OtherFunctionState> emit) async {
    emit(BodyLoader());
    final execContextBL = await ExecutionContextBuilder.build();
    final execContext = execContextBL.getExecutionContext();
    otherFunctionBL = await OtherFunctionDataBuilder.build(execContext!);
    redeemRequest = RedeemRequest(
      fromValue: redeemTickets.value.toInt(),
      managerId: event.managerId ?? execContext.userPKId,
      fromType: 1,
      toType: selectedCard == 'Bonus' ? 3 : 2,
      remarks: remarkController.text,
      cardId: accounts?.data?.first.accountId,
    );
    Log.printMethodStart('redeemEntitlement()','Other functions->Tag Functions->Redeem Tickets for bonus','Confirm');
    try {
      if (accounts == null) {
        emit(ErrorState(MessagesProvider.get('Please tap a card'),
            color: Colors.yellow));
      } else if (redeemTickets.value / (selectedCard == 'Bonus' ? 100 : 10) <
          1) {
        emit(ErrorState(MessagesProvider.get(
            '${selectedCard == 'Bonus' ? 'Bonus' : 'Credits'} Eligible is less than ${selectedCard == 'Bonus' ? '1' : '0'}')));
      } else {
        final response = await otherFunctionBL.redeemEntitlement(redeemRequest);
        Log.printMethodEnd('redeemEntitlement()','Other functions->Tag Functions->Redeem Tickets for bonus','Confirm');
        Log.printMethodReturn('redeemEntitlement()-Tickets redeemed successfully','Other functions->Tag Functions->Redeem Tickets for bonus','Confirm');
        emit(
          SuccessState(
            message: MessagesProvider.get(
              "Tickets redeemed for ${selectedCard == 'Bonus' ? 'Bonus' : 'Credits'} successfully",
              [],
            ),
          ),
        );
      }
    } on DioError catch (e) {
      var errorString = dioErrors(e);
      emit(ApiErrorState(errorString));
    }
  }

  redeemLoyaltyPoints(
      RedeemPoints event, Emitter<OtherFunctionState> emit) async {
    emit(BodyLoader());
    redemptionValue = 0;
    print(otherFunctionType);
    Log.printMethodStart('redeemLoyaltyPoints()','Other Function->Tag Function->$otherFunctionType','Confirm');
    if (accounts == null) {
      emit(ErrorState(MessagesProvider.get('Please tap a card'),
          color: Colors.yellow));
    } else if (redeemVirtualPoints.value >
        (accounts?.data?.first.totalVirtualPointBalance ?? 0.0)) {
      emit(ErrorState(
          MessagesProvider.get(
              'Redemption Points cannot be more than available points'),
          color: Colors.yellow));
    } else {
      LoyaltyRedemptionRuleContainerDtoList? selectedRule;
      final execContextBL = await ExecutionContextBuilder.build();
      final execContext = execContextBL.getExecutionContext();
      otherFunctionBL = await OtherFunctionDataBuilder.build(execContext!);
      if (otherFunctionType == 'loyalty points') {
        selectedRule = loyaltyRule?.firstWhere(
          (element) => element.redemptionRuleId == selectedRow,
        );
      } else {
        print(otherFunctionType);
        selectedRule = virtualRule?.firstWhere(
          (element) => element.redemptionRuleId == selectedRow,
        );
      }

      redemptionValue = selectedRule?.multiplesOnly == 'Y'
          ? (redeemVirtualPoints.value ~/ 100) * 100
          : ((otherFunctionType == 'loyalty points'
                      ? redeemPoints.value.toInt()
                      : redeemVirtualPoints.value.toInt()) *
                  selectedRule?.redemptionValue)
              .toInt();
      loyaltyPointsRequestModel = LoyaltyPointsRequestModel(
        ruleId: selectedRow,
        loyaltyRedeemPoints: redemptionValue,
        managerId: event.managerId ?? execContext.userPKId,
        remarks: remarkController.text,
        cardId: accounts?.data?.first.accountId,
        taskType: otherFunctionType == 'loyalty points'
            ? 'REDEEMLOYALTY'
            : 'REDEEMVIRTUALPOINTS',
      );
      try {
        if (!isApplied) {
          emit(ErrorState('Tap a card', color: Colors.yellow));
        } else if (otherFunctionType == 'loyalty points' &&
            ((accounts!.data!.first.accountSummaryDTO
                        ?.totalLoyaltyPointBalance ??
                    0) <
                redemptionValue)) {
          emit(ErrorState('Insufficient Loyalty points', color: Colors.red));
        } else {
          final response =
              await otherFunctionBL.postRedeemPoints(loyaltyPointsRequestModel);
          Log.printMethodReturn('redeemLoyaltyPoints()-$otherFunctionType Redeem Successful','Other Function->Tag Function->$otherFunctionType','Confirm');
          emit(SuccessState(
              message:
                  MessagesProvider.get('$otherFunctionType Redeem Successful'),
              color: KColor.notificationBGLightBlueColor));
        }
      } on DioError catch (error) {
        var errorString = dioErrors(error);
        emit(ApiErrorState(errorString));
      }
    }
    Log.printMethodEnd('redeemLoyaltyPoints()','Other Function->Tag Function->$otherFunctionType','Confirm');
  }

  cardTransfer(CardTransfer event, Emitter<OtherFunctionState> emit) async {
    emit(BodyLoader());

    final execContextBL = await ExecutionContextBuilder.build();
    final execContext = execContextBL.getExecutionContext();
    otherFunctionBL = await OtherFunctionDataBuilder.build(execContext!);
    Log.printMethodStart('cardTransfer()','Other Function->Tag Function->Transfer Card','Confirm');

    if (transferFromCard == null) {
      emit(ErrorState(
          MessagesProvider.get('Please enter a valid From Card Number')));
    } else if (transfertoCard == null) {
      emit(ErrorState(
          MessagesProvider.get('Please tap a NEW Card to transfer')));
    } else {
      transferCardRequestModel = TransferCardRequestModel(
          sourceAccountId: transferFromCard?.data?.first.accountId,
          activityType: 2,
          remarks: remarkController.text,
          activityDate: DateTime.now(),
          sourceAccountNumber: transferFromCard?.data?.first.tagNumber,
          destinationAccountNumber: transfertoCard?.data?.first.tagNumber,
          posMachineId: execContext.machineId,
          userId: execContext.userPKId);

      try {
        final response =
            await otherFunctionBL.postTransferCard(transferCardRequestModel);
        Log.printMethodEnd('cardTransfer()','Other Function->Tag Function->Transfer Card','Confirm');
        Log.printMethodReturn('cardTransfer()-Card Transferred successfully','Other Function->Tag Function->Transfer Card','Confirm');
        emit(SuccessState(
            message: MessagesProvider.get('Card Transferred successfully')));
      } on DioError catch (e) {
        var errorString = dioErrors(e);
        emit(ApiErrorState(errorString));
      }
    }
  }

  cardEntitlement(
      CardEntitlement event, Emitter<OtherFunctionState> emit) async {
    emit(BodyLoader());
    redemptionValue = 0;
    final execContextBL = await ExecutionContextBuilder.build();
    final execContext = execContextBL.getExecutionContext();
    otherFunctionBL = await OtherFunctionDataBuilder.build(execContext!);
    Log.printMethodStart('cardEntitlement()','Other Function->Tag Function->Hold Card Entitlements',entitlementStatus == "HoldCard" ? "hold" : 'unhold');
    if (accounts == null) {
      emit(ErrorState(MessagesProvider.get('Please tap card'),
          color: Colors.yellow));
    } else {
      entitlementStatus = accounts?.data?.first.accountCreditPlusDTOList?.first
                      .obligationStatus ==
                  "HELD" ||
              accounts?.data?.first.accountDiscountDTOList?.first
                      .obligationStatus ==
                  "HELD"
          ? "UnHoldCard"
          : "HoldCard";

      entitlementModel = EntitlementModel(
        sourceAccountId: accounts?.data?.first.accountId ?? 0,
        activityType: entitlementStatus == 'UnHoldCard' ? 4 : 3,
        remarks: remarkController.text,
        sourceAccountNumber: accounts?.data?.first.tagNumber ?? '',
        destinationAccountNumber: "",
        posMachineId: execContext.machineId,
        userId: /* event.managerId ??*/ execContext.userPKId ?? 0,
        activityDate: DateTime.now(),
        isChanged: true,
        invalidateAccount: false,
      );

      try {
        final response = await otherFunctionBL.postEntitlement(
            entitlementStatus, entitlementModel);
        Log.printMethodEnd('cardEntitlement()','Other Function->Tag Function->Hold Card Entitlements','Hold');
        Log.printMethodReturn('cardEntitlement()-Card entitlements ${entitlementStatus == "HoldCard" ? "hold" : 'unhold'}  is successfull','Other Function->Tag Function->Hold Card Entitlements',entitlementStatus == "HoldCard" ? "hold" : 'unhold');
        emit(SuccessState(
            message: MessagesProvider.get(
                'Card entitlements ${entitlementStatus == "HoldCard" ? "hold" : 'unhold'}  is successfull')));
      } on DioError catch (e) {
        var errorString = dioErrors(e);
        emit(ApiErrorState(errorString));
      }
    }
  }

  deactivateCard(
      DeactivateCardEvent event, Emitter<OtherFunctionState> emit) async {
    emit(BodyLoader());
    Log.printMethodStart('deactivateCard()','Other Function->Tag Function->Deactivate Cards','Deactivate');
    final execContextBL = await ExecutionContextBuilder.build();
    final execContext = execContextBL.getExecutionContext();
    otherFunctionBL = await OtherFunctionDataBuilder.build(execContext!);
    List<DeactivateCardRequestModel> deactivatedCardRequestModelList = [];
    try {
      if (selectedAccounts.isEmpty) {
        emit(ErrorState(
            MessagesProvider.get('Please select a card to Deactivate'),
            color: KColor.notoficationBGLightYellowColor));
      } else {
        for (int i = 0; i < (deactivatedCardList?.length ?? 1); i++) {
          if (selectedAccounts
              .contains(deactivatedCardList?[i].data?.first.accountId)) {
            deactivatedCardRequestModelList.add(
              DeactivateCardRequestModel(
                accountTaskId: -1,
                sourceAccountId: deactivatedCardList?[i].data?.first.accountId,
                sourceCreditPlusId: -1,
                destinationAccountId: -1,
                activityType: 5,
                synchStatus: false,
                siteId: -1,
                sourceAccountNumber:
                    deactivatedCardList?[i].data?.first.tagNumber,
                activityDate: DateTime.now(),
                approvalDate: DateTime.now(),
                approvedBy: execContext.userId,
                userId: execContext.userPKId,
                posMachineId: execContext.machineId,
                isChanged: true,
              ),
            );
          }
        }

        for (int i = 0; i < deactivatedCardRequestModelList.length; i++) {
          final response = await otherFunctionBL.deactivateCard(
            deactivateCardRequestModel: deactivatedCardRequestModelList[i],
          );
          Log.printMethodEnd('deactivateCard()','Other Function->Tag Function->Deactivate Cards','Deactivate');
          Log.printMethodReturn('deactivateCard()-Success','Other Function->Tag Function->Deactivate Cards','Deactivate');
        }
        deactivatedCardList?.removeWhere((element) =>
            selectedAccounts.contains(element.data?.first.accountId));
        selectedAccounts.clear();
        isAdded = false;
        emit(SuccessState());
      }
    } on DioError catch (e) {
      var errorString = dioErrors(e);
      emit(ApiErrorState(errorString));
    }
  }

  mergeCards(MergeCardEvent event, Emitter<OtherFunctionState> emit) async {
    emit(BodyLoader());
    Log.printMethodStart('MergeCardEvent()','Other Functions->Tag Functions->Consolidate Cards','Confirm');
    final execContextBL = await ExecutionContextBuilder.build();
    final execContext = execContextBL.getExecutionContext();
    otherFunctionBL = await OtherFunctionDataBuilder.build(execContext!);
    List<ConsolidateRequestModel> consolidateRequestModel = [];
    List<Map<String, dynamic>> requestJson = [];
    try {
      if (deactivatedCardList?.isEmpty ?? false) {
        emit(ErrorState(
            MessagesProvider.get(
                'Consolidation requires at least 1 source cards'),
            color: KColor.notoficationBGLightYellowColor));
      } else if (accounts == null) {
        emit(ErrorState(
            MessagesProvider.get('Consolidation requires 1 destination card'),
            color: KColor.notoficationBGLightYellowColor));
      } else {
        deactivatedCardList?.forEach(
          (element) {
            consolidateRequestModel.add(
              ConsolidateRequestModel(
                accountTaskId: -1,
                sourceAccountId: -1,
                sourceCreditPlusId: -1,
                destinationAccountId: -1,
                legacyCardId: -1,
                source: element.data?.first.accountId,
                activityType: 6,
                synchStatus: false,
                // groupTaskGuid: '5a6d36c9-92d6-4f3c-a293-e2dbb7d052d4',
                siteId: -1,
                activityDate: DateTime.now(),
                approvalDate: DateTime.now(),
                approvedBy: event.managerId == null
                    ? execContext.userId
                    : event.managerId.toString(),
                masterEntityId: -1,
                cashDrawerId: -1,
                userId: execContext.userPKId,
                posMachineId: execContext.machineId,
                sourceAccountNumber: element.data?.first.tagNumber,
                destinationAccountNumber: accounts?.data?.first.tagNumber,
                invalidateAccount: false,
                isChanged: true,
                isActive: true,
              ),
            );
          },
        );

        for (var element in consolidateRequestModel) {
          requestJson.add(element.toJson());
        }

        print(requestJson);

        final response = await otherFunctionBL.consolidateCards(
            consolidateRequestModel: consolidateRequestModel);
        Log.printMethodEnd('MergeCardEvent()','Other Functions->Tag Functions->Consolidate Cards','Confirm');
        Log.printMethodReturn('MergeCardEvent()-Success','Other Functions->Tag Functions->Consolidate Cards','Confirm');
        emit(SuccessState());
      }
    } on DioError catch (e) {
      var errorString = dioErrors(e);
      emit(ApiErrorState(errorString));
    }
  }

  masterCardEvent(
      MasterCardEvent event, Emitter<OtherFunctionState> emit) async {
    emit(BodyLoader());
    final execContextBL = await ExecutionContextBuilder.build();
    final execContext = execContextBL.getExecutionContext();
    otherFunctionBL = await OtherFunctionDataBuilder.build(execContext!);
    FreePlayModeRequestModel freePlayModeRequestModel =
        FreePlayModeRequestModel(
            cardNumber: accounts?.data?.first.tagNumber,
            approvalId: execContext.userPKId);
    try {
      if (event.cardType == 2) {
        final response = await otherFunctionBL.updateEnterFreePlayMode(
            freePlayModeRequestModel: freePlayModeRequestModel);
        emit(SuccessState(
            message:
                MessagesProvider.get('Free play mode set in configuration'),
            color: KColor.notificationBGLightBlueColor));
      } else if (event.cardType == 3) {
        final response = await otherFunctionBL.updateEnterFreePlayMode(
            freePlayModeRequestModel: freePlayModeRequestModel);
        emit(SuccessState(
            message: MessagesProvider.get('Free play mode exited'),
            color: KColor.notificationBGLightBlueColor));
      } else if (event.cardType == 4) {
        final response = await otherFunctionBL.updateEnterFreePlayMode(
            freePlayModeRequestModel: freePlayModeRequestModel);
        emit(SuccessState(
            message: MessagesProvider.get(
                'Free play cards have been invalidated. Please restart game readers'),
            color: KColor.notificationBGLightBlueColor));
      }
    } on DioError catch (e) {
      var errorString = dioErrors(e);
      emit(ApiErrorState(errorString));
    }
  }

  refundCard(RefundCardEvent event, Emitter<OtherFunctionState> emit) async {
    emit(BodyLoader());
    Log.printMethodStart('RefundCardEvent()','Other Functions->Tag Functions->Refund Cards','Ok');
    final execContextBL = await ExecutionContextBuilder.build();
    final execContext = execContextBL.getExecutionContext();
    otherFunctionBL = await OtherFunctionDataBuilder.build(execContext!);
    try {
      if (deactivatedCardList?.isEmpty ??
          false || deactivatedCardList == null) {
        emit(ErrorState(MessagesProvider.get('Please Tap card')));
      } else {
        List<int> accountIds = deactivatedCardList
                ?.map((e) => e.data?.first.accountId ?? 0)
                .toList() ??
            [];

        RefundCardsRequestModel refundCardsRequestModel =
            RefundCardsRequestModel(
          accountIdList: accountIds,
          remarks: remarkController.text,
          refundValue: refundApiValue.toInt(),
          makeNewOnFullRefund: isMakeNew.value,
        );
        final response = await otherFunctionBL.refundCards(
            refundCardsRequestModel: refundCardsRequestModel);
        Log.printMethodEnd('RefundCardEvent()','Other Functions->Tag Functions->Refund Cards','Ok');
        Log.printMethodReturn('RefundCardEvent()-Card Refund Sucessful','Other Functions->Tag Functions->Refund Cards','Ok');
        isRefundOngoing = true;
        emit(SuccessState(
            message: MessagesProvider.get('Card Refund Successful')));
      }
    } on DioError catch (e) {
      var errorString = dioErrors(e);
      emit(ErrorState(errorString));
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
        return e.response?.data['data'];

      case DioErrorType.sendTimeout:
        return "Connection time out";

      default:
        return "Please check your connection";
    }
  }

  redeemBonusTickets(
      RedeemBonusT event, Emitter<OtherFunctionState> emit) async {
    emit(BodyLoader());
    final execContextBL = await ExecutionContextBuilder.build();
    final execContext = execContextBL.getExecutionContext();
    otherFunctionBL = await OtherFunctionDataBuilder.build(execContext!);
    redeemRequest = RedeemRequest(
      fromValue: redeemBonus.value?.toInt() ?? 0,
      managerId: execContext.userPKId,
      fromType: 3,
      toType: 1,
      remarks: remarkController.text,
      cardId: accounts?.data?.first.accountId,
    );
    Log.printMethodStart('redeemBonusTickets()','Other Functions->Tag Functions->Redeem Bonus For Tickets','Confirm');
    try {
      if (accounts == null) {
        emit(ErrorState(MessagesProvider.get('Please tap a card'),
            color: Colors.yellow));
      } else if ((redeemBonus.value ?? 0.0) < 10.00) {
        emit(ErrorState(MessagesProvider.get(
            'Minimum bonus to redeem cannot be lesser than 10')));
      } else {
        final response = await otherFunctionBL.redeemEntitlement(redeemRequest);
        Log.printMethodEnd('redeemBonusTickets()','Other Functions->Tag Functions->Redeem Bonus For Tickets','Confirm');
        Log.printMethodReturn('redeemBonusTickets()-Bonus redeemed for Tickets successfully','Other Functions->Tag Functions->Redeem Bonus For Tickets','Confirm');
        emit(
          SuccessState(
              message: MessagesProvider.get(
                  "Bonus redeemed for Tickets successfully"),
              color: KColor.notificationBGLightBlueColor),
        );
      }
    } on DioError catch (e) {
      var errorString = dioErrors(e);
      emit(ErrorState(errorString));
    }
  }

  void addMessage(MessageEvent event, Emitter<OtherFunctionState> emit) {
    emit(MessageState(
        message: event.message,
        color: event.color ?? KColor.notificationBGLightBlueColor));
  }

  void pauseTime(PauseTimeEvent event, Emitter<OtherFunctionState> emit) {
    final remarks = remarkController.text.toString();
    add(RequestPauseTimeEvent(remarks));
  }

  void clearBloc(ClearEvent event, Emitter<OtherFunctionState> emit) {
    remarkController.clear();
    redeemTicketController.clear();
    customerSearchController.clear();
    cardController.clear();
    isRefundOngoing = false;
    emit(ClearState());
  }
}
