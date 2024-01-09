// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:master_data/models/payment_modes_container/compatible_payment_modes_dto.dart';

part 'payment_mode_container_dto.freezed.dart';
part 'payment_mode_container_dto.g.dart';

@freezed
class PaymentModeContainerDTO with _$PaymentModeContainerDTO {
  const factory PaymentModeContainerDTO({
    @JsonKey(name: 'PaymentModeId')
    required int paymentModeId,
    @JsonKey(name: 'PaymentMode')
    required String paymentMode,
    @JsonKey(name: 'IsCreditCard')
    required bool isCreditCard,
    @JsonKey(name: 'PopupFakeNoteDetectionAlert')
    required bool popupFakeNoteDetectionAlert,
    @JsonKey(name: 'CreditCardSurchargePercentage')
    required double creditCardSurchargePercentage,
    @JsonKey(name: 'Guid')
    required String guid,
    @JsonKey(name: 'SynchStatus')
    required bool synchStatus,
    @JsonKey(name: 'IsCash')
    required bool isCash,
    @JsonKey(name: 'IsDebitCard')
    required bool isDebitCard,
    @JsonKey(name: 'IsCoupon')
    required bool isCoupon,
    @JsonKey(name: 'Gateway')
    required int gateway,
    @JsonKey(name: 'ManagerApprovalRequired')
    required bool managerApprovalRequired,
    @JsonKey(name: 'IsRoundOff')
    required bool isRoundOff,
    @JsonKey(name: 'POSAvailable')
    required bool posAvailable,
    @JsonKey(name: 'DisplayOrder')
    required int displayOrder,
    @JsonKey(name: 'ImageFileName')
    required String imageFileName,
    @JsonKey(name: 'IsQRCode')
    required bool isQrCode,
    @JsonKey(name: 'PaymentReferenceMandatory')
    required bool paymentReferenceMandatory,
    @JsonKey(name: 'PaymentModeChannelsContainerDTOList')
    dynamic paymentModeChannelsContainerDTOList,
    @JsonKey(name: 'CompatiablePaymentModesContainerDTOList')
    List<CompatiblePaymentModesContainerDTO>? compatiblePaymentModesContainerDTOList,
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
    @JsonKey(name: 'AutoShowTenderedAmountKeyPad')
    required bool autoShowTenderedAmountKeyPad,
    @JsonKey(name: 'PrintMerchantReceipt')
    required bool printMerchantReceipt,
    @JsonKey(name: 'PrintCustomerReceipt')
    required bool printCustomerReceipt,
    @JsonKey(name: 'EnableTipAllocation')
    required bool enableTipAllocation,
    @JsonKey(name: 'AllowCreditCardAuthorization')
    required bool allowCreditCardAuthorization,
    @JsonKey(name: 'AllowCustomerToDecideEntryMode')
    required bool allowCustomerToDecideEntryMode,
    @JsonKey(name: 'EnableAddressValidation')
    required bool enableAddressValidation,
    @JsonKey(name: 'EnableSignatureVerification')
    required bool enableSignatureVerification,
    @JsonKey(name: 'EnableAutoCreditcardAuthorization')
    required bool enableAutoCreditcardAuthorization,
    @JsonKey(name: 'AutoAcceptSignature')
    required bool autoAcceptSignature,
    @JsonKey(name: 'PaymentDenominations')
    required String paymentDenominations,
    @JsonKey(name: 'CcPaymentReceiptPrint')
    required String ccPaymentReceiptPrint,
    @JsonKey(name: 'PreAuthAmount')
    dynamic preAuthAmount,
    @JsonKey(name: 'AllowRefund')
    required bool allowRefund,
    @JsonKey(name: 'OpenCashDrawer')
    required bool openCashDrawer,
    @JsonKey(name: 'CreditCardDetailsMandatory')
    required bool creditCardDetailsMandatory,
    @JsonKey(name: 'OTPValidation')
    required bool otpValidation,
  }) = _PaymentModeContainerDTO;

  factory PaymentModeContainerDTO.fromJson(Map<String, dynamic> json) => _$PaymentModeContainerDTOFromJson(json);
}