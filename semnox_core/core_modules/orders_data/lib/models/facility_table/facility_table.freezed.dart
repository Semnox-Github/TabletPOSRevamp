// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'facility_table.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FacilityTable _$FacilityTableFromJson(Map<String, dynamic> json) {
  return _FacilityTable.fromJson(json);
}

/// @nodoc
mixin _$FacilityTable {
  String? get Reason => throw _privateConstructorUsedError;
  String? get AdditionalComments => throw _privateConstructorUsedError;
  ApproveDTO? get ApprovalDTO => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FacilityTableCopyWith<FacilityTable> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FacilityTableCopyWith<$Res> {
  factory $FacilityTableCopyWith(
          FacilityTable value, $Res Function(FacilityTable) then) =
      _$FacilityTableCopyWithImpl<$Res, FacilityTable>;
  @useResult
  $Res call(
      {String? Reason, String? AdditionalComments, ApproveDTO? ApprovalDTO});

  $ApproveDTOCopyWith<$Res>? get ApprovalDTO;
}

/// @nodoc
class _$FacilityTableCopyWithImpl<$Res, $Val extends FacilityTable>
    implements $FacilityTableCopyWith<$Res> {
  _$FacilityTableCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? Reason = freezed,
    Object? AdditionalComments = freezed,
    Object? ApprovalDTO = freezed,
  }) {
    return _then(_value.copyWith(
      Reason: freezed == Reason
          ? _value.Reason
          : Reason // ignore: cast_nullable_to_non_nullable
              as String?,
      AdditionalComments: freezed == AdditionalComments
          ? _value.AdditionalComments
          : AdditionalComments // ignore: cast_nullable_to_non_nullable
              as String?,
      ApprovalDTO: freezed == ApprovalDTO
          ? _value.ApprovalDTO
          : ApprovalDTO // ignore: cast_nullable_to_non_nullable
              as ApproveDTO?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ApproveDTOCopyWith<$Res>? get ApprovalDTO {
    if (_value.ApprovalDTO == null) {
      return null;
    }

    return $ApproveDTOCopyWith<$Res>(_value.ApprovalDTO!, (value) {
      return _then(_value.copyWith(ApprovalDTO: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_FacilityTableCopyWith<$Res>
    implements $FacilityTableCopyWith<$Res> {
  factory _$$_FacilityTableCopyWith(
          _$_FacilityTable value, $Res Function(_$_FacilityTable) then) =
      __$$_FacilityTableCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? Reason, String? AdditionalComments, ApproveDTO? ApprovalDTO});

  @override
  $ApproveDTOCopyWith<$Res>? get ApprovalDTO;
}

/// @nodoc
class __$$_FacilityTableCopyWithImpl<$Res>
    extends _$FacilityTableCopyWithImpl<$Res, _$_FacilityTable>
    implements _$$_FacilityTableCopyWith<$Res> {
  __$$_FacilityTableCopyWithImpl(
      _$_FacilityTable _value, $Res Function(_$_FacilityTable) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? Reason = freezed,
    Object? AdditionalComments = freezed,
    Object? ApprovalDTO = freezed,
  }) {
    return _then(_$_FacilityTable(
      Reason: freezed == Reason
          ? _value.Reason
          : Reason // ignore: cast_nullable_to_non_nullable
              as String?,
      AdditionalComments: freezed == AdditionalComments
          ? _value.AdditionalComments
          : AdditionalComments // ignore: cast_nullable_to_non_nullable
              as String?,
      ApprovalDTO: freezed == ApprovalDTO
          ? _value.ApprovalDTO
          : ApprovalDTO // ignore: cast_nullable_to_non_nullable
              as ApproveDTO?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_FacilityTable implements _FacilityTable {
  const _$_FacilityTable(
      {required this.Reason,
      required this.AdditionalComments,
      required this.ApprovalDTO});

  factory _$_FacilityTable.fromJson(Map<String, dynamic> json) =>
      _$$_FacilityTableFromJson(json);

  @override
  final String? Reason;
  @override
  final String? AdditionalComments;
  @override
  final ApproveDTO? ApprovalDTO;

  @override
  String toString() {
    return 'FacilityTable(Reason: $Reason, AdditionalComments: $AdditionalComments, ApprovalDTO: $ApprovalDTO)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FacilityTable &&
            (identical(other.Reason, Reason) || other.Reason == Reason) &&
            (identical(other.AdditionalComments, AdditionalComments) ||
                other.AdditionalComments == AdditionalComments) &&
            (identical(other.ApprovalDTO, ApprovalDTO) ||
                other.ApprovalDTO == ApprovalDTO));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, Reason, AdditionalComments, ApprovalDTO);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FacilityTableCopyWith<_$_FacilityTable> get copyWith =>
      __$$_FacilityTableCopyWithImpl<_$_FacilityTable>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FacilityTableToJson(
      this,
    );
  }
}

abstract class _FacilityTable implements FacilityTable {
  const factory _FacilityTable(
      {required final String? Reason,
      required final String? AdditionalComments,
      required final ApproveDTO? ApprovalDTO}) = _$_FacilityTable;

  factory _FacilityTable.fromJson(Map<String, dynamic> json) =
      _$_FacilityTable.fromJson;

  @override
  String? get Reason;
  @override
  String? get AdditionalComments;
  @override
  ApproveDTO? get ApprovalDTO;
  @override
  @JsonKey(ignore: true)
  _$$_FacilityTableCopyWith<_$_FacilityTable> get copyWith =>
      throw _privateConstructorUsedError;
}
