// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pos_config_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PosConfigState _$PosConfigStateFromJson(Map<String, dynamic> json) {
  return _PosConfigState.fromJson(json);
}

/// @nodoc
mixin _$PosConfigState {
  int get loadingStatus => throw _privateConstructorUsedError;
  bool get isServerValidated => throw _privateConstructorUsedError;
  List<SiteDTO> get sites => throw _privateConstructorUsedError;
  bool get isServerErrorsPresent => throw _privateConstructorUsedError;
  SystemUserLoginResponse? get loginResponse =>
      throw _privateConstructorUsedError;
  String? get loadingMessage => throw _privateConstructorUsedError;
  String? get validationError => throw _privateConstructorUsedError;
  String? get apiError => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PosConfigStateCopyWith<PosConfigState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PosConfigStateCopyWith<$Res> {
  factory $PosConfigStateCopyWith(
          PosConfigState value, $Res Function(PosConfigState) then) =
      _$PosConfigStateCopyWithImpl<$Res, PosConfigState>;
  @useResult
  $Res call(
      {int loadingStatus,
      bool isServerValidated,
      List<SiteDTO> sites,
      bool isServerErrorsPresent,
      SystemUserLoginResponse? loginResponse,
      String? loadingMessage,
      String? validationError,
      String? apiError});

  $SystemUserLoginResponseCopyWith<$Res>? get loginResponse;
}

/// @nodoc
class _$PosConfigStateCopyWithImpl<$Res, $Val extends PosConfigState>
    implements $PosConfigStateCopyWith<$Res> {
  _$PosConfigStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loadingStatus = null,
    Object? isServerValidated = null,
    Object? sites = null,
    Object? isServerErrorsPresent = null,
    Object? loginResponse = freezed,
    Object? loadingMessage = freezed,
    Object? validationError = freezed,
    Object? apiError = freezed,
  }) {
    return _then(_value.copyWith(
      loadingStatus: null == loadingStatus
          ? _value.loadingStatus
          : loadingStatus // ignore: cast_nullable_to_non_nullable
              as int,
      isServerValidated: null == isServerValidated
          ? _value.isServerValidated
          : isServerValidated // ignore: cast_nullable_to_non_nullable
              as bool,
      sites: null == sites
          ? _value.sites
          : sites // ignore: cast_nullable_to_non_nullable
              as List<SiteDTO>,
      isServerErrorsPresent: null == isServerErrorsPresent
          ? _value.isServerErrorsPresent
          : isServerErrorsPresent // ignore: cast_nullable_to_non_nullable
              as bool,
      loginResponse: freezed == loginResponse
          ? _value.loginResponse
          : loginResponse // ignore: cast_nullable_to_non_nullable
              as SystemUserLoginResponse?,
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
  $SystemUserLoginResponseCopyWith<$Res>? get loginResponse {
    if (_value.loginResponse == null) {
      return null;
    }

    return $SystemUserLoginResponseCopyWith<$Res>(_value.loginResponse!,
        (value) {
      return _then(_value.copyWith(loginResponse: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_PosConfigStateCopyWith<$Res>
    implements $PosConfigStateCopyWith<$Res> {
  factory _$$_PosConfigStateCopyWith(
          _$_PosConfigState value, $Res Function(_$_PosConfigState) then) =
      __$$_PosConfigStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int loadingStatus,
      bool isServerValidated,
      List<SiteDTO> sites,
      bool isServerErrorsPresent,
      SystemUserLoginResponse? loginResponse,
      String? loadingMessage,
      String? validationError,
      String? apiError});

  @override
  $SystemUserLoginResponseCopyWith<$Res>? get loginResponse;
}

/// @nodoc
class __$$_PosConfigStateCopyWithImpl<$Res>
    extends _$PosConfigStateCopyWithImpl<$Res, _$_PosConfigState>
    implements _$$_PosConfigStateCopyWith<$Res> {
  __$$_PosConfigStateCopyWithImpl(
      _$_PosConfigState _value, $Res Function(_$_PosConfigState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loadingStatus = null,
    Object? isServerValidated = null,
    Object? sites = null,
    Object? isServerErrorsPresent = null,
    Object? loginResponse = freezed,
    Object? loadingMessage = freezed,
    Object? validationError = freezed,
    Object? apiError = freezed,
  }) {
    return _then(_$_PosConfigState(
      loadingStatus: null == loadingStatus
          ? _value.loadingStatus
          : loadingStatus // ignore: cast_nullable_to_non_nullable
              as int,
      isServerValidated: null == isServerValidated
          ? _value.isServerValidated
          : isServerValidated // ignore: cast_nullable_to_non_nullable
              as bool,
      sites: null == sites
          ? _value._sites
          : sites // ignore: cast_nullable_to_non_nullable
              as List<SiteDTO>,
      isServerErrorsPresent: null == isServerErrorsPresent
          ? _value.isServerErrorsPresent
          : isServerErrorsPresent // ignore: cast_nullable_to_non_nullable
              as bool,
      loginResponse: freezed == loginResponse
          ? _value.loginResponse
          : loginResponse // ignore: cast_nullable_to_non_nullable
              as SystemUserLoginResponse?,
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
class _$_PosConfigState implements _PosConfigState {
  const _$_PosConfigState(
      {this.loadingStatus = -1,
      this.isServerValidated = false,
      final List<SiteDTO> sites = const [],
      this.isServerErrorsPresent = false,
      this.loginResponse,
      this.loadingMessage,
      this.validationError,
      this.apiError})
      : _sites = sites;

  factory _$_PosConfigState.fromJson(Map<String, dynamic> json) =>
      _$$_PosConfigStateFromJson(json);

  @override
  @JsonKey()
  final int loadingStatus;
  @override
  @JsonKey()
  final bool isServerValidated;
  final List<SiteDTO> _sites;
  @override
  @JsonKey()
  List<SiteDTO> get sites {
    if (_sites is EqualUnmodifiableListView) return _sites;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_sites);
  }

  @override
  @JsonKey()
  final bool isServerErrorsPresent;
  @override
  final SystemUserLoginResponse? loginResponse;
  @override
  final String? loadingMessage;
  @override
  final String? validationError;
  @override
  final String? apiError;

  @override
  String toString() {
    return 'PosConfigState(loadingStatus: $loadingStatus, isServerValidated: $isServerValidated, sites: $sites, isServerErrorsPresent: $isServerErrorsPresent, loginResponse: $loginResponse, loadingMessage: $loadingMessage, validationError: $validationError, apiError: $apiError)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PosConfigState &&
            (identical(other.loadingStatus, loadingStatus) ||
                other.loadingStatus == loadingStatus) &&
            (identical(other.isServerValidated, isServerValidated) ||
                other.isServerValidated == isServerValidated) &&
            const DeepCollectionEquality().equals(other._sites, _sites) &&
            (identical(other.isServerErrorsPresent, isServerErrorsPresent) ||
                other.isServerErrorsPresent == isServerErrorsPresent) &&
            (identical(other.loginResponse, loginResponse) ||
                other.loginResponse == loginResponse) &&
            (identical(other.loadingMessage, loadingMessage) ||
                other.loadingMessage == loadingMessage) &&
            (identical(other.validationError, validationError) ||
                other.validationError == validationError) &&
            (identical(other.apiError, apiError) ||
                other.apiError == apiError));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      loadingStatus,
      isServerValidated,
      const DeepCollectionEquality().hash(_sites),
      isServerErrorsPresent,
      loginResponse,
      loadingMessage,
      validationError,
      apiError);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PosConfigStateCopyWith<_$_PosConfigState> get copyWith =>
      __$$_PosConfigStateCopyWithImpl<_$_PosConfigState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PosConfigStateToJson(
      this,
    );
  }
}

abstract class _PosConfigState implements PosConfigState {
  const factory _PosConfigState(
      {final int loadingStatus,
      final bool isServerValidated,
      final List<SiteDTO> sites,
      final bool isServerErrorsPresent,
      final SystemUserLoginResponse? loginResponse,
      final String? loadingMessage,
      final String? validationError,
      final String? apiError}) = _$_PosConfigState;

  factory _PosConfigState.fromJson(Map<String, dynamic> json) =
      _$_PosConfigState.fromJson;

  @override
  int get loadingStatus;
  @override
  bool get isServerValidated;
  @override
  List<SiteDTO> get sites;
  @override
  bool get isServerErrorsPresent;
  @override
  SystemUserLoginResponse? get loginResponse;
  @override
  String? get loadingMessage;
  @override
  String? get validationError;
  @override
  String? get apiError;
  @override
  @JsonKey(ignore: true)
  _$$_PosConfigStateCopyWith<_$_PosConfigState> get copyWith =>
      throw _privateConstructorUsedError;
}
