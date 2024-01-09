// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'approve_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ApproveDTO _$ApproveDTOFromJson(Map<String, dynamic> json) {
  return _ApproveDTO.fromJson(json);
}

/// @nodoc
mixin _$ApproveDTO {
  int? get ApproverId => throw _privateConstructorUsedError;
  String? get Remarks => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ApproveDTOCopyWith<ApproveDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApproveDTOCopyWith<$Res> {
  factory $ApproveDTOCopyWith(
          ApproveDTO value, $Res Function(ApproveDTO) then) =
      _$ApproveDTOCopyWithImpl<$Res, ApproveDTO>;
  @useResult
  $Res call({int? ApproverId, String? Remarks});
}

/// @nodoc
class _$ApproveDTOCopyWithImpl<$Res, $Val extends ApproveDTO>
    implements $ApproveDTOCopyWith<$Res> {
  _$ApproveDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ApproverId = freezed,
    Object? Remarks = freezed,
  }) {
    return _then(_value.copyWith(
      ApproverId: freezed == ApproverId
          ? _value.ApproverId
          : ApproverId // ignore: cast_nullable_to_non_nullable
              as int?,
      Remarks: freezed == Remarks
          ? _value.Remarks
          : Remarks // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ApproveDTOCopyWith<$Res>
    implements $ApproveDTOCopyWith<$Res> {
  factory _$$_ApproveDTOCopyWith(
          _$_ApproveDTO value, $Res Function(_$_ApproveDTO) then) =
      __$$_ApproveDTOCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? ApproverId, String? Remarks});
}

/// @nodoc
class __$$_ApproveDTOCopyWithImpl<$Res>
    extends _$ApproveDTOCopyWithImpl<$Res, _$_ApproveDTO>
    implements _$$_ApproveDTOCopyWith<$Res> {
  __$$_ApproveDTOCopyWithImpl(
      _$_ApproveDTO _value, $Res Function(_$_ApproveDTO) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ApproverId = freezed,
    Object? Remarks = freezed,
  }) {
    return _then(_$_ApproveDTO(
      ApproverId: freezed == ApproverId
          ? _value.ApproverId
          : ApproverId // ignore: cast_nullable_to_non_nullable
              as int?,
      Remarks: freezed == Remarks
          ? _value.Remarks
          : Remarks // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ApproveDTO implements _ApproveDTO {
  const _$_ApproveDTO({required this.ApproverId, required this.Remarks});

  factory _$_ApproveDTO.fromJson(Map<String, dynamic> json) =>
      _$$_ApproveDTOFromJson(json);

  @override
  final int? ApproverId;
  @override
  final String? Remarks;

  @override
  String toString() {
    return 'ApproveDTO(ApproverId: $ApproverId, Remarks: $Remarks)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ApproveDTO &&
            (identical(other.ApproverId, ApproverId) ||
                other.ApproverId == ApproverId) &&
            (identical(other.Remarks, Remarks) || other.Remarks == Remarks));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, ApproverId, Remarks);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ApproveDTOCopyWith<_$_ApproveDTO> get copyWith =>
      __$$_ApproveDTOCopyWithImpl<_$_ApproveDTO>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ApproveDTOToJson(
      this,
    );
  }
}

abstract class _ApproveDTO implements ApproveDTO {
  const factory _ApproveDTO(
      {required final int? ApproverId,
      required final String? Remarks}) = _$_ApproveDTO;

  factory _ApproveDTO.fromJson(Map<String, dynamic> json) =
      _$_ApproveDTO.fromJson;

  @override
  int? get ApproverId;
  @override
  String? get Remarks;
  @override
  @JsonKey(ignore: true)
  _$$_ApproveDTOCopyWith<_$_ApproveDTO> get copyWith =>
      throw _privateConstructorUsedError;
}
