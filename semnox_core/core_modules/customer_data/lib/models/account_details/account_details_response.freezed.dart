// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'account_details_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AccountDetailsResponse _$AccountDetailsResponseFromJson(
    Map<String, dynamic> json) {
  return _AccountDetailsResponse.fromJson(json);
}

/// @nodoc
mixin _$AccountDetailsResponse {
  List<AccountDetailsData>? get data => throw _privateConstructorUsedError;
  String? get exception => throw _privateConstructorUsedError;
  int? get currentPageNo => throw _privateConstructorUsedError;
  int? get totalCount => throw _privateConstructorUsedError;
  String? get barCode => throw _privateConstructorUsedError;
  String? get token => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AccountDetailsResponseCopyWith<AccountDetailsResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AccountDetailsResponseCopyWith<$Res> {
  factory $AccountDetailsResponseCopyWith(AccountDetailsResponse value,
          $Res Function(AccountDetailsResponse) then) =
      _$AccountDetailsResponseCopyWithImpl<$Res, AccountDetailsResponse>;
  @useResult
  $Res call(
      {List<AccountDetailsData>? data,
      String? exception,
      int? currentPageNo,
      int? totalCount,
      String? barCode,
      String? token});
}

/// @nodoc
class _$AccountDetailsResponseCopyWithImpl<$Res,
        $Val extends AccountDetailsResponse>
    implements $AccountDetailsResponseCopyWith<$Res> {
  _$AccountDetailsResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
    Object? exception = freezed,
    Object? currentPageNo = freezed,
    Object? totalCount = freezed,
    Object? barCode = freezed,
    Object? token = freezed,
  }) {
    return _then(_value.copyWith(
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<AccountDetailsData>?,
      exception: freezed == exception
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as String?,
      currentPageNo: freezed == currentPageNo
          ? _value.currentPageNo
          : currentPageNo // ignore: cast_nullable_to_non_nullable
              as int?,
      totalCount: freezed == totalCount
          ? _value.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as int?,
      barCode: freezed == barCode
          ? _value.barCode
          : barCode // ignore: cast_nullable_to_non_nullable
              as String?,
      token: freezed == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AccountDetailsResponseCopyWith<$Res>
    implements $AccountDetailsResponseCopyWith<$Res> {
  factory _$$_AccountDetailsResponseCopyWith(_$_AccountDetailsResponse value,
          $Res Function(_$_AccountDetailsResponse) then) =
      __$$_AccountDetailsResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<AccountDetailsData>? data,
      String? exception,
      int? currentPageNo,
      int? totalCount,
      String? barCode,
      String? token});
}

/// @nodoc
class __$$_AccountDetailsResponseCopyWithImpl<$Res>
    extends _$AccountDetailsResponseCopyWithImpl<$Res,
        _$_AccountDetailsResponse>
    implements _$$_AccountDetailsResponseCopyWith<$Res> {
  __$$_AccountDetailsResponseCopyWithImpl(_$_AccountDetailsResponse _value,
      $Res Function(_$_AccountDetailsResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
    Object? exception = freezed,
    Object? currentPageNo = freezed,
    Object? totalCount = freezed,
    Object? barCode = freezed,
    Object? token = freezed,
  }) {
    return _then(_$_AccountDetailsResponse(
      data: freezed == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<AccountDetailsData>?,
      exception: freezed == exception
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as String?,
      currentPageNo: freezed == currentPageNo
          ? _value.currentPageNo
          : currentPageNo // ignore: cast_nullable_to_non_nullable
              as int?,
      totalCount: freezed == totalCount
          ? _value.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as int?,
      barCode: freezed == barCode
          ? _value.barCode
          : barCode // ignore: cast_nullable_to_non_nullable
              as String?,
      token: freezed == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AccountDetailsResponse implements _AccountDetailsResponse {
  const _$_AccountDetailsResponse(
      {final List<AccountDetailsData>? data,
      this.exception,
      this.currentPageNo,
      this.totalCount,
      this.barCode,
      this.token})
      : _data = data;

  factory _$_AccountDetailsResponse.fromJson(Map<String, dynamic> json) =>
      _$$_AccountDetailsResponseFromJson(json);

  final List<AccountDetailsData>? _data;
  @override
  List<AccountDetailsData>? get data {
    final value = _data;
    if (value == null) return null;
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? exception;
  @override
  final int? currentPageNo;
  @override
  final int? totalCount;
  @override
  final String? barCode;
  @override
  final String? token;

  @override
  String toString() {
    return 'AccountDetailsResponse(data: $data, exception: $exception, currentPageNo: $currentPageNo, totalCount: $totalCount, barCode: $barCode, token: $token)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AccountDetailsResponse &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            (identical(other.exception, exception) ||
                other.exception == exception) &&
            (identical(other.currentPageNo, currentPageNo) ||
                other.currentPageNo == currentPageNo) &&
            (identical(other.totalCount, totalCount) ||
                other.totalCount == totalCount) &&
            (identical(other.barCode, barCode) || other.barCode == barCode) &&
            (identical(other.token, token) || other.token == token));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_data),
      exception,
      currentPageNo,
      totalCount,
      barCode,
      token);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AccountDetailsResponseCopyWith<_$_AccountDetailsResponse> get copyWith =>
      __$$_AccountDetailsResponseCopyWithImpl<_$_AccountDetailsResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AccountDetailsResponseToJson(
      this,
    );
  }
}

abstract class _AccountDetailsResponse implements AccountDetailsResponse {
  const factory _AccountDetailsResponse(
      {final List<AccountDetailsData>? data,
      final String? exception,
      final int? currentPageNo,
      final int? totalCount,
      final String? barCode,
      final String? token}) = _$_AccountDetailsResponse;

  factory _AccountDetailsResponse.fromJson(Map<String, dynamic> json) =
      _$_AccountDetailsResponse.fromJson;

  @override
  List<AccountDetailsData>? get data;
  @override
  String? get exception;
  @override
  int? get currentPageNo;
  @override
  int? get totalCount;
  @override
  String? get barCode;
  @override
  String? get token;
  @override
  @JsonKey(ignore: true)
  _$$_AccountDetailsResponseCopyWith<_$_AccountDetailsResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
