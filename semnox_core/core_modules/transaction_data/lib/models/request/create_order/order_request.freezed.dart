// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

OrderRequest _$OrderRequestFromJson(Map<String, dynamic> json) {
  return _OrderRequest.fromJson(json);
}

/// @nodoc
mixin _$OrderRequest {
  @JsonKey(name: 'TableId')
  int get tableId => throw _privateConstructorUsedError;
  @JsonKey(name: 'TableOperationDetails')
  TableOperationDetails get tableOperationDetails =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'ApprovalDTO')
  ApprovalDTO get approvalDTO => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OrderRequestCopyWith<OrderRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderRequestCopyWith<$Res> {
  factory $OrderRequestCopyWith(
          OrderRequest value, $Res Function(OrderRequest) then) =
      _$OrderRequestCopyWithImpl<$Res, OrderRequest>;
  @useResult
  $Res call(
      {@JsonKey(name: 'TableId')
          int tableId,
      @JsonKey(name: 'TableOperationDetails')
          TableOperationDetails tableOperationDetails,
      @JsonKey(name: 'ApprovalDTO')
          ApprovalDTO approvalDTO});

  $TableOperationDetailsCopyWith<$Res> get tableOperationDetails;
  $ApprovalDTOCopyWith<$Res> get approvalDTO;
}

/// @nodoc
class _$OrderRequestCopyWithImpl<$Res, $Val extends OrderRequest>
    implements $OrderRequestCopyWith<$Res> {
  _$OrderRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tableId = null,
    Object? tableOperationDetails = null,
    Object? approvalDTO = null,
  }) {
    return _then(_value.copyWith(
      tableId: null == tableId
          ? _value.tableId
          : tableId // ignore: cast_nullable_to_non_nullable
              as int,
      tableOperationDetails: null == tableOperationDetails
          ? _value.tableOperationDetails
          : tableOperationDetails // ignore: cast_nullable_to_non_nullable
              as TableOperationDetails,
      approvalDTO: null == approvalDTO
          ? _value.approvalDTO
          : approvalDTO // ignore: cast_nullable_to_non_nullable
              as ApprovalDTO,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $TableOperationDetailsCopyWith<$Res> get tableOperationDetails {
    return $TableOperationDetailsCopyWith<$Res>(_value.tableOperationDetails,
        (value) {
      return _then(_value.copyWith(tableOperationDetails: value) as $Val);
    });
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
abstract class _$$_OrderRequestCopyWith<$Res>
    implements $OrderRequestCopyWith<$Res> {
  factory _$$_OrderRequestCopyWith(
          _$_OrderRequest value, $Res Function(_$_OrderRequest) then) =
      __$$_OrderRequestCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'TableId')
          int tableId,
      @JsonKey(name: 'TableOperationDetails')
          TableOperationDetails tableOperationDetails,
      @JsonKey(name: 'ApprovalDTO')
          ApprovalDTO approvalDTO});

  @override
  $TableOperationDetailsCopyWith<$Res> get tableOperationDetails;
  @override
  $ApprovalDTOCopyWith<$Res> get approvalDTO;
}

/// @nodoc
class __$$_OrderRequestCopyWithImpl<$Res>
    extends _$OrderRequestCopyWithImpl<$Res, _$_OrderRequest>
    implements _$$_OrderRequestCopyWith<$Res> {
  __$$_OrderRequestCopyWithImpl(
      _$_OrderRequest _value, $Res Function(_$_OrderRequest) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tableId = null,
    Object? tableOperationDetails = null,
    Object? approvalDTO = null,
  }) {
    return _then(_$_OrderRequest(
      tableId: null == tableId
          ? _value.tableId
          : tableId // ignore: cast_nullable_to_non_nullable
              as int,
      tableOperationDetails: null == tableOperationDetails
          ? _value.tableOperationDetails
          : tableOperationDetails // ignore: cast_nullable_to_non_nullable
              as TableOperationDetails,
      approvalDTO: null == approvalDTO
          ? _value.approvalDTO
          : approvalDTO // ignore: cast_nullable_to_non_nullable
              as ApprovalDTO,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_OrderRequest implements _OrderRequest {
  const _$_OrderRequest(
      {@JsonKey(name: 'TableId')
          required this.tableId,
      @JsonKey(name: 'TableOperationDetails')
          required this.tableOperationDetails,
      @JsonKey(name: 'ApprovalDTO')
          required this.approvalDTO});

  factory _$_OrderRequest.fromJson(Map<String, dynamic> json) =>
      _$$_OrderRequestFromJson(json);

  @override
  @JsonKey(name: 'TableId')
  final int tableId;
  @override
  @JsonKey(name: 'TableOperationDetails')
  final TableOperationDetails tableOperationDetails;
  @override
  @JsonKey(name: 'ApprovalDTO')
  final ApprovalDTO approvalDTO;

  @override
  String toString() {
    return 'OrderRequest(tableId: $tableId, tableOperationDetails: $tableOperationDetails, approvalDTO: $approvalDTO)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OrderRequest &&
            (identical(other.tableId, tableId) || other.tableId == tableId) &&
            (identical(other.tableOperationDetails, tableOperationDetails) ||
                other.tableOperationDetails == tableOperationDetails) &&
            (identical(other.approvalDTO, approvalDTO) ||
                other.approvalDTO == approvalDTO));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, tableId, tableOperationDetails, approvalDTO);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_OrderRequestCopyWith<_$_OrderRequest> get copyWith =>
      __$$_OrderRequestCopyWithImpl<_$_OrderRequest>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_OrderRequestToJson(
      this,
    );
  }
}

abstract class _OrderRequest implements OrderRequest {
  const factory _OrderRequest(
      {@JsonKey(name: 'TableId')
          required final int tableId,
      @JsonKey(name: 'TableOperationDetails')
          required final TableOperationDetails tableOperationDetails,
      @JsonKey(name: 'ApprovalDTO')
          required final ApprovalDTO approvalDTO}) = _$_OrderRequest;

  factory _OrderRequest.fromJson(Map<String, dynamic> json) =
      _$_OrderRequest.fromJson;

  @override
  @JsonKey(name: 'TableId')
  int get tableId;
  @override
  @JsonKey(name: 'TableOperationDetails')
  TableOperationDetails get tableOperationDetails;
  @override
  @JsonKey(name: 'ApprovalDTO')
  ApprovalDTO get approvalDTO;
  @override
  @JsonKey(ignore: true)
  _$$_OrderRequestCopyWith<_$_OrderRequest> get copyWith =>
      throw _privateConstructorUsedError;
}
