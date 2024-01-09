// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_type_container_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

OrderTypeContainerData _$OrderTypeContainerDataFromJson(
    Map<String, dynamic> json) {
  return _OrderTypeContainerData.fromJson(json);
}

/// @nodoc
mixin _$OrderTypeContainerData {
  @JsonKey(name: 'OrderTypeContainerDTOList')
  List<OrderTypeContainerDTO> get orderTypeContainerDTOList =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'Hash')
  String? get hash => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OrderTypeContainerDataCopyWith<OrderTypeContainerData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderTypeContainerDataCopyWith<$Res> {
  factory $OrderTypeContainerDataCopyWith(OrderTypeContainerData value,
          $Res Function(OrderTypeContainerData) then) =
      _$OrderTypeContainerDataCopyWithImpl<$Res, OrderTypeContainerData>;
  @useResult
  $Res call(
      {@JsonKey(name: 'OrderTypeContainerDTOList')
          List<OrderTypeContainerDTO> orderTypeContainerDTOList,
      @JsonKey(name: 'Hash')
          String? hash});
}

/// @nodoc
class _$OrderTypeContainerDataCopyWithImpl<$Res,
        $Val extends OrderTypeContainerData>
    implements $OrderTypeContainerDataCopyWith<$Res> {
  _$OrderTypeContainerDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderTypeContainerDTOList = null,
    Object? hash = freezed,
  }) {
    return _then(_value.copyWith(
      orderTypeContainerDTOList: null == orderTypeContainerDTOList
          ? _value.orderTypeContainerDTOList
          : orderTypeContainerDTOList // ignore: cast_nullable_to_non_nullable
              as List<OrderTypeContainerDTO>,
      hash: freezed == hash
          ? _value.hash
          : hash // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_OrderTypeContainerDataCopyWith<$Res>
    implements $OrderTypeContainerDataCopyWith<$Res> {
  factory _$$_OrderTypeContainerDataCopyWith(_$_OrderTypeContainerData value,
          $Res Function(_$_OrderTypeContainerData) then) =
      __$$_OrderTypeContainerDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'OrderTypeContainerDTOList')
          List<OrderTypeContainerDTO> orderTypeContainerDTOList,
      @JsonKey(name: 'Hash')
          String? hash});
}

/// @nodoc
class __$$_OrderTypeContainerDataCopyWithImpl<$Res>
    extends _$OrderTypeContainerDataCopyWithImpl<$Res,
        _$_OrderTypeContainerData>
    implements _$$_OrderTypeContainerDataCopyWith<$Res> {
  __$$_OrderTypeContainerDataCopyWithImpl(_$_OrderTypeContainerData _value,
      $Res Function(_$_OrderTypeContainerData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderTypeContainerDTOList = null,
    Object? hash = freezed,
  }) {
    return _then(_$_OrderTypeContainerData(
      orderTypeContainerDTOList: null == orderTypeContainerDTOList
          ? _value._orderTypeContainerDTOList
          : orderTypeContainerDTOList // ignore: cast_nullable_to_non_nullable
              as List<OrderTypeContainerDTO>,
      hash: freezed == hash
          ? _value.hash
          : hash // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_OrderTypeContainerData implements _OrderTypeContainerData {
  const _$_OrderTypeContainerData(
      {@JsonKey(name: 'OrderTypeContainerDTOList')
          required final List<OrderTypeContainerDTO> orderTypeContainerDTOList,
      @JsonKey(name: 'Hash')
          this.hash})
      : _orderTypeContainerDTOList = orderTypeContainerDTOList;

  factory _$_OrderTypeContainerData.fromJson(Map<String, dynamic> json) =>
      _$$_OrderTypeContainerDataFromJson(json);

  final List<OrderTypeContainerDTO> _orderTypeContainerDTOList;
  @override
  @JsonKey(name: 'OrderTypeContainerDTOList')
  List<OrderTypeContainerDTO> get orderTypeContainerDTOList {
    if (_orderTypeContainerDTOList is EqualUnmodifiableListView)
      return _orderTypeContainerDTOList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_orderTypeContainerDTOList);
  }

  @override
  @JsonKey(name: 'Hash')
  final String? hash;

  @override
  String toString() {
    return 'OrderTypeContainerData(orderTypeContainerDTOList: $orderTypeContainerDTOList, hash: $hash)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OrderTypeContainerData &&
            const DeepCollectionEquality().equals(
                other._orderTypeContainerDTOList, _orderTypeContainerDTOList) &&
            (identical(other.hash, hash) || other.hash == hash));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_orderTypeContainerDTOList), hash);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_OrderTypeContainerDataCopyWith<_$_OrderTypeContainerData> get copyWith =>
      __$$_OrderTypeContainerDataCopyWithImpl<_$_OrderTypeContainerData>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_OrderTypeContainerDataToJson(
      this,
    );
  }
}

abstract class _OrderTypeContainerData implements OrderTypeContainerData {
  const factory _OrderTypeContainerData(
      {@JsonKey(name: 'OrderTypeContainerDTOList')
          required final List<OrderTypeContainerDTO> orderTypeContainerDTOList,
      @JsonKey(name: 'Hash')
          final String? hash}) = _$_OrderTypeContainerData;

  factory _OrderTypeContainerData.fromJson(Map<String, dynamic> json) =
      _$_OrderTypeContainerData.fromJson;

  @override
  @JsonKey(name: 'OrderTypeContainerDTOList')
  List<OrderTypeContainerDTO> get orderTypeContainerDTOList;
  @override
  @JsonKey(name: 'Hash')
  String? get hash;
  @override
  @JsonKey(ignore: true)
  _$$_OrderTypeContainerDataCopyWith<_$_OrderTypeContainerData> get copyWith =>
      throw _privateConstructorUsedError;
}
