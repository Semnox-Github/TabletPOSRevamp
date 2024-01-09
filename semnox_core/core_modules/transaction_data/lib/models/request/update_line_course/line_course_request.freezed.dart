// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'line_course_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UpdateLineCourseRequest _$UpdateLineCourseRequestFromJson(
    Map<String, dynamic> json) {
  return _UpdateLineCourseRequest.fromJson(json);
}

/// @nodoc
mixin _$UpdateLineCourseRequest {
  @JsonKey(name: 'TransactionLineId')
  int get transactionLineId => throw _privateConstructorUsedError;
  @JsonKey(name: 'CourseName')
  String get courseName => throw _privateConstructorUsedError;
  @JsonKey(name: 'LineRemarks')
  String get lineRemarks => throw _privateConstructorUsedError;
  @JsonKey(name: 'ApprovalDTO')
  ApprovalDTO get approvalDTO => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UpdateLineCourseRequestCopyWith<UpdateLineCourseRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdateLineCourseRequestCopyWith<$Res> {
  factory $UpdateLineCourseRequestCopyWith(UpdateLineCourseRequest value,
          $Res Function(UpdateLineCourseRequest) then) =
      _$UpdateLineCourseRequestCopyWithImpl<$Res, UpdateLineCourseRequest>;
  @useResult
  $Res call(
      {@JsonKey(name: 'TransactionLineId') int transactionLineId,
      @JsonKey(name: 'CourseName') String courseName,
      @JsonKey(name: 'LineRemarks') String lineRemarks,
      @JsonKey(name: 'ApprovalDTO') ApprovalDTO approvalDTO});

  $ApprovalDTOCopyWith<$Res> get approvalDTO;
}

/// @nodoc
class _$UpdateLineCourseRequestCopyWithImpl<$Res,
        $Val extends UpdateLineCourseRequest>
    implements $UpdateLineCourseRequestCopyWith<$Res> {
  _$UpdateLineCourseRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transactionLineId = null,
    Object? courseName = null,
    Object? lineRemarks = null,
    Object? approvalDTO = null,
  }) {
    return _then(_value.copyWith(
      transactionLineId: null == transactionLineId
          ? _value.transactionLineId
          : transactionLineId // ignore: cast_nullable_to_non_nullable
              as int,
      courseName: null == courseName
          ? _value.courseName
          : courseName // ignore: cast_nullable_to_non_nullable
              as String,
      lineRemarks: null == lineRemarks
          ? _value.lineRemarks
          : lineRemarks // ignore: cast_nullable_to_non_nullable
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
abstract class _$$_UpdateLineCourseRequestCopyWith<$Res>
    implements $UpdateLineCourseRequestCopyWith<$Res> {
  factory _$$_UpdateLineCourseRequestCopyWith(_$_UpdateLineCourseRequest value,
          $Res Function(_$_UpdateLineCourseRequest) then) =
      __$$_UpdateLineCourseRequestCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'TransactionLineId') int transactionLineId,
      @JsonKey(name: 'CourseName') String courseName,
      @JsonKey(name: 'LineRemarks') String lineRemarks,
      @JsonKey(name: 'ApprovalDTO') ApprovalDTO approvalDTO});

  @override
  $ApprovalDTOCopyWith<$Res> get approvalDTO;
}

/// @nodoc
class __$$_UpdateLineCourseRequestCopyWithImpl<$Res>
    extends _$UpdateLineCourseRequestCopyWithImpl<$Res,
        _$_UpdateLineCourseRequest>
    implements _$$_UpdateLineCourseRequestCopyWith<$Res> {
  __$$_UpdateLineCourseRequestCopyWithImpl(_$_UpdateLineCourseRequest _value,
      $Res Function(_$_UpdateLineCourseRequest) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transactionLineId = null,
    Object? courseName = null,
    Object? lineRemarks = null,
    Object? approvalDTO = null,
  }) {
    return _then(_$_UpdateLineCourseRequest(
      transactionLineId: null == transactionLineId
          ? _value.transactionLineId
          : transactionLineId // ignore: cast_nullable_to_non_nullable
              as int,
      courseName: null == courseName
          ? _value.courseName
          : courseName // ignore: cast_nullable_to_non_nullable
              as String,
      lineRemarks: null == lineRemarks
          ? _value.lineRemarks
          : lineRemarks // ignore: cast_nullable_to_non_nullable
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
class _$_UpdateLineCourseRequest implements _UpdateLineCourseRequest {
  const _$_UpdateLineCourseRequest(
      {@JsonKey(name: 'TransactionLineId') required this.transactionLineId,
      @JsonKey(name: 'CourseName') required this.courseName,
      @JsonKey(name: 'LineRemarks') required this.lineRemarks,
      @JsonKey(name: 'ApprovalDTO') required this.approvalDTO});

  factory _$_UpdateLineCourseRequest.fromJson(Map<String, dynamic> json) =>
      _$$_UpdateLineCourseRequestFromJson(json);

  @override
  @JsonKey(name: 'TransactionLineId')
  final int transactionLineId;
  @override
  @JsonKey(name: 'CourseName')
  final String courseName;
  @override
  @JsonKey(name: 'LineRemarks')
  final String lineRemarks;
  @override
  @JsonKey(name: 'ApprovalDTO')
  final ApprovalDTO approvalDTO;

  @override
  String toString() {
    return 'UpdateLineCourseRequest(transactionLineId: $transactionLineId, courseName: $courseName, lineRemarks: $lineRemarks, approvalDTO: $approvalDTO)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UpdateLineCourseRequest &&
            (identical(other.transactionLineId, transactionLineId) ||
                other.transactionLineId == transactionLineId) &&
            (identical(other.courseName, courseName) ||
                other.courseName == courseName) &&
            (identical(other.lineRemarks, lineRemarks) ||
                other.lineRemarks == lineRemarks) &&
            (identical(other.approvalDTO, approvalDTO) ||
                other.approvalDTO == approvalDTO));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, transactionLineId, courseName, lineRemarks, approvalDTO);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UpdateLineCourseRequestCopyWith<_$_UpdateLineCourseRequest>
      get copyWith =>
          __$$_UpdateLineCourseRequestCopyWithImpl<_$_UpdateLineCourseRequest>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UpdateLineCourseRequestToJson(
      this,
    );
  }
}

abstract class _UpdateLineCourseRequest implements UpdateLineCourseRequest {
  const factory _UpdateLineCourseRequest(
      {@JsonKey(name: 'TransactionLineId')
          required final int transactionLineId,
      @JsonKey(name: 'CourseName')
          required final String courseName,
      @JsonKey(name: 'LineRemarks')
          required final String lineRemarks,
      @JsonKey(name: 'ApprovalDTO')
          required final ApprovalDTO approvalDTO}) = _$_UpdateLineCourseRequest;

  factory _UpdateLineCourseRequest.fromJson(Map<String, dynamic> json) =
      _$_UpdateLineCourseRequest.fromJson;

  @override
  @JsonKey(name: 'TransactionLineId')
  int get transactionLineId;
  @override
  @JsonKey(name: 'CourseName')
  String get courseName;
  @override
  @JsonKey(name: 'LineRemarks')
  String get lineRemarks;
  @override
  @JsonKey(name: 'ApprovalDTO')
  ApprovalDTO get approvalDTO;
  @override
  @JsonKey(ignore: true)
  _$$_UpdateLineCourseRequestCopyWith<_$_UpdateLineCourseRequest>
      get copyWith => throw _privateConstructorUsedError;
}
