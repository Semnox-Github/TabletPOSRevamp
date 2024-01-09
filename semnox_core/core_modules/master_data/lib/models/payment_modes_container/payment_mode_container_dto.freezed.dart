// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payment_mode_container_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PaymentModeContainerDTO _$PaymentModeContainerDTOFromJson(
    Map<String, dynamic> json) {
  return _PaymentModeContainerDTO.fromJson(json);
}

/// @nodoc
mixin _$PaymentModeContainerDTO {
  @JsonKey(name: 'PaymentModeId')
  int get paymentModeId => throw _privateConstructorUsedError;
  @JsonKey(name: 'PaymentMode')
  String get paymentMode => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsCreditCard')
  bool get isCreditCard => throw _privateConstructorUsedError;
  @JsonKey(name: 'PopupFakeNoteDetectionAlert')
  bool get popupFakeNoteDetectionAlert => throw _privateConstructorUsedError;
  @JsonKey(name: 'CreditCardSurchargePercentage')
  double get creditCardSurchargePercentage =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'Guid')
  String get guid => throw _privateConstructorUsedError;
  @JsonKey(name: 'SynchStatus')
  bool get synchStatus => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsCash')
  bool get isCash => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsDebitCard')
  bool get isDebitCard => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsCoupon')
  bool get isCoupon => throw _privateConstructorUsedError;
  @JsonKey(name: 'Gateway')
  int get gateway => throw _privateConstructorUsedError;
  @JsonKey(name: 'ManagerApprovalRequired')
  bool get managerApprovalRequired => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsRoundOff')
  bool get isRoundOff => throw _privateConstructorUsedError;
  @JsonKey(name: 'POSAvailable')
  bool get posAvailable => throw _privateConstructorUsedError;
  @JsonKey(name: 'DisplayOrder')
  int get displayOrder => throw _privateConstructorUsedError;
  @JsonKey(name: 'ImageFileName')
  String get imageFileName => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsQRCode')
  bool get isQrCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'PaymentReferenceMandatory')
  bool get paymentReferenceMandatory => throw _privateConstructorUsedError;
  @JsonKey(name: 'PaymentModeChannelsContainerDTOList')
  dynamic get paymentModeChannelsContainerDTOList =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'CompatiablePaymentModesContainerDTOList')
  List<CompatiblePaymentModesContainerDTO>?
      get compatiblePaymentModesContainerDTOList =>
          throw _privateConstructorUsedError;
  @JsonKey(name: 'Attribute1')
  String get attribute1 => throw _privateConstructorUsedError;
  @JsonKey(name: 'Attribute2')
  String get attribute2 => throw _privateConstructorUsedError;
  @JsonKey(name: 'Attribute3')
  String get attribute3 => throw _privateConstructorUsedError;
  @JsonKey(name: 'Attribute4')
  String get attribute4 => throw _privateConstructorUsedError;
  @JsonKey(name: 'Attribute5')
  String get attribute5 => throw _privateConstructorUsedError;
  @JsonKey(name: 'AutoShowTenderedAmountKeyPad')
  bool get autoShowTenderedAmountKeyPad => throw _privateConstructorUsedError;
  @JsonKey(name: 'PrintMerchantReceipt')
  bool get printMerchantReceipt => throw _privateConstructorUsedError;
  @JsonKey(name: 'PrintCustomerReceipt')
  bool get printCustomerReceipt => throw _privateConstructorUsedError;
  @JsonKey(name: 'EnableTipAllocation')
  bool get enableTipAllocation => throw _privateConstructorUsedError;
  @JsonKey(name: 'AllowCreditCardAuthorization')
  bool get allowCreditCardAuthorization => throw _privateConstructorUsedError;
  @JsonKey(name: 'AllowCustomerToDecideEntryMode')
  bool get allowCustomerToDecideEntryMode => throw _privateConstructorUsedError;
  @JsonKey(name: 'EnableAddressValidation')
  bool get enableAddressValidation => throw _privateConstructorUsedError;
  @JsonKey(name: 'EnableSignatureVerification')
  bool get enableSignatureVerification => throw _privateConstructorUsedError;
  @JsonKey(name: 'EnableAutoCreditcardAuthorization')
  bool get enableAutoCreditcardAuthorization =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'AutoAcceptSignature')
  bool get autoAcceptSignature => throw _privateConstructorUsedError;
  @JsonKey(name: 'PaymentDenominations')
  String get paymentDenominations => throw _privateConstructorUsedError;
  @JsonKey(name: 'CcPaymentReceiptPrint')
  String get ccPaymentReceiptPrint => throw _privateConstructorUsedError;
  @JsonKey(name: 'PreAuthAmount')
  dynamic get preAuthAmount => throw _privateConstructorUsedError;
  @JsonKey(name: 'AllowRefund')
  bool get allowRefund => throw _privateConstructorUsedError;
  @JsonKey(name: 'OpenCashDrawer')
  bool get openCashDrawer => throw _privateConstructorUsedError;
  @JsonKey(name: 'CreditCardDetailsMandatory')
  bool get creditCardDetailsMandatory => throw _privateConstructorUsedError;
  @JsonKey(name: 'OTPValidation')
  bool get otpValidation => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PaymentModeContainerDTOCopyWith<PaymentModeContainerDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentModeContainerDTOCopyWith<$Res> {
  factory $PaymentModeContainerDTOCopyWith(PaymentModeContainerDTO value,
          $Res Function(PaymentModeContainerDTO) then) =
      _$PaymentModeContainerDTOCopyWithImpl<$Res, PaymentModeContainerDTO>;
  @useResult
  $Res call(
      {@JsonKey(name: 'PaymentModeId')
          int paymentModeId,
      @JsonKey(name: 'PaymentMode')
          String paymentMode,
      @JsonKey(name: 'IsCreditCard')
          bool isCreditCard,
      @JsonKey(name: 'PopupFakeNoteDetectionAlert')
          bool popupFakeNoteDetectionAlert,
      @JsonKey(name: 'CreditCardSurchargePercentage')
          double creditCardSurchargePercentage,
      @JsonKey(name: 'Guid')
          String guid,
      @JsonKey(name: 'SynchStatus')
          bool synchStatus,
      @JsonKey(name: 'IsCash')
          bool isCash,
      @JsonKey(name: 'IsDebitCard')
          bool isDebitCard,
      @JsonKey(name: 'IsCoupon')
          bool isCoupon,
      @JsonKey(name: 'Gateway')
          int gateway,
      @JsonKey(name: 'ManagerApprovalRequired')
          bool managerApprovalRequired,
      @JsonKey(name: 'IsRoundOff')
          bool isRoundOff,
      @JsonKey(name: 'POSAvailable')
          bool posAvailable,
      @JsonKey(name: 'DisplayOrder')
          int displayOrder,
      @JsonKey(name: 'ImageFileName')
          String imageFileName,
      @JsonKey(name: 'IsQRCode')
          bool isQrCode,
      @JsonKey(name: 'PaymentReferenceMandatory')
          bool paymentReferenceMandatory,
      @JsonKey(name: 'PaymentModeChannelsContainerDTOList')
          dynamic paymentModeChannelsContainerDTOList,
      @JsonKey(name: 'CompatiablePaymentModesContainerDTOList')
          List<CompatiblePaymentModesContainerDTO>?
              compatiblePaymentModesContainerDTOList,
      @JsonKey(name: 'Attribute1')
          String attribute1,
      @JsonKey(name: 'Attribute2')
          String attribute2,
      @JsonKey(name: 'Attribute3')
          String attribute3,
      @JsonKey(name: 'Attribute4')
          String attribute4,
      @JsonKey(name: 'Attribute5')
          String attribute5,
      @JsonKey(name: 'AutoShowTenderedAmountKeyPad')
          bool autoShowTenderedAmountKeyPad,
      @JsonKey(name: 'PrintMerchantReceipt')
          bool printMerchantReceipt,
      @JsonKey(name: 'PrintCustomerReceipt')
          bool printCustomerReceipt,
      @JsonKey(name: 'EnableTipAllocation')
          bool enableTipAllocation,
      @JsonKey(name: 'AllowCreditCardAuthorization')
          bool allowCreditCardAuthorization,
      @JsonKey(name: 'AllowCustomerToDecideEntryMode')
          bool allowCustomerToDecideEntryMode,
      @JsonKey(name: 'EnableAddressValidation')
          bool enableAddressValidation,
      @JsonKey(name: 'EnableSignatureVerification')
          bool enableSignatureVerification,
      @JsonKey(name: 'EnableAutoCreditcardAuthorization')
          bool enableAutoCreditcardAuthorization,
      @JsonKey(name: 'AutoAcceptSignature')
          bool autoAcceptSignature,
      @JsonKey(name: 'PaymentDenominations')
          String paymentDenominations,
      @JsonKey(name: 'CcPaymentReceiptPrint')
          String ccPaymentReceiptPrint,
      @JsonKey(name: 'PreAuthAmount')
          dynamic preAuthAmount,
      @JsonKey(name: 'AllowRefund')
          bool allowRefund,
      @JsonKey(name: 'OpenCashDrawer')
          bool openCashDrawer,
      @JsonKey(name: 'CreditCardDetailsMandatory')
          bool creditCardDetailsMandatory,
      @JsonKey(name: 'OTPValidation')
          bool otpValidation});
}

/// @nodoc
class _$PaymentModeContainerDTOCopyWithImpl<$Res,
        $Val extends PaymentModeContainerDTO>
    implements $PaymentModeContainerDTOCopyWith<$Res> {
  _$PaymentModeContainerDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? paymentModeId = null,
    Object? paymentMode = null,
    Object? isCreditCard = null,
    Object? popupFakeNoteDetectionAlert = null,
    Object? creditCardSurchargePercentage = null,
    Object? guid = null,
    Object? synchStatus = null,
    Object? isCash = null,
    Object? isDebitCard = null,
    Object? isCoupon = null,
    Object? gateway = null,
    Object? managerApprovalRequired = null,
    Object? isRoundOff = null,
    Object? posAvailable = null,
    Object? displayOrder = null,
    Object? imageFileName = null,
    Object? isQrCode = null,
    Object? paymentReferenceMandatory = null,
    Object? paymentModeChannelsContainerDTOList = freezed,
    Object? compatiblePaymentModesContainerDTOList = freezed,
    Object? attribute1 = null,
    Object? attribute2 = null,
    Object? attribute3 = null,
    Object? attribute4 = null,
    Object? attribute5 = null,
    Object? autoShowTenderedAmountKeyPad = null,
    Object? printMerchantReceipt = null,
    Object? printCustomerReceipt = null,
    Object? enableTipAllocation = null,
    Object? allowCreditCardAuthorization = null,
    Object? allowCustomerToDecideEntryMode = null,
    Object? enableAddressValidation = null,
    Object? enableSignatureVerification = null,
    Object? enableAutoCreditcardAuthorization = null,
    Object? autoAcceptSignature = null,
    Object? paymentDenominations = null,
    Object? ccPaymentReceiptPrint = null,
    Object? preAuthAmount = freezed,
    Object? allowRefund = null,
    Object? openCashDrawer = null,
    Object? creditCardDetailsMandatory = null,
    Object? otpValidation = null,
  }) {
    return _then(_value.copyWith(
      paymentModeId: null == paymentModeId
          ? _value.paymentModeId
          : paymentModeId // ignore: cast_nullable_to_non_nullable
              as int,
      paymentMode: null == paymentMode
          ? _value.paymentMode
          : paymentMode // ignore: cast_nullable_to_non_nullable
              as String,
      isCreditCard: null == isCreditCard
          ? _value.isCreditCard
          : isCreditCard // ignore: cast_nullable_to_non_nullable
              as bool,
      popupFakeNoteDetectionAlert: null == popupFakeNoteDetectionAlert
          ? _value.popupFakeNoteDetectionAlert
          : popupFakeNoteDetectionAlert // ignore: cast_nullable_to_non_nullable
              as bool,
      creditCardSurchargePercentage: null == creditCardSurchargePercentage
          ? _value.creditCardSurchargePercentage
          : creditCardSurchargePercentage // ignore: cast_nullable_to_non_nullable
              as double,
      guid: null == guid
          ? _value.guid
          : guid // ignore: cast_nullable_to_non_nullable
              as String,
      synchStatus: null == synchStatus
          ? _value.synchStatus
          : synchStatus // ignore: cast_nullable_to_non_nullable
              as bool,
      isCash: null == isCash
          ? _value.isCash
          : isCash // ignore: cast_nullable_to_non_nullable
              as bool,
      isDebitCard: null == isDebitCard
          ? _value.isDebitCard
          : isDebitCard // ignore: cast_nullable_to_non_nullable
              as bool,
      isCoupon: null == isCoupon
          ? _value.isCoupon
          : isCoupon // ignore: cast_nullable_to_non_nullable
              as bool,
      gateway: null == gateway
          ? _value.gateway
          : gateway // ignore: cast_nullable_to_non_nullable
              as int,
      managerApprovalRequired: null == managerApprovalRequired
          ? _value.managerApprovalRequired
          : managerApprovalRequired // ignore: cast_nullable_to_non_nullable
              as bool,
      isRoundOff: null == isRoundOff
          ? _value.isRoundOff
          : isRoundOff // ignore: cast_nullable_to_non_nullable
              as bool,
      posAvailable: null == posAvailable
          ? _value.posAvailable
          : posAvailable // ignore: cast_nullable_to_non_nullable
              as bool,
      displayOrder: null == displayOrder
          ? _value.displayOrder
          : displayOrder // ignore: cast_nullable_to_non_nullable
              as int,
      imageFileName: null == imageFileName
          ? _value.imageFileName
          : imageFileName // ignore: cast_nullable_to_non_nullable
              as String,
      isQrCode: null == isQrCode
          ? _value.isQrCode
          : isQrCode // ignore: cast_nullable_to_non_nullable
              as bool,
      paymentReferenceMandatory: null == paymentReferenceMandatory
          ? _value.paymentReferenceMandatory
          : paymentReferenceMandatory // ignore: cast_nullable_to_non_nullable
              as bool,
      paymentModeChannelsContainerDTOList: freezed ==
              paymentModeChannelsContainerDTOList
          ? _value.paymentModeChannelsContainerDTOList
          : paymentModeChannelsContainerDTOList // ignore: cast_nullable_to_non_nullable
              as dynamic,
      compatiblePaymentModesContainerDTOList: freezed ==
              compatiblePaymentModesContainerDTOList
          ? _value.compatiblePaymentModesContainerDTOList
          : compatiblePaymentModesContainerDTOList // ignore: cast_nullable_to_non_nullable
              as List<CompatiblePaymentModesContainerDTO>?,
      attribute1: null == attribute1
          ? _value.attribute1
          : attribute1 // ignore: cast_nullable_to_non_nullable
              as String,
      attribute2: null == attribute2
          ? _value.attribute2
          : attribute2 // ignore: cast_nullable_to_non_nullable
              as String,
      attribute3: null == attribute3
          ? _value.attribute3
          : attribute3 // ignore: cast_nullable_to_non_nullable
              as String,
      attribute4: null == attribute4
          ? _value.attribute4
          : attribute4 // ignore: cast_nullable_to_non_nullable
              as String,
      attribute5: null == attribute5
          ? _value.attribute5
          : attribute5 // ignore: cast_nullable_to_non_nullable
              as String,
      autoShowTenderedAmountKeyPad: null == autoShowTenderedAmountKeyPad
          ? _value.autoShowTenderedAmountKeyPad
          : autoShowTenderedAmountKeyPad // ignore: cast_nullable_to_non_nullable
              as bool,
      printMerchantReceipt: null == printMerchantReceipt
          ? _value.printMerchantReceipt
          : printMerchantReceipt // ignore: cast_nullable_to_non_nullable
              as bool,
      printCustomerReceipt: null == printCustomerReceipt
          ? _value.printCustomerReceipt
          : printCustomerReceipt // ignore: cast_nullable_to_non_nullable
              as bool,
      enableTipAllocation: null == enableTipAllocation
          ? _value.enableTipAllocation
          : enableTipAllocation // ignore: cast_nullable_to_non_nullable
              as bool,
      allowCreditCardAuthorization: null == allowCreditCardAuthorization
          ? _value.allowCreditCardAuthorization
          : allowCreditCardAuthorization // ignore: cast_nullable_to_non_nullable
              as bool,
      allowCustomerToDecideEntryMode: null == allowCustomerToDecideEntryMode
          ? _value.allowCustomerToDecideEntryMode
          : allowCustomerToDecideEntryMode // ignore: cast_nullable_to_non_nullable
              as bool,
      enableAddressValidation: null == enableAddressValidation
          ? _value.enableAddressValidation
          : enableAddressValidation // ignore: cast_nullable_to_non_nullable
              as bool,
      enableSignatureVerification: null == enableSignatureVerification
          ? _value.enableSignatureVerification
          : enableSignatureVerification // ignore: cast_nullable_to_non_nullable
              as bool,
      enableAutoCreditcardAuthorization: null ==
              enableAutoCreditcardAuthorization
          ? _value.enableAutoCreditcardAuthorization
          : enableAutoCreditcardAuthorization // ignore: cast_nullable_to_non_nullable
              as bool,
      autoAcceptSignature: null == autoAcceptSignature
          ? _value.autoAcceptSignature
          : autoAcceptSignature // ignore: cast_nullable_to_non_nullable
              as bool,
      paymentDenominations: null == paymentDenominations
          ? _value.paymentDenominations
          : paymentDenominations // ignore: cast_nullable_to_non_nullable
              as String,
      ccPaymentReceiptPrint: null == ccPaymentReceiptPrint
          ? _value.ccPaymentReceiptPrint
          : ccPaymentReceiptPrint // ignore: cast_nullable_to_non_nullable
              as String,
      preAuthAmount: freezed == preAuthAmount
          ? _value.preAuthAmount
          : preAuthAmount // ignore: cast_nullable_to_non_nullable
              as dynamic,
      allowRefund: null == allowRefund
          ? _value.allowRefund
          : allowRefund // ignore: cast_nullable_to_non_nullable
              as bool,
      openCashDrawer: null == openCashDrawer
          ? _value.openCashDrawer
          : openCashDrawer // ignore: cast_nullable_to_non_nullable
              as bool,
      creditCardDetailsMandatory: null == creditCardDetailsMandatory
          ? _value.creditCardDetailsMandatory
          : creditCardDetailsMandatory // ignore: cast_nullable_to_non_nullable
              as bool,
      otpValidation: null == otpValidation
          ? _value.otpValidation
          : otpValidation // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PaymentModeContainerDTOCopyWith<$Res>
    implements $PaymentModeContainerDTOCopyWith<$Res> {
  factory _$$_PaymentModeContainerDTOCopyWith(_$_PaymentModeContainerDTO value,
          $Res Function(_$_PaymentModeContainerDTO) then) =
      __$$_PaymentModeContainerDTOCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'PaymentModeId')
          int paymentModeId,
      @JsonKey(name: 'PaymentMode')
          String paymentMode,
      @JsonKey(name: 'IsCreditCard')
          bool isCreditCard,
      @JsonKey(name: 'PopupFakeNoteDetectionAlert')
          bool popupFakeNoteDetectionAlert,
      @JsonKey(name: 'CreditCardSurchargePercentage')
          double creditCardSurchargePercentage,
      @JsonKey(name: 'Guid')
          String guid,
      @JsonKey(name: 'SynchStatus')
          bool synchStatus,
      @JsonKey(name: 'IsCash')
          bool isCash,
      @JsonKey(name: 'IsDebitCard')
          bool isDebitCard,
      @JsonKey(name: 'IsCoupon')
          bool isCoupon,
      @JsonKey(name: 'Gateway')
          int gateway,
      @JsonKey(name: 'ManagerApprovalRequired')
          bool managerApprovalRequired,
      @JsonKey(name: 'IsRoundOff')
          bool isRoundOff,
      @JsonKey(name: 'POSAvailable')
          bool posAvailable,
      @JsonKey(name: 'DisplayOrder')
          int displayOrder,
      @JsonKey(name: 'ImageFileName')
          String imageFileName,
      @JsonKey(name: 'IsQRCode')
          bool isQrCode,
      @JsonKey(name: 'PaymentReferenceMandatory')
          bool paymentReferenceMandatory,
      @JsonKey(name: 'PaymentModeChannelsContainerDTOList')
          dynamic paymentModeChannelsContainerDTOList,
      @JsonKey(name: 'CompatiablePaymentModesContainerDTOList')
          List<CompatiblePaymentModesContainerDTO>?
              compatiblePaymentModesContainerDTOList,
      @JsonKey(name: 'Attribute1')
          String attribute1,
      @JsonKey(name: 'Attribute2')
          String attribute2,
      @JsonKey(name: 'Attribute3')
          String attribute3,
      @JsonKey(name: 'Attribute4')
          String attribute4,
      @JsonKey(name: 'Attribute5')
          String attribute5,
      @JsonKey(name: 'AutoShowTenderedAmountKeyPad')
          bool autoShowTenderedAmountKeyPad,
      @JsonKey(name: 'PrintMerchantReceipt')
          bool printMerchantReceipt,
      @JsonKey(name: 'PrintCustomerReceipt')
          bool printCustomerReceipt,
      @JsonKey(name: 'EnableTipAllocation')
          bool enableTipAllocation,
      @JsonKey(name: 'AllowCreditCardAuthorization')
          bool allowCreditCardAuthorization,
      @JsonKey(name: 'AllowCustomerToDecideEntryMode')
          bool allowCustomerToDecideEntryMode,
      @JsonKey(name: 'EnableAddressValidation')
          bool enableAddressValidation,
      @JsonKey(name: 'EnableSignatureVerification')
          bool enableSignatureVerification,
      @JsonKey(name: 'EnableAutoCreditcardAuthorization')
          bool enableAutoCreditcardAuthorization,
      @JsonKey(name: 'AutoAcceptSignature')
          bool autoAcceptSignature,
      @JsonKey(name: 'PaymentDenominations')
          String paymentDenominations,
      @JsonKey(name: 'CcPaymentReceiptPrint')
          String ccPaymentReceiptPrint,
      @JsonKey(name: 'PreAuthAmount')
          dynamic preAuthAmount,
      @JsonKey(name: 'AllowRefund')
          bool allowRefund,
      @JsonKey(name: 'OpenCashDrawer')
          bool openCashDrawer,
      @JsonKey(name: 'CreditCardDetailsMandatory')
          bool creditCardDetailsMandatory,
      @JsonKey(name: 'OTPValidation')
          bool otpValidation});
}

/// @nodoc
class __$$_PaymentModeContainerDTOCopyWithImpl<$Res>
    extends _$PaymentModeContainerDTOCopyWithImpl<$Res,
        _$_PaymentModeContainerDTO>
    implements _$$_PaymentModeContainerDTOCopyWith<$Res> {
  __$$_PaymentModeContainerDTOCopyWithImpl(_$_PaymentModeContainerDTO _value,
      $Res Function(_$_PaymentModeContainerDTO) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? paymentModeId = null,
    Object? paymentMode = null,
    Object? isCreditCard = null,
    Object? popupFakeNoteDetectionAlert = null,
    Object? creditCardSurchargePercentage = null,
    Object? guid = null,
    Object? synchStatus = null,
    Object? isCash = null,
    Object? isDebitCard = null,
    Object? isCoupon = null,
    Object? gateway = null,
    Object? managerApprovalRequired = null,
    Object? isRoundOff = null,
    Object? posAvailable = null,
    Object? displayOrder = null,
    Object? imageFileName = null,
    Object? isQrCode = null,
    Object? paymentReferenceMandatory = null,
    Object? paymentModeChannelsContainerDTOList = freezed,
    Object? compatiblePaymentModesContainerDTOList = freezed,
    Object? attribute1 = null,
    Object? attribute2 = null,
    Object? attribute3 = null,
    Object? attribute4 = null,
    Object? attribute5 = null,
    Object? autoShowTenderedAmountKeyPad = null,
    Object? printMerchantReceipt = null,
    Object? printCustomerReceipt = null,
    Object? enableTipAllocation = null,
    Object? allowCreditCardAuthorization = null,
    Object? allowCustomerToDecideEntryMode = null,
    Object? enableAddressValidation = null,
    Object? enableSignatureVerification = null,
    Object? enableAutoCreditcardAuthorization = null,
    Object? autoAcceptSignature = null,
    Object? paymentDenominations = null,
    Object? ccPaymentReceiptPrint = null,
    Object? preAuthAmount = freezed,
    Object? allowRefund = null,
    Object? openCashDrawer = null,
    Object? creditCardDetailsMandatory = null,
    Object? otpValidation = null,
  }) {
    return _then(_$_PaymentModeContainerDTO(
      paymentModeId: null == paymentModeId
          ? _value.paymentModeId
          : paymentModeId // ignore: cast_nullable_to_non_nullable
              as int,
      paymentMode: null == paymentMode
          ? _value.paymentMode
          : paymentMode // ignore: cast_nullable_to_non_nullable
              as String,
      isCreditCard: null == isCreditCard
          ? _value.isCreditCard
          : isCreditCard // ignore: cast_nullable_to_non_nullable
              as bool,
      popupFakeNoteDetectionAlert: null == popupFakeNoteDetectionAlert
          ? _value.popupFakeNoteDetectionAlert
          : popupFakeNoteDetectionAlert // ignore: cast_nullable_to_non_nullable
              as bool,
      creditCardSurchargePercentage: null == creditCardSurchargePercentage
          ? _value.creditCardSurchargePercentage
          : creditCardSurchargePercentage // ignore: cast_nullable_to_non_nullable
              as double,
      guid: null == guid
          ? _value.guid
          : guid // ignore: cast_nullable_to_non_nullable
              as String,
      synchStatus: null == synchStatus
          ? _value.synchStatus
          : synchStatus // ignore: cast_nullable_to_non_nullable
              as bool,
      isCash: null == isCash
          ? _value.isCash
          : isCash // ignore: cast_nullable_to_non_nullable
              as bool,
      isDebitCard: null == isDebitCard
          ? _value.isDebitCard
          : isDebitCard // ignore: cast_nullable_to_non_nullable
              as bool,
      isCoupon: null == isCoupon
          ? _value.isCoupon
          : isCoupon // ignore: cast_nullable_to_non_nullable
              as bool,
      gateway: null == gateway
          ? _value.gateway
          : gateway // ignore: cast_nullable_to_non_nullable
              as int,
      managerApprovalRequired: null == managerApprovalRequired
          ? _value.managerApprovalRequired
          : managerApprovalRequired // ignore: cast_nullable_to_non_nullable
              as bool,
      isRoundOff: null == isRoundOff
          ? _value.isRoundOff
          : isRoundOff // ignore: cast_nullable_to_non_nullable
              as bool,
      posAvailable: null == posAvailable
          ? _value.posAvailable
          : posAvailable // ignore: cast_nullable_to_non_nullable
              as bool,
      displayOrder: null == displayOrder
          ? _value.displayOrder
          : displayOrder // ignore: cast_nullable_to_non_nullable
              as int,
      imageFileName: null == imageFileName
          ? _value.imageFileName
          : imageFileName // ignore: cast_nullable_to_non_nullable
              as String,
      isQrCode: null == isQrCode
          ? _value.isQrCode
          : isQrCode // ignore: cast_nullable_to_non_nullable
              as bool,
      paymentReferenceMandatory: null == paymentReferenceMandatory
          ? _value.paymentReferenceMandatory
          : paymentReferenceMandatory // ignore: cast_nullable_to_non_nullable
              as bool,
      paymentModeChannelsContainerDTOList: freezed ==
              paymentModeChannelsContainerDTOList
          ? _value.paymentModeChannelsContainerDTOList
          : paymentModeChannelsContainerDTOList // ignore: cast_nullable_to_non_nullable
              as dynamic,
      compatiblePaymentModesContainerDTOList: freezed ==
              compatiblePaymentModesContainerDTOList
          ? _value._compatiblePaymentModesContainerDTOList
          : compatiblePaymentModesContainerDTOList // ignore: cast_nullable_to_non_nullable
              as List<CompatiblePaymentModesContainerDTO>?,
      attribute1: null == attribute1
          ? _value.attribute1
          : attribute1 // ignore: cast_nullable_to_non_nullable
              as String,
      attribute2: null == attribute2
          ? _value.attribute2
          : attribute2 // ignore: cast_nullable_to_non_nullable
              as String,
      attribute3: null == attribute3
          ? _value.attribute3
          : attribute3 // ignore: cast_nullable_to_non_nullable
              as String,
      attribute4: null == attribute4
          ? _value.attribute4
          : attribute4 // ignore: cast_nullable_to_non_nullable
              as String,
      attribute5: null == attribute5
          ? _value.attribute5
          : attribute5 // ignore: cast_nullable_to_non_nullable
              as String,
      autoShowTenderedAmountKeyPad: null == autoShowTenderedAmountKeyPad
          ? _value.autoShowTenderedAmountKeyPad
          : autoShowTenderedAmountKeyPad // ignore: cast_nullable_to_non_nullable
              as bool,
      printMerchantReceipt: null == printMerchantReceipt
          ? _value.printMerchantReceipt
          : printMerchantReceipt // ignore: cast_nullable_to_non_nullable
              as bool,
      printCustomerReceipt: null == printCustomerReceipt
          ? _value.printCustomerReceipt
          : printCustomerReceipt // ignore: cast_nullable_to_non_nullable
              as bool,
      enableTipAllocation: null == enableTipAllocation
          ? _value.enableTipAllocation
          : enableTipAllocation // ignore: cast_nullable_to_non_nullable
              as bool,
      allowCreditCardAuthorization: null == allowCreditCardAuthorization
          ? _value.allowCreditCardAuthorization
          : allowCreditCardAuthorization // ignore: cast_nullable_to_non_nullable
              as bool,
      allowCustomerToDecideEntryMode: null == allowCustomerToDecideEntryMode
          ? _value.allowCustomerToDecideEntryMode
          : allowCustomerToDecideEntryMode // ignore: cast_nullable_to_non_nullable
              as bool,
      enableAddressValidation: null == enableAddressValidation
          ? _value.enableAddressValidation
          : enableAddressValidation // ignore: cast_nullable_to_non_nullable
              as bool,
      enableSignatureVerification: null == enableSignatureVerification
          ? _value.enableSignatureVerification
          : enableSignatureVerification // ignore: cast_nullable_to_non_nullable
              as bool,
      enableAutoCreditcardAuthorization: null ==
              enableAutoCreditcardAuthorization
          ? _value.enableAutoCreditcardAuthorization
          : enableAutoCreditcardAuthorization // ignore: cast_nullable_to_non_nullable
              as bool,
      autoAcceptSignature: null == autoAcceptSignature
          ? _value.autoAcceptSignature
          : autoAcceptSignature // ignore: cast_nullable_to_non_nullable
              as bool,
      paymentDenominations: null == paymentDenominations
          ? _value.paymentDenominations
          : paymentDenominations // ignore: cast_nullable_to_non_nullable
              as String,
      ccPaymentReceiptPrint: null == ccPaymentReceiptPrint
          ? _value.ccPaymentReceiptPrint
          : ccPaymentReceiptPrint // ignore: cast_nullable_to_non_nullable
              as String,
      preAuthAmount: freezed == preAuthAmount
          ? _value.preAuthAmount
          : preAuthAmount // ignore: cast_nullable_to_non_nullable
              as dynamic,
      allowRefund: null == allowRefund
          ? _value.allowRefund
          : allowRefund // ignore: cast_nullable_to_non_nullable
              as bool,
      openCashDrawer: null == openCashDrawer
          ? _value.openCashDrawer
          : openCashDrawer // ignore: cast_nullable_to_non_nullable
              as bool,
      creditCardDetailsMandatory: null == creditCardDetailsMandatory
          ? _value.creditCardDetailsMandatory
          : creditCardDetailsMandatory // ignore: cast_nullable_to_non_nullable
              as bool,
      otpValidation: null == otpValidation
          ? _value.otpValidation
          : otpValidation // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PaymentModeContainerDTO implements _PaymentModeContainerDTO {
  const _$_PaymentModeContainerDTO(
      {@JsonKey(name: 'PaymentModeId')
          required this.paymentModeId,
      @JsonKey(name: 'PaymentMode')
          required this.paymentMode,
      @JsonKey(name: 'IsCreditCard')
          required this.isCreditCard,
      @JsonKey(name: 'PopupFakeNoteDetectionAlert')
          required this.popupFakeNoteDetectionAlert,
      @JsonKey(name: 'CreditCardSurchargePercentage')
          required this.creditCardSurchargePercentage,
      @JsonKey(name: 'Guid')
          required this.guid,
      @JsonKey(name: 'SynchStatus')
          required this.synchStatus,
      @JsonKey(name: 'IsCash')
          required this.isCash,
      @JsonKey(name: 'IsDebitCard')
          required this.isDebitCard,
      @JsonKey(name: 'IsCoupon')
          required this.isCoupon,
      @JsonKey(name: 'Gateway')
          required this.gateway,
      @JsonKey(name: 'ManagerApprovalRequired')
          required this.managerApprovalRequired,
      @JsonKey(name: 'IsRoundOff')
          required this.isRoundOff,
      @JsonKey(name: 'POSAvailable')
          required this.posAvailable,
      @JsonKey(name: 'DisplayOrder')
          required this.displayOrder,
      @JsonKey(name: 'ImageFileName')
          required this.imageFileName,
      @JsonKey(name: 'IsQRCode')
          required this.isQrCode,
      @JsonKey(name: 'PaymentReferenceMandatory')
          required this.paymentReferenceMandatory,
      @JsonKey(name: 'PaymentModeChannelsContainerDTOList')
          this.paymentModeChannelsContainerDTOList,
      @JsonKey(name: 'CompatiablePaymentModesContainerDTOList')
          final List<CompatiblePaymentModesContainerDTO>?
              compatiblePaymentModesContainerDTOList,
      @JsonKey(name: 'Attribute1')
          required this.attribute1,
      @JsonKey(name: 'Attribute2')
          required this.attribute2,
      @JsonKey(name: 'Attribute3')
          required this.attribute3,
      @JsonKey(name: 'Attribute4')
          required this.attribute4,
      @JsonKey(name: 'Attribute5')
          required this.attribute5,
      @JsonKey(name: 'AutoShowTenderedAmountKeyPad')
          required this.autoShowTenderedAmountKeyPad,
      @JsonKey(name: 'PrintMerchantReceipt')
          required this.printMerchantReceipt,
      @JsonKey(name: 'PrintCustomerReceipt')
          required this.printCustomerReceipt,
      @JsonKey(name: 'EnableTipAllocation')
          required this.enableTipAllocation,
      @JsonKey(name: 'AllowCreditCardAuthorization')
          required this.allowCreditCardAuthorization,
      @JsonKey(name: 'AllowCustomerToDecideEntryMode')
          required this.allowCustomerToDecideEntryMode,
      @JsonKey(name: 'EnableAddressValidation')
          required this.enableAddressValidation,
      @JsonKey(name: 'EnableSignatureVerification')
          required this.enableSignatureVerification,
      @JsonKey(name: 'EnableAutoCreditcardAuthorization')
          required this.enableAutoCreditcardAuthorization,
      @JsonKey(name: 'AutoAcceptSignature')
          required this.autoAcceptSignature,
      @JsonKey(name: 'PaymentDenominations')
          required this.paymentDenominations,
      @JsonKey(name: 'CcPaymentReceiptPrint')
          required this.ccPaymentReceiptPrint,
      @JsonKey(name: 'PreAuthAmount')
          this.preAuthAmount,
      @JsonKey(name: 'AllowRefund')
          required this.allowRefund,
      @JsonKey(name: 'OpenCashDrawer')
          required this.openCashDrawer,
      @JsonKey(name: 'CreditCardDetailsMandatory')
          required this.creditCardDetailsMandatory,
      @JsonKey(name: 'OTPValidation')
          required this.otpValidation})
      : _compatiblePaymentModesContainerDTOList =
            compatiblePaymentModesContainerDTOList;

  factory _$_PaymentModeContainerDTO.fromJson(Map<String, dynamic> json) =>
      _$$_PaymentModeContainerDTOFromJson(json);

  @override
  @JsonKey(name: 'PaymentModeId')
  final int paymentModeId;
  @override
  @JsonKey(name: 'PaymentMode')
  final String paymentMode;
  @override
  @JsonKey(name: 'IsCreditCard')
  final bool isCreditCard;
  @override
  @JsonKey(name: 'PopupFakeNoteDetectionAlert')
  final bool popupFakeNoteDetectionAlert;
  @override
  @JsonKey(name: 'CreditCardSurchargePercentage')
  final double creditCardSurchargePercentage;
  @override
  @JsonKey(name: 'Guid')
  final String guid;
  @override
  @JsonKey(name: 'SynchStatus')
  final bool synchStatus;
  @override
  @JsonKey(name: 'IsCash')
  final bool isCash;
  @override
  @JsonKey(name: 'IsDebitCard')
  final bool isDebitCard;
  @override
  @JsonKey(name: 'IsCoupon')
  final bool isCoupon;
  @override
  @JsonKey(name: 'Gateway')
  final int gateway;
  @override
  @JsonKey(name: 'ManagerApprovalRequired')
  final bool managerApprovalRequired;
  @override
  @JsonKey(name: 'IsRoundOff')
  final bool isRoundOff;
  @override
  @JsonKey(name: 'POSAvailable')
  final bool posAvailable;
  @override
  @JsonKey(name: 'DisplayOrder')
  final int displayOrder;
  @override
  @JsonKey(name: 'ImageFileName')
  final String imageFileName;
  @override
  @JsonKey(name: 'IsQRCode')
  final bool isQrCode;
  @override
  @JsonKey(name: 'PaymentReferenceMandatory')
  final bool paymentReferenceMandatory;
  @override
  @JsonKey(name: 'PaymentModeChannelsContainerDTOList')
  final dynamic paymentModeChannelsContainerDTOList;
  final List<CompatiblePaymentModesContainerDTO>?
      _compatiblePaymentModesContainerDTOList;
  @override
  @JsonKey(name: 'CompatiablePaymentModesContainerDTOList')
  List<CompatiblePaymentModesContainerDTO>?
      get compatiblePaymentModesContainerDTOList {
    final value = _compatiblePaymentModesContainerDTOList;
    if (value == null) return null;
    if (_compatiblePaymentModesContainerDTOList is EqualUnmodifiableListView)
      return _compatiblePaymentModesContainerDTOList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'Attribute1')
  final String attribute1;
  @override
  @JsonKey(name: 'Attribute2')
  final String attribute2;
  @override
  @JsonKey(name: 'Attribute3')
  final String attribute3;
  @override
  @JsonKey(name: 'Attribute4')
  final String attribute4;
  @override
  @JsonKey(name: 'Attribute5')
  final String attribute5;
  @override
  @JsonKey(name: 'AutoShowTenderedAmountKeyPad')
  final bool autoShowTenderedAmountKeyPad;
  @override
  @JsonKey(name: 'PrintMerchantReceipt')
  final bool printMerchantReceipt;
  @override
  @JsonKey(name: 'PrintCustomerReceipt')
  final bool printCustomerReceipt;
  @override
  @JsonKey(name: 'EnableTipAllocation')
  final bool enableTipAllocation;
  @override
  @JsonKey(name: 'AllowCreditCardAuthorization')
  final bool allowCreditCardAuthorization;
  @override
  @JsonKey(name: 'AllowCustomerToDecideEntryMode')
  final bool allowCustomerToDecideEntryMode;
  @override
  @JsonKey(name: 'EnableAddressValidation')
  final bool enableAddressValidation;
  @override
  @JsonKey(name: 'EnableSignatureVerification')
  final bool enableSignatureVerification;
  @override
  @JsonKey(name: 'EnableAutoCreditcardAuthorization')
  final bool enableAutoCreditcardAuthorization;
  @override
  @JsonKey(name: 'AutoAcceptSignature')
  final bool autoAcceptSignature;
  @override
  @JsonKey(name: 'PaymentDenominations')
  final String paymentDenominations;
  @override
  @JsonKey(name: 'CcPaymentReceiptPrint')
  final String ccPaymentReceiptPrint;
  @override
  @JsonKey(name: 'PreAuthAmount')
  final dynamic preAuthAmount;
  @override
  @JsonKey(name: 'AllowRefund')
  final bool allowRefund;
  @override
  @JsonKey(name: 'OpenCashDrawer')
  final bool openCashDrawer;
  @override
  @JsonKey(name: 'CreditCardDetailsMandatory')
  final bool creditCardDetailsMandatory;
  @override
  @JsonKey(name: 'OTPValidation')
  final bool otpValidation;

  @override
  String toString() {
    return 'PaymentModeContainerDTO(paymentModeId: $paymentModeId, paymentMode: $paymentMode, isCreditCard: $isCreditCard, popupFakeNoteDetectionAlert: $popupFakeNoteDetectionAlert, creditCardSurchargePercentage: $creditCardSurchargePercentage, guid: $guid, synchStatus: $synchStatus, isCash: $isCash, isDebitCard: $isDebitCard, isCoupon: $isCoupon, gateway: $gateway, managerApprovalRequired: $managerApprovalRequired, isRoundOff: $isRoundOff, posAvailable: $posAvailable, displayOrder: $displayOrder, imageFileName: $imageFileName, isQrCode: $isQrCode, paymentReferenceMandatory: $paymentReferenceMandatory, paymentModeChannelsContainerDTOList: $paymentModeChannelsContainerDTOList, compatiblePaymentModesContainerDTOList: $compatiblePaymentModesContainerDTOList, attribute1: $attribute1, attribute2: $attribute2, attribute3: $attribute3, attribute4: $attribute4, attribute5: $attribute5, autoShowTenderedAmountKeyPad: $autoShowTenderedAmountKeyPad, printMerchantReceipt: $printMerchantReceipt, printCustomerReceipt: $printCustomerReceipt, enableTipAllocation: $enableTipAllocation, allowCreditCardAuthorization: $allowCreditCardAuthorization, allowCustomerToDecideEntryMode: $allowCustomerToDecideEntryMode, enableAddressValidation: $enableAddressValidation, enableSignatureVerification: $enableSignatureVerification, enableAutoCreditcardAuthorization: $enableAutoCreditcardAuthorization, autoAcceptSignature: $autoAcceptSignature, paymentDenominations: $paymentDenominations, ccPaymentReceiptPrint: $ccPaymentReceiptPrint, preAuthAmount: $preAuthAmount, allowRefund: $allowRefund, openCashDrawer: $openCashDrawer, creditCardDetailsMandatory: $creditCardDetailsMandatory, otpValidation: $otpValidation)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PaymentModeContainerDTO &&
            (identical(other.paymentModeId, paymentModeId) ||
                other.paymentModeId == paymentModeId) &&
            (identical(other.paymentMode, paymentMode) ||
                other.paymentMode == paymentMode) &&
            (identical(other.isCreditCard, isCreditCard) ||
                other.isCreditCard == isCreditCard) &&
            (identical(other.popupFakeNoteDetectionAlert, popupFakeNoteDetectionAlert) ||
                other.popupFakeNoteDetectionAlert ==
                    popupFakeNoteDetectionAlert) &&
            (identical(other.creditCardSurchargePercentage, creditCardSurchargePercentage) ||
                other.creditCardSurchargePercentage ==
                    creditCardSurchargePercentage) &&
            (identical(other.guid, guid) || other.guid == guid) &&
            (identical(other.synchStatus, synchStatus) ||
                other.synchStatus == synchStatus) &&
            (identical(other.isCash, isCash) || other.isCash == isCash) &&
            (identical(other.isDebitCard, isDebitCard) ||
                other.isDebitCard == isDebitCard) &&
            (identical(other.isCoupon, isCoupon) ||
                other.isCoupon == isCoupon) &&
            (identical(other.gateway, gateway) || other.gateway == gateway) &&
            (identical(other.managerApprovalRequired, managerApprovalRequired) ||
                other.managerApprovalRequired == managerApprovalRequired) &&
            (identical(other.isRoundOff, isRoundOff) ||
                other.isRoundOff == isRoundOff) &&
            (identical(other.posAvailable, posAvailable) ||
                other.posAvailable == posAvailable) &&
            (identical(other.displayOrder, displayOrder) ||
                other.displayOrder == displayOrder) &&
            (identical(other.imageFileName, imageFileName) ||
                other.imageFileName == imageFileName) &&
            (identical(other.isQrCode, isQrCode) ||
                other.isQrCode == isQrCode) &&
            (identical(other.paymentReferenceMandatory, paymentReferenceMandatory) ||
                other.paymentReferenceMandatory == paymentReferenceMandatory) &&
            const DeepCollectionEquality().equals(
                other.paymentModeChannelsContainerDTOList,
                paymentModeChannelsContainerDTOList) &&
            const DeepCollectionEquality().equals(
                other._compatiblePaymentModesContainerDTOList,
                _compatiblePaymentModesContainerDTOList) &&
            (identical(other.attribute1, attribute1) ||
                other.attribute1 == attribute1) &&
            (identical(other.attribute2, attribute2) ||
                other.attribute2 == attribute2) &&
            (identical(other.attribute3, attribute3) ||
                other.attribute3 == attribute3) &&
            (identical(other.attribute4, attribute4) ||
                other.attribute4 == attribute4) &&
            (identical(other.attribute5, attribute5) || other.attribute5 == attribute5) &&
            (identical(other.autoShowTenderedAmountKeyPad, autoShowTenderedAmountKeyPad) || other.autoShowTenderedAmountKeyPad == autoShowTenderedAmountKeyPad) &&
            (identical(other.printMerchantReceipt, printMerchantReceipt) || other.printMerchantReceipt == printMerchantReceipt) &&
            (identical(other.printCustomerReceipt, printCustomerReceipt) || other.printCustomerReceipt == printCustomerReceipt) &&
            (identical(other.enableTipAllocation, enableTipAllocation) || other.enableTipAllocation == enableTipAllocation) &&
            (identical(other.allowCreditCardAuthorization, allowCreditCardAuthorization) || other.allowCreditCardAuthorization == allowCreditCardAuthorization) &&
            (identical(other.allowCustomerToDecideEntryMode, allowCustomerToDecideEntryMode) || other.allowCustomerToDecideEntryMode == allowCustomerToDecideEntryMode) &&
            (identical(other.enableAddressValidation, enableAddressValidation) || other.enableAddressValidation == enableAddressValidation) &&
            (identical(other.enableSignatureVerification, enableSignatureVerification) || other.enableSignatureVerification == enableSignatureVerification) &&
            (identical(other.enableAutoCreditcardAuthorization, enableAutoCreditcardAuthorization) || other.enableAutoCreditcardAuthorization == enableAutoCreditcardAuthorization) &&
            (identical(other.autoAcceptSignature, autoAcceptSignature) || other.autoAcceptSignature == autoAcceptSignature) &&
            (identical(other.paymentDenominations, paymentDenominations) || other.paymentDenominations == paymentDenominations) &&
            (identical(other.ccPaymentReceiptPrint, ccPaymentReceiptPrint) || other.ccPaymentReceiptPrint == ccPaymentReceiptPrint) &&
            const DeepCollectionEquality().equals(other.preAuthAmount, preAuthAmount) &&
            (identical(other.allowRefund, allowRefund) || other.allowRefund == allowRefund) &&
            (identical(other.openCashDrawer, openCashDrawer) || other.openCashDrawer == openCashDrawer) &&
            (identical(other.creditCardDetailsMandatory, creditCardDetailsMandatory) || other.creditCardDetailsMandatory == creditCardDetailsMandatory) &&
            (identical(other.otpValidation, otpValidation) || other.otpValidation == otpValidation));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        paymentModeId,
        paymentMode,
        isCreditCard,
        popupFakeNoteDetectionAlert,
        creditCardSurchargePercentage,
        guid,
        synchStatus,
        isCash,
        isDebitCard,
        isCoupon,
        gateway,
        managerApprovalRequired,
        isRoundOff,
        posAvailable,
        displayOrder,
        imageFileName,
        isQrCode,
        paymentReferenceMandatory,
        const DeepCollectionEquality()
            .hash(paymentModeChannelsContainerDTOList),
        const DeepCollectionEquality()
            .hash(_compatiblePaymentModesContainerDTOList),
        attribute1,
        attribute2,
        attribute3,
        attribute4,
        attribute5,
        autoShowTenderedAmountKeyPad,
        printMerchantReceipt,
        printCustomerReceipt,
        enableTipAllocation,
        allowCreditCardAuthorization,
        allowCustomerToDecideEntryMode,
        enableAddressValidation,
        enableSignatureVerification,
        enableAutoCreditcardAuthorization,
        autoAcceptSignature,
        paymentDenominations,
        ccPaymentReceiptPrint,
        const DeepCollectionEquality().hash(preAuthAmount),
        allowRefund,
        openCashDrawer,
        creditCardDetailsMandatory,
        otpValidation
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PaymentModeContainerDTOCopyWith<_$_PaymentModeContainerDTO>
      get copyWith =>
          __$$_PaymentModeContainerDTOCopyWithImpl<_$_PaymentModeContainerDTO>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PaymentModeContainerDTOToJson(
      this,
    );
  }
}

abstract class _PaymentModeContainerDTO implements PaymentModeContainerDTO {
  const factory _PaymentModeContainerDTO(
      {@JsonKey(name: 'PaymentModeId')
          required final int paymentModeId,
      @JsonKey(name: 'PaymentMode')
          required final String paymentMode,
      @JsonKey(name: 'IsCreditCard')
          required final bool isCreditCard,
      @JsonKey(name: 'PopupFakeNoteDetectionAlert')
          required final bool popupFakeNoteDetectionAlert,
      @JsonKey(name: 'CreditCardSurchargePercentage')
          required final double creditCardSurchargePercentage,
      @JsonKey(name: 'Guid')
          required final String guid,
      @JsonKey(name: 'SynchStatus')
          required final bool synchStatus,
      @JsonKey(name: 'IsCash')
          required final bool isCash,
      @JsonKey(name: 'IsDebitCard')
          required final bool isDebitCard,
      @JsonKey(name: 'IsCoupon')
          required final bool isCoupon,
      @JsonKey(name: 'Gateway')
          required final int gateway,
      @JsonKey(name: 'ManagerApprovalRequired')
          required final bool managerApprovalRequired,
      @JsonKey(name: 'IsRoundOff')
          required final bool isRoundOff,
      @JsonKey(name: 'POSAvailable')
          required final bool posAvailable,
      @JsonKey(name: 'DisplayOrder')
          required final int displayOrder,
      @JsonKey(name: 'ImageFileName')
          required final String imageFileName,
      @JsonKey(name: 'IsQRCode')
          required final bool isQrCode,
      @JsonKey(name: 'PaymentReferenceMandatory')
          required final bool paymentReferenceMandatory,
      @JsonKey(name: 'PaymentModeChannelsContainerDTOList')
          final dynamic paymentModeChannelsContainerDTOList,
      @JsonKey(name: 'CompatiablePaymentModesContainerDTOList')
          final List<CompatiblePaymentModesContainerDTO>?
              compatiblePaymentModesContainerDTOList,
      @JsonKey(name: 'Attribute1')
          required final String attribute1,
      @JsonKey(name: 'Attribute2')
          required final String attribute2,
      @JsonKey(name: 'Attribute3')
          required final String attribute3,
      @JsonKey(name: 'Attribute4')
          required final String attribute4,
      @JsonKey(name: 'Attribute5')
          required final String attribute5,
      @JsonKey(name: 'AutoShowTenderedAmountKeyPad')
          required final bool autoShowTenderedAmountKeyPad,
      @JsonKey(name: 'PrintMerchantReceipt')
          required final bool printMerchantReceipt,
      @JsonKey(name: 'PrintCustomerReceipt')
          required final bool printCustomerReceipt,
      @JsonKey(name: 'EnableTipAllocation')
          required final bool enableTipAllocation,
      @JsonKey(name: 'AllowCreditCardAuthorization')
          required final bool allowCreditCardAuthorization,
      @JsonKey(name: 'AllowCustomerToDecideEntryMode')
          required final bool allowCustomerToDecideEntryMode,
      @JsonKey(name: 'EnableAddressValidation')
          required final bool enableAddressValidation,
      @JsonKey(name: 'EnableSignatureVerification')
          required final bool enableSignatureVerification,
      @JsonKey(name: 'EnableAutoCreditcardAuthorization')
          required final bool enableAutoCreditcardAuthorization,
      @JsonKey(name: 'AutoAcceptSignature')
          required final bool autoAcceptSignature,
      @JsonKey(name: 'PaymentDenominations')
          required final String paymentDenominations,
      @JsonKey(name: 'CcPaymentReceiptPrint')
          required final String ccPaymentReceiptPrint,
      @JsonKey(name: 'PreAuthAmount')
          final dynamic preAuthAmount,
      @JsonKey(name: 'AllowRefund')
          required final bool allowRefund,
      @JsonKey(name: 'OpenCashDrawer')
          required final bool openCashDrawer,
      @JsonKey(name: 'CreditCardDetailsMandatory')
          required final bool creditCardDetailsMandatory,
      @JsonKey(name: 'OTPValidation')
          required final bool otpValidation}) = _$_PaymentModeContainerDTO;

  factory _PaymentModeContainerDTO.fromJson(Map<String, dynamic> json) =
      _$_PaymentModeContainerDTO.fromJson;

  @override
  @JsonKey(name: 'PaymentModeId')
  int get paymentModeId;
  @override
  @JsonKey(name: 'PaymentMode')
  String get paymentMode;
  @override
  @JsonKey(name: 'IsCreditCard')
  bool get isCreditCard;
  @override
  @JsonKey(name: 'PopupFakeNoteDetectionAlert')
  bool get popupFakeNoteDetectionAlert;
  @override
  @JsonKey(name: 'CreditCardSurchargePercentage')
  double get creditCardSurchargePercentage;
  @override
  @JsonKey(name: 'Guid')
  String get guid;
  @override
  @JsonKey(name: 'SynchStatus')
  bool get synchStatus;
  @override
  @JsonKey(name: 'IsCash')
  bool get isCash;
  @override
  @JsonKey(name: 'IsDebitCard')
  bool get isDebitCard;
  @override
  @JsonKey(name: 'IsCoupon')
  bool get isCoupon;
  @override
  @JsonKey(name: 'Gateway')
  int get gateway;
  @override
  @JsonKey(name: 'ManagerApprovalRequired')
  bool get managerApprovalRequired;
  @override
  @JsonKey(name: 'IsRoundOff')
  bool get isRoundOff;
  @override
  @JsonKey(name: 'POSAvailable')
  bool get posAvailable;
  @override
  @JsonKey(name: 'DisplayOrder')
  int get displayOrder;
  @override
  @JsonKey(name: 'ImageFileName')
  String get imageFileName;
  @override
  @JsonKey(name: 'IsQRCode')
  bool get isQrCode;
  @override
  @JsonKey(name: 'PaymentReferenceMandatory')
  bool get paymentReferenceMandatory;
  @override
  @JsonKey(name: 'PaymentModeChannelsContainerDTOList')
  dynamic get paymentModeChannelsContainerDTOList;
  @override
  @JsonKey(name: 'CompatiablePaymentModesContainerDTOList')
  List<CompatiblePaymentModesContainerDTO>?
      get compatiblePaymentModesContainerDTOList;
  @override
  @JsonKey(name: 'Attribute1')
  String get attribute1;
  @override
  @JsonKey(name: 'Attribute2')
  String get attribute2;
  @override
  @JsonKey(name: 'Attribute3')
  String get attribute3;
  @override
  @JsonKey(name: 'Attribute4')
  String get attribute4;
  @override
  @JsonKey(name: 'Attribute5')
  String get attribute5;
  @override
  @JsonKey(name: 'AutoShowTenderedAmountKeyPad')
  bool get autoShowTenderedAmountKeyPad;
  @override
  @JsonKey(name: 'PrintMerchantReceipt')
  bool get printMerchantReceipt;
  @override
  @JsonKey(name: 'PrintCustomerReceipt')
  bool get printCustomerReceipt;
  @override
  @JsonKey(name: 'EnableTipAllocation')
  bool get enableTipAllocation;
  @override
  @JsonKey(name: 'AllowCreditCardAuthorization')
  bool get allowCreditCardAuthorization;
  @override
  @JsonKey(name: 'AllowCustomerToDecideEntryMode')
  bool get allowCustomerToDecideEntryMode;
  @override
  @JsonKey(name: 'EnableAddressValidation')
  bool get enableAddressValidation;
  @override
  @JsonKey(name: 'EnableSignatureVerification')
  bool get enableSignatureVerification;
  @override
  @JsonKey(name: 'EnableAutoCreditcardAuthorization')
  bool get enableAutoCreditcardAuthorization;
  @override
  @JsonKey(name: 'AutoAcceptSignature')
  bool get autoAcceptSignature;
  @override
  @JsonKey(name: 'PaymentDenominations')
  String get paymentDenominations;
  @override
  @JsonKey(name: 'CcPaymentReceiptPrint')
  String get ccPaymentReceiptPrint;
  @override
  @JsonKey(name: 'PreAuthAmount')
  dynamic get preAuthAmount;
  @override
  @JsonKey(name: 'AllowRefund')
  bool get allowRefund;
  @override
  @JsonKey(name: 'OpenCashDrawer')
  bool get openCashDrawer;
  @override
  @JsonKey(name: 'CreditCardDetailsMandatory')
  bool get creditCardDetailsMandatory;
  @override
  @JsonKey(name: 'OTPValidation')
  bool get otpValidation;
  @override
  @JsonKey(ignore: true)
  _$$_PaymentModeContainerDTOCopyWith<_$_PaymentModeContainerDTO>
      get copyWith => throw _privateConstructorUsedError;
}
