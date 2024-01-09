// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_modifier_product_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AddModifierProductRequest _$AddModifierProductRequestFromJson(
    Map<String, dynamic> json) {
  return _AddModifierProductRequest.fromJson(json);
}

/// @nodoc
mixin _$AddModifierProductRequest {
  @JsonKey(name: 'SeatName')
  String get seatName => throw _privateConstructorUsedError;
  @JsonKey(name: 'SeatNumber')
  int get seatNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'ViewGroupingNumber')
  int? get viewGroupingNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'ProductId')
  int get productId => throw _privateConstructorUsedError;
  @JsonKey(name: 'Quantity')
  double get quantity => throw _privateConstructorUsedError;
  @JsonKey(name: 'ProductName')
  String get productName => throw _privateConstructorUsedError;
  @JsonKey(name: 'TransactionLineDTOList')
  List<TransactionLineDTORequest> get transactionLineDTOList =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AddModifierProductRequestCopyWith<AddModifierProductRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddModifierProductRequestCopyWith<$Res> {
  factory $AddModifierProductRequestCopyWith(AddModifierProductRequest value,
          $Res Function(AddModifierProductRequest) then) =
      _$AddModifierProductRequestCopyWithImpl<$Res, AddModifierProductRequest>;
  @useResult
  $Res call(
      {@JsonKey(name: 'SeatName')
          String seatName,
      @JsonKey(name: 'SeatNumber')
          int seatNumber,
      @JsonKey(name: 'ViewGroupingNumber')
          int? viewGroupingNumber,
      @JsonKey(name: 'ProductId')
          int productId,
      @JsonKey(name: 'Quantity')
          double quantity,
      @JsonKey(name: 'ProductName')
          String productName,
      @JsonKey(name: 'TransactionLineDTOList')
          List<TransactionLineDTORequest> transactionLineDTOList});
}

/// @nodoc
class _$AddModifierProductRequestCopyWithImpl<$Res,
        $Val extends AddModifierProductRequest>
    implements $AddModifierProductRequestCopyWith<$Res> {
  _$AddModifierProductRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? seatName = null,
    Object? seatNumber = null,
    Object? viewGroupingNumber = freezed,
    Object? productId = null,
    Object? quantity = null,
    Object? productName = null,
    Object? transactionLineDTOList = null,
  }) {
    return _then(_value.copyWith(
      seatName: null == seatName
          ? _value.seatName
          : seatName // ignore: cast_nullable_to_non_nullable
              as String,
      seatNumber: null == seatNumber
          ? _value.seatNumber
          : seatNumber // ignore: cast_nullable_to_non_nullable
              as int,
      viewGroupingNumber: freezed == viewGroupingNumber
          ? _value.viewGroupingNumber
          : viewGroupingNumber // ignore: cast_nullable_to_non_nullable
              as int?,
      productId: null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as int,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as double,
      productName: null == productName
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String,
      transactionLineDTOList: null == transactionLineDTOList
          ? _value.transactionLineDTOList
          : transactionLineDTOList // ignore: cast_nullable_to_non_nullable
              as List<TransactionLineDTORequest>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AddModifierProductRequestCopyWith<$Res>
    implements $AddModifierProductRequestCopyWith<$Res> {
  factory _$$_AddModifierProductRequestCopyWith(
          _$_AddModifierProductRequest value,
          $Res Function(_$_AddModifierProductRequest) then) =
      __$$_AddModifierProductRequestCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'SeatName')
          String seatName,
      @JsonKey(name: 'SeatNumber')
          int seatNumber,
      @JsonKey(name: 'ViewGroupingNumber')
          int? viewGroupingNumber,
      @JsonKey(name: 'ProductId')
          int productId,
      @JsonKey(name: 'Quantity')
          double quantity,
      @JsonKey(name: 'ProductName')
          String productName,
      @JsonKey(name: 'TransactionLineDTOList')
          List<TransactionLineDTORequest> transactionLineDTOList});
}

/// @nodoc
class __$$_AddModifierProductRequestCopyWithImpl<$Res>
    extends _$AddModifierProductRequestCopyWithImpl<$Res,
        _$_AddModifierProductRequest>
    implements _$$_AddModifierProductRequestCopyWith<$Res> {
  __$$_AddModifierProductRequestCopyWithImpl(
      _$_AddModifierProductRequest _value,
      $Res Function(_$_AddModifierProductRequest) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? seatName = null,
    Object? seatNumber = null,
    Object? viewGroupingNumber = freezed,
    Object? productId = null,
    Object? quantity = null,
    Object? productName = null,
    Object? transactionLineDTOList = null,
  }) {
    return _then(_$_AddModifierProductRequest(
      seatName: null == seatName
          ? _value.seatName
          : seatName // ignore: cast_nullable_to_non_nullable
              as String,
      seatNumber: null == seatNumber
          ? _value.seatNumber
          : seatNumber // ignore: cast_nullable_to_non_nullable
              as int,
      viewGroupingNumber: freezed == viewGroupingNumber
          ? _value.viewGroupingNumber
          : viewGroupingNumber // ignore: cast_nullable_to_non_nullable
              as int?,
      productId: null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as int,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as double,
      productName: null == productName
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String,
      transactionLineDTOList: null == transactionLineDTOList
          ? _value._transactionLineDTOList
          : transactionLineDTOList // ignore: cast_nullable_to_non_nullable
              as List<TransactionLineDTORequest>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AddModifierProductRequest implements _AddModifierProductRequest {
  const _$_AddModifierProductRequest(
      {@JsonKey(name: 'SeatName')
          required this.seatName,
      @JsonKey(name: 'SeatNumber')
          required this.seatNumber,
      @JsonKey(name: 'ViewGroupingNumber')
          this.viewGroupingNumber,
      @JsonKey(name: 'ProductId')
          required this.productId,
      @JsonKey(name: 'Quantity')
          required this.quantity,
      @JsonKey(name: 'ProductName')
          required this.productName,
      @JsonKey(name: 'TransactionLineDTOList')
          required final List<TransactionLineDTORequest>
              transactionLineDTOList})
      : _transactionLineDTOList = transactionLineDTOList;

  factory _$_AddModifierProductRequest.fromJson(Map<String, dynamic> json) =>
      _$$_AddModifierProductRequestFromJson(json);

  @override
  @JsonKey(name: 'SeatName')
  final String seatName;
  @override
  @JsonKey(name: 'SeatNumber')
  final int seatNumber;
  @override
  @JsonKey(name: 'ViewGroupingNumber')
  final int? viewGroupingNumber;
  @override
  @JsonKey(name: 'ProductId')
  final int productId;
  @override
  @JsonKey(name: 'Quantity')
  final double quantity;
  @override
  @JsonKey(name: 'ProductName')
  final String productName;
  final List<TransactionLineDTORequest> _transactionLineDTOList;
  @override
  @JsonKey(name: 'TransactionLineDTOList')
  List<TransactionLineDTORequest> get transactionLineDTOList {
    if (_transactionLineDTOList is EqualUnmodifiableListView)
      return _transactionLineDTOList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_transactionLineDTOList);
  }

  @override
  String toString() {
    return 'AddModifierProductRequest(seatName: $seatName, seatNumber: $seatNumber, viewGroupingNumber: $viewGroupingNumber, productId: $productId, quantity: $quantity, productName: $productName, transactionLineDTOList: $transactionLineDTOList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AddModifierProductRequest &&
            (identical(other.seatName, seatName) ||
                other.seatName == seatName) &&
            (identical(other.seatNumber, seatNumber) ||
                other.seatNumber == seatNumber) &&
            (identical(other.viewGroupingNumber, viewGroupingNumber) ||
                other.viewGroupingNumber == viewGroupingNumber) &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.productName, productName) ||
                other.productName == productName) &&
            const DeepCollectionEquality().equals(
                other._transactionLineDTOList, _transactionLineDTOList));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      seatName,
      seatNumber,
      viewGroupingNumber,
      productId,
      quantity,
      productName,
      const DeepCollectionEquality().hash(_transactionLineDTOList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AddModifierProductRequestCopyWith<_$_AddModifierProductRequest>
      get copyWith => __$$_AddModifierProductRequestCopyWithImpl<
          _$_AddModifierProductRequest>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AddModifierProductRequestToJson(
      this,
    );
  }
}

abstract class _AddModifierProductRequest implements AddModifierProductRequest {
  const factory _AddModifierProductRequest(
      {@JsonKey(name: 'SeatName')
          required final String seatName,
      @JsonKey(name: 'SeatNumber')
          required final int seatNumber,
      @JsonKey(name: 'ViewGroupingNumber')
          final int? viewGroupingNumber,
      @JsonKey(name: 'ProductId')
          required final int productId,
      @JsonKey(name: 'Quantity')
          required final double quantity,
      @JsonKey(name: 'ProductName')
          required final String productName,
      @JsonKey(name: 'TransactionLineDTOList')
          required final List<TransactionLineDTORequest>
              transactionLineDTOList}) = _$_AddModifierProductRequest;

  factory _AddModifierProductRequest.fromJson(Map<String, dynamic> json) =
      _$_AddModifierProductRequest.fromJson;

  @override
  @JsonKey(name: 'SeatName')
  String get seatName;
  @override
  @JsonKey(name: 'SeatNumber')
  int get seatNumber;
  @override
  @JsonKey(name: 'ViewGroupingNumber')
  int? get viewGroupingNumber;
  @override
  @JsonKey(name: 'ProductId')
  int get productId;
  @override
  @JsonKey(name: 'Quantity')
  double get quantity;
  @override
  @JsonKey(name: 'ProductName')
  String get productName;
  @override
  @JsonKey(name: 'TransactionLineDTOList')
  List<TransactionLineDTORequest> get transactionLineDTOList;
  @override
  @JsonKey(ignore: true)
  _$$_AddModifierProductRequestCopyWith<_$_AddModifierProductRequest>
      get copyWith => throw _privateConstructorUsedError;
}
