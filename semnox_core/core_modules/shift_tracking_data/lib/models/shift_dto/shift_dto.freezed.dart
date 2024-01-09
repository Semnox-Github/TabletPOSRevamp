// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'shift_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ShiftDTOResponse _$ShiftDTOResponseFromJson(Map<String, dynamic> json) {
  return _ShiftDTOResponse.fromJson(json);
}

/// @nodoc
mixin _$ShiftDTOResponse {
  @JsonKey(name: 'data')
  List<ShiftDTO>? get data => throw _privateConstructorUsedError;
  @JsonKey(name: 'Message')
  String? get message => throw _privateConstructorUsedError;
  @JsonKey(name: 'exception')
  String? get exception => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ShiftDTOResponseCopyWith<ShiftDTOResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShiftDTOResponseCopyWith<$Res> {
  factory $ShiftDTOResponseCopyWith(
          ShiftDTOResponse value, $Res Function(ShiftDTOResponse) then) =
      _$ShiftDTOResponseCopyWithImpl<$Res, ShiftDTOResponse>;
  @useResult
  $Res call(
      {@JsonKey(name: 'data') List<ShiftDTO>? data,
      @JsonKey(name: 'Message') String? message,
      @JsonKey(name: 'exception') String? exception});
}

/// @nodoc
class _$ShiftDTOResponseCopyWithImpl<$Res, $Val extends ShiftDTOResponse>
    implements $ShiftDTOResponseCopyWith<$Res> {
  _$ShiftDTOResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
    Object? message = freezed,
    Object? exception = freezed,
  }) {
    return _then(_value.copyWith(
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<ShiftDTO>?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      exception: freezed == exception
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ShiftDTOResponseCopyWith<$Res>
    implements $ShiftDTOResponseCopyWith<$Res> {
  factory _$$_ShiftDTOResponseCopyWith(
          _$_ShiftDTOResponse value, $Res Function(_$_ShiftDTOResponse) then) =
      __$$_ShiftDTOResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'data') List<ShiftDTO>? data,
      @JsonKey(name: 'Message') String? message,
      @JsonKey(name: 'exception') String? exception});
}

/// @nodoc
class __$$_ShiftDTOResponseCopyWithImpl<$Res>
    extends _$ShiftDTOResponseCopyWithImpl<$Res, _$_ShiftDTOResponse>
    implements _$$_ShiftDTOResponseCopyWith<$Res> {
  __$$_ShiftDTOResponseCopyWithImpl(
      _$_ShiftDTOResponse _value, $Res Function(_$_ShiftDTOResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
    Object? message = freezed,
    Object? exception = freezed,
  }) {
    return _then(_$_ShiftDTOResponse(
      data: freezed == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<ShiftDTO>?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      exception: freezed == exception
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ShiftDTOResponse implements _ShiftDTOResponse {
  const _$_ShiftDTOResponse(
      {@JsonKey(name: 'data') final List<ShiftDTO>? data,
      @JsonKey(name: 'Message') this.message,
      @JsonKey(name: 'exception') this.exception})
      : _data = data;

  factory _$_ShiftDTOResponse.fromJson(Map<String, dynamic> json) =>
      _$$_ShiftDTOResponseFromJson(json);

  final List<ShiftDTO>? _data;
  @override
  @JsonKey(name: 'data')
  List<ShiftDTO>? get data {
    final value = _data;
    if (value == null) return null;
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'Message')
  final String? message;
  @override
  @JsonKey(name: 'exception')
  final String? exception;

  @override
  String toString() {
    return 'ShiftDTOResponse(data: $data, message: $message, exception: $exception)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ShiftDTOResponse &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.exception, exception) ||
                other.exception == exception));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_data), message, exception);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ShiftDTOResponseCopyWith<_$_ShiftDTOResponse> get copyWith =>
      __$$_ShiftDTOResponseCopyWithImpl<_$_ShiftDTOResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ShiftDTOResponseToJson(
      this,
    );
  }
}

abstract class _ShiftDTOResponse implements ShiftDTOResponse {
  const factory _ShiftDTOResponse(
          {@JsonKey(name: 'data') final List<ShiftDTO>? data,
          @JsonKey(name: 'Message') final String? message,
          @JsonKey(name: 'exception') final String? exception}) =
      _$_ShiftDTOResponse;

  factory _ShiftDTOResponse.fromJson(Map<String, dynamic> json) =
      _$_ShiftDTOResponse.fromJson;

  @override
  @JsonKey(name: 'data')
  List<ShiftDTO>? get data;
  @override
  @JsonKey(name: 'Message')
  String? get message;
  @override
  @JsonKey(name: 'exception')
  String? get exception;
  @override
  @JsonKey(ignore: true)
  _$$_ShiftDTOResponseCopyWith<_$_ShiftDTOResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

ShiftDTO _$ShiftDTOFromJson(Map<String, dynamic> json) {
  return _ShiftDTO.fromJson(json);
}

/// @nodoc
mixin _$ShiftDTO {
  @JsonKey(name: "ShiftKey")
  int? get shiftKey => throw _privateConstructorUsedError;
  @JsonKey(name: "ShiftUserName")
  String? get shiftUserName => throw _privateConstructorUsedError;
  @JsonKey(name: "ShiftTime")
  String? get shiftTime => throw _privateConstructorUsedError;
  @JsonKey(name: "ShiftUserType")
  String? get shiftUserType => throw _privateConstructorUsedError;
  @JsonKey(name: "ShiftAction")
  String? get shiftAction => throw _privateConstructorUsedError;
  @JsonKey(name: "ShiftAmount")
  double? get shiftAmount => throw _privateConstructorUsedError;
  @JsonKey(name: "CardCount")
  double? get cardCount => throw _privateConstructorUsedError;
  @JsonKey(name: "ShiftTicketNumber")
  String? get shiftTicketNumber => throw _privateConstructorUsedError;
  @JsonKey(name: "ShiftRemarks")
  String? get shiftRemarks => throw _privateConstructorUsedError;
  @JsonKey(name: "POSMachine")
  String? get posMachine => throw _privateConstructorUsedError;
  @JsonKey(name: "ActualAmount")
  double? get actualAmount => throw _privateConstructorUsedError;
  @JsonKey(name: "ActualCards")
  double? get actualCards => throw _privateConstructorUsedError;
  @JsonKey(name: "ActualTickets")
  double? get actualTickets => throw _privateConstructorUsedError;
  @JsonKey(name: "GameCardamount")
  double? get gameCardamount => throw _privateConstructorUsedError;
  @JsonKey(name: "CreditCardamount")
  double? get creditCardamount => throw _privateConstructorUsedError;
  @JsonKey(name: "ChequeAmount")
  double? get chequeAmount => throw _privateConstructorUsedError;
  @JsonKey(name: "CouponAmount")
  double? get couponAmount => throw _privateConstructorUsedError;
  @JsonKey(name: "ActualGameCardamount")
  double? get actualGameCardamount => throw _privateConstructorUsedError;
  @JsonKey(name: "ActualCreditCardamount")
  double? get actualCreditCardamount => throw _privateConstructorUsedError;
  @JsonKey(name: "ActualChequeAmount")
  double? get actualChequeAmount => throw _privateConstructorUsedError;
  @JsonKey(name: "ActualCouponAmount")
  double? get actualCouponAmount => throw _privateConstructorUsedError;
  @JsonKey(name: "ShiftLoginId")
  String? get shiftLoginId => throw _privateConstructorUsedError;
  @JsonKey(name: "MasterEntityId")
  int? get masterEntityId => throw _privateConstructorUsedError;
  @JsonKey(name: "CreatedBy")
  String? get createdBy => throw _privateConstructorUsedError;
  @JsonKey(name: "CreationDate")
  String? get creationDate => throw _privateConstructorUsedError;
  @JsonKey(name: "LastUpdatedBy")
  String? get lastUpdatedBy => throw _privateConstructorUsedError;
  @JsonKey(name: "LastUpdatedDate")
  String? get lastUpdatedDate => throw _privateConstructorUsedError;
  @JsonKey(name: "Guid")
  String? get guid => throw _privateConstructorUsedError;
  @JsonKey(name: "SiteId")
  int? get siteId => throw _privateConstructorUsedError;
  @JsonKey(name: "SynchStatus")
  bool? get synchStatus => throw _privateConstructorUsedError;
  @JsonKey(name: "ShiftLogDTOList")
  List<dynamic>? get shiftLogDtoList => throw _privateConstructorUsedError;
  @JsonKey(name: "Receipt")
  dynamic get receipt => throw _privateConstructorUsedError;
  @JsonKey(name: "CashdrawerId")
  int? get cashdrawerId => throw _privateConstructorUsedError;
  @JsonKey(name: "IsShareable")
  bool? get isShareable => throw _privateConstructorUsedError;
  @JsonKey(name: "CashdrawerStatusId")
  int? get cashdrawerStatusId => throw _privateConstructorUsedError;
  @JsonKey(name: "IsChanged")
  bool? get isChanged => throw _privateConstructorUsedError;
  @JsonKey(name: "IsChangedRecursive")
  bool? get isChangedRecursive => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ShiftDTOCopyWith<ShiftDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShiftDTOCopyWith<$Res> {
  factory $ShiftDTOCopyWith(ShiftDTO value, $Res Function(ShiftDTO) then) =
      _$ShiftDTOCopyWithImpl<$Res, ShiftDTO>;
  @useResult
  $Res call(
      {@JsonKey(name: "ShiftKey") int? shiftKey,
      @JsonKey(name: "ShiftUserName") String? shiftUserName,
      @JsonKey(name: "ShiftTime") String? shiftTime,
      @JsonKey(name: "ShiftUserType") String? shiftUserType,
      @JsonKey(name: "ShiftAction") String? shiftAction,
      @JsonKey(name: "ShiftAmount") double? shiftAmount,
      @JsonKey(name: "CardCount") double? cardCount,
      @JsonKey(name: "ShiftTicketNumber") String? shiftTicketNumber,
      @JsonKey(name: "ShiftRemarks") String? shiftRemarks,
      @JsonKey(name: "POSMachine") String? posMachine,
      @JsonKey(name: "ActualAmount") double? actualAmount,
      @JsonKey(name: "ActualCards") double? actualCards,
      @JsonKey(name: "ActualTickets") double? actualTickets,
      @JsonKey(name: "GameCardamount") double? gameCardamount,
      @JsonKey(name: "CreditCardamount") double? creditCardamount,
      @JsonKey(name: "ChequeAmount") double? chequeAmount,
      @JsonKey(name: "CouponAmount") double? couponAmount,
      @JsonKey(name: "ActualGameCardamount") double? actualGameCardamount,
      @JsonKey(name: "ActualCreditCardamount") double? actualCreditCardamount,
      @JsonKey(name: "ActualChequeAmount") double? actualChequeAmount,
      @JsonKey(name: "ActualCouponAmount") double? actualCouponAmount,
      @JsonKey(name: "ShiftLoginId") String? shiftLoginId,
      @JsonKey(name: "MasterEntityId") int? masterEntityId,
      @JsonKey(name: "CreatedBy") String? createdBy,
      @JsonKey(name: "CreationDate") String? creationDate,
      @JsonKey(name: "LastUpdatedBy") String? lastUpdatedBy,
      @JsonKey(name: "LastUpdatedDate") String? lastUpdatedDate,
      @JsonKey(name: "Guid") String? guid,
      @JsonKey(name: "SiteId") int? siteId,
      @JsonKey(name: "SynchStatus") bool? synchStatus,
      @JsonKey(name: "ShiftLogDTOList") List<dynamic>? shiftLogDtoList,
      @JsonKey(name: "Receipt") dynamic receipt,
      @JsonKey(name: "CashdrawerId") int? cashdrawerId,
      @JsonKey(name: "IsShareable") bool? isShareable,
      @JsonKey(name: "CashdrawerStatusId") int? cashdrawerStatusId,
      @JsonKey(name: "IsChanged") bool? isChanged,
      @JsonKey(name: "IsChangedRecursive") bool? isChangedRecursive});
}

/// @nodoc
class _$ShiftDTOCopyWithImpl<$Res, $Val extends ShiftDTO>
    implements $ShiftDTOCopyWith<$Res> {
  _$ShiftDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? shiftKey = freezed,
    Object? shiftUserName = freezed,
    Object? shiftTime = freezed,
    Object? shiftUserType = freezed,
    Object? shiftAction = freezed,
    Object? shiftAmount = freezed,
    Object? cardCount = freezed,
    Object? shiftTicketNumber = freezed,
    Object? shiftRemarks = freezed,
    Object? posMachine = freezed,
    Object? actualAmount = freezed,
    Object? actualCards = freezed,
    Object? actualTickets = freezed,
    Object? gameCardamount = freezed,
    Object? creditCardamount = freezed,
    Object? chequeAmount = freezed,
    Object? couponAmount = freezed,
    Object? actualGameCardamount = freezed,
    Object? actualCreditCardamount = freezed,
    Object? actualChequeAmount = freezed,
    Object? actualCouponAmount = freezed,
    Object? shiftLoginId = freezed,
    Object? masterEntityId = freezed,
    Object? createdBy = freezed,
    Object? creationDate = freezed,
    Object? lastUpdatedBy = freezed,
    Object? lastUpdatedDate = freezed,
    Object? guid = freezed,
    Object? siteId = freezed,
    Object? synchStatus = freezed,
    Object? shiftLogDtoList = freezed,
    Object? receipt = freezed,
    Object? cashdrawerId = freezed,
    Object? isShareable = freezed,
    Object? cashdrawerStatusId = freezed,
    Object? isChanged = freezed,
    Object? isChangedRecursive = freezed,
  }) {
    return _then(_value.copyWith(
      shiftKey: freezed == shiftKey
          ? _value.shiftKey
          : shiftKey // ignore: cast_nullable_to_non_nullable
              as int?,
      shiftUserName: freezed == shiftUserName
          ? _value.shiftUserName
          : shiftUserName // ignore: cast_nullable_to_non_nullable
              as String?,
      shiftTime: freezed == shiftTime
          ? _value.shiftTime
          : shiftTime // ignore: cast_nullable_to_non_nullable
              as String?,
      shiftUserType: freezed == shiftUserType
          ? _value.shiftUserType
          : shiftUserType // ignore: cast_nullable_to_non_nullable
              as String?,
      shiftAction: freezed == shiftAction
          ? _value.shiftAction
          : shiftAction // ignore: cast_nullable_to_non_nullable
              as String?,
      shiftAmount: freezed == shiftAmount
          ? _value.shiftAmount
          : shiftAmount // ignore: cast_nullable_to_non_nullable
              as double?,
      cardCount: freezed == cardCount
          ? _value.cardCount
          : cardCount // ignore: cast_nullable_to_non_nullable
              as double?,
      shiftTicketNumber: freezed == shiftTicketNumber
          ? _value.shiftTicketNumber
          : shiftTicketNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      shiftRemarks: freezed == shiftRemarks
          ? _value.shiftRemarks
          : shiftRemarks // ignore: cast_nullable_to_non_nullable
              as String?,
      posMachine: freezed == posMachine
          ? _value.posMachine
          : posMachine // ignore: cast_nullable_to_non_nullable
              as String?,
      actualAmount: freezed == actualAmount
          ? _value.actualAmount
          : actualAmount // ignore: cast_nullable_to_non_nullable
              as double?,
      actualCards: freezed == actualCards
          ? _value.actualCards
          : actualCards // ignore: cast_nullable_to_non_nullable
              as double?,
      actualTickets: freezed == actualTickets
          ? _value.actualTickets
          : actualTickets // ignore: cast_nullable_to_non_nullable
              as double?,
      gameCardamount: freezed == gameCardamount
          ? _value.gameCardamount
          : gameCardamount // ignore: cast_nullable_to_non_nullable
              as double?,
      creditCardamount: freezed == creditCardamount
          ? _value.creditCardamount
          : creditCardamount // ignore: cast_nullable_to_non_nullable
              as double?,
      chequeAmount: freezed == chequeAmount
          ? _value.chequeAmount
          : chequeAmount // ignore: cast_nullable_to_non_nullable
              as double?,
      couponAmount: freezed == couponAmount
          ? _value.couponAmount
          : couponAmount // ignore: cast_nullable_to_non_nullable
              as double?,
      actualGameCardamount: freezed == actualGameCardamount
          ? _value.actualGameCardamount
          : actualGameCardamount // ignore: cast_nullable_to_non_nullable
              as double?,
      actualCreditCardamount: freezed == actualCreditCardamount
          ? _value.actualCreditCardamount
          : actualCreditCardamount // ignore: cast_nullable_to_non_nullable
              as double?,
      actualChequeAmount: freezed == actualChequeAmount
          ? _value.actualChequeAmount
          : actualChequeAmount // ignore: cast_nullable_to_non_nullable
              as double?,
      actualCouponAmount: freezed == actualCouponAmount
          ? _value.actualCouponAmount
          : actualCouponAmount // ignore: cast_nullable_to_non_nullable
              as double?,
      shiftLoginId: freezed == shiftLoginId
          ? _value.shiftLoginId
          : shiftLoginId // ignore: cast_nullable_to_non_nullable
              as String?,
      masterEntityId: freezed == masterEntityId
          ? _value.masterEntityId
          : masterEntityId // ignore: cast_nullable_to_non_nullable
              as int?,
      createdBy: freezed == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String?,
      creationDate: freezed == creationDate
          ? _value.creationDate
          : creationDate // ignore: cast_nullable_to_non_nullable
              as String?,
      lastUpdatedBy: freezed == lastUpdatedBy
          ? _value.lastUpdatedBy
          : lastUpdatedBy // ignore: cast_nullable_to_non_nullable
              as String?,
      lastUpdatedDate: freezed == lastUpdatedDate
          ? _value.lastUpdatedDate
          : lastUpdatedDate // ignore: cast_nullable_to_non_nullable
              as String?,
      guid: freezed == guid
          ? _value.guid
          : guid // ignore: cast_nullable_to_non_nullable
              as String?,
      siteId: freezed == siteId
          ? _value.siteId
          : siteId // ignore: cast_nullable_to_non_nullable
              as int?,
      synchStatus: freezed == synchStatus
          ? _value.synchStatus
          : synchStatus // ignore: cast_nullable_to_non_nullable
              as bool?,
      shiftLogDtoList: freezed == shiftLogDtoList
          ? _value.shiftLogDtoList
          : shiftLogDtoList // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      receipt: freezed == receipt
          ? _value.receipt
          : receipt // ignore: cast_nullable_to_non_nullable
              as dynamic,
      cashdrawerId: freezed == cashdrawerId
          ? _value.cashdrawerId
          : cashdrawerId // ignore: cast_nullable_to_non_nullable
              as int?,
      isShareable: freezed == isShareable
          ? _value.isShareable
          : isShareable // ignore: cast_nullable_to_non_nullable
              as bool?,
      cashdrawerStatusId: freezed == cashdrawerStatusId
          ? _value.cashdrawerStatusId
          : cashdrawerStatusId // ignore: cast_nullable_to_non_nullable
              as int?,
      isChanged: freezed == isChanged
          ? _value.isChanged
          : isChanged // ignore: cast_nullable_to_non_nullable
              as bool?,
      isChangedRecursive: freezed == isChangedRecursive
          ? _value.isChangedRecursive
          : isChangedRecursive // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ShiftDTOCopyWith<$Res> implements $ShiftDTOCopyWith<$Res> {
  factory _$$_ShiftDTOCopyWith(
          _$_ShiftDTO value, $Res Function(_$_ShiftDTO) then) =
      __$$_ShiftDTOCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "ShiftKey") int? shiftKey,
      @JsonKey(name: "ShiftUserName") String? shiftUserName,
      @JsonKey(name: "ShiftTime") String? shiftTime,
      @JsonKey(name: "ShiftUserType") String? shiftUserType,
      @JsonKey(name: "ShiftAction") String? shiftAction,
      @JsonKey(name: "ShiftAmount") double? shiftAmount,
      @JsonKey(name: "CardCount") double? cardCount,
      @JsonKey(name: "ShiftTicketNumber") String? shiftTicketNumber,
      @JsonKey(name: "ShiftRemarks") String? shiftRemarks,
      @JsonKey(name: "POSMachine") String? posMachine,
      @JsonKey(name: "ActualAmount") double? actualAmount,
      @JsonKey(name: "ActualCards") double? actualCards,
      @JsonKey(name: "ActualTickets") double? actualTickets,
      @JsonKey(name: "GameCardamount") double? gameCardamount,
      @JsonKey(name: "CreditCardamount") double? creditCardamount,
      @JsonKey(name: "ChequeAmount") double? chequeAmount,
      @JsonKey(name: "CouponAmount") double? couponAmount,
      @JsonKey(name: "ActualGameCardamount") double? actualGameCardamount,
      @JsonKey(name: "ActualCreditCardamount") double? actualCreditCardamount,
      @JsonKey(name: "ActualChequeAmount") double? actualChequeAmount,
      @JsonKey(name: "ActualCouponAmount") double? actualCouponAmount,
      @JsonKey(name: "ShiftLoginId") String? shiftLoginId,
      @JsonKey(name: "MasterEntityId") int? masterEntityId,
      @JsonKey(name: "CreatedBy") String? createdBy,
      @JsonKey(name: "CreationDate") String? creationDate,
      @JsonKey(name: "LastUpdatedBy") String? lastUpdatedBy,
      @JsonKey(name: "LastUpdatedDate") String? lastUpdatedDate,
      @JsonKey(name: "Guid") String? guid,
      @JsonKey(name: "SiteId") int? siteId,
      @JsonKey(name: "SynchStatus") bool? synchStatus,
      @JsonKey(name: "ShiftLogDTOList") List<dynamic>? shiftLogDtoList,
      @JsonKey(name: "Receipt") dynamic receipt,
      @JsonKey(name: "CashdrawerId") int? cashdrawerId,
      @JsonKey(name: "IsShareable") bool? isShareable,
      @JsonKey(name: "CashdrawerStatusId") int? cashdrawerStatusId,
      @JsonKey(name: "IsChanged") bool? isChanged,
      @JsonKey(name: "IsChangedRecursive") bool? isChangedRecursive});
}

/// @nodoc
class __$$_ShiftDTOCopyWithImpl<$Res>
    extends _$ShiftDTOCopyWithImpl<$Res, _$_ShiftDTO>
    implements _$$_ShiftDTOCopyWith<$Res> {
  __$$_ShiftDTOCopyWithImpl(
      _$_ShiftDTO _value, $Res Function(_$_ShiftDTO) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? shiftKey = freezed,
    Object? shiftUserName = freezed,
    Object? shiftTime = freezed,
    Object? shiftUserType = freezed,
    Object? shiftAction = freezed,
    Object? shiftAmount = freezed,
    Object? cardCount = freezed,
    Object? shiftTicketNumber = freezed,
    Object? shiftRemarks = freezed,
    Object? posMachine = freezed,
    Object? actualAmount = freezed,
    Object? actualCards = freezed,
    Object? actualTickets = freezed,
    Object? gameCardamount = freezed,
    Object? creditCardamount = freezed,
    Object? chequeAmount = freezed,
    Object? couponAmount = freezed,
    Object? actualGameCardamount = freezed,
    Object? actualCreditCardamount = freezed,
    Object? actualChequeAmount = freezed,
    Object? actualCouponAmount = freezed,
    Object? shiftLoginId = freezed,
    Object? masterEntityId = freezed,
    Object? createdBy = freezed,
    Object? creationDate = freezed,
    Object? lastUpdatedBy = freezed,
    Object? lastUpdatedDate = freezed,
    Object? guid = freezed,
    Object? siteId = freezed,
    Object? synchStatus = freezed,
    Object? shiftLogDtoList = freezed,
    Object? receipt = freezed,
    Object? cashdrawerId = freezed,
    Object? isShareable = freezed,
    Object? cashdrawerStatusId = freezed,
    Object? isChanged = freezed,
    Object? isChangedRecursive = freezed,
  }) {
    return _then(_$_ShiftDTO(
      shiftKey: freezed == shiftKey
          ? _value.shiftKey
          : shiftKey // ignore: cast_nullable_to_non_nullable
              as int?,
      shiftUserName: freezed == shiftUserName
          ? _value.shiftUserName
          : shiftUserName // ignore: cast_nullable_to_non_nullable
              as String?,
      shiftTime: freezed == shiftTime
          ? _value.shiftTime
          : shiftTime // ignore: cast_nullable_to_non_nullable
              as String?,
      shiftUserType: freezed == shiftUserType
          ? _value.shiftUserType
          : shiftUserType // ignore: cast_nullable_to_non_nullable
              as String?,
      shiftAction: freezed == shiftAction
          ? _value.shiftAction
          : shiftAction // ignore: cast_nullable_to_non_nullable
              as String?,
      shiftAmount: freezed == shiftAmount
          ? _value.shiftAmount
          : shiftAmount // ignore: cast_nullable_to_non_nullable
              as double?,
      cardCount: freezed == cardCount
          ? _value.cardCount
          : cardCount // ignore: cast_nullable_to_non_nullable
              as double?,
      shiftTicketNumber: freezed == shiftTicketNumber
          ? _value.shiftTicketNumber
          : shiftTicketNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      shiftRemarks: freezed == shiftRemarks
          ? _value.shiftRemarks
          : shiftRemarks // ignore: cast_nullable_to_non_nullable
              as String?,
      posMachine: freezed == posMachine
          ? _value.posMachine
          : posMachine // ignore: cast_nullable_to_non_nullable
              as String?,
      actualAmount: freezed == actualAmount
          ? _value.actualAmount
          : actualAmount // ignore: cast_nullable_to_non_nullable
              as double?,
      actualCards: freezed == actualCards
          ? _value.actualCards
          : actualCards // ignore: cast_nullable_to_non_nullable
              as double?,
      actualTickets: freezed == actualTickets
          ? _value.actualTickets
          : actualTickets // ignore: cast_nullable_to_non_nullable
              as double?,
      gameCardamount: freezed == gameCardamount
          ? _value.gameCardamount
          : gameCardamount // ignore: cast_nullable_to_non_nullable
              as double?,
      creditCardamount: freezed == creditCardamount
          ? _value.creditCardamount
          : creditCardamount // ignore: cast_nullable_to_non_nullable
              as double?,
      chequeAmount: freezed == chequeAmount
          ? _value.chequeAmount
          : chequeAmount // ignore: cast_nullable_to_non_nullable
              as double?,
      couponAmount: freezed == couponAmount
          ? _value.couponAmount
          : couponAmount // ignore: cast_nullable_to_non_nullable
              as double?,
      actualGameCardamount: freezed == actualGameCardamount
          ? _value.actualGameCardamount
          : actualGameCardamount // ignore: cast_nullable_to_non_nullable
              as double?,
      actualCreditCardamount: freezed == actualCreditCardamount
          ? _value.actualCreditCardamount
          : actualCreditCardamount // ignore: cast_nullable_to_non_nullable
              as double?,
      actualChequeAmount: freezed == actualChequeAmount
          ? _value.actualChequeAmount
          : actualChequeAmount // ignore: cast_nullable_to_non_nullable
              as double?,
      actualCouponAmount: freezed == actualCouponAmount
          ? _value.actualCouponAmount
          : actualCouponAmount // ignore: cast_nullable_to_non_nullable
              as double?,
      shiftLoginId: freezed == shiftLoginId
          ? _value.shiftLoginId
          : shiftLoginId // ignore: cast_nullable_to_non_nullable
              as String?,
      masterEntityId: freezed == masterEntityId
          ? _value.masterEntityId
          : masterEntityId // ignore: cast_nullable_to_non_nullable
              as int?,
      createdBy: freezed == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String?,
      creationDate: freezed == creationDate
          ? _value.creationDate
          : creationDate // ignore: cast_nullable_to_non_nullable
              as String?,
      lastUpdatedBy: freezed == lastUpdatedBy
          ? _value.lastUpdatedBy
          : lastUpdatedBy // ignore: cast_nullable_to_non_nullable
              as String?,
      lastUpdatedDate: freezed == lastUpdatedDate
          ? _value.lastUpdatedDate
          : lastUpdatedDate // ignore: cast_nullable_to_non_nullable
              as String?,
      guid: freezed == guid
          ? _value.guid
          : guid // ignore: cast_nullable_to_non_nullable
              as String?,
      siteId: freezed == siteId
          ? _value.siteId
          : siteId // ignore: cast_nullable_to_non_nullable
              as int?,
      synchStatus: freezed == synchStatus
          ? _value.synchStatus
          : synchStatus // ignore: cast_nullable_to_non_nullable
              as bool?,
      shiftLogDtoList: freezed == shiftLogDtoList
          ? _value._shiftLogDtoList
          : shiftLogDtoList // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      receipt: freezed == receipt
          ? _value.receipt
          : receipt // ignore: cast_nullable_to_non_nullable
              as dynamic,
      cashdrawerId: freezed == cashdrawerId
          ? _value.cashdrawerId
          : cashdrawerId // ignore: cast_nullable_to_non_nullable
              as int?,
      isShareable: freezed == isShareable
          ? _value.isShareable
          : isShareable // ignore: cast_nullable_to_non_nullable
              as bool?,
      cashdrawerStatusId: freezed == cashdrawerStatusId
          ? _value.cashdrawerStatusId
          : cashdrawerStatusId // ignore: cast_nullable_to_non_nullable
              as int?,
      isChanged: freezed == isChanged
          ? _value.isChanged
          : isChanged // ignore: cast_nullable_to_non_nullable
              as bool?,
      isChangedRecursive: freezed == isChangedRecursive
          ? _value.isChangedRecursive
          : isChangedRecursive // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ShiftDTO implements _ShiftDTO {
  const _$_ShiftDTO(
      {@JsonKey(name: "ShiftKey") this.shiftKey,
      @JsonKey(name: "ShiftUserName") this.shiftUserName,
      @JsonKey(name: "ShiftTime") this.shiftTime,
      @JsonKey(name: "ShiftUserType") this.shiftUserType,
      @JsonKey(name: "ShiftAction") this.shiftAction,
      @JsonKey(name: "ShiftAmount") this.shiftAmount,
      @JsonKey(name: "CardCount") this.cardCount,
      @JsonKey(name: "ShiftTicketNumber") this.shiftTicketNumber,
      @JsonKey(name: "ShiftRemarks") this.shiftRemarks,
      @JsonKey(name: "POSMachine") this.posMachine,
      @JsonKey(name: "ActualAmount") this.actualAmount,
      @JsonKey(name: "ActualCards") this.actualCards,
      @JsonKey(name: "ActualTickets") this.actualTickets,
      @JsonKey(name: "GameCardamount") this.gameCardamount,
      @JsonKey(name: "CreditCardamount") this.creditCardamount,
      @JsonKey(name: "ChequeAmount") this.chequeAmount,
      @JsonKey(name: "CouponAmount") this.couponAmount,
      @JsonKey(name: "ActualGameCardamount") this.actualGameCardamount,
      @JsonKey(name: "ActualCreditCardamount") this.actualCreditCardamount,
      @JsonKey(name: "ActualChequeAmount") this.actualChequeAmount,
      @JsonKey(name: "ActualCouponAmount") this.actualCouponAmount,
      @JsonKey(name: "ShiftLoginId") this.shiftLoginId,
      @JsonKey(name: "MasterEntityId") this.masterEntityId,
      @JsonKey(name: "CreatedBy") this.createdBy,
      @JsonKey(name: "CreationDate") this.creationDate,
      @JsonKey(name: "LastUpdatedBy") this.lastUpdatedBy,
      @JsonKey(name: "LastUpdatedDate") this.lastUpdatedDate,
      @JsonKey(name: "Guid") this.guid,
      @JsonKey(name: "SiteId") this.siteId,
      @JsonKey(name: "SynchStatus") this.synchStatus,
      @JsonKey(name: "ShiftLogDTOList") final List<dynamic>? shiftLogDtoList,
      @JsonKey(name: "Receipt") this.receipt,
      @JsonKey(name: "CashdrawerId") this.cashdrawerId,
      @JsonKey(name: "IsShareable") this.isShareable,
      @JsonKey(name: "CashdrawerStatusId") this.cashdrawerStatusId,
      @JsonKey(name: "IsChanged") this.isChanged,
      @JsonKey(name: "IsChangedRecursive") this.isChangedRecursive})
      : _shiftLogDtoList = shiftLogDtoList;

  factory _$_ShiftDTO.fromJson(Map<String, dynamic> json) =>
      _$$_ShiftDTOFromJson(json);

  @override
  @JsonKey(name: "ShiftKey")
  final int? shiftKey;
  @override
  @JsonKey(name: "ShiftUserName")
  final String? shiftUserName;
  @override
  @JsonKey(name: "ShiftTime")
  final String? shiftTime;
  @override
  @JsonKey(name: "ShiftUserType")
  final String? shiftUserType;
  @override
  @JsonKey(name: "ShiftAction")
  final String? shiftAction;
  @override
  @JsonKey(name: "ShiftAmount")
  final double? shiftAmount;
  @override
  @JsonKey(name: "CardCount")
  final double? cardCount;
  @override
  @JsonKey(name: "ShiftTicketNumber")
  final String? shiftTicketNumber;
  @override
  @JsonKey(name: "ShiftRemarks")
  final String? shiftRemarks;
  @override
  @JsonKey(name: "POSMachine")
  final String? posMachine;
  @override
  @JsonKey(name: "ActualAmount")
  final double? actualAmount;
  @override
  @JsonKey(name: "ActualCards")
  final double? actualCards;
  @override
  @JsonKey(name: "ActualTickets")
  final double? actualTickets;
  @override
  @JsonKey(name: "GameCardamount")
  final double? gameCardamount;
  @override
  @JsonKey(name: "CreditCardamount")
  final double? creditCardamount;
  @override
  @JsonKey(name: "ChequeAmount")
  final double? chequeAmount;
  @override
  @JsonKey(name: "CouponAmount")
  final double? couponAmount;
  @override
  @JsonKey(name: "ActualGameCardamount")
  final double? actualGameCardamount;
  @override
  @JsonKey(name: "ActualCreditCardamount")
  final double? actualCreditCardamount;
  @override
  @JsonKey(name: "ActualChequeAmount")
  final double? actualChequeAmount;
  @override
  @JsonKey(name: "ActualCouponAmount")
  final double? actualCouponAmount;
  @override
  @JsonKey(name: "ShiftLoginId")
  final String? shiftLoginId;
  @override
  @JsonKey(name: "MasterEntityId")
  final int? masterEntityId;
  @override
  @JsonKey(name: "CreatedBy")
  final String? createdBy;
  @override
  @JsonKey(name: "CreationDate")
  final String? creationDate;
  @override
  @JsonKey(name: "LastUpdatedBy")
  final String? lastUpdatedBy;
  @override
  @JsonKey(name: "LastUpdatedDate")
  final String? lastUpdatedDate;
  @override
  @JsonKey(name: "Guid")
  final String? guid;
  @override
  @JsonKey(name: "SiteId")
  final int? siteId;
  @override
  @JsonKey(name: "SynchStatus")
  final bool? synchStatus;
  final List<dynamic>? _shiftLogDtoList;
  @override
  @JsonKey(name: "ShiftLogDTOList")
  List<dynamic>? get shiftLogDtoList {
    final value = _shiftLogDtoList;
    if (value == null) return null;
    if (_shiftLogDtoList is EqualUnmodifiableListView) return _shiftLogDtoList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: "Receipt")
  final dynamic receipt;
  @override
  @JsonKey(name: "CashdrawerId")
  final int? cashdrawerId;
  @override
  @JsonKey(name: "IsShareable")
  final bool? isShareable;
  @override
  @JsonKey(name: "CashdrawerStatusId")
  final int? cashdrawerStatusId;
  @override
  @JsonKey(name: "IsChanged")
  final bool? isChanged;
  @override
  @JsonKey(name: "IsChangedRecursive")
  final bool? isChangedRecursive;

  @override
  String toString() {
    return 'ShiftDTO(shiftKey: $shiftKey, shiftUserName: $shiftUserName, shiftTime: $shiftTime, shiftUserType: $shiftUserType, shiftAction: $shiftAction, shiftAmount: $shiftAmount, cardCount: $cardCount, shiftTicketNumber: $shiftTicketNumber, shiftRemarks: $shiftRemarks, posMachine: $posMachine, actualAmount: $actualAmount, actualCards: $actualCards, actualTickets: $actualTickets, gameCardamount: $gameCardamount, creditCardamount: $creditCardamount, chequeAmount: $chequeAmount, couponAmount: $couponAmount, actualGameCardamount: $actualGameCardamount, actualCreditCardamount: $actualCreditCardamount, actualChequeAmount: $actualChequeAmount, actualCouponAmount: $actualCouponAmount, shiftLoginId: $shiftLoginId, masterEntityId: $masterEntityId, createdBy: $createdBy, creationDate: $creationDate, lastUpdatedBy: $lastUpdatedBy, lastUpdatedDate: $lastUpdatedDate, guid: $guid, siteId: $siteId, synchStatus: $synchStatus, shiftLogDtoList: $shiftLogDtoList, receipt: $receipt, cashdrawerId: $cashdrawerId, isShareable: $isShareable, cashdrawerStatusId: $cashdrawerStatusId, isChanged: $isChanged, isChangedRecursive: $isChangedRecursive)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ShiftDTO &&
            (identical(other.shiftKey, shiftKey) ||
                other.shiftKey == shiftKey) &&
            (identical(other.shiftUserName, shiftUserName) ||
                other.shiftUserName == shiftUserName) &&
            (identical(other.shiftTime, shiftTime) ||
                other.shiftTime == shiftTime) &&
            (identical(other.shiftUserType, shiftUserType) ||
                other.shiftUserType == shiftUserType) &&
            (identical(other.shiftAction, shiftAction) ||
                other.shiftAction == shiftAction) &&
            (identical(other.shiftAmount, shiftAmount) ||
                other.shiftAmount == shiftAmount) &&
            (identical(other.cardCount, cardCount) ||
                other.cardCount == cardCount) &&
            (identical(other.shiftTicketNumber, shiftTicketNumber) ||
                other.shiftTicketNumber == shiftTicketNumber) &&
            (identical(other.shiftRemarks, shiftRemarks) ||
                other.shiftRemarks == shiftRemarks) &&
            (identical(other.posMachine, posMachine) ||
                other.posMachine == posMachine) &&
            (identical(other.actualAmount, actualAmount) ||
                other.actualAmount == actualAmount) &&
            (identical(other.actualCards, actualCards) ||
                other.actualCards == actualCards) &&
            (identical(other.actualTickets, actualTickets) ||
                other.actualTickets == actualTickets) &&
            (identical(other.gameCardamount, gameCardamount) ||
                other.gameCardamount == gameCardamount) &&
            (identical(other.creditCardamount, creditCardamount) ||
                other.creditCardamount == creditCardamount) &&
            (identical(other.chequeAmount, chequeAmount) ||
                other.chequeAmount == chequeAmount) &&
            (identical(other.couponAmount, couponAmount) ||
                other.couponAmount == couponAmount) &&
            (identical(other.actualGameCardamount, actualGameCardamount) ||
                other.actualGameCardamount == actualGameCardamount) &&
            (identical(other.actualCreditCardamount, actualCreditCardamount) ||
                other.actualCreditCardamount == actualCreditCardamount) &&
            (identical(other.actualChequeAmount, actualChequeAmount) ||
                other.actualChequeAmount == actualChequeAmount) &&
            (identical(other.actualCouponAmount, actualCouponAmount) ||
                other.actualCouponAmount == actualCouponAmount) &&
            (identical(other.shiftLoginId, shiftLoginId) ||
                other.shiftLoginId == shiftLoginId) &&
            (identical(other.masterEntityId, masterEntityId) ||
                other.masterEntityId == masterEntityId) &&
            (identical(other.createdBy, createdBy) ||
                other.createdBy == createdBy) &&
            (identical(other.creationDate, creationDate) ||
                other.creationDate == creationDate) &&
            (identical(other.lastUpdatedBy, lastUpdatedBy) ||
                other.lastUpdatedBy == lastUpdatedBy) &&
            (identical(other.lastUpdatedDate, lastUpdatedDate) ||
                other.lastUpdatedDate == lastUpdatedDate) &&
            (identical(other.guid, guid) || other.guid == guid) &&
            (identical(other.siteId, siteId) || other.siteId == siteId) &&
            (identical(other.synchStatus, synchStatus) ||
                other.synchStatus == synchStatus) &&
            const DeepCollectionEquality()
                .equals(other._shiftLogDtoList, _shiftLogDtoList) &&
            const DeepCollectionEquality().equals(other.receipt, receipt) &&
            (identical(other.cashdrawerId, cashdrawerId) ||
                other.cashdrawerId == cashdrawerId) &&
            (identical(other.isShareable, isShareable) ||
                other.isShareable == isShareable) &&
            (identical(other.cashdrawerStatusId, cashdrawerStatusId) ||
                other.cashdrawerStatusId == cashdrawerStatusId) &&
            (identical(other.isChanged, isChanged) ||
                other.isChanged == isChanged) &&
            (identical(other.isChangedRecursive, isChangedRecursive) ||
                other.isChangedRecursive == isChangedRecursive));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        shiftKey,
        shiftUserName,
        shiftTime,
        shiftUserType,
        shiftAction,
        shiftAmount,
        cardCount,
        shiftTicketNumber,
        shiftRemarks,
        posMachine,
        actualAmount,
        actualCards,
        actualTickets,
        gameCardamount,
        creditCardamount,
        chequeAmount,
        couponAmount,
        actualGameCardamount,
        actualCreditCardamount,
        actualChequeAmount,
        actualCouponAmount,
        shiftLoginId,
        masterEntityId,
        createdBy,
        creationDate,
        lastUpdatedBy,
        lastUpdatedDate,
        guid,
        siteId,
        synchStatus,
        const DeepCollectionEquality().hash(_shiftLogDtoList),
        const DeepCollectionEquality().hash(receipt),
        cashdrawerId,
        isShareable,
        cashdrawerStatusId,
        isChanged,
        isChangedRecursive
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ShiftDTOCopyWith<_$_ShiftDTO> get copyWith =>
      __$$_ShiftDTOCopyWithImpl<_$_ShiftDTO>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ShiftDTOToJson(
      this,
    );
  }
}

abstract class _ShiftDTO implements ShiftDTO {
  const factory _ShiftDTO(
      {@JsonKey(name: "ShiftKey") final int? shiftKey,
      @JsonKey(name: "ShiftUserName") final String? shiftUserName,
      @JsonKey(name: "ShiftTime") final String? shiftTime,
      @JsonKey(name: "ShiftUserType") final String? shiftUserType,
      @JsonKey(name: "ShiftAction") final String? shiftAction,
      @JsonKey(name: "ShiftAmount") final double? shiftAmount,
      @JsonKey(name: "CardCount") final double? cardCount,
      @JsonKey(name: "ShiftTicketNumber") final String? shiftTicketNumber,
      @JsonKey(name: "ShiftRemarks") final String? shiftRemarks,
      @JsonKey(name: "POSMachine") final String? posMachine,
      @JsonKey(name: "ActualAmount") final double? actualAmount,
      @JsonKey(name: "ActualCards") final double? actualCards,
      @JsonKey(name: "ActualTickets") final double? actualTickets,
      @JsonKey(name: "GameCardamount") final double? gameCardamount,
      @JsonKey(name: "CreditCardamount") final double? creditCardamount,
      @JsonKey(name: "ChequeAmount") final double? chequeAmount,
      @JsonKey(name: "CouponAmount") final double? couponAmount,
      @JsonKey(name: "ActualGameCardamount") final double? actualGameCardamount,
      @JsonKey(name: "ActualCreditCardamount")
      final double? actualCreditCardamount,
      @JsonKey(name: "ActualChequeAmount") final double? actualChequeAmount,
      @JsonKey(name: "ActualCouponAmount") final double? actualCouponAmount,
      @JsonKey(name: "ShiftLoginId") final String? shiftLoginId,
      @JsonKey(name: "MasterEntityId") final int? masterEntityId,
      @JsonKey(name: "CreatedBy") final String? createdBy,
      @JsonKey(name: "CreationDate") final String? creationDate,
      @JsonKey(name: "LastUpdatedBy") final String? lastUpdatedBy,
      @JsonKey(name: "LastUpdatedDate") final String? lastUpdatedDate,
      @JsonKey(name: "Guid") final String? guid,
      @JsonKey(name: "SiteId") final int? siteId,
      @JsonKey(name: "SynchStatus") final bool? synchStatus,
      @JsonKey(name: "ShiftLogDTOList") final List<dynamic>? shiftLogDtoList,
      @JsonKey(name: "Receipt") final dynamic receipt,
      @JsonKey(name: "CashdrawerId") final int? cashdrawerId,
      @JsonKey(name: "IsShareable") final bool? isShareable,
      @JsonKey(name: "CashdrawerStatusId") final int? cashdrawerStatusId,
      @JsonKey(name: "IsChanged") final bool? isChanged,
      @JsonKey(name: "IsChangedRecursive")
      final bool? isChangedRecursive}) = _$_ShiftDTO;

  factory _ShiftDTO.fromJson(Map<String, dynamic> json) = _$_ShiftDTO.fromJson;

  @override
  @JsonKey(name: "ShiftKey")
  int? get shiftKey;
  @override
  @JsonKey(name: "ShiftUserName")
  String? get shiftUserName;
  @override
  @JsonKey(name: "ShiftTime")
  String? get shiftTime;
  @override
  @JsonKey(name: "ShiftUserType")
  String? get shiftUserType;
  @override
  @JsonKey(name: "ShiftAction")
  String? get shiftAction;
  @override
  @JsonKey(name: "ShiftAmount")
  double? get shiftAmount;
  @override
  @JsonKey(name: "CardCount")
  double? get cardCount;
  @override
  @JsonKey(name: "ShiftTicketNumber")
  String? get shiftTicketNumber;
  @override
  @JsonKey(name: "ShiftRemarks")
  String? get shiftRemarks;
  @override
  @JsonKey(name: "POSMachine")
  String? get posMachine;
  @override
  @JsonKey(name: "ActualAmount")
  double? get actualAmount;
  @override
  @JsonKey(name: "ActualCards")
  double? get actualCards;
  @override
  @JsonKey(name: "ActualTickets")
  double? get actualTickets;
  @override
  @JsonKey(name: "GameCardamount")
  double? get gameCardamount;
  @override
  @JsonKey(name: "CreditCardamount")
  double? get creditCardamount;
  @override
  @JsonKey(name: "ChequeAmount")
  double? get chequeAmount;
  @override
  @JsonKey(name: "CouponAmount")
  double? get couponAmount;
  @override
  @JsonKey(name: "ActualGameCardamount")
  double? get actualGameCardamount;
  @override
  @JsonKey(name: "ActualCreditCardamount")
  double? get actualCreditCardamount;
  @override
  @JsonKey(name: "ActualChequeAmount")
  double? get actualChequeAmount;
  @override
  @JsonKey(name: "ActualCouponAmount")
  double? get actualCouponAmount;
  @override
  @JsonKey(name: "ShiftLoginId")
  String? get shiftLoginId;
  @override
  @JsonKey(name: "MasterEntityId")
  int? get masterEntityId;
  @override
  @JsonKey(name: "CreatedBy")
  String? get createdBy;
  @override
  @JsonKey(name: "CreationDate")
  String? get creationDate;
  @override
  @JsonKey(name: "LastUpdatedBy")
  String? get lastUpdatedBy;
  @override
  @JsonKey(name: "LastUpdatedDate")
  String? get lastUpdatedDate;
  @override
  @JsonKey(name: "Guid")
  String? get guid;
  @override
  @JsonKey(name: "SiteId")
  int? get siteId;
  @override
  @JsonKey(name: "SynchStatus")
  bool? get synchStatus;
  @override
  @JsonKey(name: "ShiftLogDTOList")
  List<dynamic>? get shiftLogDtoList;
  @override
  @JsonKey(name: "Receipt")
  dynamic get receipt;
  @override
  @JsonKey(name: "CashdrawerId")
  int? get cashdrawerId;
  @override
  @JsonKey(name: "IsShareable")
  bool? get isShareable;
  @override
  @JsonKey(name: "CashdrawerStatusId")
  int? get cashdrawerStatusId;
  @override
  @JsonKey(name: "IsChanged")
  bool? get isChanged;
  @override
  @JsonKey(name: "IsChangedRecursive")
  bool? get isChangedRecursive;
  @override
  @JsonKey(ignore: true)
  _$$_ShiftDTOCopyWith<_$_ShiftDTO> get copyWith =>
      throw _privateConstructorUsedError;
}
