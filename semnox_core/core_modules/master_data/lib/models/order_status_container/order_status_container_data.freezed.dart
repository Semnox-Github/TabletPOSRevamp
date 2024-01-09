// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_status_container_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

OrderStatusContainerData _$OrderStatusContainerDataFromJson(
    Map<String, dynamic> json) {
  return _OrderStatusContainerData.fromJson(json);
}

/// @nodoc
mixin _$OrderStatusContainerData {
  @JsonKey(name: 'OrderStatusContainerDTOList')
  List<OrderStatusContainerDTO> get orderStatusContainerDTOList =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'Hash')
  String? get hash => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OrderStatusContainerDataCopyWith<OrderStatusContainerData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderStatusContainerDataCopyWith<$Res> {
  factory $OrderStatusContainerDataCopyWith(OrderStatusContainerData value,
          $Res Function(OrderStatusContainerData) then) =
      _$OrderStatusContainerDataCopyWithImpl<$Res, OrderStatusContainerData>;
  @useResult
  $Res call(
      {@JsonKey(name: 'OrderStatusContainerDTOList')
          List<OrderStatusContainerDTO> orderStatusContainerDTOList,
      @JsonKey(name: 'Hash')
          String? hash});
}

/// @nodoc
class _$OrderStatusContainerDataCopyWithImpl<$Res,
        $Val extends OrderStatusContainerData>
    implements $OrderStatusContainerDataCopyWith<$Res> {
  _$OrderStatusContainerDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderStatusContainerDTOList = null,
    Object? hash = freezed,
  }) {
    return _then(_value.copyWith(
      orderStatusContainerDTOList: null == orderStatusContainerDTOList
          ? _value.orderStatusContainerDTOList
          : orderStatusContainerDTOList // ignore: cast_nullable_to_non_nullable
              as List<OrderStatusContainerDTO>,
      hash: freezed == hash
          ? _value.hash
          : hash // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_OrderStatusContainerDataCopyWith<$Res>
    implements $OrderStatusContainerDataCopyWith<$Res> {
  factory _$$_OrderStatusContainerDataCopyWith(
          _$_OrderStatusContainerData value,
          $Res Function(_$_OrderStatusContainerData) then) =
      __$$_OrderStatusContainerDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'OrderStatusContainerDTOList')
          List<OrderStatusContainerDTO> orderStatusContainerDTOList,
      @JsonKey(name: 'Hash')
          String? hash});
}

/// @nodoc
class __$$_OrderStatusContainerDataCopyWithImpl<$Res>
    extends _$OrderStatusContainerDataCopyWithImpl<$Res,
        _$_OrderStatusContainerData>
    implements _$$_OrderStatusContainerDataCopyWith<$Res> {
  __$$_OrderStatusContainerDataCopyWithImpl(_$_OrderStatusContainerData _value,
      $Res Function(_$_OrderStatusContainerData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderStatusContainerDTOList = null,
    Object? hash = freezed,
  }) {
    return _then(_$_OrderStatusContainerData(
      orderStatusContainerDTOList: null == orderStatusContainerDTOList
          ? _value._orderStatusContainerDTOList
          : orderStatusContainerDTOList // ignore: cast_nullable_to_non_nullable
              as List<OrderStatusContainerDTO>,
      hash: freezed == hash
          ? _value.hash
          : hash // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_OrderStatusContainerData implements _OrderStatusContainerData {
  const _$_OrderStatusContainerData(
      {@JsonKey(name: 'OrderStatusContainerDTOList')
          required final List<OrderStatusContainerDTO>
              orderStatusContainerDTOList,
      @JsonKey(name: 'Hash')
          this.hash})
      : _orderStatusContainerDTOList = orderStatusContainerDTOList;

  factory _$_OrderStatusContainerData.fromJson(Map<String, dynamic> json) =>
      _$$_OrderStatusContainerDataFromJson(json);

  final List<OrderStatusContainerDTO> _orderStatusContainerDTOList;
  @override
  @JsonKey(name: 'OrderStatusContainerDTOList')
  List<OrderStatusContainerDTO> get orderStatusContainerDTOList {
    if (_orderStatusContainerDTOList is EqualUnmodifiableListView)
      return _orderStatusContainerDTOList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_orderStatusContainerDTOList);
  }

  @override
  @JsonKey(name: 'Hash')
  final String? hash;

  @override
  String toString() {
    return 'OrderStatusContainerData(orderStatusContainerDTOList: $orderStatusContainerDTOList, hash: $hash)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OrderStatusContainerData &&
            const DeepCollectionEquality().equals(
                other._orderStatusContainerDTOList,
                _orderStatusContainerDTOList) &&
            (identical(other.hash, hash) || other.hash == hash));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_orderStatusContainerDTOList), hash);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_OrderStatusContainerDataCopyWith<_$_OrderStatusContainerData>
      get copyWith => __$$_OrderStatusContainerDataCopyWithImpl<
          _$_OrderStatusContainerData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_OrderStatusContainerDataToJson(
      this,
    );
  }
}

abstract class _OrderStatusContainerData implements OrderStatusContainerData {
  const factory _OrderStatusContainerData(
      {@JsonKey(name: 'OrderStatusContainerDTOList')
          required final List<OrderStatusContainerDTO>
              orderStatusContainerDTOList,
      @JsonKey(name: 'Hash')
          final String? hash}) = _$_OrderStatusContainerData;

  factory _OrderStatusContainerData.fromJson(Map<String, dynamic> json) =
      _$_OrderStatusContainerData.fromJson;

  @override
  @JsonKey(name: 'OrderStatusContainerDTOList')
  List<OrderStatusContainerDTO> get orderStatusContainerDTOList;
  @override
  @JsonKey(name: 'Hash')
  String? get hash;
  @override
  @JsonKey(ignore: true)
  _$$_OrderStatusContainerDataCopyWith<_$_OrderStatusContainerData>
      get copyWith => throw _privateConstructorUsedError;
}
