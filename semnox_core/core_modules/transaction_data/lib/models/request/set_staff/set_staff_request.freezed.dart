// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'set_staff_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SetStaffRequest _$SetStaffRequestFromJson(Map<String, dynamic> json) {
  return _SetStaffRequest.fromJson(json);
}

/// @nodoc
mixin _$SetStaffRequest {
  @JsonKey(name: 'UserId')
  int get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'ApprovalDTO')
  ApprovalDTO get approvalDTO => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SetStaffRequestCopyWith<SetStaffRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SetStaffRequestCopyWith<$Res> {
  factory $SetStaffRequestCopyWith(
          SetStaffRequest value, $Res Function(SetStaffRequest) then) =
      _$SetStaffRequestCopyWithImpl<$Res, SetStaffRequest>;
  @useResult
  $Res call(
      {@JsonKey(name: 'UserId') int userId,
      @JsonKey(name: 'ApprovalDTO') ApprovalDTO approvalDTO});

  $ApprovalDTOCopyWith<$Res> get approvalDTO;
}

/// @nodoc
class _$SetStaffRequestCopyWithImpl<$Res, $Val extends SetStaffRequest>
    implements $SetStaffRequestCopyWith<$Res> {
  _$SetStaffRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? approvalDTO = null,
  }) {
    return _then(_value.copyWith(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
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
abstract class _$$_SetStaffRequestCopyWith<$Res>
    implements $SetStaffRequestCopyWith<$Res> {
  factory _$$_SetStaffRequestCopyWith(
          _$_SetStaffRequest value, $Res Function(_$_SetStaffRequest) then) =
      __$$_SetStaffRequestCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'UserId') int userId,
      @JsonKey(name: 'ApprovalDTO') ApprovalDTO approvalDTO});

  @override
  $ApprovalDTOCopyWith<$Res> get approvalDTO;
}

/// @nodoc
class __$$_SetStaffRequestCopyWithImpl<$Res>
    extends _$SetStaffRequestCopyWithImpl<$Res, _$_SetStaffRequest>
    implements _$$_SetStaffRequestCopyWith<$Res> {
  __$$_SetStaffRequestCopyWithImpl(
      _$_SetStaffRequest _value, $Res Function(_$_SetStaffRequest) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? approvalDTO = null,
  }) {
    return _then(_$_SetStaffRequest(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      approvalDTO: null == approvalDTO
          ? _value.approvalDTO
          : approvalDTO // ignore: cast_nullable_to_non_nullable
              as ApprovalDTO,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SetStaffRequest implements _SetStaffRequest {
  const _$_SetStaffRequest(
      {@JsonKey(name: 'UserId') required this.userId,
      @JsonKey(name: 'ApprovalDTO') required this.approvalDTO});

  factory _$_SetStaffRequest.fromJson(Map<String, dynamic> json) =>
      _$$_SetStaffRequestFromJson(json);

  @override
  @JsonKey(name: 'UserId')
  final int userId;
  @override
  @JsonKey(name: 'ApprovalDTO')
  final ApprovalDTO approvalDTO;

  @override
  String toString() {
    return 'SetStaffRequest(userId: $userId, approvalDTO: $approvalDTO)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SetStaffRequest &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.approvalDTO, approvalDTO) ||
                other.approvalDTO == approvalDTO));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, userId, approvalDTO);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SetStaffRequestCopyWith<_$_SetStaffRequest> get copyWith =>
      __$$_SetStaffRequestCopyWithImpl<_$_SetStaffRequest>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SetStaffRequestToJson(
      this,
    );
  }
}

abstract class _SetStaffRequest implements SetStaffRequest {
  const factory _SetStaffRequest(
      {@JsonKey(name: 'UserId')
          required final int userId,
      @JsonKey(name: 'ApprovalDTO')
          required final ApprovalDTO approvalDTO}) = _$_SetStaffRequest;

  factory _SetStaffRequest.fromJson(Map<String, dynamic> json) =
      _$_SetStaffRequest.fromJson;

  @override
  @JsonKey(name: 'UserId')
  int get userId;
  @override
  @JsonKey(name: 'ApprovalDTO')
  ApprovalDTO get approvalDTO;
  @override
  @JsonKey(ignore: true)
  _$$_SetStaffRequestCopyWith<_$_SetStaffRequest> get copyWith =>
      throw _privateConstructorUsedError;
}
