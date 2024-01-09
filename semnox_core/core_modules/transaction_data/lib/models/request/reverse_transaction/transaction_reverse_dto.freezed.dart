// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transaction_reverse_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TransactionReverseDto _$TransactionReverseDtoFromJson(
    Map<String, dynamic> json) {
  return _TransactionReverseDto.fromJson(json);
}

/// @nodoc
mixin _$TransactionReverseDto {
  @JsonKey(name: 'TransactionId')
  int get transactionId => throw _privateConstructorUsedError;
  @JsonKey(name: 'ReasonId')
  int get reasonId => throw _privateConstructorUsedError;
  @JsonKey(name: 'Remarks')
  String get remarks => throw _privateConstructorUsedError;
  @JsonKey(name: 'ReverseObligations')
  bool get reverseObligations => throw _privateConstructorUsedError;
  @JsonKey(name: 'ForceReverseUsedObligations')
  bool get forceReverseUsedObligations => throw _privateConstructorUsedError;
  @JsonKey(name: 'TransactionLineIdList')
  List<int> get transactionLineIdList => throw _privateConstructorUsedError;
  @JsonKey(name: 'ApprovalDTO')
  ApprovalDTO get approvalDTO => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TransactionReverseDtoCopyWith<TransactionReverseDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionReverseDtoCopyWith<$Res> {
  factory $TransactionReverseDtoCopyWith(TransactionReverseDto value,
          $Res Function(TransactionReverseDto) then) =
      _$TransactionReverseDtoCopyWithImpl<$Res, TransactionReverseDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'TransactionId')
          int transactionId,
      @JsonKey(name: 'ReasonId')
          int reasonId,
      @JsonKey(name: 'Remarks')
          String remarks,
      @JsonKey(name: 'ReverseObligations')
          bool reverseObligations,
      @JsonKey(name: 'ForceReverseUsedObligations')
          bool forceReverseUsedObligations,
      @JsonKey(name: 'TransactionLineIdList')
          List<int> transactionLineIdList,
      @JsonKey(name: 'ApprovalDTO')
          ApprovalDTO approvalDTO});

  $ApprovalDTOCopyWith<$Res> get approvalDTO;
}

/// @nodoc
class _$TransactionReverseDtoCopyWithImpl<$Res,
        $Val extends TransactionReverseDto>
    implements $TransactionReverseDtoCopyWith<$Res> {
  _$TransactionReverseDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transactionId = null,
    Object? reasonId = null,
    Object? remarks = null,
    Object? reverseObligations = null,
    Object? forceReverseUsedObligations = null,
    Object? transactionLineIdList = null,
    Object? approvalDTO = null,
  }) {
    return _then(_value.copyWith(
      transactionId: null == transactionId
          ? _value.transactionId
          : transactionId // ignore: cast_nullable_to_non_nullable
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
      transactionLineIdList: null == transactionLineIdList
          ? _value.transactionLineIdList
          : transactionLineIdList // ignore: cast_nullable_to_non_nullable
              as List<int>,
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
abstract class _$$_TransactionReverseDtoCopyWith<$Res>
    implements $TransactionReverseDtoCopyWith<$Res> {
  factory _$$_TransactionReverseDtoCopyWith(_$_TransactionReverseDto value,
          $Res Function(_$_TransactionReverseDto) then) =
      __$$_TransactionReverseDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'TransactionId')
          int transactionId,
      @JsonKey(name: 'ReasonId')
          int reasonId,
      @JsonKey(name: 'Remarks')
          String remarks,
      @JsonKey(name: 'ReverseObligations')
          bool reverseObligations,
      @JsonKey(name: 'ForceReverseUsedObligations')
          bool forceReverseUsedObligations,
      @JsonKey(name: 'TransactionLineIdList')
          List<int> transactionLineIdList,
      @JsonKey(name: 'ApprovalDTO')
          ApprovalDTO approvalDTO});

  @override
  $ApprovalDTOCopyWith<$Res> get approvalDTO;
}

/// @nodoc
class __$$_TransactionReverseDtoCopyWithImpl<$Res>
    extends _$TransactionReverseDtoCopyWithImpl<$Res, _$_TransactionReverseDto>
    implements _$$_TransactionReverseDtoCopyWith<$Res> {
  __$$_TransactionReverseDtoCopyWithImpl(_$_TransactionReverseDto _value,
      $Res Function(_$_TransactionReverseDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transactionId = null,
    Object? reasonId = null,
    Object? remarks = null,
    Object? reverseObligations = null,
    Object? forceReverseUsedObligations = null,
    Object? transactionLineIdList = null,
    Object? approvalDTO = null,
  }) {
    return _then(_$_TransactionReverseDto(
      transactionId: null == transactionId
          ? _value.transactionId
          : transactionId // ignore: cast_nullable_to_non_nullable
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
      transactionLineIdList: null == transactionLineIdList
          ? _value._transactionLineIdList
          : transactionLineIdList // ignore: cast_nullable_to_non_nullable
              as List<int>,
      approvalDTO: null == approvalDTO
          ? _value.approvalDTO
          : approvalDTO // ignore: cast_nullable_to_non_nullable
              as ApprovalDTO,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TransactionReverseDto implements _TransactionReverseDto {
  const _$_TransactionReverseDto(
      {@JsonKey(name: 'TransactionId')
          required this.transactionId,
      @JsonKey(name: 'ReasonId')
          required this.reasonId,
      @JsonKey(name: 'Remarks')
          required this.remarks,
      @JsonKey(name: 'ReverseObligations')
          required this.reverseObligations,
      @JsonKey(name: 'ForceReverseUsedObligations')
          required this.forceReverseUsedObligations,
      @JsonKey(name: 'TransactionLineIdList')
          required final List<int> transactionLineIdList,
      @JsonKey(name: 'ApprovalDTO')
          required this.approvalDTO})
      : _transactionLineIdList = transactionLineIdList;

  factory _$_TransactionReverseDto.fromJson(Map<String, dynamic> json) =>
      _$$_TransactionReverseDtoFromJson(json);

  @override
  @JsonKey(name: 'TransactionId')
  final int transactionId;
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
  final List<int> _transactionLineIdList;
  @override
  @JsonKey(name: 'TransactionLineIdList')
  List<int> get transactionLineIdList {
    if (_transactionLineIdList is EqualUnmodifiableListView)
      return _transactionLineIdList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_transactionLineIdList);
  }

  @override
  @JsonKey(name: 'ApprovalDTO')
  final ApprovalDTO approvalDTO;

  @override
  String toString() {
    return 'TransactionReverseDto(transactionId: $transactionId, reasonId: $reasonId, remarks: $remarks, reverseObligations: $reverseObligations, forceReverseUsedObligations: $forceReverseUsedObligations, transactionLineIdList: $transactionLineIdList, approvalDTO: $approvalDTO)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TransactionReverseDto &&
            (identical(other.transactionId, transactionId) ||
                other.transactionId == transactionId) &&
            (identical(other.reasonId, reasonId) ||
                other.reasonId == reasonId) &&
            (identical(other.remarks, remarks) || other.remarks == remarks) &&
            (identical(other.reverseObligations, reverseObligations) ||
                other.reverseObligations == reverseObligations) &&
            (identical(other.forceReverseUsedObligations,
                    forceReverseUsedObligations) ||
                other.forceReverseUsedObligations ==
                    forceReverseUsedObligations) &&
            const DeepCollectionEquality()
                .equals(other._transactionLineIdList, _transactionLineIdList) &&
            (identical(other.approvalDTO, approvalDTO) ||
                other.approvalDTO == approvalDTO));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      transactionId,
      reasonId,
      remarks,
      reverseObligations,
      forceReverseUsedObligations,
      const DeepCollectionEquality().hash(_transactionLineIdList),
      approvalDTO);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TransactionReverseDtoCopyWith<_$_TransactionReverseDto> get copyWith =>
      __$$_TransactionReverseDtoCopyWithImpl<_$_TransactionReverseDto>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TransactionReverseDtoToJson(
      this,
    );
  }
}

abstract class _TransactionReverseDto implements TransactionReverseDto {
  const factory _TransactionReverseDto(
      {@JsonKey(name: 'TransactionId')
          required final int transactionId,
      @JsonKey(name: 'ReasonId')
          required final int reasonId,
      @JsonKey(name: 'Remarks')
          required final String remarks,
      @JsonKey(name: 'ReverseObligations')
          required final bool reverseObligations,
      @JsonKey(name: 'ForceReverseUsedObligations')
          required final bool forceReverseUsedObligations,
      @JsonKey(name: 'TransactionLineIdList')
          required final List<int> transactionLineIdList,
      @JsonKey(name: 'ApprovalDTO')
          required final ApprovalDTO approvalDTO}) = _$_TransactionReverseDto;

  factory _TransactionReverseDto.fromJson(Map<String, dynamic> json) =
      _$_TransactionReverseDto.fromJson;

  @override
  @JsonKey(name: 'TransactionId')
  int get transactionId;
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
  @JsonKey(name: 'TransactionLineIdList')
  List<int> get transactionLineIdList;
  @override
  @JsonKey(name: 'ApprovalDTO')
  ApprovalDTO get approvalDTO;
  @override
  @JsonKey(ignore: true)
  _$$_TransactionReverseDtoCopyWith<_$_TransactionReverseDto> get copyWith =>
      throw _privateConstructorUsedError;
}
