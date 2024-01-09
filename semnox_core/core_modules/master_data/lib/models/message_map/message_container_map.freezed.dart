// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'message_container_map.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MessageContainerMap _$MessageContainerMapFromJson(Map<String, dynamic> json) {
  return _MessageContainerMap.fromJson(json);
}

/// @nodoc
mixin _$MessageContainerMap {
  int get messageId => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MessageContainerMapCopyWith<MessageContainerMap> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MessageContainerMapCopyWith<$Res> {
  factory $MessageContainerMapCopyWith(
          MessageContainerMap value, $Res Function(MessageContainerMap) then) =
      _$MessageContainerMapCopyWithImpl<$Res, MessageContainerMap>;
  @useResult
  $Res call({int messageId, String message});
}

/// @nodoc
class _$MessageContainerMapCopyWithImpl<$Res, $Val extends MessageContainerMap>
    implements $MessageContainerMapCopyWith<$Res> {
  _$MessageContainerMapCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? messageId = null,
    Object? message = null,
  }) {
    return _then(_value.copyWith(
      messageId: null == messageId
          ? _value.messageId
          : messageId // ignore: cast_nullable_to_non_nullable
              as int,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MessageContainerMapCopyWith<$Res>
    implements $MessageContainerMapCopyWith<$Res> {
  factory _$$_MessageContainerMapCopyWith(_$_MessageContainerMap value,
          $Res Function(_$_MessageContainerMap) then) =
      __$$_MessageContainerMapCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int messageId, String message});
}

/// @nodoc
class __$$_MessageContainerMapCopyWithImpl<$Res>
    extends _$MessageContainerMapCopyWithImpl<$Res, _$_MessageContainerMap>
    implements _$$_MessageContainerMapCopyWith<$Res> {
  __$$_MessageContainerMapCopyWithImpl(_$_MessageContainerMap _value,
      $Res Function(_$_MessageContainerMap) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? messageId = null,
    Object? message = null,
  }) {
    return _then(_$_MessageContainerMap(
      messageId: null == messageId
          ? _value.messageId
          : messageId // ignore: cast_nullable_to_non_nullable
              as int,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MessageContainerMap implements _MessageContainerMap {
  const _$_MessageContainerMap(
      {required this.messageId, required this.message});

  factory _$_MessageContainerMap.fromJson(Map<String, dynamic> json) =>
      _$$_MessageContainerMapFromJson(json);

  @override
  final int messageId;
  @override
  final String message;

  @override
  String toString() {
    return 'MessageContainerMap(messageId: $messageId, message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MessageContainerMap &&
            (identical(other.messageId, messageId) ||
                other.messageId == messageId) &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, messageId, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MessageContainerMapCopyWith<_$_MessageContainerMap> get copyWith =>
      __$$_MessageContainerMapCopyWithImpl<_$_MessageContainerMap>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MessageContainerMapToJson(
      this,
    );
  }
}

abstract class _MessageContainerMap implements MessageContainerMap {
  const factory _MessageContainerMap(
      {required final int messageId,
      required final String message}) = _$_MessageContainerMap;

  factory _MessageContainerMap.fromJson(Map<String, dynamic> json) =
      _$_MessageContainerMap.fromJson;

  @override
  int get messageId;
  @override
  String get message;
  @override
  @JsonKey(ignore: true)
  _$$_MessageContainerMapCopyWith<_$_MessageContainerMap> get copyWith =>
      throw _privateConstructorUsedError;
}
