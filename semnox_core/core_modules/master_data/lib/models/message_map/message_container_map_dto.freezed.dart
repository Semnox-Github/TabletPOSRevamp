// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'message_container_map_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MessageContainerMapDTO _$MessageContainerMapDTOFromJson(
    Map<String, dynamic> json) {
  return _MessageContainerMapDTO.fromJson(json);
}

/// @nodoc
mixin _$MessageContainerMapDTO {
  List<MessageContainerMap> get messages => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MessageContainerMapDTOCopyWith<MessageContainerMapDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MessageContainerMapDTOCopyWith<$Res> {
  factory $MessageContainerMapDTOCopyWith(MessageContainerMapDTO value,
          $Res Function(MessageContainerMapDTO) then) =
      _$MessageContainerMapDTOCopyWithImpl<$Res, MessageContainerMapDTO>;
  @useResult
  $Res call({List<MessageContainerMap> messages});
}

/// @nodoc
class _$MessageContainerMapDTOCopyWithImpl<$Res,
        $Val extends MessageContainerMapDTO>
    implements $MessageContainerMapDTOCopyWith<$Res> {
  _$MessageContainerMapDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? messages = null,
  }) {
    return _then(_value.copyWith(
      messages: null == messages
          ? _value.messages
          : messages // ignore: cast_nullable_to_non_nullable
              as List<MessageContainerMap>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MessageContainerMapDTOCopyWith<$Res>
    implements $MessageContainerMapDTOCopyWith<$Res> {
  factory _$$_MessageContainerMapDTOCopyWith(_$_MessageContainerMapDTO value,
          $Res Function(_$_MessageContainerMapDTO) then) =
      __$$_MessageContainerMapDTOCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<MessageContainerMap> messages});
}

/// @nodoc
class __$$_MessageContainerMapDTOCopyWithImpl<$Res>
    extends _$MessageContainerMapDTOCopyWithImpl<$Res,
        _$_MessageContainerMapDTO>
    implements _$$_MessageContainerMapDTOCopyWith<$Res> {
  __$$_MessageContainerMapDTOCopyWithImpl(_$_MessageContainerMapDTO _value,
      $Res Function(_$_MessageContainerMapDTO) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? messages = null,
  }) {
    return _then(_$_MessageContainerMapDTO(
      messages: null == messages
          ? _value._messages
          : messages // ignore: cast_nullable_to_non_nullable
              as List<MessageContainerMap>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MessageContainerMapDTO implements _MessageContainerMapDTO {
  const _$_MessageContainerMapDTO(
      {required final List<MessageContainerMap> messages})
      : _messages = messages;

  factory _$_MessageContainerMapDTO.fromJson(Map<String, dynamic> json) =>
      _$$_MessageContainerMapDTOFromJson(json);

  final List<MessageContainerMap> _messages;
  @override
  List<MessageContainerMap> get messages {
    if (_messages is EqualUnmodifiableListView) return _messages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_messages);
  }

  @override
  String toString() {
    return 'MessageContainerMapDTO(messages: $messages)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MessageContainerMapDTO &&
            const DeepCollectionEquality().equals(other._messages, _messages));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_messages));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MessageContainerMapDTOCopyWith<_$_MessageContainerMapDTO> get copyWith =>
      __$$_MessageContainerMapDTOCopyWithImpl<_$_MessageContainerMapDTO>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MessageContainerMapDTOToJson(
      this,
    );
  }
}

abstract class _MessageContainerMapDTO implements MessageContainerMapDTO {
  const factory _MessageContainerMapDTO(
          {required final List<MessageContainerMap> messages}) =
      _$_MessageContainerMapDTO;

  factory _MessageContainerMapDTO.fromJson(Map<String, dynamic> json) =
      _$_MessageContainerMapDTO.fromJson;

  @override
  List<MessageContainerMap> get messages;
  @override
  @JsonKey(ignore: true)
  _$$_MessageContainerMapDTOCopyWith<_$_MessageContainerMapDTO> get copyWith =>
      throw _privateConstructorUsedError;
}
