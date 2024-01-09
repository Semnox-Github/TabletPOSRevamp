// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'update_line_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UpdateLineRequest _$UpdateLineRequestFromJson(Map<String, dynamic> json) {
  return _UpdateLineRequest.fromJson(json);
}

/// @nodoc
mixin _$UpdateLineRequest {
  @JsonKey(name: 'SeatName')
  String get seatName => throw _privateConstructorUsedError;
  @JsonKey(name: 'CourseName')
  dynamic get courseName => throw _privateConstructorUsedError;
  @JsonKey(name: 'ComboProductId')
  int? get comboProductId => throw _privateConstructorUsedError;
  @JsonKey(name: 'ModifierSetId')
  int? get modifierSetId => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsNonChargeable')
  bool? get isNonChargeable => throw _privateConstructorUsedError;
  @JsonKey(name: 'OrderTypeId')
  int? get orderTypeId => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsReversed')
  bool? get isReversed => throw _privateConstructorUsedError;
  @JsonKey(name: 'OnPrintHold')
  bool? get onPrintHold => throw _privateConstructorUsedError;
  @JsonKey(name: 'Is9999Product')
  bool? get is9999Product => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsCrossSellProduct')
  bool? get isCrossSellProduct => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsUpsellProduct')
  bool? get isUpsellProduct => throw _privateConstructorUsedError;
  @JsonKey(name: 'UserOverriddenPrice')
  dynamic get userOverriddenPrice => throw _privateConstructorUsedError;
  @JsonKey(name: 'SeatNumber')
  int get seatNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'TransactionLineId')
  int get transactionLineId => throw _privateConstructorUsedError;
  @JsonKey(name: 'TransactionProfileId')
  int? get transactionProfileId => throw _privateConstructorUsedError;
  @JsonKey(name: 'LineNumber')
  int get lineNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'ProductId')
  int get productId => throw _privateConstructorUsedError;
  @JsonKey(name: 'Quantity')
  int get quantity => throw _privateConstructorUsedError;
  @JsonKey(name: 'Remarks')
  String? get remarks => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UpdateLineRequestCopyWith<UpdateLineRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdateLineRequestCopyWith<$Res> {
  factory $UpdateLineRequestCopyWith(
          UpdateLineRequest value, $Res Function(UpdateLineRequest) then) =
      _$UpdateLineRequestCopyWithImpl<$Res, UpdateLineRequest>;
  @useResult
  $Res call(
      {@JsonKey(name: 'SeatName') String seatName,
      @JsonKey(name: 'CourseName') dynamic courseName,
      @JsonKey(name: 'ComboProductId') int? comboProductId,
      @JsonKey(name: 'ModifierSetId') int? modifierSetId,
      @JsonKey(name: 'IsNonChargeable') bool? isNonChargeable,
      @JsonKey(name: 'OrderTypeId') int? orderTypeId,
      @JsonKey(name: 'IsReversed') bool? isReversed,
      @JsonKey(name: 'OnPrintHold') bool? onPrintHold,
      @JsonKey(name: 'Is9999Product') bool? is9999Product,
      @JsonKey(name: 'IsCrossSellProduct') bool? isCrossSellProduct,
      @JsonKey(name: 'IsUpsellProduct') bool? isUpsellProduct,
      @JsonKey(name: 'UserOverriddenPrice') dynamic userOverriddenPrice,
      @JsonKey(name: 'SeatNumber') int seatNumber,
      @JsonKey(name: 'TransactionLineId') int transactionLineId,
      @JsonKey(name: 'TransactionProfileId') int? transactionProfileId,
      @JsonKey(name: 'LineNumber') int lineNumber,
      @JsonKey(name: 'ProductId') int productId,
      @JsonKey(name: 'Quantity') int quantity,
      @JsonKey(name: 'Remarks') String? remarks});
}

/// @nodoc
class _$UpdateLineRequestCopyWithImpl<$Res, $Val extends UpdateLineRequest>
    implements $UpdateLineRequestCopyWith<$Res> {
  _$UpdateLineRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? seatName = null,
    Object? courseName = freezed,
    Object? comboProductId = freezed,
    Object? modifierSetId = freezed,
    Object? isNonChargeable = freezed,
    Object? orderTypeId = freezed,
    Object? isReversed = freezed,
    Object? onPrintHold = freezed,
    Object? is9999Product = freezed,
    Object? isCrossSellProduct = freezed,
    Object? isUpsellProduct = freezed,
    Object? userOverriddenPrice = freezed,
    Object? seatNumber = null,
    Object? transactionLineId = null,
    Object? transactionProfileId = freezed,
    Object? lineNumber = null,
    Object? productId = null,
    Object? quantity = null,
    Object? remarks = freezed,
  }) {
    return _then(_value.copyWith(
      seatName: null == seatName
          ? _value.seatName
          : seatName // ignore: cast_nullable_to_non_nullable
              as String,
      courseName: freezed == courseName
          ? _value.courseName
          : courseName // ignore: cast_nullable_to_non_nullable
              as dynamic,
      comboProductId: freezed == comboProductId
          ? _value.comboProductId
          : comboProductId // ignore: cast_nullable_to_non_nullable
              as int?,
      modifierSetId: freezed == modifierSetId
          ? _value.modifierSetId
          : modifierSetId // ignore: cast_nullable_to_non_nullable
              as int?,
      isNonChargeable: freezed == isNonChargeable
          ? _value.isNonChargeable
          : isNonChargeable // ignore: cast_nullable_to_non_nullable
              as bool?,
      orderTypeId: freezed == orderTypeId
          ? _value.orderTypeId
          : orderTypeId // ignore: cast_nullable_to_non_nullable
              as int?,
      isReversed: freezed == isReversed
          ? _value.isReversed
          : isReversed // ignore: cast_nullable_to_non_nullable
              as bool?,
      onPrintHold: freezed == onPrintHold
          ? _value.onPrintHold
          : onPrintHold // ignore: cast_nullable_to_non_nullable
              as bool?,
      is9999Product: freezed == is9999Product
          ? _value.is9999Product
          : is9999Product // ignore: cast_nullable_to_non_nullable
              as bool?,
      isCrossSellProduct: freezed == isCrossSellProduct
          ? _value.isCrossSellProduct
          : isCrossSellProduct // ignore: cast_nullable_to_non_nullable
              as bool?,
      isUpsellProduct: freezed == isUpsellProduct
          ? _value.isUpsellProduct
          : isUpsellProduct // ignore: cast_nullable_to_non_nullable
              as bool?,
      userOverriddenPrice: freezed == userOverriddenPrice
          ? _value.userOverriddenPrice
          : userOverriddenPrice // ignore: cast_nullable_to_non_nullable
              as dynamic,
      seatNumber: null == seatNumber
          ? _value.seatNumber
          : seatNumber // ignore: cast_nullable_to_non_nullable
              as int,
      transactionLineId: null == transactionLineId
          ? _value.transactionLineId
          : transactionLineId // ignore: cast_nullable_to_non_nullable
              as int,
      transactionProfileId: freezed == transactionProfileId
          ? _value.transactionProfileId
          : transactionProfileId // ignore: cast_nullable_to_non_nullable
              as int?,
      lineNumber: null == lineNumber
          ? _value.lineNumber
          : lineNumber // ignore: cast_nullable_to_non_nullable
              as int,
      productId: null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as int,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      remarks: freezed == remarks
          ? _value.remarks
          : remarks // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UpdateLineRequestCopyWith<$Res>
    implements $UpdateLineRequestCopyWith<$Res> {
  factory _$$_UpdateLineRequestCopyWith(_$_UpdateLineRequest value,
          $Res Function(_$_UpdateLineRequest) then) =
      __$$_UpdateLineRequestCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'SeatName') String seatName,
      @JsonKey(name: 'CourseName') dynamic courseName,
      @JsonKey(name: 'ComboProductId') int? comboProductId,
      @JsonKey(name: 'ModifierSetId') int? modifierSetId,
      @JsonKey(name: 'IsNonChargeable') bool? isNonChargeable,
      @JsonKey(name: 'OrderTypeId') int? orderTypeId,
      @JsonKey(name: 'IsReversed') bool? isReversed,
      @JsonKey(name: 'OnPrintHold') bool? onPrintHold,
      @JsonKey(name: 'Is9999Product') bool? is9999Product,
      @JsonKey(name: 'IsCrossSellProduct') bool? isCrossSellProduct,
      @JsonKey(name: 'IsUpsellProduct') bool? isUpsellProduct,
      @JsonKey(name: 'UserOverriddenPrice') dynamic userOverriddenPrice,
      @JsonKey(name: 'SeatNumber') int seatNumber,
      @JsonKey(name: 'TransactionLineId') int transactionLineId,
      @JsonKey(name: 'TransactionProfileId') int? transactionProfileId,
      @JsonKey(name: 'LineNumber') int lineNumber,
      @JsonKey(name: 'ProductId') int productId,
      @JsonKey(name: 'Quantity') int quantity,
      @JsonKey(name: 'Remarks') String? remarks});
}

/// @nodoc
class __$$_UpdateLineRequestCopyWithImpl<$Res>
    extends _$UpdateLineRequestCopyWithImpl<$Res, _$_UpdateLineRequest>
    implements _$$_UpdateLineRequestCopyWith<$Res> {
  __$$_UpdateLineRequestCopyWithImpl(
      _$_UpdateLineRequest _value, $Res Function(_$_UpdateLineRequest) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? seatName = null,
    Object? courseName = freezed,
    Object? comboProductId = freezed,
    Object? modifierSetId = freezed,
    Object? isNonChargeable = freezed,
    Object? orderTypeId = freezed,
    Object? isReversed = freezed,
    Object? onPrintHold = freezed,
    Object? is9999Product = freezed,
    Object? isCrossSellProduct = freezed,
    Object? isUpsellProduct = freezed,
    Object? userOverriddenPrice = freezed,
    Object? seatNumber = null,
    Object? transactionLineId = null,
    Object? transactionProfileId = freezed,
    Object? lineNumber = null,
    Object? productId = null,
    Object? quantity = null,
    Object? remarks = freezed,
  }) {
    return _then(_$_UpdateLineRequest(
      seatName: null == seatName
          ? _value.seatName
          : seatName // ignore: cast_nullable_to_non_nullable
              as String,
      courseName: freezed == courseName
          ? _value.courseName
          : courseName // ignore: cast_nullable_to_non_nullable
              as dynamic,
      comboProductId: freezed == comboProductId
          ? _value.comboProductId
          : comboProductId // ignore: cast_nullable_to_non_nullable
              as int?,
      modifierSetId: freezed == modifierSetId
          ? _value.modifierSetId
          : modifierSetId // ignore: cast_nullable_to_non_nullable
              as int?,
      isNonChargeable: freezed == isNonChargeable
          ? _value.isNonChargeable
          : isNonChargeable // ignore: cast_nullable_to_non_nullable
              as bool?,
      orderTypeId: freezed == orderTypeId
          ? _value.orderTypeId
          : orderTypeId // ignore: cast_nullable_to_non_nullable
              as int?,
      isReversed: freezed == isReversed
          ? _value.isReversed
          : isReversed // ignore: cast_nullable_to_non_nullable
              as bool?,
      onPrintHold: freezed == onPrintHold
          ? _value.onPrintHold
          : onPrintHold // ignore: cast_nullable_to_non_nullable
              as bool?,
      is9999Product: freezed == is9999Product
          ? _value.is9999Product
          : is9999Product // ignore: cast_nullable_to_non_nullable
              as bool?,
      isCrossSellProduct: freezed == isCrossSellProduct
          ? _value.isCrossSellProduct
          : isCrossSellProduct // ignore: cast_nullable_to_non_nullable
              as bool?,
      isUpsellProduct: freezed == isUpsellProduct
          ? _value.isUpsellProduct
          : isUpsellProduct // ignore: cast_nullable_to_non_nullable
              as bool?,
      userOverriddenPrice: freezed == userOverriddenPrice
          ? _value.userOverriddenPrice
          : userOverriddenPrice // ignore: cast_nullable_to_non_nullable
              as dynamic,
      seatNumber: null == seatNumber
          ? _value.seatNumber
          : seatNumber // ignore: cast_nullable_to_non_nullable
              as int,
      transactionLineId: null == transactionLineId
          ? _value.transactionLineId
          : transactionLineId // ignore: cast_nullable_to_non_nullable
              as int,
      transactionProfileId: freezed == transactionProfileId
          ? _value.transactionProfileId
          : transactionProfileId // ignore: cast_nullable_to_non_nullable
              as int?,
      lineNumber: null == lineNumber
          ? _value.lineNumber
          : lineNumber // ignore: cast_nullable_to_non_nullable
              as int,
      productId: null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as int,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      remarks: freezed == remarks
          ? _value.remarks
          : remarks // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UpdateLineRequest implements _UpdateLineRequest {
  const _$_UpdateLineRequest(
      {@JsonKey(name: 'SeatName') required this.seatName,
      @JsonKey(name: 'CourseName') this.courseName,
      @JsonKey(name: 'ComboProductId') this.comboProductId,
      @JsonKey(name: 'ModifierSetId') this.modifierSetId,
      @JsonKey(name: 'IsNonChargeable') this.isNonChargeable,
      @JsonKey(name: 'OrderTypeId') this.orderTypeId,
      @JsonKey(name: 'IsReversed') this.isReversed,
      @JsonKey(name: 'OnPrintHold') this.onPrintHold,
      @JsonKey(name: 'Is9999Product') this.is9999Product,
      @JsonKey(name: 'IsCrossSellProduct') this.isCrossSellProduct,
      @JsonKey(name: 'IsUpsellProduct') this.isUpsellProduct,
      @JsonKey(name: 'UserOverriddenPrice') this.userOverriddenPrice,
      @JsonKey(name: 'SeatNumber') required this.seatNumber,
      @JsonKey(name: 'TransactionLineId') required this.transactionLineId,
      @JsonKey(name: 'TransactionProfileId') this.transactionProfileId,
      @JsonKey(name: 'LineNumber') required this.lineNumber,
      @JsonKey(name: 'ProductId') required this.productId,
      @JsonKey(name: 'Quantity') required this.quantity,
      @JsonKey(name: 'Remarks') this.remarks});

  factory _$_UpdateLineRequest.fromJson(Map<String, dynamic> json) =>
      _$$_UpdateLineRequestFromJson(json);

  @override
  @JsonKey(name: 'SeatName')
  final String seatName;
  @override
  @JsonKey(name: 'CourseName')
  final dynamic courseName;
  @override
  @JsonKey(name: 'ComboProductId')
  final int? comboProductId;
  @override
  @JsonKey(name: 'ModifierSetId')
  final int? modifierSetId;
  @override
  @JsonKey(name: 'IsNonChargeable')
  final bool? isNonChargeable;
  @override
  @JsonKey(name: 'OrderTypeId')
  final int? orderTypeId;
  @override
  @JsonKey(name: 'IsReversed')
  final bool? isReversed;
  @override
  @JsonKey(name: 'OnPrintHold')
  final bool? onPrintHold;
  @override
  @JsonKey(name: 'Is9999Product')
  final bool? is9999Product;
  @override
  @JsonKey(name: 'IsCrossSellProduct')
  final bool? isCrossSellProduct;
  @override
  @JsonKey(name: 'IsUpsellProduct')
  final bool? isUpsellProduct;
  @override
  @JsonKey(name: 'UserOverriddenPrice')
  final dynamic userOverriddenPrice;
  @override
  @JsonKey(name: 'SeatNumber')
  final int seatNumber;
  @override
  @JsonKey(name: 'TransactionLineId')
  final int transactionLineId;
  @override
  @JsonKey(name: 'TransactionProfileId')
  final int? transactionProfileId;
  @override
  @JsonKey(name: 'LineNumber')
  final int lineNumber;
  @override
  @JsonKey(name: 'ProductId')
  final int productId;
  @override
  @JsonKey(name: 'Quantity')
  final int quantity;
  @override
  @JsonKey(name: 'Remarks')
  final String? remarks;

  @override
  String toString() {
    return 'UpdateLineRequest(seatName: $seatName, courseName: $courseName, comboProductId: $comboProductId, modifierSetId: $modifierSetId, isNonChargeable: $isNonChargeable, orderTypeId: $orderTypeId, isReversed: $isReversed, onPrintHold: $onPrintHold, is9999Product: $is9999Product, isCrossSellProduct: $isCrossSellProduct, isUpsellProduct: $isUpsellProduct, userOverriddenPrice: $userOverriddenPrice, seatNumber: $seatNumber, transactionLineId: $transactionLineId, transactionProfileId: $transactionProfileId, lineNumber: $lineNumber, productId: $productId, quantity: $quantity, remarks: $remarks)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UpdateLineRequest &&
            (identical(other.seatName, seatName) ||
                other.seatName == seatName) &&
            const DeepCollectionEquality()
                .equals(other.courseName, courseName) &&
            (identical(other.comboProductId, comboProductId) ||
                other.comboProductId == comboProductId) &&
            (identical(other.modifierSetId, modifierSetId) ||
                other.modifierSetId == modifierSetId) &&
            (identical(other.isNonChargeable, isNonChargeable) ||
                other.isNonChargeable == isNonChargeable) &&
            (identical(other.orderTypeId, orderTypeId) ||
                other.orderTypeId == orderTypeId) &&
            (identical(other.isReversed, isReversed) ||
                other.isReversed == isReversed) &&
            (identical(other.onPrintHold, onPrintHold) ||
                other.onPrintHold == onPrintHold) &&
            (identical(other.is9999Product, is9999Product) ||
                other.is9999Product == is9999Product) &&
            (identical(other.isCrossSellProduct, isCrossSellProduct) ||
                other.isCrossSellProduct == isCrossSellProduct) &&
            (identical(other.isUpsellProduct, isUpsellProduct) ||
                other.isUpsellProduct == isUpsellProduct) &&
            const DeepCollectionEquality()
                .equals(other.userOverriddenPrice, userOverriddenPrice) &&
            (identical(other.seatNumber, seatNumber) ||
                other.seatNumber == seatNumber) &&
            (identical(other.transactionLineId, transactionLineId) ||
                other.transactionLineId == transactionLineId) &&
            (identical(other.transactionProfileId, transactionProfileId) ||
                other.transactionProfileId == transactionProfileId) &&
            (identical(other.lineNumber, lineNumber) ||
                other.lineNumber == lineNumber) &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.remarks, remarks) || other.remarks == remarks));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        seatName,
        const DeepCollectionEquality().hash(courseName),
        comboProductId,
        modifierSetId,
        isNonChargeable,
        orderTypeId,
        isReversed,
        onPrintHold,
        is9999Product,
        isCrossSellProduct,
        isUpsellProduct,
        const DeepCollectionEquality().hash(userOverriddenPrice),
        seatNumber,
        transactionLineId,
        transactionProfileId,
        lineNumber,
        productId,
        quantity,
        remarks
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UpdateLineRequestCopyWith<_$_UpdateLineRequest> get copyWith =>
      __$$_UpdateLineRequestCopyWithImpl<_$_UpdateLineRequest>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UpdateLineRequestToJson(
      this,
    );
  }
}

abstract class _UpdateLineRequest implements UpdateLineRequest {
  const factory _UpdateLineRequest(
      {@JsonKey(name: 'SeatName') required final String seatName,
      @JsonKey(name: 'CourseName') final dynamic courseName,
      @JsonKey(name: 'ComboProductId') final int? comboProductId,
      @JsonKey(name: 'ModifierSetId') final int? modifierSetId,
      @JsonKey(name: 'IsNonChargeable') final bool? isNonChargeable,
      @JsonKey(name: 'OrderTypeId') final int? orderTypeId,
      @JsonKey(name: 'IsReversed') final bool? isReversed,
      @JsonKey(name: 'OnPrintHold') final bool? onPrintHold,
      @JsonKey(name: 'Is9999Product') final bool? is9999Product,
      @JsonKey(name: 'IsCrossSellProduct') final bool? isCrossSellProduct,
      @JsonKey(name: 'IsUpsellProduct') final bool? isUpsellProduct,
      @JsonKey(name: 'UserOverriddenPrice') final dynamic userOverriddenPrice,
      @JsonKey(name: 'SeatNumber') required final int seatNumber,
      @JsonKey(name: 'TransactionLineId') required final int transactionLineId,
      @JsonKey(name: 'TransactionProfileId') final int? transactionProfileId,
      @JsonKey(name: 'LineNumber') required final int lineNumber,
      @JsonKey(name: 'ProductId') required final int productId,
      @JsonKey(name: 'Quantity') required final int quantity,
      @JsonKey(name: 'Remarks') final String? remarks}) = _$_UpdateLineRequest;

  factory _UpdateLineRequest.fromJson(Map<String, dynamic> json) =
      _$_UpdateLineRequest.fromJson;

  @override
  @JsonKey(name: 'SeatName')
  String get seatName;
  @override
  @JsonKey(name: 'CourseName')
  dynamic get courseName;
  @override
  @JsonKey(name: 'ComboProductId')
  int? get comboProductId;
  @override
  @JsonKey(name: 'ModifierSetId')
  int? get modifierSetId;
  @override
  @JsonKey(name: 'IsNonChargeable')
  bool? get isNonChargeable;
  @override
  @JsonKey(name: 'OrderTypeId')
  int? get orderTypeId;
  @override
  @JsonKey(name: 'IsReversed')
  bool? get isReversed;
  @override
  @JsonKey(name: 'OnPrintHold')
  bool? get onPrintHold;
  @override
  @JsonKey(name: 'Is9999Product')
  bool? get is9999Product;
  @override
  @JsonKey(name: 'IsCrossSellProduct')
  bool? get isCrossSellProduct;
  @override
  @JsonKey(name: 'IsUpsellProduct')
  bool? get isUpsellProduct;
  @override
  @JsonKey(name: 'UserOverriddenPrice')
  dynamic get userOverriddenPrice;
  @override
  @JsonKey(name: 'SeatNumber')
  int get seatNumber;
  @override
  @JsonKey(name: 'TransactionLineId')
  int get transactionLineId;
  @override
  @JsonKey(name: 'TransactionProfileId')
  int? get transactionProfileId;
  @override
  @JsonKey(name: 'LineNumber')
  int get lineNumber;
  @override
  @JsonKey(name: 'ProductId')
  int get productId;
  @override
  @JsonKey(name: 'Quantity')
  int get quantity;
  @override
  @JsonKey(name: 'Remarks')
  String? get remarks;
  @override
  @JsonKey(ignore: true)
  _$$_UpdateLineRequestCopyWith<_$_UpdateLineRequest> get copyWith =>
      throw _privateConstructorUsedError;
}
