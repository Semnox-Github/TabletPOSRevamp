
import 'package:freezed_annotation/freezed_annotation.dart';


part 'transaction_payment_dto.freezed.dart';
part 'transaction_payment_dto.g.dart';

@freezed
class TransactionPaymentDto with _$TransactionPaymentDto{
  const factory TransactionPaymentDto({
    @JsonKey(name: 'PaymentId')
    required int paymentId,
    @JsonKey(name: 'ApproverId')
    required int approverId,
    @JsonKey(name: 'TransactionId')
    required int transactionId,
    @JsonKey(name: 'PaymentModeId')
    required int paymentModeId,
    @JsonKey(name: 'Amount')
    required double amount,
    @JsonKey(name: 'CreditCardNumber')
    required String creditCardNumber,
    @JsonKey(name: 'NameOnCreditCard')
    required String nameOnCreditCard,
    @JsonKey(name: 'CreditCardName')
    required String creditCardName,
    @JsonKey(name: 'CreditCardExpiry')
    required String creditCardExpiry,
    @JsonKey(name: 'CreditCardAuthorization')
    required String creditCardAuthorization,
    @JsonKey(name: 'CardId')
    required int cardId,
    @JsonKey(name: 'CCResponseId')
    required int ccResponseId,
    @JsonKey(name: 'CardEntitlementType')
    required String cardEntitlementType,
    @JsonKey(name: 'CardCreditPlusId')
    required int cardCreditPlusId,
    @JsonKey(name: 'CouponSetId')
    required int couponSetId,
    @JsonKey(name: 'CouponNumber')
    required String couponNumber,
    @JsonKey(name: 'CPConsumptionId')
    required int cpConsumptionId,
    @JsonKey(name: 'Reference')
    dynamic reference,
    @JsonKey(name: 'Guid')
    required String guid,
    @JsonKey(name: 'SynchStatus')
    required bool synchStatus,
    @JsonKey(name: 'SiteId')
    required int siteId,
    @JsonKey(name: 'Memo')
    String? memo,
    @JsonKey(name: 'PaymentDate')
    required String paymentDate,
    @JsonKey(name: 'CashDrawerId')
    required int cashDrawerId,
    @JsonKey(name: 'LastUpdateDate')
    required String lastUpdateDate,
    @JsonKey(name: 'CreationDate')
    required String creationDate,
    @JsonKey(name: 'CreatedBy')
    required String createdBy,
    @JsonKey(name: 'LastUpdatedUser')
    required String lastUpdatedUser,
    @JsonKey(name: 'ParentPaymentId')
    required int parentPaymentId,
    @JsonKey(name: 'TenderedAmount')
    dynamic tenderedAmount,
    @JsonKey(name: 'TipAmount')
    required double tipAmount,
    @JsonKey(name: 'PosMachine')
    required String posMachine,
    @JsonKey(name: 'MasterEntityId')
    required int masterEntityId,
    @JsonKey(name: 'CurrencyCode')
    dynamic currencyCode,
    @JsonKey(name: 'CurrencyRate')
    dynamic currencyRate,
    @JsonKey(name: 'IsTaxable')
    dynamic isTaxable,
    @JsonKey(name: 'CouponValue')
    dynamic couponValue,
    @JsonKey(name: 'ApprovedBy')
    dynamic approvedBy,
    @JsonKey(name: 'SubscriptionAuthorizationMode')
    required int subscriptionAuthorizationMode,
    @JsonKey(name: 'CustomerCardProfileId')
    required String customerCardProfileId,
    @JsonKey(name: 'ExternalSourceReference')
    required String externalSourceReference,
    @JsonKey(name: 'Attribute1')
    required String attribute1,
    @JsonKey(name: 'Attribute2')
    required String attribute2,
    @JsonKey(name: 'Attribute3')
    required String attribute3,
    @JsonKey(name: 'Attribute4')
    required String attribute4,
    @JsonKey(name: 'Attribute5')
    required String attribute5,
    @JsonKey(name: 'PaymentStatusId')
    required int paymentStatusId,
    @JsonKey(name: 'PaymentStatus')
    required String paymentStatus,
    @JsonKey(name: 'PaymentStatusChangeDate')
    required String paymentStatusChangeDate,
    @JsonKey(name: 'IsKeyedMode')
    dynamic isKeyedMode,
    @JsonKey(name: 'PaymentModeOTP')
    required String paymentModeOtp,
    @JsonKey(name: 'PaymentTransactionDTOList')
    required List<dynamic> paymentTransactionDTOList,
    @JsonKey(name: 'TransactionPaymentDTOList')
    required List<dynamic> transactionPaymentDTOList,
    @JsonKey(name: 'TrxLinePaymentMappingDTOList')
    required List<dynamic> trxLinePaymentMappingDTOList,
    @JsonKey(name: 'IsChanged')
    required bool isChanged,
    @JsonKey(name: 'IsChangedRecursive')
    required bool isChangedRecursive,
    @Default(false)
    bool isSelected,
  }) = _TransactionPaymentDto;

  factory TransactionPaymentDto.fromJson(Map<String, dynamic> json) => _$TransactionPaymentDtoFromJson(json);
}