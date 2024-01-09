// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'message_container_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MessageContainerDTO _$MessageContainerDTOFromJson(Map<String, dynamic> json) {
  return _MessageContainerDTO.fromJson(json);
}

/// @nodoc
mixin _$MessageContainerDTO {
  @JsonKey(name: 'MessageId')
  int get messageId => throw _privateConstructorUsedError;
  @JsonKey(name: 'MessageNumber')
  int get messageNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'Message')
  String get message => throw _privateConstructorUsedError;
  @JsonKey(name: 'TranslatedMessage')
  String get translatedMessage => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MessageContainerDTOCopyWith<MessageContainerDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MessageContainerDTOCopyWith<$Res> {
  factory $MessageContainerDTOCopyWith(
          MessageContainerDTO value, $Res Function(MessageContainerDTO) then) =
      _$MessageContainerDTOCopyWithImpl<$Res, MessageContainerDTO>;
  @useResult
  $Res call(
      {@JsonKey(name: 'MessageId') int messageId,
      @JsonKey(name: 'MessageNumber') int messageNumber,
      @JsonKey(name: 'Message') String message,
      @JsonKey(name: 'TranslatedMessage') String translatedMessage});
}

/// @nodoc
class _$MessageContainerDTOCopyWithImpl<$Res, $Val extends MessageContainerDTO>
    implements $MessageContainerDTOCopyWith<$Res> {
  _$MessageContainerDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? messageId = null,
    Object? messageNumber = null,
    Object? message = null,
    Object? translatedMessage = null,
  }) {
    return _then(_value.copyWith(
      messageId: null == messageId
          ? _value.messageId
          : messageId // ignore: cast_nullable_to_non_nullable
              as int,
      messageNumber: null == messageNumber
          ? _value.messageNumber
          : messageNumber // ignore: cast_nullable_to_non_nullable
              as int,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      translatedMessage: null == translatedMessage
          ? _value.translatedMessage
          : translatedMessage // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MessageContainerDTOCopyWith<$Res>
    implements $MessageContainerDTOCopyWith<$Res> {
  factory _$$_MessageContainerDTOCopyWith(_$_MessageContainerDTO value,
          $Res Function(_$_MessageContainerDTO) then) =
      __$$_MessageContainerDTOCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'MessageId') int messageId,
      @JsonKey(name: 'MessageNumber') int messageNumber,
      @JsonKey(name: 'Message') String message,
      @JsonKey(name: 'TranslatedMessage') String translatedMessage});
}

/// @nodoc
class __$$_MessageContainerDTOCopyWithImpl<$Res>
    extends _$MessageContainerDTOCopyWithImpl<$Res, _$_MessageContainerDTO>
    implements _$$_MessageContainerDTOCopyWith<$Res> {
  __$$_MessageContainerDTOCopyWithImpl(_$_MessageContainerDTO _value,
      $Res Function(_$_MessageContainerDTO) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? messageId = null,
    Object? messageNumber = null,
    Object? message = null,
    Object? translatedMessage = null,
  }) {
    return _then(_$_MessageContainerDTO(
      messageId: null == messageId
          ? _value.messageId
          : messageId // ignore: cast_nullable_to_non_nullable
              as int,
      messageNumber: null == messageNumber
          ? _value.messageNumber
          : messageNumber // ignore: cast_nullable_to_non_nullable
              as int,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      translatedMessage: null == translatedMessage
          ? _value.translatedMessage
          : translatedMessage // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MessageContainerDTO implements _MessageContainerDTO {
  const _$_MessageContainerDTO(
      {@JsonKey(name: 'MessageId') required this.messageId,
      @JsonKey(name: 'MessageNumber') required this.messageNumber,
      @JsonKey(name: 'Message') required this.message,
      @JsonKey(name: 'TranslatedMessage') required this.translatedMessage});

  factory _$_MessageContainerDTO.fromJson(Map<String, dynamic> json) =>
      _$$_MessageContainerDTOFromJson(json);

  @override
  @JsonKey(name: 'MessageId')
  final int messageId;
  @override
  @JsonKey(name: 'MessageNumber')
  final int messageNumber;
  @override
  @JsonKey(name: 'Message')
  final String message;
  @override
  @JsonKey(name: 'TranslatedMessage')
  final String translatedMessage;

  @override
  String toString() {
    return 'MessageContainerDTO(messageId: $messageId, messageNumber: $messageNumber, message: $message, translatedMessage: $translatedMessage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MessageContainerDTO &&
            (identical(other.messageId, messageId) ||
                other.messageId == messageId) &&
            (identical(other.messageNumber, messageNumber) ||
                other.messageNumber == messageNumber) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.translatedMessage, translatedMessage) ||
                other.translatedMessage == translatedMessage));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, messageId, messageNumber, message, translatedMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MessageContainerDTOCopyWith<_$_MessageContainerDTO> get copyWith =>
      __$$_MessageContainerDTOCopyWithImpl<_$_MessageContainerDTO>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MessageContainerDTOToJson(
      this,
    );
  }
}

abstract class _MessageContainerDTO implements MessageContainerDTO {
  const factory _MessageContainerDTO(
      {@JsonKey(name: 'MessageId')
          required final int messageId,
      @JsonKey(name: 'MessageNumber')
          required final int messageNumber,
      @JsonKey(name: 'Message')
          required final String message,
      @JsonKey(name: 'TranslatedMessage')
          required final String translatedMessage}) = _$_MessageContainerDTO;

  factory _MessageContainerDTO.fromJson(Map<String, dynamic> json) =
      _$_MessageContainerDTO.fromJson;

  @override
  @JsonKey(name: 'MessageId')
  int get messageId;
  @override
  @JsonKey(name: 'MessageNumber')
  int get messageNumber;
  @override
  @JsonKey(name: 'Message')
  String get message;
  @override
  @JsonKey(name: 'TranslatedMessage')
  String get translatedMessage;
  @override
  @JsonKey(ignore: true)
  _$$_MessageContainerDTOCopyWith<_$_MessageContainerDTO> get copyWith =>
      throw _privateConstructorUsedError;
}
