part of 'other_function_bloc.dart';

@immutable
abstract class OtherFunctionState {}

class OtherFunctionInitial extends OtherFunctionState {}

class LoadingState extends OtherFunctionState {}

class BodyLoader extends OtherFunctionState {}

class SuccessState extends OtherFunctionState {
  final String? message;
  final Color? color;
  SuccessState({this.message, this.color});
}

class MessageState extends OtherFunctionState {
  final String? message;
  final Color? color;
  MessageState({this.message, this.color});
}

class ErrorState extends OtherFunctionState {
  final String message;
  final Color? color;
  ErrorState(this.message, {this.color});
}

class ApiErrorState extends OtherFunctionState {
  final String message;
  final Color? color;
  ApiErrorState(this.message, {this.color});
}

class CardDetailsState extends OtherFunctionState {
  final AccountDetailsResponse response;
  final int? index;
  final Color? color;
  final String? message;
  CardDetailsState(this.response, {this.index, this.color, this.message});
}

class LinkedCardState extends OtherFunctionState {
  final List<AccountDetailsResponse>? linkedCards;
  final bool? isDelete;
  final bool? isError;
  final String? message;
  LinkedCardState(this.linkedCards,
      {this.isDelete, this.isError, this.message});
}

class UpdateDisplayState extends OtherFunctionState {}

class TokenSetMode extends OtherFunctionState {
  final String tokenMode;
  TokenSetMode({required this.tokenMode});
}

class RedeemContainerState extends OtherFunctionState {
  final String setCard;
  RedeemContainerState({required this.setCard});
}

class ClearState extends OtherFunctionState {}

class SelectedRowState extends OtherFunctionState {
  final int rowId;
  SelectedRowState({required this.rowId});
}

class DeactivateCardListState extends OtherFunctionState {
  final List<AccountDetailsResponse>? linkedCards;
  DeactivateCardListState(this.linkedCards);
}
