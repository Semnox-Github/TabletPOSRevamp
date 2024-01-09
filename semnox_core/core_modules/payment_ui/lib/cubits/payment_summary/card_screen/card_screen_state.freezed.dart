// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'card_screen_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CardScreenState _$CardScreenStateFromJson(Map<String, dynamic> json) {
  return _CardScreenState.fromJson(json);
}

/// @nodoc
mixin _$CardScreenState {
  bool get isLoading => throw _privateConstructorUsedError;
  TransactionResponse? get transactionResponse =>
      throw _privateConstructorUsedError;
  String? get loadingMessage => throw _privateConstructorUsedError;
  String? get validationError => throw _privateConstructorUsedError;
  String? get apiError => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CardScreenStateCopyWith<CardScreenState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CardScreenStateCopyWith<$Res> {
  factory $CardScreenStateCopyWith(
          CardScreenState value, $Res Function(CardScreenState) then) =
      _$CardScreenStateCopyWithImpl<$Res, CardScreenState>;
  @useResult
  $Res call(
      {bool isLoading,
      TransactionResponse? transactionResponse,
      String? loadingMessage,
      String? validationError,
      String? apiError});

  $TransactionResponseCopyWith<$Res>? get transactionResponse;
}

/// @nodoc
class _$CardScreenStateCopyWithImpl<$Res, $Val extends CardScreenState>
    implements $CardScreenStateCopyWith<$Res> {
  _$CardScreenStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? transactionResponse = freezed,
    Object? loadingMessage = freezed,
    Object? validationError = freezed,
    Object? apiError = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      transactionResponse: freezed == transactionResponse
          ? _value.transactionResponse
          : transactionResponse // ignore: cast_nullable_to_non_nullable
              as TransactionResponse?,
      loadingMessage: freezed == loadingMessage
          ? _value.loadingMessage
          : loadingMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      validationError: freezed == validationError
          ? _value.validationError
          : validationError // ignore: cast_nullable_to_non_nullable
              as String?,
      apiError: freezed == apiError
          ? _value.apiError
          : apiError // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $TransactionResponseCopyWith<$Res>? get transactionResponse {
    if (_value.transactionResponse == null) {
      return null;
    }

    return $TransactionResponseCopyWith<$Res>(_value.transactionResponse!,
        (value) {
      return _then(_value.copyWith(transactionResponse: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CardScreenStateImplCopyWith<$Res>
    implements $CardScreenStateCopyWith<$Res> {
  factory _$$CardScreenStateImplCopyWith(_$CardScreenStateImpl value,
          $Res Function(_$CardScreenStateImpl) then) =
      __$$CardScreenStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      TransactionResponse? transactionResponse,
      String? loadingMessage,
      String? validationError,
      String? apiError});

  @override
  $TransactionResponseCopyWith<$Res>? get transactionResponse;
}

/// @nodoc
class __$$CardScreenStateImplCopyWithImpl<$Res>
    extends _$CardScreenStateCopyWithImpl<$Res, _$CardScreenStateImpl>
    implements _$$CardScreenStateImplCopyWith<$Res> {
  __$$CardScreenStateImplCopyWithImpl(
      _$CardScreenStateImpl _value, $Res Function(_$CardScreenStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? transactionResponse = freezed,
    Object? loadingMessage = freezed,
    Object? validationError = freezed,
    Object? apiError = freezed,
  }) {
    return _then(_$CardScreenStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      transactionResponse: freezed == transactionResponse
          ? _value.transactionResponse
          : transactionResponse // ignore: cast_nullable_to_non_nullable
              as TransactionResponse?,
      loadingMessage: freezed == loadingMessage
          ? _value.loadingMessage
          : loadingMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      validationError: freezed == validationError
          ? _value.validationError
          : validationError // ignore: cast_nullable_to_non_nullable
              as String?,
      apiError: freezed == apiError
          ? _value.apiError
          : apiError // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CardScreenStateImpl implements _CardScreenState {
  const _$CardScreenStateImpl(
      {this.isLoading = false,
      this.transactionResponse,
      this.loadingMessage,
      this.validationError,
      this.apiError});

  factory _$CardScreenStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$CardScreenStateImplFromJson(json);

  @override
  @JsonKey()
  final bool isLoading;
  @override
  final TransactionResponse? transactionResponse;
  @override
  final String? loadingMessage;
  @override
  final String? validationError;
  @override
  final String? apiError;

  @override
  String toString() {
    return 'CardScreenState(isLoading: $isLoading, transactionResponse: $transactionResponse, loadingMessage: $loadingMessage, validationError: $validationError, apiError: $apiError)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CardScreenStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.transactionResponse, transactionResponse) ||
                other.transactionResponse == transactionResponse) &&
            (identical(other.loadingMessage, loadingMessage) ||
                other.loadingMessage == loadingMessage) &&
            (identical(other.validationError, validationError) ||
                other.validationError == validationError) &&
            (identical(other.apiError, apiError) ||
                other.apiError == apiError));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, isLoading, transactionResponse,
      loadingMessage, validationError, apiError);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CardScreenStateImplCopyWith<_$CardScreenStateImpl> get copyWith =>
      __$$CardScreenStateImplCopyWithImpl<_$CardScreenStateImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CardScreenStateImplToJson(
      this,
    );
  }
}

abstract class _CardScreenState implements CardScreenState {
  const factory _CardScreenState(
      {final bool isLoading,
      final TransactionResponse? transactionResponse,
      final String? loadingMessage,
      final String? validationError,
      final String? apiError}) = _$CardScreenStateImpl;

  factory _CardScreenState.fromJson(Map<String, dynamic> json) =
      _$CardScreenStateImpl.fromJson;

  @override
  bool get isLoading;
  @override
  TransactionResponse? get transactionResponse;
  @override
  String? get loadingMessage;
  @override
  String? get validationError;
  @override
  String? get apiError;
  @override
  @JsonKey(ignore: true)
  _$$CardScreenStateImplCopyWith<_$CardScreenStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
