// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'orders_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

OrdersData _$OrdersDataFromJson(Map<String, dynamic> json) {
  return _OrdersData.fromJson(json);
}

/// @nodoc
mixin _$OrdersData {
  @JsonKey(name: 'OrderId')
  int get orderId => throw _privateConstructorUsedError;
  @JsonKey(name: 'TableId')
  int get tableId => throw _privateConstructorUsedError;
  @JsonKey(name: 'OrderDate')
  String get orderDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'GuestName')
  String get guestName => throw _privateConstructorUsedError;
  @JsonKey(name: 'GuestContactNumber')
  String get guestContactNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'TransactionIdentifier')
  String get transactionIdentifier => throw _privateConstructorUsedError;
  @JsonKey(name: 'TentNumber')
  String get tentNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'OrderStatus')
  String get orderStatus => throw _privateConstructorUsedError;
  @JsonKey(name: 'OrderStatusId')
  int get orderStatusId => throw _privateConstructorUsedError;
  @JsonKey(name: 'OrderStatusChangeDate')
  dynamic? get orderStatusChangeDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'TransactionId')
  int get transactionId => throw _privateConstructorUsedError;
  @JsonKey(name: 'TransactionNumber')
  String get transactionNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'TransactionAmount')
  double get transactionAmount => throw _privateConstructorUsedError;
  @JsonKey(name: 'TransactionStatus')
  String get transactionStatus => throw _privateConstructorUsedError;
  @JsonKey(name: 'TransactionStatusId')
  int get transactionStatusId => throw _privateConstructorUsedError;
  @JsonKey(name: 'TransactionStatusChangeDate')
  dynamic? get transactionStatusChangeDate =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'PaymentStatus')
  String get paymentStatus => throw _privateConstructorUsedError;
  @JsonKey(name: 'PaymentStatusId')
  int get paymentStatusId => throw _privateConstructorUsedError;
  @JsonKey(name: 'PaymentStatusChangeDate')
  dynamic? get paymentStatusChangeDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsAccessible')
  bool get isAccessible => throw _privateConstructorUsedError;
  bool get isSelected => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OrdersDataCopyWith<OrdersData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrdersDataCopyWith<$Res> {
  factory $OrdersDataCopyWith(
          OrdersData value, $Res Function(OrdersData) then) =
      _$OrdersDataCopyWithImpl<$Res, OrdersData>;
  @useResult
  $Res call(
      {@JsonKey(name: 'OrderId')
          int orderId,
      @JsonKey(name: 'TableId')
          int tableId,
      @JsonKey(name: 'OrderDate')
          String orderDate,
      @JsonKey(name: 'GuestName')
          String guestName,
      @JsonKey(name: 'GuestContactNumber')
          String guestContactNumber,
      @JsonKey(name: 'TransactionIdentifier')
          String transactionIdentifier,
      @JsonKey(name: 'TentNumber')
          String tentNumber,
      @JsonKey(name: 'OrderStatus')
          String orderStatus,
      @JsonKey(name: 'OrderStatusId')
          int orderStatusId,
      @JsonKey(name: 'OrderStatusChangeDate')
          dynamic? orderStatusChangeDate,
      @JsonKey(name: 'TransactionId')
          int transactionId,
      @JsonKey(name: 'TransactionNumber')
          String transactionNumber,
      @JsonKey(name: 'TransactionAmount')
          double transactionAmount,
      @JsonKey(name: 'TransactionStatus')
          String transactionStatus,
      @JsonKey(name: 'TransactionStatusId')
          int transactionStatusId,
      @JsonKey(name: 'TransactionStatusChangeDate')
          dynamic? transactionStatusChangeDate,
      @JsonKey(name: 'PaymentStatus')
          String paymentStatus,
      @JsonKey(name: 'PaymentStatusId')
          int paymentStatusId,
      @JsonKey(name: 'PaymentStatusChangeDate')
          dynamic? paymentStatusChangeDate,
      @JsonKey(name: 'IsAccessible')
          bool isAccessible,
      bool isSelected});
}

/// @nodoc
class _$OrdersDataCopyWithImpl<$Res, $Val extends OrdersData>
    implements $OrdersDataCopyWith<$Res> {
  _$OrdersDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderId = null,
    Object? tableId = null,
    Object? orderDate = null,
    Object? guestName = null,
    Object? guestContactNumber = null,
    Object? transactionIdentifier = null,
    Object? tentNumber = null,
    Object? orderStatus = null,
    Object? orderStatusId = null,
    Object? orderStatusChangeDate = freezed,
    Object? transactionId = null,
    Object? transactionNumber = null,
    Object? transactionAmount = null,
    Object? transactionStatus = null,
    Object? transactionStatusId = null,
    Object? transactionStatusChangeDate = freezed,
    Object? paymentStatus = null,
    Object? paymentStatusId = null,
    Object? paymentStatusChangeDate = freezed,
    Object? isAccessible = null,
    Object? isSelected = null,
  }) {
    return _then(_value.copyWith(
      orderId: null == orderId
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as int,
      tableId: null == tableId
          ? _value.tableId
          : tableId // ignore: cast_nullable_to_non_nullable
              as int,
      orderDate: null == orderDate
          ? _value.orderDate
          : orderDate // ignore: cast_nullable_to_non_nullable
              as String,
      guestName: null == guestName
          ? _value.guestName
          : guestName // ignore: cast_nullable_to_non_nullable
              as String,
      guestContactNumber: null == guestContactNumber
          ? _value.guestContactNumber
          : guestContactNumber // ignore: cast_nullable_to_non_nullable
              as String,
      transactionIdentifier: null == transactionIdentifier
          ? _value.transactionIdentifier
          : transactionIdentifier // ignore: cast_nullable_to_non_nullable
              as String,
      tentNumber: null == tentNumber
          ? _value.tentNumber
          : tentNumber // ignore: cast_nullable_to_non_nullable
              as String,
      orderStatus: null == orderStatus
          ? _value.orderStatus
          : orderStatus // ignore: cast_nullable_to_non_nullable
              as String,
      orderStatusId: null == orderStatusId
          ? _value.orderStatusId
          : orderStatusId // ignore: cast_nullable_to_non_nullable
              as int,
      orderStatusChangeDate: freezed == orderStatusChangeDate
          ? _value.orderStatusChangeDate
          : orderStatusChangeDate // ignore: cast_nullable_to_non_nullable
              as dynamic?,
      transactionId: null == transactionId
          ? _value.transactionId
          : transactionId // ignore: cast_nullable_to_non_nullable
              as int,
      transactionNumber: null == transactionNumber
          ? _value.transactionNumber
          : transactionNumber // ignore: cast_nullable_to_non_nullable
              as String,
      transactionAmount: null == transactionAmount
          ? _value.transactionAmount
          : transactionAmount // ignore: cast_nullable_to_non_nullable
              as double,
      transactionStatus: null == transactionStatus
          ? _value.transactionStatus
          : transactionStatus // ignore: cast_nullable_to_non_nullable
              as String,
      transactionStatusId: null == transactionStatusId
          ? _value.transactionStatusId
          : transactionStatusId // ignore: cast_nullable_to_non_nullable
              as int,
      transactionStatusChangeDate: freezed == transactionStatusChangeDate
          ? _value.transactionStatusChangeDate
          : transactionStatusChangeDate // ignore: cast_nullable_to_non_nullable
              as dynamic?,
      paymentStatus: null == paymentStatus
          ? _value.paymentStatus
          : paymentStatus // ignore: cast_nullable_to_non_nullable
              as String,
      paymentStatusId: null == paymentStatusId
          ? _value.paymentStatusId
          : paymentStatusId // ignore: cast_nullable_to_non_nullable
              as int,
      paymentStatusChangeDate: freezed == paymentStatusChangeDate
          ? _value.paymentStatusChangeDate
          : paymentStatusChangeDate // ignore: cast_nullable_to_non_nullable
              as dynamic?,
      isAccessible: null == isAccessible
          ? _value.isAccessible
          : isAccessible // ignore: cast_nullable_to_non_nullable
              as bool,
      isSelected: null == isSelected
          ? _value.isSelected
          : isSelected // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_OrdersDataCopyWith<$Res>
    implements $OrdersDataCopyWith<$Res> {
  factory _$$_OrdersDataCopyWith(
          _$_OrdersData value, $Res Function(_$_OrdersData) then) =
      __$$_OrdersDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'OrderId')
          int orderId,
      @JsonKey(name: 'TableId')
          int tableId,
      @JsonKey(name: 'OrderDate')
          String orderDate,
      @JsonKey(name: 'GuestName')
          String guestName,
      @JsonKey(name: 'GuestContactNumber')
          String guestContactNumber,
      @JsonKey(name: 'TransactionIdentifier')
          String transactionIdentifier,
      @JsonKey(name: 'TentNumber')
          String tentNumber,
      @JsonKey(name: 'OrderStatus')
          String orderStatus,
      @JsonKey(name: 'OrderStatusId')
          int orderStatusId,
      @JsonKey(name: 'OrderStatusChangeDate')
          dynamic? orderStatusChangeDate,
      @JsonKey(name: 'TransactionId')
          int transactionId,
      @JsonKey(name: 'TransactionNumber')
          String transactionNumber,
      @JsonKey(name: 'TransactionAmount')
          double transactionAmount,
      @JsonKey(name: 'TransactionStatus')
          String transactionStatus,
      @JsonKey(name: 'TransactionStatusId')
          int transactionStatusId,
      @JsonKey(name: 'TransactionStatusChangeDate')
          dynamic? transactionStatusChangeDate,
      @JsonKey(name: 'PaymentStatus')
          String paymentStatus,
      @JsonKey(name: 'PaymentStatusId')
          int paymentStatusId,
      @JsonKey(name: 'PaymentStatusChangeDate')
          dynamic? paymentStatusChangeDate,
      @JsonKey(name: 'IsAccessible')
          bool isAccessible,
      bool isSelected});
}

/// @nodoc
class __$$_OrdersDataCopyWithImpl<$Res>
    extends _$OrdersDataCopyWithImpl<$Res, _$_OrdersData>
    implements _$$_OrdersDataCopyWith<$Res> {
  __$$_OrdersDataCopyWithImpl(
      _$_OrdersData _value, $Res Function(_$_OrdersData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderId = null,
    Object? tableId = null,
    Object? orderDate = null,
    Object? guestName = null,
    Object? guestContactNumber = null,
    Object? transactionIdentifier = null,
    Object? tentNumber = null,
    Object? orderStatus = null,
    Object? orderStatusId = null,
    Object? orderStatusChangeDate = freezed,
    Object? transactionId = null,
    Object? transactionNumber = null,
    Object? transactionAmount = null,
    Object? transactionStatus = null,
    Object? transactionStatusId = null,
    Object? transactionStatusChangeDate = freezed,
    Object? paymentStatus = null,
    Object? paymentStatusId = null,
    Object? paymentStatusChangeDate = freezed,
    Object? isAccessible = null,
    Object? isSelected = null,
  }) {
    return _then(_$_OrdersData(
      orderId: null == orderId
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as int,
      tableId: null == tableId
          ? _value.tableId
          : tableId // ignore: cast_nullable_to_non_nullable
              as int,
      orderDate: null == orderDate
          ? _value.orderDate
          : orderDate // ignore: cast_nullable_to_non_nullable
              as String,
      guestName: null == guestName
          ? _value.guestName
          : guestName // ignore: cast_nullable_to_non_nullable
              as String,
      guestContactNumber: null == guestContactNumber
          ? _value.guestContactNumber
          : guestContactNumber // ignore: cast_nullable_to_non_nullable
              as String,
      transactionIdentifier: null == transactionIdentifier
          ? _value.transactionIdentifier
          : transactionIdentifier // ignore: cast_nullable_to_non_nullable
              as String,
      tentNumber: null == tentNumber
          ? _value.tentNumber
          : tentNumber // ignore: cast_nullable_to_non_nullable
              as String,
      orderStatus: null == orderStatus
          ? _value.orderStatus
          : orderStatus // ignore: cast_nullable_to_non_nullable
              as String,
      orderStatusId: null == orderStatusId
          ? _value.orderStatusId
          : orderStatusId // ignore: cast_nullable_to_non_nullable
              as int,
      orderStatusChangeDate: freezed == orderStatusChangeDate
          ? _value.orderStatusChangeDate
          : orderStatusChangeDate // ignore: cast_nullable_to_non_nullable
              as dynamic?,
      transactionId: null == transactionId
          ? _value.transactionId
          : transactionId // ignore: cast_nullable_to_non_nullable
              as int,
      transactionNumber: null == transactionNumber
          ? _value.transactionNumber
          : transactionNumber // ignore: cast_nullable_to_non_nullable
              as String,
      transactionAmount: null == transactionAmount
          ? _value.transactionAmount
          : transactionAmount // ignore: cast_nullable_to_non_nullable
              as double,
      transactionStatus: null == transactionStatus
          ? _value.transactionStatus
          : transactionStatus // ignore: cast_nullable_to_non_nullable
              as String,
      transactionStatusId: null == transactionStatusId
          ? _value.transactionStatusId
          : transactionStatusId // ignore: cast_nullable_to_non_nullable
              as int,
      transactionStatusChangeDate: freezed == transactionStatusChangeDate
          ? _value.transactionStatusChangeDate
          : transactionStatusChangeDate // ignore: cast_nullable_to_non_nullable
              as dynamic?,
      paymentStatus: null == paymentStatus
          ? _value.paymentStatus
          : paymentStatus // ignore: cast_nullable_to_non_nullable
              as String,
      paymentStatusId: null == paymentStatusId
          ? _value.paymentStatusId
          : paymentStatusId // ignore: cast_nullable_to_non_nullable
              as int,
      paymentStatusChangeDate: freezed == paymentStatusChangeDate
          ? _value.paymentStatusChangeDate
          : paymentStatusChangeDate // ignore: cast_nullable_to_non_nullable
              as dynamic?,
      isAccessible: null == isAccessible
          ? _value.isAccessible
          : isAccessible // ignore: cast_nullable_to_non_nullable
              as bool,
      isSelected: null == isSelected
          ? _value.isSelected
          : isSelected // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_OrdersData implements _OrdersData {
  const _$_OrdersData(
      {@JsonKey(name: 'OrderId')
          required this.orderId,
      @JsonKey(name: 'TableId')
          required this.tableId,
      @JsonKey(name: 'OrderDate')
          required this.orderDate,
      @JsonKey(name: 'GuestName')
          required this.guestName,
      @JsonKey(name: 'GuestContactNumber')
          required this.guestContactNumber,
      @JsonKey(name: 'TransactionIdentifier')
          required this.transactionIdentifier,
      @JsonKey(name: 'TentNumber')
          required this.tentNumber,
      @JsonKey(name: 'OrderStatus')
          required this.orderStatus,
      @JsonKey(name: 'OrderStatusId')
          required this.orderStatusId,
      @JsonKey(name: 'OrderStatusChangeDate')
          this.orderStatusChangeDate,
      @JsonKey(name: 'TransactionId')
          required this.transactionId,
      @JsonKey(name: 'TransactionNumber')
          required this.transactionNumber,
      @JsonKey(name: 'TransactionAmount')
          required this.transactionAmount,
      @JsonKey(name: 'TransactionStatus')
          required this.transactionStatus,
      @JsonKey(name: 'TransactionStatusId')
          required this.transactionStatusId,
      @JsonKey(name: 'TransactionStatusChangeDate')
          this.transactionStatusChangeDate,
      @JsonKey(name: 'PaymentStatus')
          required this.paymentStatus,
      @JsonKey(name: 'PaymentStatusId')
          required this.paymentStatusId,
      @JsonKey(name: 'PaymentStatusChangeDate')
          this.paymentStatusChangeDate,
      @JsonKey(name: 'IsAccessible')
          required this.isAccessible,
      this.isSelected = false});

  factory _$_OrdersData.fromJson(Map<String, dynamic> json) =>
      _$$_OrdersDataFromJson(json);

  @override
  @JsonKey(name: 'OrderId')
  final int orderId;
  @override
  @JsonKey(name: 'TableId')
  final int tableId;
  @override
  @JsonKey(name: 'OrderDate')
  final String orderDate;
  @override
  @JsonKey(name: 'GuestName')
  final String guestName;
  @override
  @JsonKey(name: 'GuestContactNumber')
  final String guestContactNumber;
  @override
  @JsonKey(name: 'TransactionIdentifier')
  final String transactionIdentifier;
  @override
  @JsonKey(name: 'TentNumber')
  final String tentNumber;
  @override
  @JsonKey(name: 'OrderStatus')
  final String orderStatus;
  @override
  @JsonKey(name: 'OrderStatusId')
  final int orderStatusId;
  @override
  @JsonKey(name: 'OrderStatusChangeDate')
  final dynamic? orderStatusChangeDate;
  @override
  @JsonKey(name: 'TransactionId')
  final int transactionId;
  @override
  @JsonKey(name: 'TransactionNumber')
  final String transactionNumber;
  @override
  @JsonKey(name: 'TransactionAmount')
  final double transactionAmount;
  @override
  @JsonKey(name: 'TransactionStatus')
  final String transactionStatus;
  @override
  @JsonKey(name: 'TransactionStatusId')
  final int transactionStatusId;
  @override
  @JsonKey(name: 'TransactionStatusChangeDate')
  final dynamic? transactionStatusChangeDate;
  @override
  @JsonKey(name: 'PaymentStatus')
  final String paymentStatus;
  @override
  @JsonKey(name: 'PaymentStatusId')
  final int paymentStatusId;
  @override
  @JsonKey(name: 'PaymentStatusChangeDate')
  final dynamic? paymentStatusChangeDate;
  @override
  @JsonKey(name: 'IsAccessible')
  final bool isAccessible;
  @override
  @JsonKey()
  final bool isSelected;

  @override
  String toString() {
    return 'OrdersData(orderId: $orderId, tableId: $tableId, orderDate: $orderDate, guestName: $guestName, guestContactNumber: $guestContactNumber, transactionIdentifier: $transactionIdentifier, tentNumber: $tentNumber, orderStatus: $orderStatus, orderStatusId: $orderStatusId, orderStatusChangeDate: $orderStatusChangeDate, transactionId: $transactionId, transactionNumber: $transactionNumber, transactionAmount: $transactionAmount, transactionStatus: $transactionStatus, transactionStatusId: $transactionStatusId, transactionStatusChangeDate: $transactionStatusChangeDate, paymentStatus: $paymentStatus, paymentStatusId: $paymentStatusId, paymentStatusChangeDate: $paymentStatusChangeDate, isAccessible: $isAccessible, isSelected: $isSelected)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OrdersData &&
            (identical(other.orderId, orderId) || other.orderId == orderId) &&
            (identical(other.tableId, tableId) || other.tableId == tableId) &&
            (identical(other.orderDate, orderDate) ||
                other.orderDate == orderDate) &&
            (identical(other.guestName, guestName) ||
                other.guestName == guestName) &&
            (identical(other.guestContactNumber, guestContactNumber) ||
                other.guestContactNumber == guestContactNumber) &&
            (identical(other.transactionIdentifier, transactionIdentifier) ||
                other.transactionIdentifier == transactionIdentifier) &&
            (identical(other.tentNumber, tentNumber) ||
                other.tentNumber == tentNumber) &&
            (identical(other.orderStatus, orderStatus) ||
                other.orderStatus == orderStatus) &&
            (identical(other.orderStatusId, orderStatusId) ||
                other.orderStatusId == orderStatusId) &&
            const DeepCollectionEquality()
                .equals(other.orderStatusChangeDate, orderStatusChangeDate) &&
            (identical(other.transactionId, transactionId) ||
                other.transactionId == transactionId) &&
            (identical(other.transactionNumber, transactionNumber) ||
                other.transactionNumber == transactionNumber) &&
            (identical(other.transactionAmount, transactionAmount) ||
                other.transactionAmount == transactionAmount) &&
            (identical(other.transactionStatus, transactionStatus) ||
                other.transactionStatus == transactionStatus) &&
            (identical(other.transactionStatusId, transactionStatusId) ||
                other.transactionStatusId == transactionStatusId) &&
            const DeepCollectionEquality().equals(
                other.transactionStatusChangeDate,
                transactionStatusChangeDate) &&
            (identical(other.paymentStatus, paymentStatus) ||
                other.paymentStatus == paymentStatus) &&
            (identical(other.paymentStatusId, paymentStatusId) ||
                other.paymentStatusId == paymentStatusId) &&
            const DeepCollectionEquality().equals(
                other.paymentStatusChangeDate, paymentStatusChangeDate) &&
            (identical(other.isAccessible, isAccessible) ||
                other.isAccessible == isAccessible) &&
            (identical(other.isSelected, isSelected) ||
                other.isSelected == isSelected));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        orderId,
        tableId,
        orderDate,
        guestName,
        guestContactNumber,
        transactionIdentifier,
        tentNumber,
        orderStatus,
        orderStatusId,
        const DeepCollectionEquality().hash(orderStatusChangeDate),
        transactionId,
        transactionNumber,
        transactionAmount,
        transactionStatus,
        transactionStatusId,
        const DeepCollectionEquality().hash(transactionStatusChangeDate),
        paymentStatus,
        paymentStatusId,
        const DeepCollectionEquality().hash(paymentStatusChangeDate),
        isAccessible,
        isSelected
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_OrdersDataCopyWith<_$_OrdersData> get copyWith =>
      __$$_OrdersDataCopyWithImpl<_$_OrdersData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_OrdersDataToJson(
      this,
    );
  }
}

abstract class _OrdersData implements OrdersData {
  const factory _OrdersData(
      {@JsonKey(name: 'OrderId')
          required final int orderId,
      @JsonKey(name: 'TableId')
          required final int tableId,
      @JsonKey(name: 'OrderDate')
          required final String orderDate,
      @JsonKey(name: 'GuestName')
          required final String guestName,
      @JsonKey(name: 'GuestContactNumber')
          required final String guestContactNumber,
      @JsonKey(name: 'TransactionIdentifier')
          required final String transactionIdentifier,
      @JsonKey(name: 'TentNumber')
          required final String tentNumber,
      @JsonKey(name: 'OrderStatus')
          required final String orderStatus,
      @JsonKey(name: 'OrderStatusId')
          required final int orderStatusId,
      @JsonKey(name: 'OrderStatusChangeDate')
          final dynamic? orderStatusChangeDate,
      @JsonKey(name: 'TransactionId')
          required final int transactionId,
      @JsonKey(name: 'TransactionNumber')
          required final String transactionNumber,
      @JsonKey(name: 'TransactionAmount')
          required final double transactionAmount,
      @JsonKey(name: 'TransactionStatus')
          required final String transactionStatus,
      @JsonKey(name: 'TransactionStatusId')
          required final int transactionStatusId,
      @JsonKey(name: 'TransactionStatusChangeDate')
          final dynamic? transactionStatusChangeDate,
      @JsonKey(name: 'PaymentStatus')
          required final String paymentStatus,
      @JsonKey(name: 'PaymentStatusId')
          required final int paymentStatusId,
      @JsonKey(name: 'PaymentStatusChangeDate')
          final dynamic? paymentStatusChangeDate,
      @JsonKey(name: 'IsAccessible')
          required final bool isAccessible,
      final bool isSelected}) = _$_OrdersData;

  factory _OrdersData.fromJson(Map<String, dynamic> json) =
      _$_OrdersData.fromJson;

  @override
  @JsonKey(name: 'OrderId')
  int get orderId;
  @override
  @JsonKey(name: 'TableId')
  int get tableId;
  @override
  @JsonKey(name: 'OrderDate')
  String get orderDate;
  @override
  @JsonKey(name: 'GuestName')
  String get guestName;
  @override
  @JsonKey(name: 'GuestContactNumber')
  String get guestContactNumber;
  @override
  @JsonKey(name: 'TransactionIdentifier')
  String get transactionIdentifier;
  @override
  @JsonKey(name: 'TentNumber')
  String get tentNumber;
  @override
  @JsonKey(name: 'OrderStatus')
  String get orderStatus;
  @override
  @JsonKey(name: 'OrderStatusId')
  int get orderStatusId;
  @override
  @JsonKey(name: 'OrderStatusChangeDate')
  dynamic? get orderStatusChangeDate;
  @override
  @JsonKey(name: 'TransactionId')
  int get transactionId;
  @override
  @JsonKey(name: 'TransactionNumber')
  String get transactionNumber;
  @override
  @JsonKey(name: 'TransactionAmount')
  double get transactionAmount;
  @override
  @JsonKey(name: 'TransactionStatus')
  String get transactionStatus;
  @override
  @JsonKey(name: 'TransactionStatusId')
  int get transactionStatusId;
  @override
  @JsonKey(name: 'TransactionStatusChangeDate')
  dynamic? get transactionStatusChangeDate;
  @override
  @JsonKey(name: 'PaymentStatus')
  String get paymentStatus;
  @override
  @JsonKey(name: 'PaymentStatusId')
  int get paymentStatusId;
  @override
  @JsonKey(name: 'PaymentStatusChangeDate')
  dynamic? get paymentStatusChangeDate;
  @override
  @JsonKey(name: 'IsAccessible')
  bool get isAccessible;
  @override
  bool get isSelected;
  @override
  @JsonKey(ignore: true)
  _$$_OrdersDataCopyWith<_$_OrdersData> get copyWith =>
      throw _privateConstructorUsedError;
}
