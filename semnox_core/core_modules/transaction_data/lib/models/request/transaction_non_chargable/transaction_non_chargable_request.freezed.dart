// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transaction_non_chargable_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TransactionNonChargableRequest _$TransactionNonChargableRequestFromJson(
    Map<String, dynamic> json) {
  return _TransactionNonChargableRequest.fromJson(json);
}

/// @nodoc
mixin _$TransactionNonChargableRequest {
  @JsonKey(name: 'ApproverId')
  int get approverId => throw _privateConstructorUsedError;
  @JsonKey(name: 'Remarks')
  String get remarks => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TransactionNonChargableRequestCopyWith<TransactionNonChargableRequest>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionNonChargableRequestCopyWith<$Res> {
  factory $TransactionNonChargableRequestCopyWith(
          TransactionNonChargableRequest value,
          $Res Function(TransactionNonChargableRequest) then) =
      _$TransactionNonChargableRequestCopyWithImpl<$Res,
          TransactionNonChargableRequest>;
  @useResult
  $Res call(
      {@JsonKey(name: 'ApproverId') int approverId,
      @JsonKey(name: 'Remarks') String remarks});
}

/// @nodoc
class _$TransactionNonChargableRequestCopyWithImpl<$Res,
        $Val extends TransactionNonChargableRequest>
    implements $TransactionNonChargableRequestCopyWith<$Res> {
  _$TransactionNonChargableRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? approverId = null,
    Object? remarks = null,
  }) {
    return _then(_value.copyWith(
      approverId: null == approverId
          ? _value.approverId
          : approverId // ignore: cast_nullable_to_non_nullable
              as int,
      remarks: null == remarks
          ? _value.remarks
          : remarks // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TransactionNonChargableRequestCopyWith<$Res>
    implements $TransactionNonChargableRequestCopyWith<$Res> {
  factory _$$_TransactionNonChargableRequestCopyWith(
          _$_TransactionNonChargableRequest value,
          $Res Function(_$_TransactionNonChargableRequest) then) =
      __$$_TransactionNonChargableRequestCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'ApproverId') int approverId,
      @JsonKey(name: 'Remarks') String remarks});
}

/// @nodoc
class __$$_TransactionNonChargableRequestCopyWithImpl<$Res>
    extends _$TransactionNonChargableRequestCopyWithImpl<$Res,
        _$_TransactionNonChargableRequest>
    implements _$$_TransactionNonChargableRequestCopyWith<$Res> {
  __$$_TransactionNonChargableRequestCopyWithImpl(
      _$_TransactionNonChargableRequest _value,
      $Res Function(_$_TransactionNonChargableRequest) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? approverId = null,
    Object? remarks = null,
  }) {
    return _then(_$_TransactionNonChargableRequest(
      approverId: null == approverId
          ? _value.approverId
          : approverId // ignore: cast_nullable_to_non_nullable
              as int,
      remarks: null == remarks
          ? _value.remarks
          : remarks // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TransactionNonChargableRequest
    implements _TransactionNonChargableRequest {
  const _$_TransactionNonChargableRequest(
      {@JsonKey(name: 'ApproverId') required this.approverId,
      @JsonKey(name: 'Remarks') required this.remarks});

  factory _$_TransactionNonChargableRequest.fromJson(
          Map<String, dynamic> json) =>
      _$$_TransactionNonChargableRequestFromJson(json);

  @override
  @JsonKey(name: 'ApproverId')
  final int approverId;
  @override
  @JsonKey(name: 'Remarks')
  final String remarks;

  @override
  String toString() {
    return 'TransactionNonChargableRequest(approverId: $approverId, remarks: $remarks)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TransactionNonChargableRequest &&
            (identical(other.approverId, approverId) ||
                other.approverId == approverId) &&
            (identical(other.remarks, remarks) || other.remarks == remarks));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, approverId, remarks);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TransactionNonChargableRequestCopyWith<_$_TransactionNonChargableRequest>
      get copyWith => __$$_TransactionNonChargableRequestCopyWithImpl<
          _$_TransactionNonChargableRequest>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TransactionNonChargableRequestToJson(
      this,
    );
  }
}

abstract class _TransactionNonChargableRequest
    implements TransactionNonChargableRequest {
  const factory _TransactionNonChargableRequest(
          {@JsonKey(name: 'ApproverId') required final int approverId,
          @JsonKey(name: 'Remarks') required final String remarks}) =
      _$_TransactionNonChargableRequest;

  factory _TransactionNonChargableRequest.fromJson(Map<String, dynamic> json) =
      _$_TransactionNonChargableRequest.fromJson;

  @override
  @JsonKey(name: 'ApproverId')
  int get approverId;
  @override
  @JsonKey(name: 'Remarks')
  String get remarks;
  @override
  @JsonKey(ignore: true)
  _$$_TransactionNonChargableRequestCopyWith<_$_TransactionNonChargableRequest>
      get copyWith => throw _privateConstructorUsedError;
}
