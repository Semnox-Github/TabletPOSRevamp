// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transaction_line_reverse_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TransactionLineReverseDto _$TransactionLineReverseDtoFromJson(
    Map<String, dynamic> json) {
  return _TransactionLineReverseDto.fromJson(json);
}

/// @nodoc
mixin _$TransactionLineReverseDto {
  @JsonKey(name: 'TransactionLineId')
  int get transactionLineId => throw _privateConstructorUsedError;
  @JsonKey(name: 'ReasonId')
  int get reasonId => throw _privateConstructorUsedError;
  @JsonKey(name: 'Remarks')
  String get remarks => throw _privateConstructorUsedError;
  @JsonKey(name: 'ReverseObligations')
  bool get reverseObligations => throw _privateConstructorUsedError;
  @JsonKey(name: 'ForceReverseUsedObligations')
  bool get forceReverseUsedObligations => throw _privateConstructorUsedError;
  @JsonKey(name: 'ApprovalDTO')
  ApprovalDTO get approvalDTO => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TransactionLineReverseDtoCopyWith<TransactionLineReverseDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionLineReverseDtoCopyWith<$Res> {
  factory $TransactionLineReverseDtoCopyWith(TransactionLineReverseDto value,
          $Res Function(TransactionLineReverseDto) then) =
      _$TransactionLineReverseDtoCopyWithImpl<$Res, TransactionLineReverseDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'TransactionLineId')
          int transactionLineId,
      @JsonKey(name: 'ReasonId')
          int reasonId,
      @JsonKey(name: 'Remarks')
          String remarks,
      @JsonKey(name: 'ReverseObligations')
          bool reverseObligations,
      @JsonKey(name: 'ForceReverseUsedObligations')
          bool forceReverseUsedObligations,
      @JsonKey(name: 'ApprovalDTO')
          ApprovalDTO approvalDTO});

  $ApprovalDTOCopyWith<$Res> get approvalDTO;
}

/// @nodoc
class _$TransactionLineReverseDtoCopyWithImpl<$Res,
        $Val extends TransactionLineReverseDto>
    implements $TransactionLineReverseDtoCopyWith<$Res> {
  _$TransactionLineReverseDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transactionLineId = null,
    Object? reasonId = null,
    Object? remarks = null,
    Object? reverseObligations = null,
    Object? forceReverseUsedObligations = null,
    Object? approvalDTO = null,
  }) {
    return _then(_value.copyWith(
      transactionLineId: null == transactionLineId
          ? _value.transactionLineId
          : transactionLineId // ignore: cast_nullable_to_non_nullable
              as int,
      reasonId: null == reasonId
          ? _value.reasonId
          : reasonId // ignore: cast_nullable_to_non_nullable
              as int,
      remarks: null == remarks
          ? _value.remarks
          : remarks // ignore: cast_nullable_to_non_nullable
              as String,
      reverseObligations: null == reverseObligations
          ? _value.reverseObligations
          : reverseObligations // ignore: cast_nullable_to_non_nullable
              as bool,
      forceReverseUsedObligations: null == forceReverseUsedObligations
          ? _value.forceReverseUsedObligations
          : forceReverseUsedObligations // ignore: cast_nullable_to_non_nullable
              as bool,
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
abstract class _$$_TransactionLineReverseDtoCopyWith<$Res>
    implements $TransactionLineReverseDtoCopyWith<$Res> {
  factory _$$_TransactionLineReverseDtoCopyWith(
          _$_TransactionLineReverseDto value,
          $Res Function(_$_TransactionLineReverseDto) then) =
      __$$_TransactionLineReverseDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'TransactionLineId')
          int transactionLineId,
      @JsonKey(name: 'ReasonId')
          int reasonId,
      @JsonKey(name: 'Remarks')
          String remarks,
      @JsonKey(name: 'ReverseObligations')
          bool reverseObligations,
      @JsonKey(name: 'ForceReverseUsedObligations')
          bool forceReverseUsedObligations,
      @JsonKey(name: 'ApprovalDTO')
          ApprovalDTO approvalDTO});

  @override
  $ApprovalDTOCopyWith<$Res> get approvalDTO;
}

/// @nodoc
class __$$_TransactionLineReverseDtoCopyWithImpl<$Res>
    extends _$TransactionLineReverseDtoCopyWithImpl<$Res,
        _$_TransactionLineReverseDto>
    implements _$$_TransactionLineReverseDtoCopyWith<$Res> {
  __$$_TransactionLineReverseDtoCopyWithImpl(
      _$_TransactionLineReverseDto _value,
      $Res Function(_$_TransactionLineReverseDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transactionLineId = null,
    Object? reasonId = null,
    Object? remarks = null,
    Object? reverseObligations = null,
    Object? forceReverseUsedObligations = null,
    Object? approvalDTO = null,
  }) {
    return _then(_$_TransactionLineReverseDto(
      transactionLineId: null == transactionLineId
          ? _value.transactionLineId
          : transactionLineId // ignore: cast_nullable_to_non_nullable
              as int,
      reasonId: null == reasonId
          ? _value.reasonId
          : reasonId // ignore: cast_nullable_to_non_nullable
              as int,
      remarks: null == remarks
          ? _value.remarks
          : remarks // ignore: cast_nullable_to_non_nullable
              as String,
      reverseObligations: null == reverseObligations
          ? _value.reverseObligations
          : reverseObligations // ignore: cast_nullable_to_non_nullable
              as bool,
      forceReverseUsedObligations: null == forceReverseUsedObligations
          ? _value.forceReverseUsedObligations
          : forceReverseUsedObligations // ignore: cast_nullable_to_non_nullable
              as bool,
      approvalDTO: null == approvalDTO
          ? _value.approvalDTO
          : approvalDTO // ignore: cast_nullable_to_non_nullable
              as ApprovalDTO,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TransactionLineReverseDto implements _TransactionLineReverseDto {
  const _$_TransactionLineReverseDto(
      {@JsonKey(name: 'TransactionLineId')
          required this.transactionLineId,
      @JsonKey(name: 'ReasonId')
          required this.reasonId,
      @JsonKey(name: 'Remarks')
          required this.remarks,
      @JsonKey(name: 'ReverseObligations')
          required this.reverseObligations,
      @JsonKey(name: 'ForceReverseUsedObligations')
          required this.forceReverseUsedObligations,
      @JsonKey(name: 'ApprovalDTO')
          required this.approvalDTO});

  factory _$_TransactionLineReverseDto.fromJson(Map<String, dynamic> json) =>
      _$$_TransactionLineReverseDtoFromJson(json);

  @override
  @JsonKey(name: 'TransactionLineId')
  final int transactionLineId;
  @override
  @JsonKey(name: 'ReasonId')
  final int reasonId;
  @override
  @JsonKey(name: 'Remarks')
  final String remarks;
  @override
  @JsonKey(name: 'ReverseObligations')
  final bool reverseObligations;
  @override
  @JsonKey(name: 'ForceReverseUsedObligations')
  final bool forceReverseUsedObligations;
  @override
  @JsonKey(name: 'ApprovalDTO')
  final ApprovalDTO approvalDTO;

  @override
  String toString() {
    return 'TransactionLineReverseDto(transactionLineId: $transactionLineId, reasonId: $reasonId, remarks: $remarks, reverseObligations: $reverseObligations, forceReverseUsedObligations: $forceReverseUsedObligations, approvalDTO: $approvalDTO)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TransactionLineReverseDto &&
            (identical(other.transactionLineId, transactionLineId) ||
                other.transactionLineId == transactionLineId) &&
            (identical(other.reasonId, reasonId) ||
                other.reasonId == reasonId) &&
            (identical(other.remarks, remarks) || other.remarks == remarks) &&
            (identical(other.reverseObligations, reverseObligations) ||
                other.reverseObligations == reverseObligations) &&
            (identical(other.forceReverseUsedObligations,
                    forceReverseUsedObligations) ||
                other.forceReverseUsedObligations ==
                    forceReverseUsedObligations) &&
            (identical(other.approvalDTO, approvalDTO) ||
                other.approvalDTO == approvalDTO));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, transactionLineId, reasonId,
      remarks, reverseObligations, forceReverseUsedObligations, approvalDTO);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TransactionLineReverseDtoCopyWith<_$_TransactionLineReverseDto>
      get copyWith => __$$_TransactionLineReverseDtoCopyWithImpl<
          _$_TransactionLineReverseDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TransactionLineReverseDtoToJson(
      this,
    );
  }
}

abstract class _TransactionLineReverseDto implements TransactionLineReverseDto {
  const factory _TransactionLineReverseDto(
          {@JsonKey(name: 'TransactionLineId')
              required final int transactionLineId,
          @JsonKey(name: 'ReasonId')
              required final int reasonId,
          @JsonKey(name: 'Remarks')
              required final String remarks,
          @JsonKey(name: 'ReverseObligations')
              required final bool reverseObligations,
          @JsonKey(name: 'ForceReverseUsedObligations')
              required final bool forceReverseUsedObligations,
          @JsonKey(name: 'ApprovalDTO')
              required final ApprovalDTO approvalDTO}) =
      _$_TransactionLineReverseDto;

  factory _TransactionLineReverseDto.fromJson(Map<String, dynamic> json) =
      _$_TransactionLineReverseDto.fromJson;

  @override
  @JsonKey(name: 'TransactionLineId')
  int get transactionLineId;
  @override
  @JsonKey(name: 'ReasonId')
  int get reasonId;
  @override
  @JsonKey(name: 'Remarks')
  String get remarks;
  @override
  @JsonKey(name: 'ReverseObligations')
  bool get reverseObligations;
  @override
  @JsonKey(name: 'ForceReverseUsedObligations')
  bool get forceReverseUsedObligations;
  @override
  @JsonKey(name: 'ApprovalDTO')
  ApprovalDTO get approvalDTO;
  @override
  @JsonKey(ignore: true)
  _$$_TransactionLineReverseDtoCopyWith<_$_TransactionLineReverseDto>
      get copyWith => throw _privateConstructorUsedError;
}
