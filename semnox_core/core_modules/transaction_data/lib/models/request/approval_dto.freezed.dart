// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'approval_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ApprovalDTO _$ApprovalDTOFromJson(Map<String, dynamic> json) {
  return _ApprovalDTO.fromJson(json);
}

/// @nodoc
mixin _$ApprovalDTO {
  @JsonKey(name: 'ApproverId')
  int get approverId => throw _privateConstructorUsedError;
  @JsonKey(name: 'Remarks')
  String get remarks => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ApprovalDTOCopyWith<ApprovalDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApprovalDTOCopyWith<$Res> {
  factory $ApprovalDTOCopyWith(
          ApprovalDTO value, $Res Function(ApprovalDTO) then) =
      _$ApprovalDTOCopyWithImpl<$Res, ApprovalDTO>;
  @useResult
  $Res call(
      {@JsonKey(name: 'ApproverId') int approverId,
      @JsonKey(name: 'Remarks') String remarks});
}

/// @nodoc
class _$ApprovalDTOCopyWithImpl<$Res, $Val extends ApprovalDTO>
    implements $ApprovalDTOCopyWith<$Res> {
  _$ApprovalDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? approverId = null,
    Object? remarks = null,
  }) {
    return _then(_value.copyWith(
      approverId: null == approverId
          ? _value.approverId
          : approverId // ignore: cast_nullable_to_non_nullable
              as int,
      remarks: null == remarks
          ? _value.remarks
          : remarks // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ApprovalDTOCopyWith<$Res>
    implements $ApprovalDTOCopyWith<$Res> {
  factory _$$_ApprovalDTOCopyWith(
          _$_ApprovalDTO value, $Res Function(_$_ApprovalDTO) then) =
      __$$_ApprovalDTOCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'ApproverId') int approverId,
      @JsonKey(name: 'Remarks') String remarks});
}

/// @nodoc
class __$$_ApprovalDTOCopyWithImpl<$Res>
    extends _$ApprovalDTOCopyWithImpl<$Res, _$_ApprovalDTO>
    implements _$$_ApprovalDTOCopyWith<$Res> {
  __$$_ApprovalDTOCopyWithImpl(
      _$_ApprovalDTO _value, $Res Function(_$_ApprovalDTO) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? approverId = null,
    Object? remarks = null,
  }) {
    return _then(_$_ApprovalDTO(
      approverId: null == approverId
          ? _value.approverId
          : approverId // ignore: cast_nullable_to_non_nullable
              as int,
      remarks: null == remarks
          ? _value.remarks
          : remarks // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ApprovalDTO implements _ApprovalDTO {
  const _$_ApprovalDTO(
      {@JsonKey(name: 'ApproverId') required this.approverId,
      @JsonKey(name: 'Remarks') required this.remarks});

  factory _$_ApprovalDTO.fromJson(Map<String, dynamic> json) =>
      _$$_ApprovalDTOFromJson(json);

  @override
  @JsonKey(name: 'ApproverId')
  final int approverId;
  @override
  @JsonKey(name: 'Remarks')
  final String remarks;

  @override
  String toString() {
    return 'ApprovalDTO(approverId: $approverId, remarks: $remarks)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ApprovalDTO &&
            (identical(other.approverId, approverId) ||
                other.approverId == approverId) &&
            (identical(other.remarks, remarks) || other.remarks == remarks));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, approverId, remarks);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ApprovalDTOCopyWith<_$_ApprovalDTO> get copyWith =>
      __$$_ApprovalDTOCopyWithImpl<_$_ApprovalDTO>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ApprovalDTOToJson(
      this,
    );
  }
}

abstract class _ApprovalDTO implements ApprovalDTO {
  const factory _ApprovalDTO(
          {@JsonKey(name: 'ApproverId') required final int approverId,
          @JsonKey(name: 'Remarks') required final String remarks}) =
      _$_ApprovalDTO;

  factory _ApprovalDTO.fromJson(Map<String, dynamic> json) =
      _$_ApprovalDTO.fromJson;

  @override
  @JsonKey(name: 'ApproverId')
  int get approverId;
  @override
  @JsonKey(name: 'Remarks')
  String get remarks;
  @override
  @JsonKey(ignore: true)
  _$$_ApprovalDTOCopyWith<_$_ApprovalDTO> get copyWith =>
      throw _privateConstructorUsedError;
}
