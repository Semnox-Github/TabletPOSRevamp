// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'message_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MessageData _$MessageDataFromJson(Map<String, dynamic> json) {
  return _MessageData.fromJson(json);
}

/// @nodoc
mixin _$MessageData {
  @JsonKey(name: 'MessageContainerDTOList')
  List<MessageContainerDTO> get messageContainerDTOList =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'Hash')
  String? get hash => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MessageDataCopyWith<MessageData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MessageDataCopyWith<$Res> {
  factory $MessageDataCopyWith(
          MessageData value, $Res Function(MessageData) then) =
      _$MessageDataCopyWithImpl<$Res, MessageData>;
  @useResult
  $Res call(
      {@JsonKey(name: 'MessageContainerDTOList')
          List<MessageContainerDTO> messageContainerDTOList,
      @JsonKey(name: 'Hash')
          String? hash});
}

/// @nodoc
class _$MessageDataCopyWithImpl<$Res, $Val extends MessageData>
    implements $MessageDataCopyWith<$Res> {
  _$MessageDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? messageContainerDTOList = null,
    Object? hash = freezed,
  }) {
    return _then(_value.copyWith(
      messageContainerDTOList: null == messageContainerDTOList
          ? _value.messageContainerDTOList
          : messageContainerDTOList // ignore: cast_nullable_to_non_nullable
              as List<MessageContainerDTO>,
      hash: freezed == hash
          ? _value.hash
          : hash // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MessageDataCopyWith<$Res>
    implements $MessageDataCopyWith<$Res> {
  factory _$$_MessageDataCopyWith(
          _$_MessageData value, $Res Function(_$_MessageData) then) =
      __$$_MessageDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'MessageContainerDTOList')
          List<MessageContainerDTO> messageContainerDTOList,
      @JsonKey(name: 'Hash')
          String? hash});
}

/// @nodoc
class __$$_MessageDataCopyWithImpl<$Res>
    extends _$MessageDataCopyWithImpl<$Res, _$_MessageData>
    implements _$$_MessageDataCopyWith<$Res> {
  __$$_MessageDataCopyWithImpl(
      _$_MessageData _value, $Res Function(_$_MessageData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? messageContainerDTOList = null,
    Object? hash = freezed,
  }) {
    return _then(_$_MessageData(
      messageContainerDTOList: null == messageContainerDTOList
          ? _value._messageContainerDTOList
          : messageContainerDTOList // ignore: cast_nullable_to_non_nullable
              as List<MessageContainerDTO>,
      hash: freezed == hash
          ? _value.hash
          : hash // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MessageData implements _MessageData {
  const _$_MessageData(
      {@JsonKey(name: 'MessageContainerDTOList')
          required final List<MessageContainerDTO> messageContainerDTOList,
      @JsonKey(name: 'Hash')
          this.hash})
      : _messageContainerDTOList = messageContainerDTOList;

  factory _$_MessageData.fromJson(Map<String, dynamic> json) =>
      _$$_MessageDataFromJson(json);

  final List<MessageContainerDTO> _messageContainerDTOList;
  @override
  @JsonKey(name: 'MessageContainerDTOList')
  List<MessageContainerDTO> get messageContainerDTOList {
    if (_messageContainerDTOList is EqualUnmodifiableListView)
      return _messageContainerDTOList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_messageContainerDTOList);
  }

  @override
  @JsonKey(name: 'Hash')
  final String? hash;

  @override
  String toString() {
    return 'MessageData(messageContainerDTOList: $messageContainerDTOList, hash: $hash)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MessageData &&
            const DeepCollectionEquality().equals(
                other._messageContainerDTOList, _messageContainerDTOList) &&
            (identical(other.hash, hash) || other.hash == hash));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_messageContainerDTOList), hash);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MessageDataCopyWith<_$_MessageData> get copyWith =>
      __$$_MessageDataCopyWithImpl<_$_MessageData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MessageDataToJson(
      this,
    );
  }
}

abstract class _MessageData implements MessageData {
  const factory _MessageData(
      {@JsonKey(name: 'MessageContainerDTOList')
          required final List<MessageContainerDTO> messageContainerDTOList,
      @JsonKey(name: 'Hash')
          final String? hash}) = _$_MessageData;

  factory _MessageData.fromJson(Map<String, dynamic> json) =
      _$_MessageData.fromJson;

  @override
  @JsonKey(name: 'MessageContainerDTOList')
  List<MessageContainerDTO> get messageContainerDTOList;
  @override
  @JsonKey(name: 'Hash')
  String? get hash;
  @override
  @JsonKey(ignore: true)
  _$$_MessageDataCopyWith<_$_MessageData> get copyWith =>
      throw _privateConstructorUsedError;
}
