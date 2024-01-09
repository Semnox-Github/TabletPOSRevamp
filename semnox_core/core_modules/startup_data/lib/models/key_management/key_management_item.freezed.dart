// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'key_management_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

KeyManagementItem _$KeyManagementItemFromJson(Map<String, dynamic> json) {
  return _KeyManagementItem.fromJson(json);
}

/// @nodoc
mixin _$KeyManagementItem {
  @JsonKey(name: 'KeyManagementWarningType')
  String get keyManagementWarningType => throw _privateConstructorUsedError;
  @JsonKey(name: 'MessageNumber')
  int get messageNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'Parameters')
  List<String> get parameters => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $KeyManagementItemCopyWith<KeyManagementItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $KeyManagementItemCopyWith<$Res> {
  factory $KeyManagementItemCopyWith(
          KeyManagementItem value, $Res Function(KeyManagementItem) then) =
      _$KeyManagementItemCopyWithImpl<$Res, KeyManagementItem>;
  @useResult
  $Res call(
      {@JsonKey(name: 'KeyManagementWarningType')
          String keyManagementWarningType,
      @JsonKey(name: 'MessageNumber')
          int messageNumber,
      @JsonKey(name: 'Parameters')
          List<String> parameters});
}

/// @nodoc
class _$KeyManagementItemCopyWithImpl<$Res, $Val extends KeyManagementItem>
    implements $KeyManagementItemCopyWith<$Res> {
  _$KeyManagementItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? keyManagementWarningType = null,
    Object? messageNumber = null,
    Object? parameters = null,
  }) {
    return _then(_value.copyWith(
      keyManagementWarningType: null == keyManagementWarningType
          ? _value.keyManagementWarningType
          : keyManagementWarningType // ignore: cast_nullable_to_non_nullable
              as String,
      messageNumber: null == messageNumber
          ? _value.messageNumber
          : messageNumber // ignore: cast_nullable_to_non_nullable
              as int,
      parameters: null == parameters
          ? _value.parameters
          : parameters // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_KeyManagementItemCopyWith<$Res>
    implements $KeyManagementItemCopyWith<$Res> {
  factory _$$_KeyManagementItemCopyWith(_$_KeyManagementItem value,
          $Res Function(_$_KeyManagementItem) then) =
      __$$_KeyManagementItemCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'KeyManagementWarningType')
          String keyManagementWarningType,
      @JsonKey(name: 'MessageNumber')
          int messageNumber,
      @JsonKey(name: 'Parameters')
          List<String> parameters});
}

/// @nodoc
class __$$_KeyManagementItemCopyWithImpl<$Res>
    extends _$KeyManagementItemCopyWithImpl<$Res, _$_KeyManagementItem>
    implements _$$_KeyManagementItemCopyWith<$Res> {
  __$$_KeyManagementItemCopyWithImpl(
      _$_KeyManagementItem _value, $Res Function(_$_KeyManagementItem) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? keyManagementWarningType = null,
    Object? messageNumber = null,
    Object? parameters = null,
  }) {
    return _then(_$_KeyManagementItem(
      keyManagementWarningType: null == keyManagementWarningType
          ? _value.keyManagementWarningType
          : keyManagementWarningType // ignore: cast_nullable_to_non_nullable
              as String,
      messageNumber: null == messageNumber
          ? _value.messageNumber
          : messageNumber // ignore: cast_nullable_to_non_nullable
              as int,
      parameters: null == parameters
          ? _value._parameters
          : parameters // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_KeyManagementItem implements _KeyManagementItem {
  const _$_KeyManagementItem(
      {@JsonKey(name: 'KeyManagementWarningType')
          required this.keyManagementWarningType,
      @JsonKey(name: 'MessageNumber')
          required this.messageNumber,
      @JsonKey(name: 'Parameters')
          required final List<String> parameters})
      : _parameters = parameters;

  factory _$_KeyManagementItem.fromJson(Map<String, dynamic> json) =>
      _$$_KeyManagementItemFromJson(json);

  @override
  @JsonKey(name: 'KeyManagementWarningType')
  final String keyManagementWarningType;
  @override
  @JsonKey(name: 'MessageNumber')
  final int messageNumber;
  final List<String> _parameters;
  @override
  @JsonKey(name: 'Parameters')
  List<String> get parameters {
    if (_parameters is EqualUnmodifiableListView) return _parameters;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_parameters);
  }

  @override
  String toString() {
    return 'KeyManagementItem(keyManagementWarningType: $keyManagementWarningType, messageNumber: $messageNumber, parameters: $parameters)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_KeyManagementItem &&
            (identical(
                    other.keyManagementWarningType, keyManagementWarningType) ||
                other.keyManagementWarningType == keyManagementWarningType) &&
            (identical(other.messageNumber, messageNumber) ||
                other.messageNumber == messageNumber) &&
            const DeepCollectionEquality()
                .equals(other._parameters, _parameters));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, keyManagementWarningType,
      messageNumber, const DeepCollectionEquality().hash(_parameters));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_KeyManagementItemCopyWith<_$_KeyManagementItem> get copyWith =>
      __$$_KeyManagementItemCopyWithImpl<_$_KeyManagementItem>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_KeyManagementItemToJson(
      this,
    );
  }
}

abstract class _KeyManagementItem implements KeyManagementItem {
  const factory _KeyManagementItem(
      {@JsonKey(name: 'KeyManagementWarningType')
          required final String keyManagementWarningType,
      @JsonKey(name: 'MessageNumber')
          required final int messageNumber,
      @JsonKey(name: 'Parameters')
          required final List<String> parameters}) = _$_KeyManagementItem;

  factory _KeyManagementItem.fromJson(Map<String, dynamic> json) =
      _$_KeyManagementItem.fromJson;

  @override
  @JsonKey(name: 'KeyManagementWarningType')
  String get keyManagementWarningType;
  @override
  @JsonKey(name: 'MessageNumber')
  int get messageNumber;
  @override
  @JsonKey(name: 'Parameters')
  List<String> get parameters;
  @override
  @JsonKey(ignore: true)
  _$$_KeyManagementItemCopyWith<_$_KeyManagementItem> get copyWith =>
      throw _privateConstructorUsedError;
}
