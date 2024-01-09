// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'peripheral_container_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PeripheralContainerDTO _$PeripheralContainerDTOFromJson(
    Map<String, dynamic> json) {
  return _PeripheralContainerDTO.fromJson(json);
}

/// @nodoc
mixin _$PeripheralContainerDTO {
  @JsonKey(name: 'DeviceId')
  int get deviceId => throw _privateConstructorUsedError;
  @JsonKey(name: 'DeviceName')
  String get deviceName => throw _privateConstructorUsedError;
  @JsonKey(name: 'PosMachineId')
  int get posMachineId => throw _privateConstructorUsedError;
  @JsonKey(name: 'DeviceType')
  String get deviceType => throw _privateConstructorUsedError;
  @JsonKey(name: 'DeviceSubType')
  String get deviceSubType => throw _privateConstructorUsedError;
  @JsonKey(name: 'Vid')
  String get vid => throw _privateConstructorUsedError;
  @JsonKey(name: 'Pid')
  String get pid => throw _privateConstructorUsedError;
  @JsonKey(name: 'OptionalString')
  String get optionalString => throw _privateConstructorUsedError;
  @JsonKey(name: 'EnableTagDecryption')
  bool get enableTagDecryption => throw _privateConstructorUsedError;
  @JsonKey(name: 'ExcludeDecryptionForTagLength')
  String get excludeDecryptionForTagLength =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'ReaderIsForRechargeOnly')
  bool get readerIsForRechargeOnly => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PeripheralContainerDTOCopyWith<PeripheralContainerDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PeripheralContainerDTOCopyWith<$Res> {
  factory $PeripheralContainerDTOCopyWith(PeripheralContainerDTO value,
          $Res Function(PeripheralContainerDTO) then) =
      _$PeripheralContainerDTOCopyWithImpl<$Res, PeripheralContainerDTO>;
  @useResult
  $Res call(
      {@JsonKey(name: 'DeviceId')
          int deviceId,
      @JsonKey(name: 'DeviceName')
          String deviceName,
      @JsonKey(name: 'PosMachineId')
          int posMachineId,
      @JsonKey(name: 'DeviceType')
          String deviceType,
      @JsonKey(name: 'DeviceSubType')
          String deviceSubType,
      @JsonKey(name: 'Vid')
          String vid,
      @JsonKey(name: 'Pid')
          String pid,
      @JsonKey(name: 'OptionalString')
          String optionalString,
      @JsonKey(name: 'EnableTagDecryption')
          bool enableTagDecryption,
      @JsonKey(name: 'ExcludeDecryptionForTagLength')
          String excludeDecryptionForTagLength,
      @JsonKey(name: 'ReaderIsForRechargeOnly')
          bool readerIsForRechargeOnly});
}

/// @nodoc
class _$PeripheralContainerDTOCopyWithImpl<$Res,
        $Val extends PeripheralContainerDTO>
    implements $PeripheralContainerDTOCopyWith<$Res> {
  _$PeripheralContainerDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? deviceId = null,
    Object? deviceName = null,
    Object? posMachineId = null,
    Object? deviceType = null,
    Object? deviceSubType = null,
    Object? vid = null,
    Object? pid = null,
    Object? optionalString = null,
    Object? enableTagDecryption = null,
    Object? excludeDecryptionForTagLength = null,
    Object? readerIsForRechargeOnly = null,
  }) {
    return _then(_value.copyWith(
      deviceId: null == deviceId
          ? _value.deviceId
          : deviceId // ignore: cast_nullable_to_non_nullable
              as int,
      deviceName: null == deviceName
          ? _value.deviceName
          : deviceName // ignore: cast_nullable_to_non_nullable
              as String,
      posMachineId: null == posMachineId
          ? _value.posMachineId
          : posMachineId // ignore: cast_nullable_to_non_nullable
              as int,
      deviceType: null == deviceType
          ? _value.deviceType
          : deviceType // ignore: cast_nullable_to_non_nullable
              as String,
      deviceSubType: null == deviceSubType
          ? _value.deviceSubType
          : deviceSubType // ignore: cast_nullable_to_non_nullable
              as String,
      vid: null == vid
          ? _value.vid
          : vid // ignore: cast_nullable_to_non_nullable
              as String,
      pid: null == pid
          ? _value.pid
          : pid // ignore: cast_nullable_to_non_nullable
              as String,
      optionalString: null == optionalString
          ? _value.optionalString
          : optionalString // ignore: cast_nullable_to_non_nullable
              as String,
      enableTagDecryption: null == enableTagDecryption
          ? _value.enableTagDecryption
          : enableTagDecryption // ignore: cast_nullable_to_non_nullable
              as bool,
      excludeDecryptionForTagLength: null == excludeDecryptionForTagLength
          ? _value.excludeDecryptionForTagLength
          : excludeDecryptionForTagLength // ignore: cast_nullable_to_non_nullable
              as String,
      readerIsForRechargeOnly: null == readerIsForRechargeOnly
          ? _value.readerIsForRechargeOnly
          : readerIsForRechargeOnly // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PeripheralContainerDTOCopyWith<$Res>
    implements $PeripheralContainerDTOCopyWith<$Res> {
  factory _$$_PeripheralContainerDTOCopyWith(_$_PeripheralContainerDTO value,
          $Res Function(_$_PeripheralContainerDTO) then) =
      __$$_PeripheralContainerDTOCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'DeviceId')
          int deviceId,
      @JsonKey(name: 'DeviceName')
          String deviceName,
      @JsonKey(name: 'PosMachineId')
          int posMachineId,
      @JsonKey(name: 'DeviceType')
          String deviceType,
      @JsonKey(name: 'DeviceSubType')
          String deviceSubType,
      @JsonKey(name: 'Vid')
          String vid,
      @JsonKey(name: 'Pid')
          String pid,
      @JsonKey(name: 'OptionalString')
          String optionalString,
      @JsonKey(name: 'EnableTagDecryption')
          bool enableTagDecryption,
      @JsonKey(name: 'ExcludeDecryptionForTagLength')
          String excludeDecryptionForTagLength,
      @JsonKey(name: 'ReaderIsForRechargeOnly')
          bool readerIsForRechargeOnly});
}

/// @nodoc
class __$$_PeripheralContainerDTOCopyWithImpl<$Res>
    extends _$PeripheralContainerDTOCopyWithImpl<$Res,
        _$_PeripheralContainerDTO>
    implements _$$_PeripheralContainerDTOCopyWith<$Res> {
  __$$_PeripheralContainerDTOCopyWithImpl(_$_PeripheralContainerDTO _value,
      $Res Function(_$_PeripheralContainerDTO) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? deviceId = null,
    Object? deviceName = null,
    Object? posMachineId = null,
    Object? deviceType = null,
    Object? deviceSubType = null,
    Object? vid = null,
    Object? pid = null,
    Object? optionalString = null,
    Object? enableTagDecryption = null,
    Object? excludeDecryptionForTagLength = null,
    Object? readerIsForRechargeOnly = null,
  }) {
    return _then(_$_PeripheralContainerDTO(
      deviceId: null == deviceId
          ? _value.deviceId
          : deviceId // ignore: cast_nullable_to_non_nullable
              as int,
      deviceName: null == deviceName
          ? _value.deviceName
          : deviceName // ignore: cast_nullable_to_non_nullable
              as String,
      posMachineId: null == posMachineId
          ? _value.posMachineId
          : posMachineId // ignore: cast_nullable_to_non_nullable
              as int,
      deviceType: null == deviceType
          ? _value.deviceType
          : deviceType // ignore: cast_nullable_to_non_nullable
              as String,
      deviceSubType: null == deviceSubType
          ? _value.deviceSubType
          : deviceSubType // ignore: cast_nullable_to_non_nullable
              as String,
      vid: null == vid
          ? _value.vid
          : vid // ignore: cast_nullable_to_non_nullable
              as String,
      pid: null == pid
          ? _value.pid
          : pid // ignore: cast_nullable_to_non_nullable
              as String,
      optionalString: null == optionalString
          ? _value.optionalString
          : optionalString // ignore: cast_nullable_to_non_nullable
              as String,
      enableTagDecryption: null == enableTagDecryption
          ? _value.enableTagDecryption
          : enableTagDecryption // ignore: cast_nullable_to_non_nullable
              as bool,
      excludeDecryptionForTagLength: null == excludeDecryptionForTagLength
          ? _value.excludeDecryptionForTagLength
          : excludeDecryptionForTagLength // ignore: cast_nullable_to_non_nullable
              as String,
      readerIsForRechargeOnly: null == readerIsForRechargeOnly
          ? _value.readerIsForRechargeOnly
          : readerIsForRechargeOnly // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PeripheralContainerDTO implements _PeripheralContainerDTO {
  const _$_PeripheralContainerDTO(
      {@JsonKey(name: 'DeviceId')
          required this.deviceId,
      @JsonKey(name: 'DeviceName')
          required this.deviceName,
      @JsonKey(name: 'PosMachineId')
          required this.posMachineId,
      @JsonKey(name: 'DeviceType')
          required this.deviceType,
      @JsonKey(name: 'DeviceSubType')
          required this.deviceSubType,
      @JsonKey(name: 'Vid')
          required this.vid,
      @JsonKey(name: 'Pid')
          required this.pid,
      @JsonKey(name: 'OptionalString')
          required this.optionalString,
      @JsonKey(name: 'EnableTagDecryption')
          required this.enableTagDecryption,
      @JsonKey(name: 'ExcludeDecryptionForTagLength')
          required this.excludeDecryptionForTagLength,
      @JsonKey(name: 'ReaderIsForRechargeOnly')
          required this.readerIsForRechargeOnly});

  factory _$_PeripheralContainerDTO.fromJson(Map<String, dynamic> json) =>
      _$$_PeripheralContainerDTOFromJson(json);

  @override
  @JsonKey(name: 'DeviceId')
  final int deviceId;
  @override
  @JsonKey(name: 'DeviceName')
  final String deviceName;
  @override
  @JsonKey(name: 'PosMachineId')
  final int posMachineId;
  @override
  @JsonKey(name: 'DeviceType')
  final String deviceType;
  @override
  @JsonKey(name: 'DeviceSubType')
  final String deviceSubType;
  @override
  @JsonKey(name: 'Vid')
  final String vid;
  @override
  @JsonKey(name: 'Pid')
  final String pid;
  @override
  @JsonKey(name: 'OptionalString')
  final String optionalString;
  @override
  @JsonKey(name: 'EnableTagDecryption')
  final bool enableTagDecryption;
  @override
  @JsonKey(name: 'ExcludeDecryptionForTagLength')
  final String excludeDecryptionForTagLength;
  @override
  @JsonKey(name: 'ReaderIsForRechargeOnly')
  final bool readerIsForRechargeOnly;

  @override
  String toString() {
    return 'PeripheralContainerDTO(deviceId: $deviceId, deviceName: $deviceName, posMachineId: $posMachineId, deviceType: $deviceType, deviceSubType: $deviceSubType, vid: $vid, pid: $pid, optionalString: $optionalString, enableTagDecryption: $enableTagDecryption, excludeDecryptionForTagLength: $excludeDecryptionForTagLength, readerIsForRechargeOnly: $readerIsForRechargeOnly)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PeripheralContainerDTO &&
            (identical(other.deviceId, deviceId) ||
                other.deviceId == deviceId) &&
            (identical(other.deviceName, deviceName) ||
                other.deviceName == deviceName) &&
            (identical(other.posMachineId, posMachineId) ||
                other.posMachineId == posMachineId) &&
            (identical(other.deviceType, deviceType) ||
                other.deviceType == deviceType) &&
            (identical(other.deviceSubType, deviceSubType) ||
                other.deviceSubType == deviceSubType) &&
            (identical(other.vid, vid) || other.vid == vid) &&
            (identical(other.pid, pid) || other.pid == pid) &&
            (identical(other.optionalString, optionalString) ||
                other.optionalString == optionalString) &&
            (identical(other.enableTagDecryption, enableTagDecryption) ||
                other.enableTagDecryption == enableTagDecryption) &&
            (identical(other.excludeDecryptionForTagLength,
                    excludeDecryptionForTagLength) ||
                other.excludeDecryptionForTagLength ==
                    excludeDecryptionForTagLength) &&
            (identical(
                    other.readerIsForRechargeOnly, readerIsForRechargeOnly) ||
                other.readerIsForRechargeOnly == readerIsForRechargeOnly));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      deviceId,
      deviceName,
      posMachineId,
      deviceType,
      deviceSubType,
      vid,
      pid,
      optionalString,
      enableTagDecryption,
      excludeDecryptionForTagLength,
      readerIsForRechargeOnly);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PeripheralContainerDTOCopyWith<_$_PeripheralContainerDTO> get copyWith =>
      __$$_PeripheralContainerDTOCopyWithImpl<_$_PeripheralContainerDTO>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PeripheralContainerDTOToJson(
      this,
    );
  }
}

abstract class _PeripheralContainerDTO implements PeripheralContainerDTO {
  const factory _PeripheralContainerDTO(
          {@JsonKey(name: 'DeviceId')
              required final int deviceId,
          @JsonKey(name: 'DeviceName')
              required final String deviceName,
          @JsonKey(name: 'PosMachineId')
              required final int posMachineId,
          @JsonKey(name: 'DeviceType')
              required final String deviceType,
          @JsonKey(name: 'DeviceSubType')
              required final String deviceSubType,
          @JsonKey(name: 'Vid')
              required final String vid,
          @JsonKey(name: 'Pid')
              required final String pid,
          @JsonKey(name: 'OptionalString')
              required final String optionalString,
          @JsonKey(name: 'EnableTagDecryption')
              required final bool enableTagDecryption,
          @JsonKey(name: 'ExcludeDecryptionForTagLength')
              required final String excludeDecryptionForTagLength,
          @JsonKey(name: 'ReaderIsForRechargeOnly')
              required final bool readerIsForRechargeOnly}) =
      _$_PeripheralContainerDTO;

  factory _PeripheralContainerDTO.fromJson(Map<String, dynamic> json) =
      _$_PeripheralContainerDTO.fromJson;

  @override
  @JsonKey(name: 'DeviceId')
  int get deviceId;
  @override
  @JsonKey(name: 'DeviceName')
  String get deviceName;
  @override
  @JsonKey(name: 'PosMachineId')
  int get posMachineId;
  @override
  @JsonKey(name: 'DeviceType')
  String get deviceType;
  @override
  @JsonKey(name: 'DeviceSubType')
  String get deviceSubType;
  @override
  @JsonKey(name: 'Vid')
  String get vid;
  @override
  @JsonKey(name: 'Pid')
  String get pid;
  @override
  @JsonKey(name: 'OptionalString')
  String get optionalString;
  @override
  @JsonKey(name: 'EnableTagDecryption')
  bool get enableTagDecryption;
  @override
  @JsonKey(name: 'ExcludeDecryptionForTagLength')
  String get excludeDecryptionForTagLength;
  @override
  @JsonKey(name: 'ReaderIsForRechargeOnly')
  bool get readerIsForRechargeOnly;
  @override
  @JsonKey(ignore: true)
  _$$_PeripheralContainerDTOCopyWith<_$_PeripheralContainerDTO> get copyWith =>
      throw _privateConstructorUsedError;
}
