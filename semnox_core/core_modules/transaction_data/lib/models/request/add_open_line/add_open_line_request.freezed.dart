// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_open_line_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AddOpenLineRequest _$AddOpenLineRequestFromJson(Map<String, dynamic> json) {
  return _AddOpenLineRequest.fromJson(json);
}

/// @nodoc
mixin _$AddOpenLineRequest {
  @JsonKey(name: 'ProductId')
  int get productId => throw _privateConstructorUsedError;
  @JsonKey(name: 'Description')
  String get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'Price')
  double get price => throw _privateConstructorUsedError;
  @JsonKey(name: 'PrinterId')
  int get printerId => throw _privateConstructorUsedError;
  @JsonKey(name: 'Remarks')
  String get remarks => throw _privateConstructorUsedError;
  @JsonKey(name: 'ApprovalDTO')
  ApprovalDTO get approvalDTO => throw _privateConstructorUsedError;
  @JsonKey(name: 'SeatNumber')
  int get seatNo => throw _privateConstructorUsedError;
  @JsonKey(name: 'SeatName')
  String get seatName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AddOpenLineRequestCopyWith<AddOpenLineRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddOpenLineRequestCopyWith<$Res> {
  factory $AddOpenLineRequestCopyWith(
          AddOpenLineRequest value, $Res Function(AddOpenLineRequest) then) =
      _$AddOpenLineRequestCopyWithImpl<$Res, AddOpenLineRequest>;
  @useResult
  $Res call(
      {@JsonKey(name: 'ProductId') int productId,
      @JsonKey(name: 'Description') String description,
      @JsonKey(name: 'Price') double price,
      @JsonKey(name: 'PrinterId') int printerId,
      @JsonKey(name: 'Remarks') String remarks,
      @JsonKey(name: 'ApprovalDTO') ApprovalDTO approvalDTO,
      @JsonKey(name: 'SeatNumber') int seatNo,
      @JsonKey(name: 'SeatName') String seatName});

  $ApprovalDTOCopyWith<$Res> get approvalDTO;
}

/// @nodoc
class _$AddOpenLineRequestCopyWithImpl<$Res, $Val extends AddOpenLineRequest>
    implements $AddOpenLineRequestCopyWith<$Res> {
  _$AddOpenLineRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productId = null,
    Object? description = null,
    Object? price = null,
    Object? printerId = null,
    Object? remarks = null,
    Object? approvalDTO = null,
    Object? seatNo = null,
    Object? seatName = null,
  }) {
    return _then(_value.copyWith(
      productId: null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as int,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      printerId: null == printerId
          ? _value.printerId
          : printerId // ignore: cast_nullable_to_non_nullable
              as int,
      remarks: null == remarks
          ? _value.remarks
          : remarks // ignore: cast_nullable_to_non_nullable
              as String,
      approvalDTO: null == approvalDTO
          ? _value.approvalDTO
          : approvalDTO // ignore: cast_nullable_to_non_nullable
              as ApprovalDTO,
      seatNo: null == seatNo
          ? _value.seatNo
          : seatNo // ignore: cast_nullable_to_non_nullable
              as int,
      seatName: null == seatName
          ? _value.seatName
          : seatName // ignore: cast_nullable_to_non_nullable
              as String,
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
abstract class _$$_AddOpenLineRequestCopyWith<$Res>
    implements $AddOpenLineRequestCopyWith<$Res> {
  factory _$$_AddOpenLineRequestCopyWith(_$_AddOpenLineRequest value,
          $Res Function(_$_AddOpenLineRequest) then) =
      __$$_AddOpenLineRequestCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'ProductId') int productId,
      @JsonKey(name: 'Description') String description,
      @JsonKey(name: 'Price') double price,
      @JsonKey(name: 'PrinterId') int printerId,
      @JsonKey(name: 'Remarks') String remarks,
      @JsonKey(name: 'ApprovalDTO') ApprovalDTO approvalDTO,
      @JsonKey(name: 'SeatNumber') int seatNo,
      @JsonKey(name: 'SeatName') String seatName});

  @override
  $ApprovalDTOCopyWith<$Res> get approvalDTO;
}

/// @nodoc
class __$$_AddOpenLineRequestCopyWithImpl<$Res>
    extends _$AddOpenLineRequestCopyWithImpl<$Res, _$_AddOpenLineRequest>
    implements _$$_AddOpenLineRequestCopyWith<$Res> {
  __$$_AddOpenLineRequestCopyWithImpl(
      _$_AddOpenLineRequest _value, $Res Function(_$_AddOpenLineRequest) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productId = null,
    Object? description = null,
    Object? price = null,
    Object? printerId = null,
    Object? remarks = null,
    Object? approvalDTO = null,
    Object? seatNo = null,
    Object? seatName = null,
  }) {
    return _then(_$_AddOpenLineRequest(
      productId: null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as int,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      printerId: null == printerId
          ? _value.printerId
          : printerId // ignore: cast_nullable_to_non_nullable
              as int,
      remarks: null == remarks
          ? _value.remarks
          : remarks // ignore: cast_nullable_to_non_nullable
              as String,
      approvalDTO: null == approvalDTO
          ? _value.approvalDTO
          : approvalDTO // ignore: cast_nullable_to_non_nullable
              as ApprovalDTO,
      seatNo: null == seatNo
          ? _value.seatNo
          : seatNo // ignore: cast_nullable_to_non_nullable
              as int,
      seatName: null == seatName
          ? _value.seatName
          : seatName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AddOpenLineRequest implements _AddOpenLineRequest {
  const _$_AddOpenLineRequest(
      {@JsonKey(name: 'ProductId') required this.productId,
      @JsonKey(name: 'Description') required this.description,
      @JsonKey(name: 'Price') required this.price,
      @JsonKey(name: 'PrinterId') required this.printerId,
      @JsonKey(name: 'Remarks') required this.remarks,
      @JsonKey(name: 'ApprovalDTO') required this.approvalDTO,
      @JsonKey(name: 'SeatNumber') required this.seatNo,
      @JsonKey(name: 'SeatName') required this.seatName});

  factory _$_AddOpenLineRequest.fromJson(Map<String, dynamic> json) =>
      _$$_AddOpenLineRequestFromJson(json);

  @override
  @JsonKey(name: 'ProductId')
  final int productId;
  @override
  @JsonKey(name: 'Description')
  final String description;
  @override
  @JsonKey(name: 'Price')
  final double price;
  @override
  @JsonKey(name: 'PrinterId')
  final int printerId;
  @override
  @JsonKey(name: 'Remarks')
  final String remarks;
  @override
  @JsonKey(name: 'ApprovalDTO')
  final ApprovalDTO approvalDTO;
  @override
  @JsonKey(name: 'SeatNumber')
  final int seatNo;
  @override
  @JsonKey(name: 'SeatName')
  final String seatName;

  @override
  String toString() {
    return 'AddOpenLineRequest(productId: $productId, description: $description, price: $price, printerId: $printerId, remarks: $remarks, approvalDTO: $approvalDTO, seatNo: $seatNo, seatName: $seatName)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AddOpenLineRequest &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.printerId, printerId) ||
                other.printerId == printerId) &&
            (identical(other.remarks, remarks) || other.remarks == remarks) &&
            (identical(other.approvalDTO, approvalDTO) ||
                other.approvalDTO == approvalDTO) &&
            (identical(other.seatNo, seatNo) || other.seatNo == seatNo) &&
            (identical(other.seatName, seatName) ||
                other.seatName == seatName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, productId, description, price,
      printerId, remarks, approvalDTO, seatNo, seatName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AddOpenLineRequestCopyWith<_$_AddOpenLineRequest> get copyWith =>
      __$$_AddOpenLineRequestCopyWithImpl<_$_AddOpenLineRequest>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AddOpenLineRequestToJson(
      this,
    );
  }
}

abstract class _AddOpenLineRequest implements AddOpenLineRequest {
  const factory _AddOpenLineRequest(
          {@JsonKey(name: 'ProductId') required final int productId,
          @JsonKey(name: 'Description') required final String description,
          @JsonKey(name: 'Price') required final double price,
          @JsonKey(name: 'PrinterId') required final int printerId,
          @JsonKey(name: 'Remarks') required final String remarks,
          @JsonKey(name: 'ApprovalDTO') required final ApprovalDTO approvalDTO,
          @JsonKey(name: 'SeatNumber') required final int seatNo,
          @JsonKey(name: 'SeatName') required final String seatName}) =
      _$_AddOpenLineRequest;

  factory _AddOpenLineRequest.fromJson(Map<String, dynamic> json) =
      _$_AddOpenLineRequest.fromJson;

  @override
  @JsonKey(name: 'ProductId')
  int get productId;
  @override
  @JsonKey(name: 'Description')
  String get description;
  @override
  @JsonKey(name: 'Price')
  double get price;
  @override
  @JsonKey(name: 'PrinterId')
  int get printerId;
  @override
  @JsonKey(name: 'Remarks')
  String get remarks;
  @override
  @JsonKey(name: 'ApprovalDTO')
  ApprovalDTO get approvalDTO;
  @override
  @JsonKey(name: 'SeatNumber')
  int get seatNo;
  @override
  @JsonKey(name: 'SeatName')
  String get seatName;
  @override
  @JsonKey(ignore: true)
  _$$_AddOpenLineRequestCopyWith<_$_AddOpenLineRequest> get copyWith =>
      throw _privateConstructorUsedError;
}
