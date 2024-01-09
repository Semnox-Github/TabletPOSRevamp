// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'facility_table_container_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FacilityTableContainerDTO _$FacilityTableContainerDTOFromJson(
    Map<String, dynamic> json) {
  return _FacilityTablesContainerDTO.fromJson(json);
}

/// @nodoc
mixin _$FacilityTableContainerDTO {
  @JsonKey(name: 'TableId')
  int get tableId => throw _privateConstructorUsedError;
  @JsonKey(name: 'TableName')
  String get tableName => throw _privateConstructorUsedError;
  @JsonKey(name: 'RowIndex')
  int get rowIndex => throw _privateConstructorUsedError;
  @JsonKey(name: 'ColumnIndex')
  int get columnIndex => throw _privateConstructorUsedError;
  @JsonKey(name: 'FacilityId')
  int get facilityId => throw _privateConstructorUsedError;
  @JsonKey(name: 'TableType')
  String get tableType => throw _privateConstructorUsedError;
  @JsonKey(name: 'InterfaceInfo1')
  String get interfaceInfo1 => throw _privateConstructorUsedError;
  @JsonKey(name: 'InterfaceInfo2')
  String get interfaceInfo2 => throw _privateConstructorUsedError;
  @JsonKey(name: 'InterfaceInfo3')
  String get interfaceInfo3 => throw _privateConstructorUsedError;
  @JsonKey(name: 'Remarks')
  String get remarks => throw _privateConstructorUsedError;
  @JsonKey(name: 'Guid')
  String get guid => throw _privateConstructorUsedError;
  @JsonKey(name: 'MaxCheckIns')
  int get maxCheckIns => throw _privateConstructorUsedError;
  @JsonKey(name: 'UserId')
  int get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'TableStatus')
  String? get tableStatus => throw _privateConstructorUsedError;
  @JsonKey(name: 'TrxId')
  int get trxId => throw _privateConstructorUsedError;
  @JsonKey(name: 'OrderId')
  int get urderId => throw _privateConstructorUsedError;
  @JsonKey(name: 'CustomerName')
  String? get customerName => throw _privateConstructorUsedError;
  @JsonKey(name: 'ImageFileName')
  String get imageFileName => throw _privateConstructorUsedError;
  @JsonKey(name: 'PositionX')
  dynamic? get positionX => throw _privateConstructorUsedError;
  @JsonKey(name: 'PositionY')
  dynamic? get positionY => throw _privateConstructorUsedError;
  @JsonKey(name: 'AllowMultipleOrders')
  bool get allowMultipleOrders => throw _privateConstructorUsedError;
  FacilityTableCurrentStatusDTO? get facilityTableCurrentStatusDTO =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FacilityTableContainerDTOCopyWith<FacilityTableContainerDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FacilityTableContainerDTOCopyWith<$Res> {
  factory $FacilityTableContainerDTOCopyWith(FacilityTableContainerDTO value,
          $Res Function(FacilityTableContainerDTO) then) =
      _$FacilityTableContainerDTOCopyWithImpl<$Res, FacilityTableContainerDTO>;
  @useResult
  $Res call(
      {@JsonKey(name: 'TableId') int tableId,
      @JsonKey(name: 'TableName') String tableName,
      @JsonKey(name: 'RowIndex') int rowIndex,
      @JsonKey(name: 'ColumnIndex') int columnIndex,
      @JsonKey(name: 'FacilityId') int facilityId,
      @JsonKey(name: 'TableType') String tableType,
      @JsonKey(name: 'InterfaceInfo1') String interfaceInfo1,
      @JsonKey(name: 'InterfaceInfo2') String interfaceInfo2,
      @JsonKey(name: 'InterfaceInfo3') String interfaceInfo3,
      @JsonKey(name: 'Remarks') String remarks,
      @JsonKey(name: 'Guid') String guid,
      @JsonKey(name: 'MaxCheckIns') int maxCheckIns,
      @JsonKey(name: 'UserId') int userId,
      @JsonKey(name: 'TableStatus') String? tableStatus,
      @JsonKey(name: 'TrxId') int trxId,
      @JsonKey(name: 'OrderId') int urderId,
      @JsonKey(name: 'CustomerName') String? customerName,
      @JsonKey(name: 'ImageFileName') String imageFileName,
      @JsonKey(name: 'PositionX') dynamic? positionX,
      @JsonKey(name: 'PositionY') dynamic? positionY,
      @JsonKey(name: 'AllowMultipleOrders') bool allowMultipleOrders,
      FacilityTableCurrentStatusDTO? facilityTableCurrentStatusDTO});

  $FacilityTableCurrentStatusDTOCopyWith<$Res>?
      get facilityTableCurrentStatusDTO;
}

/// @nodoc
class _$FacilityTableContainerDTOCopyWithImpl<$Res,
        $Val extends FacilityTableContainerDTO>
    implements $FacilityTableContainerDTOCopyWith<$Res> {
  _$FacilityTableContainerDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tableId = null,
    Object? tableName = null,
    Object? rowIndex = null,
    Object? columnIndex = null,
    Object? facilityId = null,
    Object? tableType = null,
    Object? interfaceInfo1 = null,
    Object? interfaceInfo2 = null,
    Object? interfaceInfo3 = null,
    Object? remarks = null,
    Object? guid = null,
    Object? maxCheckIns = null,
    Object? userId = null,
    Object? tableStatus = freezed,
    Object? trxId = null,
    Object? urderId = null,
    Object? customerName = freezed,
    Object? imageFileName = null,
    Object? positionX = freezed,
    Object? positionY = freezed,
    Object? allowMultipleOrders = null,
    Object? facilityTableCurrentStatusDTO = freezed,
  }) {
    return _then(_value.copyWith(
      tableId: null == tableId
          ? _value.tableId
          : tableId // ignore: cast_nullable_to_non_nullable
              as int,
      tableName: null == tableName
          ? _value.tableName
          : tableName // ignore: cast_nullable_to_non_nullable
              as String,
      rowIndex: null == rowIndex
          ? _value.rowIndex
          : rowIndex // ignore: cast_nullable_to_non_nullable
              as int,
      columnIndex: null == columnIndex
          ? _value.columnIndex
          : columnIndex // ignore: cast_nullable_to_non_nullable
              as int,
      facilityId: null == facilityId
          ? _value.facilityId
          : facilityId // ignore: cast_nullable_to_non_nullable
              as int,
      tableType: null == tableType
          ? _value.tableType
          : tableType // ignore: cast_nullable_to_non_nullable
              as String,
      interfaceInfo1: null == interfaceInfo1
          ? _value.interfaceInfo1
          : interfaceInfo1 // ignore: cast_nullable_to_non_nullable
              as String,
      interfaceInfo2: null == interfaceInfo2
          ? _value.interfaceInfo2
          : interfaceInfo2 // ignore: cast_nullable_to_non_nullable
              as String,
      interfaceInfo3: null == interfaceInfo3
          ? _value.interfaceInfo3
          : interfaceInfo3 // ignore: cast_nullable_to_non_nullable
              as String,
      remarks: null == remarks
          ? _value.remarks
          : remarks // ignore: cast_nullable_to_non_nullable
              as String,
      guid: null == guid
          ? _value.guid
          : guid // ignore: cast_nullable_to_non_nullable
              as String,
      maxCheckIns: null == maxCheckIns
          ? _value.maxCheckIns
          : maxCheckIns // ignore: cast_nullable_to_non_nullable
              as int,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      tableStatus: freezed == tableStatus
          ? _value.tableStatus
          : tableStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      trxId: null == trxId
          ? _value.trxId
          : trxId // ignore: cast_nullable_to_non_nullable
              as int,
      urderId: null == urderId
          ? _value.urderId
          : urderId // ignore: cast_nullable_to_non_nullable
              as int,
      customerName: freezed == customerName
          ? _value.customerName
          : customerName // ignore: cast_nullable_to_non_nullable
              as String?,
      imageFileName: null == imageFileName
          ? _value.imageFileName
          : imageFileName // ignore: cast_nullable_to_non_nullable
              as String,
      positionX: freezed == positionX
          ? _value.positionX
          : positionX // ignore: cast_nullable_to_non_nullable
              as dynamic?,
      positionY: freezed == positionY
          ? _value.positionY
          : positionY // ignore: cast_nullable_to_non_nullable
              as dynamic?,
      allowMultipleOrders: null == allowMultipleOrders
          ? _value.allowMultipleOrders
          : allowMultipleOrders // ignore: cast_nullable_to_non_nullable
              as bool,
      facilityTableCurrentStatusDTO: freezed == facilityTableCurrentStatusDTO
          ? _value.facilityTableCurrentStatusDTO
          : facilityTableCurrentStatusDTO // ignore: cast_nullable_to_non_nullable
              as FacilityTableCurrentStatusDTO?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $FacilityTableCurrentStatusDTOCopyWith<$Res>?
      get facilityTableCurrentStatusDTO {
    if (_value.facilityTableCurrentStatusDTO == null) {
      return null;
    }

    return $FacilityTableCurrentStatusDTOCopyWith<$Res>(
        _value.facilityTableCurrentStatusDTO!, (value) {
      return _then(
          _value.copyWith(facilityTableCurrentStatusDTO: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_FacilityTablesContainerDTOCopyWith<$Res>
    implements $FacilityTableContainerDTOCopyWith<$Res> {
  factory _$$_FacilityTablesContainerDTOCopyWith(
          _$_FacilityTablesContainerDTO value,
          $Res Function(_$_FacilityTablesContainerDTO) then) =
      __$$_FacilityTablesContainerDTOCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'TableId') int tableId,
      @JsonKey(name: 'TableName') String tableName,
      @JsonKey(name: 'RowIndex') int rowIndex,
      @JsonKey(name: 'ColumnIndex') int columnIndex,
      @JsonKey(name: 'FacilityId') int facilityId,
      @JsonKey(name: 'TableType') String tableType,
      @JsonKey(name: 'InterfaceInfo1') String interfaceInfo1,
      @JsonKey(name: 'InterfaceInfo2') String interfaceInfo2,
      @JsonKey(name: 'InterfaceInfo3') String interfaceInfo3,
      @JsonKey(name: 'Remarks') String remarks,
      @JsonKey(name: 'Guid') String guid,
      @JsonKey(name: 'MaxCheckIns') int maxCheckIns,
      @JsonKey(name: 'UserId') int userId,
      @JsonKey(name: 'TableStatus') String? tableStatus,
      @JsonKey(name: 'TrxId') int trxId,
      @JsonKey(name: 'OrderId') int urderId,
      @JsonKey(name: 'CustomerName') String? customerName,
      @JsonKey(name: 'ImageFileName') String imageFileName,
      @JsonKey(name: 'PositionX') dynamic? positionX,
      @JsonKey(name: 'PositionY') dynamic? positionY,
      @JsonKey(name: 'AllowMultipleOrders') bool allowMultipleOrders,
      FacilityTableCurrentStatusDTO? facilityTableCurrentStatusDTO});

  @override
  $FacilityTableCurrentStatusDTOCopyWith<$Res>?
      get facilityTableCurrentStatusDTO;
}

/// @nodoc
class __$$_FacilityTablesContainerDTOCopyWithImpl<$Res>
    extends _$FacilityTableContainerDTOCopyWithImpl<$Res,
        _$_FacilityTablesContainerDTO>
    implements _$$_FacilityTablesContainerDTOCopyWith<$Res> {
  __$$_FacilityTablesContainerDTOCopyWithImpl(
      _$_FacilityTablesContainerDTO _value,
      $Res Function(_$_FacilityTablesContainerDTO) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tableId = null,
    Object? tableName = null,
    Object? rowIndex = null,
    Object? columnIndex = null,
    Object? facilityId = null,
    Object? tableType = null,
    Object? interfaceInfo1 = null,
    Object? interfaceInfo2 = null,
    Object? interfaceInfo3 = null,
    Object? remarks = null,
    Object? guid = null,
    Object? maxCheckIns = null,
    Object? userId = null,
    Object? tableStatus = freezed,
    Object? trxId = null,
    Object? urderId = null,
    Object? customerName = freezed,
    Object? imageFileName = null,
    Object? positionX = freezed,
    Object? positionY = freezed,
    Object? allowMultipleOrders = null,
    Object? facilityTableCurrentStatusDTO = freezed,
  }) {
    return _then(_$_FacilityTablesContainerDTO(
      tableId: null == tableId
          ? _value.tableId
          : tableId // ignore: cast_nullable_to_non_nullable
              as int,
      tableName: null == tableName
          ? _value.tableName
          : tableName // ignore: cast_nullable_to_non_nullable
              as String,
      rowIndex: null == rowIndex
          ? _value.rowIndex
          : rowIndex // ignore: cast_nullable_to_non_nullable
              as int,
      columnIndex: null == columnIndex
          ? _value.columnIndex
          : columnIndex // ignore: cast_nullable_to_non_nullable
              as int,
      facilityId: null == facilityId
          ? _value.facilityId
          : facilityId // ignore: cast_nullable_to_non_nullable
              as int,
      tableType: null == tableType
          ? _value.tableType
          : tableType // ignore: cast_nullable_to_non_nullable
              as String,
      interfaceInfo1: null == interfaceInfo1
          ? _value.interfaceInfo1
          : interfaceInfo1 // ignore: cast_nullable_to_non_nullable
              as String,
      interfaceInfo2: null == interfaceInfo2
          ? _value.interfaceInfo2
          : interfaceInfo2 // ignore: cast_nullable_to_non_nullable
              as String,
      interfaceInfo3: null == interfaceInfo3
          ? _value.interfaceInfo3
          : interfaceInfo3 // ignore: cast_nullable_to_non_nullable
              as String,
      remarks: null == remarks
          ? _value.remarks
          : remarks // ignore: cast_nullable_to_non_nullable
              as String,
      guid: null == guid
          ? _value.guid
          : guid // ignore: cast_nullable_to_non_nullable
              as String,
      maxCheckIns: null == maxCheckIns
          ? _value.maxCheckIns
          : maxCheckIns // ignore: cast_nullable_to_non_nullable
              as int,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      tableStatus: freezed == tableStatus
          ? _value.tableStatus
          : tableStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      trxId: null == trxId
          ? _value.trxId
          : trxId // ignore: cast_nullable_to_non_nullable
              as int,
      urderId: null == urderId
          ? _value.urderId
          : urderId // ignore: cast_nullable_to_non_nullable
              as int,
      customerName: freezed == customerName
          ? _value.customerName
          : customerName // ignore: cast_nullable_to_non_nullable
              as String?,
      imageFileName: null == imageFileName
          ? _value.imageFileName
          : imageFileName // ignore: cast_nullable_to_non_nullable
              as String,
      positionX: freezed == positionX
          ? _value.positionX
          : positionX // ignore: cast_nullable_to_non_nullable
              as dynamic?,
      positionY: freezed == positionY
          ? _value.positionY
          : positionY // ignore: cast_nullable_to_non_nullable
              as dynamic?,
      allowMultipleOrders: null == allowMultipleOrders
          ? _value.allowMultipleOrders
          : allowMultipleOrders // ignore: cast_nullable_to_non_nullable
              as bool,
      facilityTableCurrentStatusDTO: freezed == facilityTableCurrentStatusDTO
          ? _value.facilityTableCurrentStatusDTO
          : facilityTableCurrentStatusDTO // ignore: cast_nullable_to_non_nullable
              as FacilityTableCurrentStatusDTO?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_FacilityTablesContainerDTO implements _FacilityTablesContainerDTO {
  const _$_FacilityTablesContainerDTO(
      {@JsonKey(name: 'TableId') required this.tableId,
      @JsonKey(name: 'TableName') required this.tableName,
      @JsonKey(name: 'RowIndex') required this.rowIndex,
      @JsonKey(name: 'ColumnIndex') required this.columnIndex,
      @JsonKey(name: 'FacilityId') required this.facilityId,
      @JsonKey(name: 'TableType') required this.tableType,
      @JsonKey(name: 'InterfaceInfo1') required this.interfaceInfo1,
      @JsonKey(name: 'InterfaceInfo2') required this.interfaceInfo2,
      @JsonKey(name: 'InterfaceInfo3') required this.interfaceInfo3,
      @JsonKey(name: 'Remarks') required this.remarks,
      @JsonKey(name: 'Guid') required this.guid,
      @JsonKey(name: 'MaxCheckIns') required this.maxCheckIns,
      @JsonKey(name: 'UserId') required this.userId,
      @JsonKey(name: 'TableStatus') this.tableStatus,
      @JsonKey(name: 'TrxId') required this.trxId,
      @JsonKey(name: 'OrderId') required this.urderId,
      @JsonKey(name: 'CustomerName') this.customerName,
      @JsonKey(name: 'ImageFileName') required this.imageFileName,
      @JsonKey(name: 'PositionX') this.positionX,
      @JsonKey(name: 'PositionY') this.positionY,
      @JsonKey(name: 'AllowMultipleOrders') required this.allowMultipleOrders,
      this.facilityTableCurrentStatusDTO});

  factory _$_FacilityTablesContainerDTO.fromJson(Map<String, dynamic> json) =>
      _$$_FacilityTablesContainerDTOFromJson(json);

  @override
  @JsonKey(name: 'TableId')
  final int tableId;
  @override
  @JsonKey(name: 'TableName')
  final String tableName;
  @override
  @JsonKey(name: 'RowIndex')
  final int rowIndex;
  @override
  @JsonKey(name: 'ColumnIndex')
  final int columnIndex;
  @override
  @JsonKey(name: 'FacilityId')
  final int facilityId;
  @override
  @JsonKey(name: 'TableType')
  final String tableType;
  @override
  @JsonKey(name: 'InterfaceInfo1')
  final String interfaceInfo1;
  @override
  @JsonKey(name: 'InterfaceInfo2')
  final String interfaceInfo2;
  @override
  @JsonKey(name: 'InterfaceInfo3')
  final String interfaceInfo3;
  @override
  @JsonKey(name: 'Remarks')
  final String remarks;
  @override
  @JsonKey(name: 'Guid')
  final String guid;
  @override
  @JsonKey(name: 'MaxCheckIns')
  final int maxCheckIns;
  @override
  @JsonKey(name: 'UserId')
  final int userId;
  @override
  @JsonKey(name: 'TableStatus')
  final String? tableStatus;
  @override
  @JsonKey(name: 'TrxId')
  final int trxId;
  @override
  @JsonKey(name: 'OrderId')
  final int urderId;
  @override
  @JsonKey(name: 'CustomerName')
  final String? customerName;
  @override
  @JsonKey(name: 'ImageFileName')
  final String imageFileName;
  @override
  @JsonKey(name: 'PositionX')
  final dynamic? positionX;
  @override
  @JsonKey(name: 'PositionY')
  final dynamic? positionY;
  @override
  @JsonKey(name: 'AllowMultipleOrders')
  final bool allowMultipleOrders;
  @override
  final FacilityTableCurrentStatusDTO? facilityTableCurrentStatusDTO;

  @override
  String toString() {
    return 'FacilityTableContainerDTO(tableId: $tableId, tableName: $tableName, rowIndex: $rowIndex, columnIndex: $columnIndex, facilityId: $facilityId, tableType: $tableType, interfaceInfo1: $interfaceInfo1, interfaceInfo2: $interfaceInfo2, interfaceInfo3: $interfaceInfo3, remarks: $remarks, guid: $guid, maxCheckIns: $maxCheckIns, userId: $userId, tableStatus: $tableStatus, trxId: $trxId, urderId: $urderId, customerName: $customerName, imageFileName: $imageFileName, positionX: $positionX, positionY: $positionY, allowMultipleOrders: $allowMultipleOrders, facilityTableCurrentStatusDTO: $facilityTableCurrentStatusDTO)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FacilityTablesContainerDTO &&
            (identical(other.tableId, tableId) || other.tableId == tableId) &&
            (identical(other.tableName, tableName) ||
                other.tableName == tableName) &&
            (identical(other.rowIndex, rowIndex) ||
                other.rowIndex == rowIndex) &&
            (identical(other.columnIndex, columnIndex) ||
                other.columnIndex == columnIndex) &&
            (identical(other.facilityId, facilityId) ||
                other.facilityId == facilityId) &&
            (identical(other.tableType, tableType) ||
                other.tableType == tableType) &&
            (identical(other.interfaceInfo1, interfaceInfo1) ||
                other.interfaceInfo1 == interfaceInfo1) &&
            (identical(other.interfaceInfo2, interfaceInfo2) ||
                other.interfaceInfo2 == interfaceInfo2) &&
            (identical(other.interfaceInfo3, interfaceInfo3) ||
                other.interfaceInfo3 == interfaceInfo3) &&
            (identical(other.remarks, remarks) || other.remarks == remarks) &&
            (identical(other.guid, guid) || other.guid == guid) &&
            (identical(other.maxCheckIns, maxCheckIns) ||
                other.maxCheckIns == maxCheckIns) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.tableStatus, tableStatus) ||
                other.tableStatus == tableStatus) &&
            (identical(other.trxId, trxId) || other.trxId == trxId) &&
            (identical(other.urderId, urderId) || other.urderId == urderId) &&
            (identical(other.customerName, customerName) ||
                other.customerName == customerName) &&
            (identical(other.imageFileName, imageFileName) ||
                other.imageFileName == imageFileName) &&
            const DeepCollectionEquality().equals(other.positionX, positionX) &&
            const DeepCollectionEquality().equals(other.positionY, positionY) &&
            (identical(other.allowMultipleOrders, allowMultipleOrders) ||
                other.allowMultipleOrders == allowMultipleOrders) &&
            (identical(other.facilityTableCurrentStatusDTO,
                    facilityTableCurrentStatusDTO) ||
                other.facilityTableCurrentStatusDTO ==
                    facilityTableCurrentStatusDTO));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        tableId,
        tableName,
        rowIndex,
        columnIndex,
        facilityId,
        tableType,
        interfaceInfo1,
        interfaceInfo2,
        interfaceInfo3,
        remarks,
        guid,
        maxCheckIns,
        userId,
        tableStatus,
        trxId,
        urderId,
        customerName,
        imageFileName,
        const DeepCollectionEquality().hash(positionX),
        const DeepCollectionEquality().hash(positionY),
        allowMultipleOrders,
        facilityTableCurrentStatusDTO
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FacilityTablesContainerDTOCopyWith<_$_FacilityTablesContainerDTO>
      get copyWith => __$$_FacilityTablesContainerDTOCopyWithImpl<
          _$_FacilityTablesContainerDTO>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FacilityTablesContainerDTOToJson(
      this,
    );
  }
}

abstract class _FacilityTablesContainerDTO
    implements FacilityTableContainerDTO {
  const factory _FacilityTablesContainerDTO(
          {@JsonKey(name: 'TableId')
              required final int tableId,
          @JsonKey(name: 'TableName')
              required final String tableName,
          @JsonKey(name: 'RowIndex')
              required final int rowIndex,
          @JsonKey(name: 'ColumnIndex')
              required final int columnIndex,
          @JsonKey(name: 'FacilityId')
              required final int facilityId,
          @JsonKey(name: 'TableType')
              required final String tableType,
          @JsonKey(name: 'InterfaceInfo1')
              required final String interfaceInfo1,
          @JsonKey(name: 'InterfaceInfo2')
              required final String interfaceInfo2,
          @JsonKey(name: 'InterfaceInfo3')
              required final String interfaceInfo3,
          @JsonKey(name: 'Remarks')
              required final String remarks,
          @JsonKey(name: 'Guid')
              required final String guid,
          @JsonKey(name: 'MaxCheckIns')
              required final int maxCheckIns,
          @JsonKey(name: 'UserId')
              required final int userId,
          @JsonKey(name: 'TableStatus')
              final String? tableStatus,
          @JsonKey(name: 'TrxId')
              required final int trxId,
          @JsonKey(name: 'OrderId')
              required final int urderId,
          @JsonKey(name: 'CustomerName')
              final String? customerName,
          @JsonKey(name: 'ImageFileName')
              required final String imageFileName,
          @JsonKey(name: 'PositionX')
              final dynamic? positionX,
          @JsonKey(name: 'PositionY')
              final dynamic? positionY,
          @JsonKey(name: 'AllowMultipleOrders')
              required final bool allowMultipleOrders,
          final FacilityTableCurrentStatusDTO? facilityTableCurrentStatusDTO}) =
      _$_FacilityTablesContainerDTO;

  factory _FacilityTablesContainerDTO.fromJson(Map<String, dynamic> json) =
      _$_FacilityTablesContainerDTO.fromJson;

  @override
  @JsonKey(name: 'TableId')
  int get tableId;
  @override
  @JsonKey(name: 'TableName')
  String get tableName;
  @override
  @JsonKey(name: 'RowIndex')
  int get rowIndex;
  @override
  @JsonKey(name: 'ColumnIndex')
  int get columnIndex;
  @override
  @JsonKey(name: 'FacilityId')
  int get facilityId;
  @override
  @JsonKey(name: 'TableType')
  String get tableType;
  @override
  @JsonKey(name: 'InterfaceInfo1')
  String get interfaceInfo1;
  @override
  @JsonKey(name: 'InterfaceInfo2')
  String get interfaceInfo2;
  @override
  @JsonKey(name: 'InterfaceInfo3')
  String get interfaceInfo3;
  @override
  @JsonKey(name: 'Remarks')
  String get remarks;
  @override
  @JsonKey(name: 'Guid')
  String get guid;
  @override
  @JsonKey(name: 'MaxCheckIns')
  int get maxCheckIns;
  @override
  @JsonKey(name: 'UserId')
  int get userId;
  @override
  @JsonKey(name: 'TableStatus')
  String? get tableStatus;
  @override
  @JsonKey(name: 'TrxId')
  int get trxId;
  @override
  @JsonKey(name: 'OrderId')
  int get urderId;
  @override
  @JsonKey(name: 'CustomerName')
  String? get customerName;
  @override
  @JsonKey(name: 'ImageFileName')
  String get imageFileName;
  @override
  @JsonKey(name: 'PositionX')
  dynamic? get positionX;
  @override
  @JsonKey(name: 'PositionY')
  dynamic? get positionY;
  @override
  @JsonKey(name: 'AllowMultipleOrders')
  bool get allowMultipleOrders;
  @override
  FacilityTableCurrentStatusDTO? get facilityTableCurrentStatusDTO;
  @override
  @JsonKey(ignore: true)
  _$$_FacilityTablesContainerDTOCopyWith<_$_FacilityTablesContainerDTO>
      get copyWith => throw _privateConstructorUsedError;
}
