// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_type_container_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

OrderTypeContainerDTO _$OrderTypeContainerDTOFromJson(
    Map<String, dynamic> json) {
  return _OrderTypeContainerDTO.fromJson(json);
}

/// @nodoc
mixin _$OrderTypeContainerDTO {
  @JsonKey(name: 'OrderTypeId')
  int? get orderTypeId => throw _privateConstructorUsedError;
  @JsonKey(name: 'Name')
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'Description')
  String? get description => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OrderTypeContainerDTOCopyWith<OrderTypeContainerDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderTypeContainerDTOCopyWith<$Res> {
  factory $OrderTypeContainerDTOCopyWith(OrderTypeContainerDTO value,
          $Res Function(OrderTypeContainerDTO) then) =
      _$OrderTypeContainerDTOCopyWithImpl<$Res, OrderTypeContainerDTO>;
  @useResult
  $Res call(
      {@JsonKey(name: 'OrderTypeId') int? orderTypeId,
      @JsonKey(name: 'Name') String? name,
      @JsonKey(name: 'Description') String? description});
}

/// @nodoc
class _$OrderTypeContainerDTOCopyWithImpl<$Res,
        $Val extends OrderTypeContainerDTO>
    implements $OrderTypeContainerDTOCopyWith<$Res> {
  _$OrderTypeContainerDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderTypeId = freezed,
    Object? name = freezed,
    Object? description = freezed,
  }) {
    return _then(_value.copyWith(
      orderTypeId: freezed == orderTypeId
          ? _value.orderTypeId
          : orderTypeId // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_OrderTypeContainerDTOCopyWith<$Res>
    implements $OrderTypeContainerDTOCopyWith<$Res> {
  factory _$$_OrderTypeContainerDTOCopyWith(_$_OrderTypeContainerDTO value,
          $Res Function(_$_OrderTypeContainerDTO) then) =
      __$$_OrderTypeContainerDTOCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'OrderTypeId') int? orderTypeId,
      @JsonKey(name: 'Name') String? name,
      @JsonKey(name: 'Description') String? description});
}

/// @nodoc
class __$$_OrderTypeContainerDTOCopyWithImpl<$Res>
    extends _$OrderTypeContainerDTOCopyWithImpl<$Res, _$_OrderTypeContainerDTO>
    implements _$$_OrderTypeContainerDTOCopyWith<$Res> {
  __$$_OrderTypeContainerDTOCopyWithImpl(_$_OrderTypeContainerDTO _value,
      $Res Function(_$_OrderTypeContainerDTO) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderTypeId = freezed,
    Object? name = freezed,
    Object? description = freezed,
  }) {
    return _then(_$_OrderTypeContainerDTO(
      orderTypeId: freezed == orderTypeId
          ? _value.orderTypeId
          : orderTypeId // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_OrderTypeContainerDTO implements _OrderTypeContainerDTO {
  const _$_OrderTypeContainerDTO(
      {@JsonKey(name: 'OrderTypeId') required this.orderTypeId,
      @JsonKey(name: 'Name') required this.name,
      @JsonKey(name: 'Description') required this.description});

  factory _$_OrderTypeContainerDTO.fromJson(Map<String, dynamic> json) =>
      _$$_OrderTypeContainerDTOFromJson(json);

  @override
  @JsonKey(name: 'OrderTypeId')
  final int? orderTypeId;
  @override
  @JsonKey(name: 'Name')
  final String? name;
  @override
  @JsonKey(name: 'Description')
  final String? description;

  @override
  String toString() {
    return 'OrderTypeContainerDTO(orderTypeId: $orderTypeId, name: $name, description: $description)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OrderTypeContainerDTO &&
            (identical(other.orderTypeId, orderTypeId) ||
                other.orderTypeId == orderTypeId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, orderTypeId, name, description);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_OrderTypeContainerDTOCopyWith<_$_OrderTypeContainerDTO> get copyWith =>
      __$$_OrderTypeContainerDTOCopyWithImpl<_$_OrderTypeContainerDTO>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_OrderTypeContainerDTOToJson(
      this,
    );
  }
}

abstract class _OrderTypeContainerDTO implements OrderTypeContainerDTO {
  const factory _OrderTypeContainerDTO(
          {@JsonKey(name: 'OrderTypeId') required final int? orderTypeId,
          @JsonKey(name: 'Name') required final String? name,
          @JsonKey(name: 'Description') required final String? description}) =
      _$_OrderTypeContainerDTO;

  factory _OrderTypeContainerDTO.fromJson(Map<String, dynamic> json) =
      _$_OrderTypeContainerDTO.fromJson;

  @override
  @JsonKey(name: 'OrderTypeId')
  int? get orderTypeId;
  @override
  @JsonKey(name: 'Name')
  String? get name;
  @override
  @JsonKey(name: 'Description')
  String? get description;
  @override
  @JsonKey(ignore: true)
  _$$_OrderTypeContainerDTOCopyWith<_$_OrderTypeContainerDTO> get copyWith =>
      throw _privateConstructorUsedError;
}
