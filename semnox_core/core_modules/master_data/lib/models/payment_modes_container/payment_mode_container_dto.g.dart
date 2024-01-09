// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_mode_container_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PaymentModeContainerDTO _$$_PaymentModeContainerDTOFromJson(
        Map<String, dynamic> json) =>
    _$_PaymentModeContainerDTO(
      paymentModeId: json['PaymentModeId'] as int,
      paymentMode: json['PaymentMode'] as String,
      isCreditCard: json['IsCreditCard'] as bool,
      popupFakeNoteDetectionAlert: json['PopupFakeNoteDetectionAlert'] as bool,
      creditCardSurchargePercentage:
          (json['CreditCardSurchargePercentage'] as num).toDouble(),
      guid: json['Guid'] as String,
      synchStatus: json['SynchStatus'] as bool,
      isCash: json['IsCash'] as bool,
      isDebitCard: json['IsDebitCard'] as bool,
      isCoupon: json['IsCoupon'] as bool,
      gateway: json['Gateway'] as int,
      managerApprovalRequired: json['ManagerApprovalRequired'] as bool,
      isRoundOff: json['IsRoundOff'] as bool,
      posAvailable: json['POSAvailable'] as bool,
      displayOrder: json['DisplayOrder'] as int,
      imageFileName: json['ImageFileName'] as String,
      isQrCode: json['IsQRCode'] as bool,
      paymentReferenceMandatory: json['PaymentReferenceMandatory'] as bool,
      paymentModeChannelsContainerDTOList:
          json['PaymentModeChannelsContainerDTOList'],
      compatiblePaymentModesContainerDTOList:
          (json['CompatiablePaymentModesContainerDTOList'] as List<dynamic>?)
              ?.map((e) => CompatiblePaymentModesContainerDTO.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
      attribute1: json['Attribute1'] as String,
      attribute2: json['Attribute2'] as String,
      attribute3: json['Attribute3'] as String,
      attribute4: json['Attribute4'] as String,
      attribute5: json['Attribute5'] as String,
      autoShowTenderedAmountKeyPad:
          json['AutoShowTenderedAmountKeyPad'] as bool,
      printMerchantReceipt: json['PrintMerchantReceipt'] as bool,
      printCustomerReceipt: json['PrintCustomerReceipt'] as bool,
      enableTipAllocation: json['EnableTipAllocation'] as bool,
      allowCreditCardAuthorization:
          json['AllowCreditCardAuthorization'] as bool,
      allowCustomerToDecideEntryMode:
          json['AllowCustomerToDecideEntryMode'] as bool,
      enableAddressValidation: json['EnableAddressValidation'] as bool,
      enableSignatureVerification: json['EnableSignatureVerification'] as bool,
      enableAutoCreditcardAuthorization:
          json['EnableAutoCreditcardAuthorization'] as bool,
      autoAcceptSignature: json['AutoAcceptSignature'] as bool,
      paymentDenominations: json['PaymentDenominations'] as String,
      ccPaymentReceiptPrint: json['CcPaymentReceiptPrint'] as String,
      preAuthAmount: json['PreAuthAmount'],
      allowRefund: json['AllowRefund'] as bool,
      openCashDrawer: json['OpenCashDrawer'] as bool,
      creditCardDetailsMandatory: json['CreditCardDetailsMandatory'] as bool,
      otpValidation: json['OTPValidation'] as bool,
    );

Map<String, dynamic> _$$_PaymentModeContainerDTOToJson(
        _$_PaymentModeContainerDTO instance) =>
    <String, dynamic>{
      'PaymentModeId': instance.paymentModeId,
      'PaymentMode': instance.paymentMode,
      'IsCreditCard': instance.isCreditCard,
      'PopupFakeNoteDetectionAlert': instance.popupFakeNoteDetectionAlert,
      'CreditCardSurchargePercentage': instance.creditCardSurchargePercentage,
      'Guid': instance.guid,
      'SynchStatus': instance.synchStatus,
      'IsCash': instance.isCash,
      'IsDebitCard': instance.isDebitCard,
      'IsCoupon': instance.isCoupon,
      'Gateway': instance.gateway,
      'ManagerApprovalRequired': instance.managerApprovalRequired,
      'IsRoundOff': instance.isRoundOff,
      'POSAvailable': instance.posAvailable,
      'DisplayOrder': instance.displayOrder,
      'ImageFileName': instance.imageFileName,
      'IsQRCode': instance.isQrCode,
      'PaymentReferenceMandatory': instance.paymentReferenceMandatory,
      'PaymentModeChannelsContainerDTOList':
          instance.paymentModeChannelsContainerDTOList,
      'CompatiablePaymentModesContainerDTOList':
          instance.compatiblePaymentModesContainerDTOList,
      'Attribute1': instance.attribute1,
      'Attribute2': instance.attribute2,
      'Attribute3': instance.attribute3,
      'Attribute4': instance.attribute4,
      'Attribute5': instance.attribute5,
      'AutoShowTenderedAmountKeyPad': instance.autoShowTenderedAmountKeyPad,
      'PrintMerchantReceipt': instance.printMerchantReceipt,
      'PrintCustomerReceipt': instance.printCustomerReceipt,
      'EnableTipAllocation': instance.enableTipAllocation,
      'AllowCreditCardAuthorization': instance.allowCreditCardAuthorization,
      'AllowCustomerToDecideEntryMode': instance.allowCustomerToDecideEntryMode,
      'EnableAddressValidation': instance.enableAddressValidation,
      'EnableSignatureVerification': instance.enableSignatureVerification,
      'EnableAutoCreditcardAuthorization':
          instance.enableAutoCreditcardAuthorization,
      'AutoAcceptSignature': instance.autoAcceptSignature,
      'PaymentDenominations': instance.paymentDenominations,
      'CcPaymentReceiptPrint': instance.ccPaymentReceiptPrint,
      'PreAuthAmount': instance.preAuthAmount,
      'AllowRefund': instance.allowRefund,
      'OpenCashDrawer': instance.openCashDrawer,
      'CreditCardDetailsMandatory': instance.creditCardDetailsMandatory,
      'OTPValidation': instance.otpValidation,
    };
