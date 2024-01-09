// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pause_time_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PauseTimeRequest _$PauseTimeRequestFromJson(Map<String, dynamic> json) {
  return _PauseTimeRequest.fromJson(json);
}

/// @nodoc
mixin _$PauseTimeRequest {
  @JsonKey(name: 'CardId')
  int? get cardId => throw _privateConstructorUsedError;
  @JsonKey(name: 'ManagerId')
  int? get managerId => throw _privateConstructorUsedError;
  @JsonKey(name: 'Remarks')
  String? get remarks => throw _privateConstructorUsedError;
  @JsonKey(name: 'TimeStatus')
  int? get timeStatus => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PauseTimeRequestCopyWith<PauseTimeRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PauseTimeRequestCopyWith<$Res> {
  factory $PauseTimeRequestCopyWith(
          PauseTimeRequest value, $Res Function(PauseTimeRequest) then) =
      _$PauseTimeRequestCopyWithImpl<$Res, PauseTimeRequest>;
  @useResult
  $Res call(
      {@JsonKey(name: 'CardId') int? cardId,
      @JsonKey(name: 'ManagerId') int? managerId,
      @JsonKey(name: 'Remarks') String? remarks,
      @JsonKey(name: 'TimeStatus') int? timeStatus});
}

/// @nodoc
class _$PauseTimeRequestCopyWithImpl<$Res, $Val extends PauseTimeRequest>
    implements $PauseTimeRequestCopyWith<$Res> {
  _$PauseTimeRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cardId = freezed,
    Object? managerId = freezed,
    Object? remarks = freezed,
    Object? timeStatus = freezed,
  }) {
    return _then(_value.copyWith(
      cardId: freezed == cardId
          ? _value.cardId
          : cardId // ignore: cast_nullable_to_non_nullable
              as int?,
      managerId: freezed == managerId
          ? _value.managerId
          : managerId // ignore: cast_nullable_to_non_nullable
              as int?,
      remarks: freezed == remarks
          ? _value.remarks
          : remarks // ignore: cast_nullable_to_non_nullable
              as String?,
      timeStatus: freezed == timeStatus
          ? _value.timeStatus
          : timeStatus // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PauseTimeRequestCopyWith<$Res>
    implements $PauseTimeRequestCopyWith<$Res> {
  factory _$$_PauseTimeRequestCopyWith(
          _$_PauseTimeRequest value, $Res Function(_$_PauseTimeRequest) then) =
      __$$_PauseTimeRequestCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'CardId') int? cardId,
      @JsonKey(name: 'ManagerId') int? managerId,
      @JsonKey(name: 'Remarks') String? remarks,
      @JsonKey(name: 'TimeStatus') int? timeStatus});
}

/// @nodoc
class __$$_PauseTimeRequestCopyWithImpl<$Res>
    extends _$PauseTimeRequestCopyWithImpl<$Res, _$_PauseTimeRequest>
    implements _$$_PauseTimeRequestCopyWith<$Res> {
  __$$_PauseTimeRequestCopyWithImpl(
      _$_PauseTimeRequest _value, $Res Function(_$_PauseTimeRequest) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cardId = freezed,
    Object? managerId = freezed,
    Object? remarks = freezed,
    Object? timeStatus = freezed,
  }) {
    return _then(_$_PauseTimeRequest(
      cardId: freezed == cardId
          ? _value.cardId
          : cardId // ignore: cast_nullable_to_non_nullable
              as int?,
      managerId: freezed == managerId
          ? _value.managerId
          : managerId // ignore: cast_nullable_to_non_nullable
              as int?,
      remarks: freezed == remarks
          ? _value.remarks
          : remarks // ignore: cast_nullable_to_non_nullable
              as String?,
      timeStatus: freezed == timeStatus
          ? _value.timeStatus
          : timeStatus // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PauseTimeRequest implements _PauseTimeRequest {
  const _$_PauseTimeRequest(
      {@JsonKey(name: 'CardId') this.cardId,
      @JsonKey(name: 'ManagerId') this.managerId,
      @JsonKey(name: 'Remarks') this.remarks,
      @JsonKey(name: 'TimeStatus') this.timeStatus});

  factory _$_PauseTimeRequest.fromJson(Map<String, dynamic> json) =>
      _$$_PauseTimeRequestFromJson(json);

  @override
  @JsonKey(name: 'CardId')
  final int? cardId;
  @override
  @JsonKey(name: 'ManagerId')
  final int? managerId;
  @override
  @JsonKey(name: 'Remarks')
  final String? remarks;
  @override
  @JsonKey(name: 'TimeStatus')
  final int? timeStatus;

  @override
  String toString() {
    return 'PauseTimeRequest(cardId: $cardId, managerId: $managerId, remarks: $remarks, timeStatus: $timeStatus)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PauseTimeRequest &&
            (identical(other.cardId, cardId) || other.cardId == cardId) &&
            (identical(other.managerId, managerId) ||
                other.managerId == managerId) &&
            (identical(other.remarks, remarks) || other.remarks == remarks) &&
            (identical(other.timeStatus, timeStatus) ||
                other.timeStatus == timeStatus));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, cardId, managerId, remarks, timeStatus);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PauseTimeRequestCopyWith<_$_PauseTimeRequest> get copyWith =>
      __$$_PauseTimeRequestCopyWithImpl<_$_PauseTimeRequest>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PauseTimeRequestToJson(
      this,
    );
  }
}

abstract class _PauseTimeRequest implements PauseTimeRequest {
  const factory _PauseTimeRequest(
          {@JsonKey(name: 'CardId') final int? cardId,
          @JsonKey(name: 'ManagerId') final int? managerId,
          @JsonKey(name: 'Remarks') final String? remarks,
          @JsonKey(name: 'TimeStatus') final int? timeStatus}) =
      _$_PauseTimeRequest;

  factory _PauseTimeRequest.fromJson(Map<String, dynamic> json) =
      _$_PauseTimeRequest.fromJson;

  @override
  @JsonKey(name: 'CardId')
  int? get cardId;
  @override
  @JsonKey(name: 'ManagerId')
  int? get managerId;
  @override
  @JsonKey(name: 'Remarks')
  String? get remarks;
  @override
  @JsonKey(name: 'TimeStatus')
  int? get timeStatus;
  @override
  @JsonKey(ignore: true)
  _$$_PauseTimeRequestCopyWith<_$_PauseTimeRequest> get copyWith =>
      throw _privateConstructorUsedError;
}
