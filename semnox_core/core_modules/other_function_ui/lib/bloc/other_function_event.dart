part of 'other_function_bloc.dart';

@immutable
abstract class OtherFunctionEvent {}

class CreditForToken extends OtherFunctionEvent {}

class CardDetailEvent extends OtherFunctionEvent {
  final String cardNo;
  CardDetailEvent(this.cardNo);
}

class RequestPauseTimeEvent extends OtherFunctionEvent {
  final String? remarks;
  RequestPauseTimeEvent(this.remarks);
}

class SetBonusCard extends OtherFunctionEvent {}

class GetLinkedCards extends OtherFunctionEvent {}

class BalanceCard extends OtherFunctionEvent {}

class TokenForCredit extends OtherFunctionEvent {}

class ClearEvent extends OtherFunctionEvent {}

class UpdateDisplayValue extends OtherFunctionEvent {}

class RealEToken extends OtherFunctionEvent {}

class TokenMode extends OtherFunctionEvent {}

class ETokenMode extends OtherFunctionEvent {}

class RedeemTickets extends OtherFunctionEvent {
  final int? managerId;
  RedeemTickets({this.managerId});
}

class PauseTimeEvent extends OtherFunctionEvent {}

class MessageEvent extends OtherFunctionEvent {
  final String? message;
  final Color? color;
  MessageEvent(this.message, this.color);
}

class RedeemBonusT extends OtherFunctionEvent {}

class RedeemPoints extends OtherFunctionEvent {
  final int? managerId;
  RedeemPoints({this.managerId});
}

class CardEntitlement extends OtherFunctionEvent {
  final int? managerId;
  CardEntitlement({this.managerId});
}

class CardTransfer extends OtherFunctionEvent {}

class LinkCardEvent extends OtherFunctionEvent {}

class PostLinkCard extends OtherFunctionEvent {}

class AddCardsToList extends OtherFunctionEvent {
  final String accNumber;
  AddCardsToList(this.accNumber);
}

class AddLinkCard extends OtherFunctionEvent {
  final String accNumber;
  AddLinkCard(this.accNumber);
}

class RemoveLinkedCard extends OtherFunctionEvent {
  final int accountId;
  RemoveLinkedCard(this.accountId);
}

class CardChangeEvent extends OtherFunctionEvent {
  final String? tagNumber;
  CardChangeEvent(this.tagNumber);
}

class CardDetailsByAccNumber extends OtherFunctionEvent {
  final String cardNo;
  CardDetailsByAccNumber(this.cardNo);
}

class TransferToCardDetails extends OtherFunctionEvent {
  final String cardNo;
  TransferToCardDetails(this.cardNo);
}

class TransferFromCardDetails extends OtherFunctionEvent {
  final String? tagNo;
  final String accId;
  TransferFromCardDetails(this.accId, {this.tagNo});
}

class SetSelectedRow extends OtherFunctionEvent {
  final int rowId;
  SetSelectedRow({required this.rowId});
}

class DeactivateCardEvent extends OtherFunctionEvent {}

class MergeCardEvent extends OtherFunctionEvent {
  final int? managerId;
  MergeCardEvent({this.managerId});
}

class MasterCardEvent extends OtherFunctionEvent {
  final int? cardType;
  MasterCardEvent({this.cardType});
}

class RefundCardEvent extends OtherFunctionEvent {}

class DeleteCard extends OtherFunctionEvent {
  final int accountId;
  DeleteCard({required this.accountId});
}
