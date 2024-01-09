// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'table_operation_details.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TableOperationDetails _$TableOperationDetailsFromJson(
    Map<String, dynamic> json) {
  return _TableOperationDetails.fromJson(json);
}

/// @nodoc
mixin _$TableOperationDetails {
  @JsonKey(name: 'Reason')
  String get reason => throw _privateConstructorUsedError;
  @JsonKey(name: 'AdditionalComments')
  String get additionalComments => throw _privateConstructorUsedError;
  @JsonKey(name: 'ApprovalDTO')
  ApprovalDTO get approvalDTO => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TableOperationDetailsCopyWith<TableOperationDetails> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TableOperationDetailsCopyWith<$Res> {
  factory $TableOperationDetailsCopyWith(TableOperationDetails value,
          $Res Function(TableOperationDetails) then) =
      _$TableOperationDetailsCopyWithImpl<$Res, TableOperationDetails>;
  @useResult
  $Res call(
      {@JsonKey(name: 'Reason') String reason,
      @JsonKey(name: 'AdditionalComments') String additionalComments,
      @JsonKey(name: 'ApprovalDTO') ApprovalDTO approvalDTO});

  $ApprovalDTOCopyWith<$Res> get approvalDTO;
}

/// @nodoc
class _$TableOperationDetailsCopyWithImpl<$Res,
        $Val extends TableOperationDetails>
    implements $TableOperationDetailsCopyWith<$Res> {
  _$TableOperationDetailsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reason = null,
    Object? additionalComments = null,
    Object? approvalDTO = null,
  }) {
    return _then(_value.copyWith(
      reason: null == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String,
      additionalComments: null == additionalComments
          ? _value.additionalComments
          : additionalComments // ignore: cast_nullable_to_non_nullable
              as String,
      approvalDTO: null == approvalDTO
          ? _value.approvalDTO
          : approvalDTO // ignore: cast_nullable_to_non_nullable
              as ApprovalDTO,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ApprovalDTOCopyWith<$Res> get approvalDTO {
    return $ApprovalDTOCopyWith<$Res>(_value.approvalDTO, (value) {
      return _then(_value.copyWith(approvalDTO: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_TableOperationDetailsCopyWith<$Res>
    implements $TableOperationDetailsCopyWith<$Res> {
  factory _$$_TableOperationDetailsCopyWith(_$_TableOperationDetails value,
          $Res Function(_$_TableOperationDetails) then) =
      __$$_TableOperationDetailsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'Reason') String reason,
      @JsonKey(name: 'AdditionalComments') String additionalComments,
      @JsonKey(name: 'ApprovalDTO') ApprovalDTO approvalDTO});

  @override
  $ApprovalDTOCopyWith<$Res> get approvalDTO;
}

/// @nodoc
class __$$_TableOperationDetailsCopyWithImpl<$Res>
    extends _$TableOperationDetailsCopyWithImpl<$Res, _$_TableOperationDetails>
    implements _$$_TableOperationDetailsCopyWith<$Res> {
  __$$_TableOperationDetailsCopyWithImpl(_$_TableOperationDetails _value,
      $Res Function(_$_TableOperationDetails) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reason = null,
    Object? additionalComments = null,
    Object? approvalDTO = null,
  }) {
    return _then(_$_TableOperationDetails(
      reason: null == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String,
      additionalComments: null == additionalComments
          ? _value.additionalComments
          : additionalComments // ignore: cast_nullable_to_non_nullable
              as String,
      approvalDTO: null == approvalDTO
          ? _value.approvalDTO
          : approvalDTO // ignore: cast_nullable_to_non_nullable
              as ApprovalDTO,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TableOperationDetails implements _TableOperationDetails {
  const _$_TableOperationDetails(
      {@JsonKey(name: 'Reason') required this.reason,
      @JsonKey(name: 'AdditionalComments') required this.additionalComments,
      @JsonKey(name: 'ApprovalDTO') required this.approvalDTO});

  factory _$_TableOperationDetails.fromJson(Map<String, dynamic> json) =>
      _$$_TableOperationDetailsFromJson(json);

  @override
  @JsonKey(name: 'Reason')
  final String reason;
  @override
  @JsonKey(name: 'AdditionalComments')
  final String additionalComments;
  @override
  @JsonKey(name: 'ApprovalDTO')
  final ApprovalDTO approvalDTO;

  @override
  String toString() {
    return 'TableOperationDetails(reason: $reason, additionalComments: $additionalComments, approvalDTO: $approvalDTO)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TableOperationDetails &&
            (identical(other.reason, reason) || other.reason == reason) &&
            (identical(other.additionalComments, additionalComments) ||
                other.additionalComments == additionalComments) &&
            (identical(other.approvalDTO, approvalDTO) ||
                other.approvalDTO == approvalDTO));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, reason, additionalComments, approvalDTO);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TableOperationDetailsCopyWith<_$_TableOperationDetails> get copyWith =>
      __$$_TableOperationDetailsCopyWithImpl<_$_TableOperationDetails>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TableOperationDetailsToJson(
      this,
    );
  }
}

abstract class _TableOperationDetails implements TableOperationDetails {
  const factory _TableOperationDetails(
      {@JsonKey(name: 'Reason')
          required final String reason,
      @JsonKey(name: 'AdditionalComments')
          required final String additionalComments,
      @JsonKey(name: 'ApprovalDTO')
          required final ApprovalDTO approvalDTO}) = _$_TableOperationDetails;

  factory _TableOperationDetails.fromJson(Map<String, dynamic> json) =
      _$_TableOperationDetails.fromJson;

  @override
  @JsonKey(name: 'Reason')
  String get reason;
  @override
  @JsonKey(name: 'AdditionalComments')
  String get additionalComments;
  @override
  @JsonKey(name: 'ApprovalDTO')
  ApprovalDTO get approvalDTO;
  @override
  @JsonKey(ignore: true)
  _$$_TableOperationDetailsCopyWith<_$_TableOperationDetails> get copyWith =>
      throw _privateConstructorUsedError;
}
