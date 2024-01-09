// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'shift_action_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ShiftActionDTO _$ShiftActionDTOFromJson(Map<String, dynamic> json) {
  return _ShiftActionDTO.fromJson(json);
}

/// @nodoc
mixin _$ShiftActionDTO {
  @JsonKey(name: 'ShiftId')
  int get shiftId => throw _privateConstructorUsedError;
  @JsonKey(name: 'ShiftLogId')
  int get shiftLogId => throw _privateConstructorUsedError;
  @JsonKey(name: 'ShiftAction')
  String? get shiftAction => throw _privateConstructorUsedError;
  @JsonKey(name: 'ShiftAmount')
  double? get shiftAmount => throw _privateConstructorUsedError;
  @JsonKey(name: 'Cardcount')
  int get cardcount => throw _privateConstructorUsedError;
  @JsonKey(name: 'ShiftTicketNumber')
  String? get shiftTicketNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'ShiftRemarks')
  String? get shiftRemarks => throw _privateConstructorUsedError;
  @JsonKey(name: 'ActualAmount')
  double? get actualAmount => throw _privateConstructorUsedError;
  @JsonKey(name: 'ActualCards')
  int? get actualCards => throw _privateConstructorUsedError;
  @JsonKey(name: 'ActualTickets')
  int? get actualTickets => throw _privateConstructorUsedError;
  @JsonKey(name: 'GameCardAmount')
  int? get gameCardAmount => throw _privateConstructorUsedError;
  @JsonKey(name: 'CreditCardAmount')
  double? get creditCardAmount => throw _privateConstructorUsedError;
  @JsonKey(name: 'ChequeAmount')
  double? get chequeAmount => throw _privateConstructorUsedError;
  @JsonKey(name: 'CouponAmount')
  double? get couponAmount => throw _privateConstructorUsedError;
  @JsonKey(name: 'ActualGameCardAmount')
  double? get actualGameCardAmount => throw _privateConstructorUsedError;
  @JsonKey(name: 'ActualCreditCardAmount')
  double? get actualCreditCardAmount => throw _privateConstructorUsedError;
  @JsonKey(name: 'ActualChequeAmount')
  double? get actualChequeAmount => throw _privateConstructorUsedError;
  @JsonKey(name: 'ActualCouponAmount')
  double? get actualCouponAmount => throw _privateConstructorUsedError;
  @JsonKey(name: 'ShiftReason')
  String? get shiftReason => throw _privateConstructorUsedError;
  @JsonKey(name: 'CashDRawerId')
  int get cashDRawerId => throw _privateConstructorUsedError;
  @JsonKey(name: 'ShiftUserName')
  String? get shiftUserName => throw _privateConstructorUsedError;
  @JsonKey(name: 'ShiftLoginId')
  String? get shiftLoginId => throw _privateConstructorUsedError;
  @JsonKey(name: 'PosMachineName')
  String? get posMachineName => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsShareable')
  bool get isShareable => throw _privateConstructorUsedError;
  @JsonKey(name: 'CashDrawerStatusId')
  int get cashDrawerStatusId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ShiftActionDTOCopyWith<ShiftActionDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShiftActionDTOCopyWith<$Res> {
  factory $ShiftActionDTOCopyWith(
          ShiftActionDTO value, $Res Function(ShiftActionDTO) then) =
      _$ShiftActionDTOCopyWithImpl<$Res, ShiftActionDTO>;
  @useResult
  $Res call(
      {@JsonKey(name: 'ShiftId') int shiftId,
      @JsonKey(name: 'ShiftLogId') int shiftLogId,
      @JsonKey(name: 'ShiftAction') String? shiftAction,
      @JsonKey(name: 'ShiftAmount') double? shiftAmount,
      @JsonKey(name: 'Cardcount') int cardcount,
      @JsonKey(name: 'ShiftTicketNumber') String? shiftTicketNumber,
      @JsonKey(name: 'ShiftRemarks') String? shiftRemarks,
      @JsonKey(name: 'ActualAmount') double? actualAmount,
      @JsonKey(name: 'ActualCards') int? actualCards,
      @JsonKey(name: 'ActualTickets') int? actualTickets,
      @JsonKey(name: 'GameCardAmount') int? gameCardAmount,
      @JsonKey(name: 'CreditCardAmount') double? creditCardAmount,
      @JsonKey(name: 'ChequeAmount') double? chequeAmount,
      @JsonKey(name: 'CouponAmount') double? couponAmount,
      @JsonKey(name: 'ActualGameCardAmount') double? actualGameCardAmount,
      @JsonKey(name: 'ActualCreditCardAmount') double? actualCreditCardAmount,
      @JsonKey(name: 'ActualChequeAmount') double? actualChequeAmount,
      @JsonKey(name: 'ActualCouponAmount') double? actualCouponAmount,
      @JsonKey(name: 'ShiftReason') String? shiftReason,
      @JsonKey(name: 'CashDRawerId') int cashDRawerId,
      @JsonKey(name: 'ShiftUserName') String? shiftUserName,
      @JsonKey(name: 'ShiftLoginId') String? shiftLoginId,
      @JsonKey(name: 'PosMachineName') String? posMachineName,
      @JsonKey(name: 'IsShareable') bool isShareable,
      @JsonKey(name: 'CashDrawerStatusId') int cashDrawerStatusId});
}

/// @nodoc
class _$ShiftActionDTOCopyWithImpl<$Res, $Val extends ShiftActionDTO>
    implements $ShiftActionDTOCopyWith<$Res> {
  _$ShiftActionDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? shiftId = null,
    Object? shiftLogId = null,
    Object? shiftAction = freezed,
    Object? shiftAmount = freezed,
    Object? cardcount = null,
    Object? shiftTicketNumber = freezed,
    Object? shiftRemarks = freezed,
    Object? actualAmount = freezed,
    Object? actualCards = freezed,
    Object? actualTickets = freezed,
    Object? gameCardAmount = freezed,
    Object? creditCardAmount = freezed,
    Object? chequeAmount = freezed,
    Object? couponAmount = freezed,
    Object? actualGameCardAmount = freezed,
    Object? actualCreditCardAmount = freezed,
    Object? actualChequeAmount = freezed,
    Object? actualCouponAmount = freezed,
    Object? shiftReason = freezed,
    Object? cashDRawerId = null,
    Object? shiftUserName = freezed,
    Object? shiftLoginId = freezed,
    Object? posMachineName = freezed,
    Object? isShareable = null,
    Object? cashDrawerStatusId = null,
  }) {
    return _then(_value.copyWith(
      shiftId: null == shiftId
          ? _value.shiftId
          : shiftId // ignore: cast_nullable_to_non_nullable
              as int,
      shiftLogId: null == shiftLogId
          ? _value.shiftLogId
          : shiftLogId // ignore: cast_nullable_to_non_nullable
              as int,
      shiftAction: freezed == shiftAction
          ? _value.shiftAction
          : shiftAction // ignore: cast_nullable_to_non_nullable
              as String?,
      shiftAmount: freezed == shiftAmount
          ? _value.shiftAmount
          : shiftAmount // ignore: cast_nullable_to_non_nullable
              as double?,
      cardcount: null == cardcount
          ? _value.cardcount
          : cardcount // ignore: cast_nullable_to_non_nullable
              as int,
      shiftTicketNumber: freezed == shiftTicketNumber
          ? _value.shiftTicketNumber
          : shiftTicketNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      shiftRemarks: freezed == shiftRemarks
          ? _value.shiftRemarks
          : shiftRemarks // ignore: cast_nullable_to_non_nullable
              as String?,
      actualAmount: freezed == actualAmount
          ? _value.actualAmount
          : actualAmount // ignore: cast_nullable_to_non_nullable
              as double?,
      actualCards: freezed == actualCards
          ? _value.actualCards
          : actualCards // ignore: cast_nullable_to_non_nullable
              as int?,
      actualTickets: freezed == actualTickets
          ? _value.actualTickets
          : actualTickets // ignore: cast_nullable_to_non_nullable
              as int?,
      gameCardAmount: freezed == gameCardAmount
          ? _value.gameCardAmount
          : gameCardAmount // ignore: cast_nullable_to_non_nullable
              as int?,
      creditCardAmount: freezed == creditCardAmount
          ? _value.creditCardAmount
          : creditCardAmount // ignore: cast_nullable_to_non_nullable
              as double?,
      chequeAmount: freezed == chequeAmount
          ? _value.chequeAmount
          : chequeAmount // ignore: cast_nullable_to_non_nullable
              as double?,
      couponAmount: freezed == couponAmount
          ? _value.couponAmount
          : couponAmount // ignore: cast_nullable_to_non_nullable
              as double?,
      actualGameCardAmount: freezed == actualGameCardAmount
          ? _value.actualGameCardAmount
          : actualGameCardAmount // ignore: cast_nullable_to_non_nullable
              as double?,
      actualCreditCardAmount: freezed == actualCreditCardAmount
          ? _value.actualCreditCardAmount
          : actualCreditCardAmount // ignore: cast_nullable_to_non_nullable
              as double?,
      actualChequeAmount: freezed == actualChequeAmount
          ? _value.actualChequeAmount
          : actualChequeAmount // ignore: cast_nullable_to_non_nullable
              as double?,
      actualCouponAmount: freezed == actualCouponAmount
          ? _value.actualCouponAmount
          : actualCouponAmount // ignore: cast_nullable_to_non_nullable
              as double?,
      shiftReason: freezed == shiftReason
          ? _value.shiftReason
          : shiftReason // ignore: cast_nullable_to_non_nullable
              as String?,
      cashDRawerId: null == cashDRawerId
          ? _value.cashDRawerId
          : cashDRawerId // ignore: cast_nullable_to_non_nullable
              as int,
      shiftUserName: freezed == shiftUserName
          ? _value.shiftUserName
          : shiftUserName // ignore: cast_nullable_to_non_nullable
              as String?,
      shiftLoginId: freezed == shiftLoginId
          ? _value.shiftLoginId
          : shiftLoginId // ignore: cast_nullable_to_non_nullable
              as String?,
      posMachineName: freezed == posMachineName
          ? _value.posMachineName
          : posMachineName // ignore: cast_nullable_to_non_nullable
              as String?,
      isShareable: null == isShareable
          ? _value.isShareable
          : isShareable // ignore: cast_nullable_to_non_nullable
              as bool,
      cashDrawerStatusId: null == cashDrawerStatusId
          ? _value.cashDrawerStatusId
          : cashDrawerStatusId // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ShiftActionDTOCopyWith<$Res>
    implements $ShiftActionDTOCopyWith<$Res> {
  factory _$$_ShiftActionDTOCopyWith(
          _$_ShiftActionDTO value, $Res Function(_$_ShiftActionDTO) then) =
      __$$_ShiftActionDTOCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'ShiftId') int shiftId,
      @JsonKey(name: 'ShiftLogId') int shiftLogId,
      @JsonKey(name: 'ShiftAction') String? shiftAction,
      @JsonKey(name: 'ShiftAmount') double? shiftAmount,
      @JsonKey(name: 'Cardcount') int cardcount,
      @JsonKey(name: 'ShiftTicketNumber') String? shiftTicketNumber,
      @JsonKey(name: 'ShiftRemarks') String? shiftRemarks,
      @JsonKey(name: 'ActualAmount') double? actualAmount,
      @JsonKey(name: 'ActualCards') int? actualCards,
      @JsonKey(name: 'ActualTickets') int? actualTickets,
      @JsonKey(name: 'GameCardAmount') int? gameCardAmount,
      @JsonKey(name: 'CreditCardAmount') double? creditCardAmount,
      @JsonKey(name: 'ChequeAmount') double? chequeAmount,
      @JsonKey(name: 'CouponAmount') double? couponAmount,
      @JsonKey(name: 'ActualGameCardAmount') double? actualGameCardAmount,
      @JsonKey(name: 'ActualCreditCardAmount') double? actualCreditCardAmount,
      @JsonKey(name: 'ActualChequeAmount') double? actualChequeAmount,
      @JsonKey(name: 'ActualCouponAmount') double? actualCouponAmount,
      @JsonKey(name: 'ShiftReason') String? shiftReason,
      @JsonKey(name: 'CashDRawerId') int cashDRawerId,
      @JsonKey(name: 'ShiftUserName') String? shiftUserName,
      @JsonKey(name: 'ShiftLoginId') String? shiftLoginId,
      @JsonKey(name: 'PosMachineName') String? posMachineName,
      @JsonKey(name: 'IsShareable') bool isShareable,
      @JsonKey(name: 'CashDrawerStatusId') int cashDrawerStatusId});
}

/// @nodoc
class __$$_ShiftActionDTOCopyWithImpl<$Res>
    extends _$ShiftActionDTOCopyWithImpl<$Res, _$_ShiftActionDTO>
    implements _$$_ShiftActionDTOCopyWith<$Res> {
  __$$_ShiftActionDTOCopyWithImpl(
      _$_ShiftActionDTO _value, $Res Function(_$_ShiftActionDTO) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? shiftId = null,
    Object? shiftLogId = null,
    Object? shiftAction = freezed,
    Object? shiftAmount = freezed,
    Object? cardcount = null,
    Object? shiftTicketNumber = freezed,
    Object? shiftRemarks = freezed,
    Object? actualAmount = freezed,
    Object? actualCards = freezed,
    Object? actualTickets = freezed,
    Object? gameCardAmount = freezed,
    Object? creditCardAmount = freezed,
    Object? chequeAmount = freezed,
    Object? couponAmount = freezed,
    Object? actualGameCardAmount = freezed,
    Object? actualCreditCardAmount = freezed,
    Object? actualChequeAmount = freezed,
    Object? actualCouponAmount = freezed,
    Object? shiftReason = freezed,
    Object? cashDRawerId = null,
    Object? shiftUserName = freezed,
    Object? shiftLoginId = freezed,
    Object? posMachineName = freezed,
    Object? isShareable = null,
    Object? cashDrawerStatusId = null,
  }) {
    return _then(_$_ShiftActionDTO(
      shiftId: null == shiftId
          ? _value.shiftId
          : shiftId // ignore: cast_nullable_to_non_nullable
              as int,
      shiftLogId: null == shiftLogId
          ? _value.shiftLogId
          : shiftLogId // ignore: cast_nullable_to_non_nullable
              as int,
      shiftAction: freezed == shiftAction
          ? _value.shiftAction
          : shiftAction // ignore: cast_nullable_to_non_nullable
              as String?,
      shiftAmount: freezed == shiftAmount
          ? _value.shiftAmount
          : shiftAmount // ignore: cast_nullable_to_non_nullable
              as double?,
      cardcount: null == cardcount
          ? _value.cardcount
          : cardcount // ignore: cast_nullable_to_non_nullable
              as int,
      shiftTicketNumber: freezed == shiftTicketNumber
          ? _value.shiftTicketNumber
          : shiftTicketNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      shiftRemarks: freezed == shiftRemarks
          ? _value.shiftRemarks
          : shiftRemarks // ignore: cast_nullable_to_non_nullable
              as String?,
      actualAmount: freezed == actualAmount
          ? _value.actualAmount
          : actualAmount // ignore: cast_nullable_to_non_nullable
              as double?,
      actualCards: freezed == actualCards
          ? _value.actualCards
          : actualCards // ignore: cast_nullable_to_non_nullable
              as int?,
      actualTickets: freezed == actualTickets
          ? _value.actualTickets
          : actualTickets // ignore: cast_nullable_to_non_nullable
              as int?,
      gameCardAmount: freezed == gameCardAmount
          ? _value.gameCardAmount
          : gameCardAmount // ignore: cast_nullable_to_non_nullable
              as int?,
      creditCardAmount: freezed == creditCardAmount
          ? _value.creditCardAmount
          : creditCardAmount // ignore: cast_nullable_to_non_nullable
              as double?,
      chequeAmount: freezed == chequeAmount
          ? _value.chequeAmount
          : chequeAmount // ignore: cast_nullable_to_non_nullable
              as double?,
      couponAmount: freezed == couponAmount
          ? _value.couponAmount
          : couponAmount // ignore: cast_nullable_to_non_nullable
              as double?,
      actualGameCardAmount: freezed == actualGameCardAmount
          ? _value.actualGameCardAmount
          : actualGameCardAmount // ignore: cast_nullable_to_non_nullable
              as double?,
      actualCreditCardAmount: freezed == actualCreditCardAmount
          ? _value.actualCreditCardAmount
          : actualCreditCardAmount // ignore: cast_nullable_to_non_nullable
              as double?,
      actualChequeAmount: freezed == actualChequeAmount
          ? _value.actualChequeAmount
          : actualChequeAmount // ignore: cast_nullable_to_non_nullable
              as double?,
      actualCouponAmount: freezed == actualCouponAmount
          ? _value.actualCouponAmount
          : actualCouponAmount // ignore: cast_nullable_to_non_nullable
              as double?,
      shiftReason: freezed == shiftReason
          ? _value.shiftReason
          : shiftReason // ignore: cast_nullable_to_non_nullable
              as String?,
      cashDRawerId: null == cashDRawerId
          ? _value.cashDRawerId
          : cashDRawerId // ignore: cast_nullable_to_non_nullable
              as int,
      shiftUserName: freezed == shiftUserName
          ? _value.shiftUserName
          : shiftUserName // ignore: cast_nullable_to_non_nullable
              as String?,
      shiftLoginId: freezed == shiftLoginId
          ? _value.shiftLoginId
          : shiftLoginId // ignore: cast_nullable_to_non_nullable
              as String?,
      posMachineName: freezed == posMachineName
          ? _value.posMachineName
          : posMachineName // ignore: cast_nullable_to_non_nullable
              as String?,
      isShareable: null == isShareable
          ? _value.isShareable
          : isShareable // ignore: cast_nullable_to_non_nullable
              as bool,
      cashDrawerStatusId: null == cashDrawerStatusId
          ? _value.cashDrawerStatusId
          : cashDrawerStatusId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ShiftActionDTO
    with DiagnosticableTreeMixin
    implements _ShiftActionDTO {
  const _$_ShiftActionDTO(
      {@JsonKey(name: 'ShiftId') required this.shiftId,
      @JsonKey(name: 'ShiftLogId') required this.shiftLogId,
      @JsonKey(name: 'ShiftAction') this.shiftAction,
      @JsonKey(name: 'ShiftAmount') required this.shiftAmount,
      @JsonKey(name: 'Cardcount') required this.cardcount,
      @JsonKey(name: 'ShiftTicketNumber') this.shiftTicketNumber,
      @JsonKey(name: 'ShiftRemarks') this.shiftRemarks,
      @JsonKey(name: 'ActualAmount') this.actualAmount,
      @JsonKey(name: 'ActualCards') this.actualCards,
      @JsonKey(name: 'ActualTickets') this.actualTickets,
      @JsonKey(name: 'GameCardAmount') this.gameCardAmount,
      @JsonKey(name: 'CreditCardAmount') this.creditCardAmount,
      @JsonKey(name: 'ChequeAmount') this.chequeAmount,
      @JsonKey(name: 'CouponAmount') this.couponAmount,
      @JsonKey(name: 'ActualGameCardAmount') this.actualGameCardAmount,
      @JsonKey(name: 'ActualCreditCardAmount') this.actualCreditCardAmount,
      @JsonKey(name: 'ActualChequeAmount') this.actualChequeAmount,
      @JsonKey(name: 'ActualCouponAmount') this.actualCouponAmount,
      @JsonKey(name: 'ShiftReason') this.shiftReason,
      @JsonKey(name: 'CashDRawerId') required this.cashDRawerId,
      @JsonKey(name: 'ShiftUserName') this.shiftUserName,
      @JsonKey(name: 'ShiftLoginId') required this.shiftLoginId,
      @JsonKey(name: 'PosMachineName') required this.posMachineName,
      @JsonKey(name: 'IsShareable') required this.isShareable,
      @JsonKey(name: 'CashDrawerStatusId') required this.cashDrawerStatusId});

  factory _$_ShiftActionDTO.fromJson(Map<String, dynamic> json) =>
      _$$_ShiftActionDTOFromJson(json);

  @override
  @JsonKey(name: 'ShiftId')
  final int shiftId;
  @override
  @JsonKey(name: 'ShiftLogId')
  final int shiftLogId;
  @override
  @JsonKey(name: 'ShiftAction')
  final String? shiftAction;
  @override
  @JsonKey(name: 'ShiftAmount')
  final double? shiftAmount;
  @override
  @JsonKey(name: 'Cardcount')
  final int cardcount;
  @override
  @JsonKey(name: 'ShiftTicketNumber')
  final String? shiftTicketNumber;
  @override
  @JsonKey(name: 'ShiftRemarks')
  final String? shiftRemarks;
  @override
  @JsonKey(name: 'ActualAmount')
  final double? actualAmount;
  @override
  @JsonKey(name: 'ActualCards')
  final int? actualCards;
  @override
  @JsonKey(name: 'ActualTickets')
  final int? actualTickets;
  @override
  @JsonKey(name: 'GameCardAmount')
  final int? gameCardAmount;
  @override
  @JsonKey(name: 'CreditCardAmount')
  final double? creditCardAmount;
  @override
  @JsonKey(name: 'ChequeAmount')
  final double? chequeAmount;
  @override
  @JsonKey(name: 'CouponAmount')
  final double? couponAmount;
  @override
  @JsonKey(name: 'ActualGameCardAmount')
  final double? actualGameCardAmount;
  @override
  @JsonKey(name: 'ActualCreditCardAmount')
  final double? actualCreditCardAmount;
  @override
  @JsonKey(name: 'ActualChequeAmount')
  final double? actualChequeAmount;
  @override
  @JsonKey(name: 'ActualCouponAmount')
  final double? actualCouponAmount;
  @override
  @JsonKey(name: 'ShiftReason')
  final String? shiftReason;
  @override
  @JsonKey(name: 'CashDRawerId')
  final int cashDRawerId;
  @override
  @JsonKey(name: 'ShiftUserName')
  final String? shiftUserName;
  @override
  @JsonKey(name: 'ShiftLoginId')
  final String? shiftLoginId;
  @override
  @JsonKey(name: 'PosMachineName')
  final String? posMachineName;
  @override
  @JsonKey(name: 'IsShareable')
  final bool isShareable;
  @override
  @JsonKey(name: 'CashDrawerStatusId')
  final int cashDrawerStatusId;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ShiftActionDTO(shiftId: $shiftId, shiftLogId: $shiftLogId, shiftAction: $shiftAction, shiftAmount: $shiftAmount, cardcount: $cardcount, shiftTicketNumber: $shiftTicketNumber, shiftRemarks: $shiftRemarks, actualAmount: $actualAmount, actualCards: $actualCards, actualTickets: $actualTickets, gameCardAmount: $gameCardAmount, creditCardAmount: $creditCardAmount, chequeAmount: $chequeAmount, couponAmount: $couponAmount, actualGameCardAmount: $actualGameCardAmount, actualCreditCardAmount: $actualCreditCardAmount, actualChequeAmount: $actualChequeAmount, actualCouponAmount: $actualCouponAmount, shiftReason: $shiftReason, cashDRawerId: $cashDRawerId, shiftUserName: $shiftUserName, shiftLoginId: $shiftLoginId, posMachineName: $posMachineName, isShareable: $isShareable, cashDrawerStatusId: $cashDrawerStatusId)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ShiftActionDTO'))
      ..add(DiagnosticsProperty('shiftId', shiftId))
      ..add(DiagnosticsProperty('shiftLogId', shiftLogId))
      ..add(DiagnosticsProperty('shiftAction', shiftAction))
      ..add(DiagnosticsProperty('shiftAmount', shiftAmount))
      ..add(DiagnosticsProperty('cardcount', cardcount))
      ..add(DiagnosticsProperty('shiftTicketNumber', shiftTicketNumber))
      ..add(DiagnosticsProperty('shiftRemarks', shiftRemarks))
      ..add(DiagnosticsProperty('actualAmount', actualAmount))
      ..add(DiagnosticsProperty('actualCards', actualCards))
      ..add(DiagnosticsProperty('actualTickets', actualTickets))
      ..add(DiagnosticsProperty('gameCardAmount', gameCardAmount))
      ..add(DiagnosticsProperty('creditCardAmount', creditCardAmount))
      ..add(DiagnosticsProperty('chequeAmount', chequeAmount))
      ..add(DiagnosticsProperty('couponAmount', couponAmount))
      ..add(DiagnosticsProperty('actualGameCardAmount', actualGameCardAmount))
      ..add(
          DiagnosticsProperty('actualCreditCardAmount', actualCreditCardAmount))
      ..add(DiagnosticsProperty('actualChequeAmount', actualChequeAmount))
      ..add(DiagnosticsProperty('actualCouponAmount', actualCouponAmount))
      ..add(DiagnosticsProperty('shiftReason', shiftReason))
      ..add(DiagnosticsProperty('cashDRawerId', cashDRawerId))
      ..add(DiagnosticsProperty('shiftUserName', shiftUserName))
      ..add(DiagnosticsProperty('shiftLoginId', shiftLoginId))
      ..add(DiagnosticsProperty('posMachineName', posMachineName))
      ..add(DiagnosticsProperty('isShareable', isShareable))
      ..add(DiagnosticsProperty('cashDrawerStatusId', cashDrawerStatusId));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ShiftActionDTO &&
            (identical(other.shiftId, shiftId) || other.shiftId == shiftId) &&
            (identical(other.shiftLogId, shiftLogId) ||
                other.shiftLogId == shiftLogId) &&
            (identical(other.shiftAction, shiftAction) ||
                other.shiftAction == shiftAction) &&
            (identical(other.shiftAmount, shiftAmount) ||
                other.shiftAmount == shiftAmount) &&
            (identical(other.cardcount, cardcount) ||
                other.cardcount == cardcount) &&
            (identical(other.shiftTicketNumber, shiftTicketNumber) ||
                other.shiftTicketNumber == shiftTicketNumber) &&
            (identical(other.shiftRemarks, shiftRemarks) ||
                other.shiftRemarks == shiftRemarks) &&
            (identical(other.actualAmount, actualAmount) ||
                other.actualAmount == actualAmount) &&
            (identical(other.actualCards, actualCards) ||
                other.actualCards == actualCards) &&
            (identical(other.actualTickets, actualTickets) ||
                other.actualTickets == actualTickets) &&
            (identical(other.gameCardAmount, gameCardAmount) ||
                other.gameCardAmount == gameCardAmount) &&
            (identical(other.creditCardAmount, creditCardAmount) ||
                other.creditCardAmount == creditCardAmount) &&
            (identical(other.chequeAmount, chequeAmount) ||
                other.chequeAmount == chequeAmount) &&
            (identical(other.couponAmount, couponAmount) ||
                other.couponAmount == couponAmount) &&
            (identical(other.actualGameCardAmount, actualGameCardAmount) ||
                other.actualGameCardAmount == actualGameCardAmount) &&
            (identical(other.actualCreditCardAmount, actualCreditCardAmount) ||
                other.actualCreditCardAmount == actualCreditCardAmount) &&
            (identical(other.actualChequeAmount, actualChequeAmount) ||
                other.actualChequeAmount == actualChequeAmount) &&
            (identical(other.actualCouponAmount, actualCouponAmount) ||
                other.actualCouponAmount == actualCouponAmount) &&
            (identical(other.shiftReason, shiftReason) ||
                other.shiftReason == shiftReason) &&
            (identical(other.cashDRawerId, cashDRawerId) ||
                other.cashDRawerId == cashDRawerId) &&
            (identical(other.shiftUserName, shiftUserName) ||
                other.shiftUserName == shiftUserName) &&
            (identical(other.shiftLoginId, shiftLoginId) ||
                other.shiftLoginId == shiftLoginId) &&
            (identical(other.posMachineName, posMachineName) ||
                other.posMachineName == posMachineName) &&
            (identical(other.isShareable, isShareable) ||
                other.isShareable == isShareable) &&
            (identical(other.cashDrawerStatusId, cashDrawerStatusId) ||
                other.cashDrawerStatusId == cashDrawerStatusId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        shiftId,
        shiftLogId,
        shiftAction,
        shiftAmount,
        cardcount,
        shiftTicketNumber,
        shiftRemarks,
        actualAmount,
        actualCards,
        actualTickets,
        gameCardAmount,
        creditCardAmount,
        chequeAmount,
        couponAmount,
        actualGameCardAmount,
        actualCreditCardAmount,
        actualChequeAmount,
        actualCouponAmount,
        shiftReason,
        cashDRawerId,
        shiftUserName,
        shiftLoginId,
        posMachineName,
        isShareable,
        cashDrawerStatusId
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ShiftActionDTOCopyWith<_$_ShiftActionDTO> get copyWith =>
      __$$_ShiftActionDTOCopyWithImpl<_$_ShiftActionDTO>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ShiftActionDTOToJson(
      this,
    );
  }
}

abstract class _ShiftActionDTO implements ShiftActionDTO {
  const factory _ShiftActionDTO(
      {@JsonKey(name: 'ShiftId') required final int shiftId,
      @JsonKey(name: 'ShiftLogId') required final int shiftLogId,
      @JsonKey(name: 'ShiftAction') final String? shiftAction,
      @JsonKey(name: 'ShiftAmount') required final double? shiftAmount,
      @JsonKey(name: 'Cardcount') required final int cardcount,
      @JsonKey(name: 'ShiftTicketNumber') final String? shiftTicketNumber,
      @JsonKey(name: 'ShiftRemarks') final String? shiftRemarks,
      @JsonKey(name: 'ActualAmount') final double? actualAmount,
      @JsonKey(name: 'ActualCards') final int? actualCards,
      @JsonKey(name: 'ActualTickets') final int? actualTickets,
      @JsonKey(name: 'GameCardAmount') final int? gameCardAmount,
      @JsonKey(name: 'CreditCardAmount') final double? creditCardAmount,
      @JsonKey(name: 'ChequeAmount') final double? chequeAmount,
      @JsonKey(name: 'CouponAmount') final double? couponAmount,
      @JsonKey(name: 'ActualGameCardAmount') final double? actualGameCardAmount,
      @JsonKey(name: 'ActualCreditCardAmount')
      final double? actualCreditCardAmount,
      @JsonKey(name: 'ActualChequeAmount') final double? actualChequeAmount,
      @JsonKey(name: 'ActualCouponAmount') final double? actualCouponAmount,
      @JsonKey(name: 'ShiftReason') final String? shiftReason,
      @JsonKey(name: 'CashDRawerId') required final int cashDRawerId,
      @JsonKey(name: 'ShiftUserName') final String? shiftUserName,
      @JsonKey(name: 'ShiftLoginId') required final String? shiftLoginId,
      @JsonKey(name: 'PosMachineName') required final String? posMachineName,
      @JsonKey(name: 'IsShareable') required final bool isShareable,
      @JsonKey(name: 'CashDrawerStatusId')
      required final int cashDrawerStatusId}) = _$_ShiftActionDTO;

  factory _ShiftActionDTO.fromJson(Map<String, dynamic> json) =
      _$_ShiftActionDTO.fromJson;

  @override
  @JsonKey(name: 'ShiftId')
  int get shiftId;
  @override
  @JsonKey(name: 'ShiftLogId')
  int get shiftLogId;
  @override
  @JsonKey(name: 'ShiftAction')
  String? get shiftAction;
  @override
  @JsonKey(name: 'ShiftAmount')
  double? get shiftAmount;
  @override
  @JsonKey(name: 'Cardcount')
  int get cardcount;
  @override
  @JsonKey(name: 'ShiftTicketNumber')
  String? get shiftTicketNumber;
  @override
  @JsonKey(name: 'ShiftRemarks')
  String? get shiftRemarks;
  @override
  @JsonKey(name: 'ActualAmount')
  double? get actualAmount;
  @override
  @JsonKey(name: 'ActualCards')
  int? get actualCards;
  @override
  @JsonKey(name: 'ActualTickets')
  int? get actualTickets;
  @override
  @JsonKey(name: 'GameCardAmount')
  int? get gameCardAmount;
  @override
  @JsonKey(name: 'CreditCardAmount')
  double? get creditCardAmount;
  @override
  @JsonKey(name: 'ChequeAmount')
  double? get chequeAmount;
  @override
  @JsonKey(name: 'CouponAmount')
  double? get couponAmount;
  @override
  @JsonKey(name: 'ActualGameCardAmount')
  double? get actualGameCardAmount;
  @override
  @JsonKey(name: 'ActualCreditCardAmount')
  double? get actualCreditCardAmount;
  @override
  @JsonKey(name: 'ActualChequeAmount')
  double? get actualChequeAmount;
  @override
  @JsonKey(name: 'ActualCouponAmount')
  double? get actualCouponAmount;
  @override
  @JsonKey(name: 'ShiftReason')
  String? get shiftReason;
  @override
  @JsonKey(name: 'CashDRawerId')
  int get cashDRawerId;
  @override
  @JsonKey(name: 'ShiftUserName')
  String? get shiftUserName;
  @override
  @JsonKey(name: 'ShiftLoginId')
  String? get shiftLoginId;
  @override
  @JsonKey(name: 'PosMachineName')
  String? get posMachineName;
  @override
  @JsonKey(name: 'IsShareable')
  bool get isShareable;
  @override
  @JsonKey(name: 'CashDrawerStatusId')
  int get cashDrawerStatusId;
  @override
  @JsonKey(ignore: true)
  _$$_ShiftActionDTOCopyWith<_$_ShiftActionDTO> get copyWith =>
      throw _privateConstructorUsedError;
}
