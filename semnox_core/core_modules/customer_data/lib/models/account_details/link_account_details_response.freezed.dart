// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'link_account_details_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LinkAccountDetailsResponse _$LinkAccountDetailsResponseFromJson(
    Map<String, dynamic> json) {
  return _LinkAccountDetailsResponse.fromJson(json);
}

/// @nodoc
mixin _$LinkAccountDetailsResponse {
  AccountDetailsData? get data => throw _privateConstructorUsedError;
  String? get exception => throw _privateConstructorUsedError;
  int? get currentPageNo => throw _privateConstructorUsedError;
  int? get totalCount => throw _privateConstructorUsedError;
  String? get barCode => throw _privateConstructorUsedError;
  String? get token => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LinkAccountDetailsResponseCopyWith<LinkAccountDetailsResponse>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LinkAccountDetailsResponseCopyWith<$Res> {
  factory $LinkAccountDetailsResponseCopyWith(LinkAccountDetailsResponse value,
          $Res Function(LinkAccountDetailsResponse) then) =
      _$LinkAccountDetailsResponseCopyWithImpl<$Res,
          LinkAccountDetailsResponse>;
  @useResult
  $Res call(
      {AccountDetailsData? data,
      String? exception,
      int? currentPageNo,
      int? totalCount,
      String? barCode,
      String? token});

  $AccountDetailsDataCopyWith<$Res>? get data;
}

/// @nodoc
class _$LinkAccountDetailsResponseCopyWithImpl<$Res,
        $Val extends LinkAccountDetailsResponse>
    implements $LinkAccountDetailsResponseCopyWith<$Res> {
  _$LinkAccountDetailsResponseCopyWithImpl(this._value, this._then);

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
              as AccountDetailsData?,
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

  @override
  @pragma('vm:prefer-inline')
  $AccountDetailsDataCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $AccountDetailsDataCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_LinkAccountDetailsResponseCopyWith<$Res>
    implements $LinkAccountDetailsResponseCopyWith<$Res> {
  factory _$$_LinkAccountDetailsResponseCopyWith(
          _$_LinkAccountDetailsResponse value,
          $Res Function(_$_LinkAccountDetailsResponse) then) =
      __$$_LinkAccountDetailsResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {AccountDetailsData? data,
      String? exception,
      int? currentPageNo,
      int? totalCount,
      String? barCode,
      String? token});

  @override
  $AccountDetailsDataCopyWith<$Res>? get data;
}

/// @nodoc
class __$$_LinkAccountDetailsResponseCopyWithImpl<$Res>
    extends _$LinkAccountDetailsResponseCopyWithImpl<$Res,
        _$_LinkAccountDetailsResponse>
    implements _$$_LinkAccountDetailsResponseCopyWith<$Res> {
  __$$_LinkAccountDetailsResponseCopyWithImpl(
      _$_LinkAccountDetailsResponse _value,
      $Res Function(_$_LinkAccountDetailsResponse) _then)
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
    return _then(_$_LinkAccountDetailsResponse(
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as AccountDetailsData?,
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
class _$_LinkAccountDetailsResponse implements _LinkAccountDetailsResponse {
  const _$_LinkAccountDetailsResponse(
      {this.data,
      this.exception,
      this.currentPageNo,
      this.totalCount,
      this.barCode,
      this.token});

  factory _$_LinkAccountDetailsResponse.fromJson(Map<String, dynamic> json) =>
      _$$_LinkAccountDetailsResponseFromJson(json);

  @override
  final AccountDetailsData? data;
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
    return 'LinkAccountDetailsResponse(data: $data, exception: $exception, currentPageNo: $currentPageNo, totalCount: $totalCount, barCode: $barCode, token: $token)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LinkAccountDetailsResponse &&
            (identical(other.data, data) || other.data == data) &&
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
      runtimeType, data, exception, currentPageNo, totalCount, barCode, token);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LinkAccountDetailsResponseCopyWith<_$_LinkAccountDetailsResponse>
      get copyWith => __$$_LinkAccountDetailsResponseCopyWithImpl<
          _$_LinkAccountDetailsResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LinkAccountDetailsResponseToJson(
      this,
    );
  }
}

abstract class _LinkAccountDetailsResponse
    implements LinkAccountDetailsResponse {
  const factory _LinkAccountDetailsResponse(
      {final AccountDetailsData? data,
      final String? exception,
      final int? currentPageNo,
      final int? totalCount,
      final String? barCode,
      final String? token}) = _$_LinkAccountDetailsResponse;

  factory _LinkAccountDetailsResponse.fromJson(Map<String, dynamic> json) =
      _$_LinkAccountDetailsResponse.fromJson;

  @override
  AccountDetailsData? get data;
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
  _$$_LinkAccountDetailsResponseCopyWith<_$_LinkAccountDetailsResponse>
      get copyWith => throw _privateConstructorUsedError;
}
