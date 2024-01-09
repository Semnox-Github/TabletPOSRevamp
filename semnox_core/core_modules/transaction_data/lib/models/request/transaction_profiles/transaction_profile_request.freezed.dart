// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transaction_profile_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TransactionProfileRequest _$TransactionProfileRequestFromJson(
    Map<String, dynamic> json) {
  return _TransactionProfileRequest.fromJson(json);
}

/// @nodoc
mixin _$TransactionProfileRequest {
  @JsonKey(name: 'TransactionLineIdList')
  List<int> get transactionLineIdList => throw _privateConstructorUsedError;
  @JsonKey(name: 'remarks')
  String get remarks => throw _privateConstructorUsedError;
  @JsonKey(name: 'ProfileId')
  int get profileId => throw _privateConstructorUsedError;
  @JsonKey(name: 'Name')
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'Identification')
  String get identification => throw _privateConstructorUsedError;
  @JsonKey(name: 'ApprovalDTO')
  ApprovalDTO get approvalDTO => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TransactionProfileRequestCopyWith<TransactionProfileRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionProfileRequestCopyWith<$Res> {
  factory $TransactionProfileRequestCopyWith(TransactionProfileRequest value,
          $Res Function(TransactionProfileRequest) then) =
      _$TransactionProfileRequestCopyWithImpl<$Res, TransactionProfileRequest>;
  @useResult
  $Res call(
      {@JsonKey(name: 'TransactionLineIdList') List<int> transactionLineIdList,
      @JsonKey(name: 'remarks') String remarks,
      @JsonKey(name: 'ProfileId') int profileId,
      @JsonKey(name: 'Name') String name,
      @JsonKey(name: 'Identification') String identification,
      @JsonKey(name: 'ApprovalDTO') ApprovalDTO approvalDTO});

  $ApprovalDTOCopyWith<$Res> get approvalDTO;
}

/// @nodoc
class _$TransactionProfileRequestCopyWithImpl<$Res,
        $Val extends TransactionProfileRequest>
    implements $TransactionProfileRequestCopyWith<$Res> {
  _$TransactionProfileRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transactionLineIdList = null,
    Object? remarks = null,
    Object? profileId = null,
    Object? name = null,
    Object? identification = null,
    Object? approvalDTO = null,
  }) {
    return _then(_value.copyWith(
      transactionLineIdList: null == transactionLineIdList
          ? _value.transactionLineIdList
          : transactionLineIdList // ignore: cast_nullable_to_non_nullable
              as List<int>,
      remarks: null == remarks
          ? _value.remarks
          : remarks // ignore: cast_nullable_to_non_nullable
              as String,
      profileId: null == profileId
          ? _value.profileId
          : profileId // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      identification: null == identification
          ? _value.identification
          : identification // ignore: cast_nullable_to_non_nullable
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
abstract class _$$_TransactionProfileRequestCopyWith<$Res>
    implements $TransactionProfileRequestCopyWith<$Res> {
  factory _$$_TransactionProfileRequestCopyWith(
          _$_TransactionProfileRequest value,
          $Res Function(_$_TransactionProfileRequest) then) =
      __$$_TransactionProfileRequestCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'TransactionLineIdList') List<int> transactionLineIdList,
      @JsonKey(name: 'remarks') String remarks,
      @JsonKey(name: 'ProfileId') int profileId,
      @JsonKey(name: 'Name') String name,
      @JsonKey(name: 'Identification') String identification,
      @JsonKey(name: 'ApprovalDTO') ApprovalDTO approvalDTO});

  @override
  $ApprovalDTOCopyWith<$Res> get approvalDTO;
}

/// @nodoc
class __$$_TransactionProfileRequestCopyWithImpl<$Res>
    extends _$TransactionProfileRequestCopyWithImpl<$Res,
        _$_TransactionProfileRequest>
    implements _$$_TransactionProfileRequestCopyWith<$Res> {
  __$$_TransactionProfileRequestCopyWithImpl(
      _$_TransactionProfileRequest _value,
      $Res Function(_$_TransactionProfileRequest) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transactionLineIdList = null,
    Object? remarks = null,
    Object? profileId = null,
    Object? name = null,
    Object? identification = null,
    Object? approvalDTO = null,
  }) {
    return _then(_$_TransactionProfileRequest(
      transactionLineIdList: null == transactionLineIdList
          ? _value._transactionLineIdList
          : transactionLineIdList // ignore: cast_nullable_to_non_nullable
              as List<int>,
      remarks: null == remarks
          ? _value.remarks
          : remarks // ignore: cast_nullable_to_non_nullable
              as String,
      profileId: null == profileId
          ? _value.profileId
          : profileId // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      identification: null == identification
          ? _value.identification
          : identification // ignore: cast_nullable_to_non_nullable
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
class _$_TransactionProfileRequest implements _TransactionProfileRequest {
  const _$_TransactionProfileRequest(
      {@JsonKey(name: 'TransactionLineIdList')
          required final List<int> transactionLineIdList,
      @JsonKey(name: 'remarks')
          required this.remarks,
      @JsonKey(name: 'ProfileId')
          required this.profileId,
      @JsonKey(name: 'Name')
          required this.name,
      @JsonKey(name: 'Identification')
          required this.identification,
      @JsonKey(name: 'ApprovalDTO')
          required this.approvalDTO})
      : _transactionLineIdList = transactionLineIdList;

  factory _$_TransactionProfileRequest.fromJson(Map<String, dynamic> json) =>
      _$$_TransactionProfileRequestFromJson(json);

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
  @JsonKey(name: 'remarks')
  final String remarks;
  @override
  @JsonKey(name: 'ProfileId')
  final int profileId;
  @override
  @JsonKey(name: 'Name')
  final String name;
  @override
  @JsonKey(name: 'Identification')
  final String identification;
  @override
  @JsonKey(name: 'ApprovalDTO')
  final ApprovalDTO approvalDTO;

  @override
  String toString() {
    return 'TransactionProfileRequest(transactionLineIdList: $transactionLineIdList, remarks: $remarks, profileId: $profileId, name: $name, identification: $identification, approvalDTO: $approvalDTO)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TransactionProfileRequest &&
            const DeepCollectionEquality()
                .equals(other._transactionLineIdList, _transactionLineIdList) &&
            (identical(other.remarks, remarks) || other.remarks == remarks) &&
            (identical(other.profileId, profileId) ||
                other.profileId == profileId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.identification, identification) ||
                other.identification == identification) &&
            (identical(other.approvalDTO, approvalDTO) ||
                other.approvalDTO == approvalDTO));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_transactionLineIdList),
      remarks,
      profileId,
      name,
      identification,
      approvalDTO);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TransactionProfileRequestCopyWith<_$_TransactionProfileRequest>
      get copyWith => __$$_TransactionProfileRequestCopyWithImpl<
          _$_TransactionProfileRequest>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TransactionProfileRequestToJson(
      this,
    );
  }
}

abstract class _TransactionProfileRequest implements TransactionProfileRequest {
  const factory _TransactionProfileRequest(
          {@JsonKey(name: 'TransactionLineIdList')
              required final List<int> transactionLineIdList,
          @JsonKey(name: 'remarks')
              required final String remarks,
          @JsonKey(name: 'ProfileId')
              required final int profileId,
          @JsonKey(name: 'Name')
              required final String name,
          @JsonKey(name: 'Identification')
              required final String identification,
          @JsonKey(name: 'ApprovalDTO')
              required final ApprovalDTO approvalDTO}) =
      _$_TransactionProfileRequest;

  factory _TransactionProfileRequest.fromJson(Map<String, dynamic> json) =
      _$_TransactionProfileRequest.fromJson;

  @override
  @JsonKey(name: 'TransactionLineIdList')
  List<int> get transactionLineIdList;
  @override
  @JsonKey(name: 'remarks')
  String get remarks;
  @override
  @JsonKey(name: 'ProfileId')
  int get profileId;
  @override
  @JsonKey(name: 'Name')
  String get name;
  @override
  @JsonKey(name: 'Identification')
  String get identification;
  @override
  @JsonKey(name: 'ApprovalDTO')
  ApprovalDTO get approvalDTO;
  @override
  @JsonKey(ignore: true)
  _$$_TransactionProfileRequestCopyWith<_$_TransactionProfileRequest>
      get copyWith => throw _privateConstructorUsedError;
}
