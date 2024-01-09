// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_status_container_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

OrderStatusContainerDTO _$OrderStatusContainerDTOFromJson(
    Map<String, dynamic> json) {
  return _OrderStatusContainerDTO.fromJson(json);
}

/// @nodoc
mixin _$OrderStatusContainerDTO {
  @JsonKey(name: 'OrderStatusId')
  int get orderStatusId => throw _privateConstructorUsedError;
  @JsonKey(name: 'OrderStatus')
  String get orderStatus => throw _privateConstructorUsedError;
  @JsonKey(name: 'Guid')
  String get guid => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OrderStatusContainerDTOCopyWith<OrderStatusContainerDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderStatusContainerDTOCopyWith<$Res> {
  factory $OrderStatusContainerDTOCopyWith(OrderStatusContainerDTO value,
          $Res Function(OrderStatusContainerDTO) then) =
      _$OrderStatusContainerDTOCopyWithImpl<$Res, OrderStatusContainerDTO>;
  @useResult
  $Res call(
      {@JsonKey(name: 'OrderStatusId') int orderStatusId,
      @JsonKey(name: 'OrderStatus') String orderStatus,
      @JsonKey(name: 'Guid') String guid});
}

/// @nodoc
class _$OrderStatusContainerDTOCopyWithImpl<$Res,
        $Val extends OrderStatusContainerDTO>
    implements $OrderStatusContainerDTOCopyWith<$Res> {
  _$OrderStatusContainerDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderStatusId = null,
    Object? orderStatus = null,
    Object? guid = null,
  }) {
    return _then(_value.copyWith(
      orderStatusId: null == orderStatusId
          ? _value.orderStatusId
          : orderStatusId // ignore: cast_nullable_to_non_nullable
              as int,
      orderStatus: null == orderStatus
          ? _value.orderStatus
          : orderStatus // ignore: cast_nullable_to_non_nullable
              as String,
      guid: null == guid
          ? _value.guid
          : guid // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_OrderStatusContainerDTOCopyWith<$Res>
    implements $OrderStatusContainerDTOCopyWith<$Res> {
  factory _$$_OrderStatusContainerDTOCopyWith(_$_OrderStatusContainerDTO value,
          $Res Function(_$_OrderStatusContainerDTO) then) =
      __$$_OrderStatusContainerDTOCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'OrderStatusId') int orderStatusId,
      @JsonKey(name: 'OrderStatus') String orderStatus,
      @JsonKey(name: 'Guid') String guid});
}

/// @nodoc
class __$$_OrderStatusContainerDTOCopyWithImpl<$Res>
    extends _$OrderStatusContainerDTOCopyWithImpl<$Res,
        _$_OrderStatusContainerDTO>
    implements _$$_OrderStatusContainerDTOCopyWith<$Res> {
  __$$_OrderStatusContainerDTOCopyWithImpl(_$_OrderStatusContainerDTO _value,
      $Res Function(_$_OrderStatusContainerDTO) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderStatusId = null,
    Object? orderStatus = null,
    Object? guid = null,
  }) {
    return _then(_$_OrderStatusContainerDTO(
      orderStatusId: null == orderStatusId
          ? _value.orderStatusId
          : orderStatusId // ignore: cast_nullable_to_non_nullable
              as int,
      orderStatus: null == orderStatus
          ? _value.orderStatus
          : orderStatus // ignore: cast_nullable_to_non_nullable
              as String,
      guid: null == guid
          ? _value.guid
          : guid // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_OrderStatusContainerDTO implements _OrderStatusContainerDTO {
  const _$_OrderStatusContainerDTO(
      {@JsonKey(name: 'OrderStatusId') required this.orderStatusId,
      @JsonKey(name: 'OrderStatus') required this.orderStatus,
      @JsonKey(name: 'Guid') required this.guid});

  factory _$_OrderStatusContainerDTO.fromJson(Map<String, dynamic> json) =>
      _$$_OrderStatusContainerDTOFromJson(json);

  @override
  @JsonKey(name: 'OrderStatusId')
  final int orderStatusId;
  @override
  @JsonKey(name: 'OrderStatus')
  final String orderStatus;
  @override
  @JsonKey(name: 'Guid')
  final String guid;

  @override
  String toString() {
    return 'OrderStatusContainerDTO(orderStatusId: $orderStatusId, orderStatus: $orderStatus, guid: $guid)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OrderStatusContainerDTO &&
            (identical(other.orderStatusId, orderStatusId) ||
                other.orderStatusId == orderStatusId) &&
            (identical(other.orderStatus, orderStatus) ||
                other.orderStatus == orderStatus) &&
            (identical(other.guid, guid) || other.guid == guid));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, orderStatusId, orderStatus, guid);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_OrderStatusContainerDTOCopyWith<_$_OrderStatusContainerDTO>
      get copyWith =>
          __$$_OrderStatusContainerDTOCopyWithImpl<_$_OrderStatusContainerDTO>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_OrderStatusContainerDTOToJson(
      this,
    );
  }
}

abstract class _OrderStatusContainerDTO implements OrderStatusContainerDTO {
  const factory _OrderStatusContainerDTO(
          {@JsonKey(name: 'OrderStatusId') required final int orderStatusId,
          @JsonKey(name: 'OrderStatus') required final String orderStatus,
          @JsonKey(name: 'Guid') required final String guid}) =
      _$_OrderStatusContainerDTO;

  factory _OrderStatusContainerDTO.fromJson(Map<String, dynamic> json) =
      _$_OrderStatusContainerDTO.fromJson;

  @override
  @JsonKey(name: 'OrderStatusId')
  int get orderStatusId;
  @override
  @JsonKey(name: 'OrderStatus')
  String get orderStatus;
  @override
  @JsonKey(name: 'Guid')
  String get guid;
  @override
  @JsonKey(ignore: true)
  _$$_OrderStatusContainerDTOCopyWith<_$_OrderStatusContainerDTO>
      get copyWith => throw _privateConstructorUsedError;
}
