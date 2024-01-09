// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'update_relationship_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UpdateRelationshipRequest _$UpdateRelationshipRequestFromJson(
    Map<String, dynamic> json) {
  return _UpdateRelationshipRequest.fromJson(json);
}

/// @nodoc
mixin _$UpdateRelationshipRequest {
  @JsonKey(name: 'CustomerId')
  int? get customerId => throw _privateConstructorUsedError;
  @JsonKey(name: 'CustomerName')
  String? get customerName => throw _privateConstructorUsedError;
  @JsonKey(name: 'RelatedCustomerId')
  int? get relatedCustomerId => throw _privateConstructorUsedError;
  @JsonKey(name: 'RelatedCustomerName')
  String? get relatedCustomerName => throw _privateConstructorUsedError;
  @JsonKey(name: 'CustomerRelationshipTypeId')
  int? get customerRelationshipTypeId => throw _privateConstructorUsedError;
  @JsonKey(name: 'EffectiveDate')
  dynamic get effectiveDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'ExpiryDate')
  dynamic get expiryDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsActive')
  bool? get isActive => throw _privateConstructorUsedError;
  @JsonKey(name: 'CustomerDTO')
  dynamic get customerDto => throw _privateConstructorUsedError;
  @JsonKey(name: 'RelatedCustomerDTO')
  dynamic get relatedCustomerDto => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsChanged')
  bool? get isChanged => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UpdateRelationshipRequestCopyWith<UpdateRelationshipRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdateRelationshipRequestCopyWith<$Res> {
  factory $UpdateRelationshipRequestCopyWith(UpdateRelationshipRequest value,
          $Res Function(UpdateRelationshipRequest) then) =
      _$UpdateRelationshipRequestCopyWithImpl<$Res, UpdateRelationshipRequest>;
  @useResult
  $Res call(
      {@JsonKey(name: 'CustomerId')
          int? customerId,
      @JsonKey(name: 'CustomerName')
          String? customerName,
      @JsonKey(name: 'RelatedCustomerId')
          int? relatedCustomerId,
      @JsonKey(name: 'RelatedCustomerName')
          String? relatedCustomerName,
      @JsonKey(name: 'CustomerRelationshipTypeId')
          int? customerRelationshipTypeId,
      @JsonKey(name: 'EffectiveDate')
          dynamic effectiveDate,
      @JsonKey(name: 'ExpiryDate')
          dynamic expiryDate,
      @JsonKey(name: 'IsActive')
          bool? isActive,
      @JsonKey(name: 'CustomerDTO')
          dynamic customerDto,
      @JsonKey(name: 'RelatedCustomerDTO')
          dynamic relatedCustomerDto,
      @JsonKey(name: 'IsChanged')
          bool? isChanged});
}

/// @nodoc
class _$UpdateRelationshipRequestCopyWithImpl<$Res,
        $Val extends UpdateRelationshipRequest>
    implements $UpdateRelationshipRequestCopyWith<$Res> {
  _$UpdateRelationshipRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? customerId = freezed,
    Object? customerName = freezed,
    Object? relatedCustomerId = freezed,
    Object? relatedCustomerName = freezed,
    Object? customerRelationshipTypeId = freezed,
    Object? effectiveDate = freezed,
    Object? expiryDate = freezed,
    Object? isActive = freezed,
    Object? customerDto = freezed,
    Object? relatedCustomerDto = freezed,
    Object? isChanged = freezed,
  }) {
    return _then(_value.copyWith(
      customerId: freezed == customerId
          ? _value.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as int?,
      customerName: freezed == customerName
          ? _value.customerName
          : customerName // ignore: cast_nullable_to_non_nullable
              as String?,
      relatedCustomerId: freezed == relatedCustomerId
          ? _value.relatedCustomerId
          : relatedCustomerId // ignore: cast_nullable_to_non_nullable
              as int?,
      relatedCustomerName: freezed == relatedCustomerName
          ? _value.relatedCustomerName
          : relatedCustomerName // ignore: cast_nullable_to_non_nullable
              as String?,
      customerRelationshipTypeId: freezed == customerRelationshipTypeId
          ? _value.customerRelationshipTypeId
          : customerRelationshipTypeId // ignore: cast_nullable_to_non_nullable
              as int?,
      effectiveDate: freezed == effectiveDate
          ? _value.effectiveDate
          : effectiveDate // ignore: cast_nullable_to_non_nullable
              as dynamic,
      expiryDate: freezed == expiryDate
          ? _value.expiryDate
          : expiryDate // ignore: cast_nullable_to_non_nullable
              as dynamic,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      customerDto: freezed == customerDto
          ? _value.customerDto
          : customerDto // ignore: cast_nullable_to_non_nullable
              as dynamic,
      relatedCustomerDto: freezed == relatedCustomerDto
          ? _value.relatedCustomerDto
          : relatedCustomerDto // ignore: cast_nullable_to_non_nullable
              as dynamic,
      isChanged: freezed == isChanged
          ? _value.isChanged
          : isChanged // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UpdateRelationshipRequestCopyWith<$Res>
    implements $UpdateRelationshipRequestCopyWith<$Res> {
  factory _$$_UpdateRelationshipRequestCopyWith(
          _$_UpdateRelationshipRequest value,
          $Res Function(_$_UpdateRelationshipRequest) then) =
      __$$_UpdateRelationshipRequestCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'CustomerId')
          int? customerId,
      @JsonKey(name: 'CustomerName')
          String? customerName,
      @JsonKey(name: 'RelatedCustomerId')
          int? relatedCustomerId,
      @JsonKey(name: 'RelatedCustomerName')
          String? relatedCustomerName,
      @JsonKey(name: 'CustomerRelationshipTypeId')
          int? customerRelationshipTypeId,
      @JsonKey(name: 'EffectiveDate')
          dynamic effectiveDate,
      @JsonKey(name: 'ExpiryDate')
          dynamic expiryDate,
      @JsonKey(name: 'IsActive')
          bool? isActive,
      @JsonKey(name: 'CustomerDTO')
          dynamic customerDto,
      @JsonKey(name: 'RelatedCustomerDTO')
          dynamic relatedCustomerDto,
      @JsonKey(name: 'IsChanged')
          bool? isChanged});
}

/// @nodoc
class __$$_UpdateRelationshipRequestCopyWithImpl<$Res>
    extends _$UpdateRelationshipRequestCopyWithImpl<$Res,
        _$_UpdateRelationshipRequest>
    implements _$$_UpdateRelationshipRequestCopyWith<$Res> {
  __$$_UpdateRelationshipRequestCopyWithImpl(
      _$_UpdateRelationshipRequest _value,
      $Res Function(_$_UpdateRelationshipRequest) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? customerId = freezed,
    Object? customerName = freezed,
    Object? relatedCustomerId = freezed,
    Object? relatedCustomerName = freezed,
    Object? customerRelationshipTypeId = freezed,
    Object? effectiveDate = freezed,
    Object? expiryDate = freezed,
    Object? isActive = freezed,
    Object? customerDto = freezed,
    Object? relatedCustomerDto = freezed,
    Object? isChanged = freezed,
  }) {
    return _then(_$_UpdateRelationshipRequest(
      customerId: freezed == customerId
          ? _value.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as int?,
      customerName: freezed == customerName
          ? _value.customerName
          : customerName // ignore: cast_nullable_to_non_nullable
              as String?,
      relatedCustomerId: freezed == relatedCustomerId
          ? _value.relatedCustomerId
          : relatedCustomerId // ignore: cast_nullable_to_non_nullable
              as int?,
      relatedCustomerName: freezed == relatedCustomerName
          ? _value.relatedCustomerName
          : relatedCustomerName // ignore: cast_nullable_to_non_nullable
              as String?,
      customerRelationshipTypeId: freezed == customerRelationshipTypeId
          ? _value.customerRelationshipTypeId
          : customerRelationshipTypeId // ignore: cast_nullable_to_non_nullable
              as int?,
      effectiveDate: freezed == effectiveDate
          ? _value.effectiveDate
          : effectiveDate // ignore: cast_nullable_to_non_nullable
              as dynamic,
      expiryDate: freezed == expiryDate
          ? _value.expiryDate
          : expiryDate // ignore: cast_nullable_to_non_nullable
              as dynamic,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      customerDto: freezed == customerDto
          ? _value.customerDto
          : customerDto // ignore: cast_nullable_to_non_nullable
              as dynamic,
      relatedCustomerDto: freezed == relatedCustomerDto
          ? _value.relatedCustomerDto
          : relatedCustomerDto // ignore: cast_nullable_to_non_nullable
              as dynamic,
      isChanged: freezed == isChanged
          ? _value.isChanged
          : isChanged // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UpdateRelationshipRequest implements _UpdateRelationshipRequest {
  const _$_UpdateRelationshipRequest(
      {@JsonKey(name: 'CustomerId')
          required this.customerId,
      @JsonKey(name: 'CustomerName')
          required this.customerName,
      @JsonKey(name: 'RelatedCustomerId')
          required this.relatedCustomerId,
      @JsonKey(name: 'RelatedCustomerName')
          required this.relatedCustomerName,
      @JsonKey(name: 'CustomerRelationshipTypeId')
          required this.customerRelationshipTypeId,
      @JsonKey(name: 'EffectiveDate')
          required this.effectiveDate,
      @JsonKey(name: 'ExpiryDate')
          required this.expiryDate,
      @JsonKey(name: 'IsActive')
          required this.isActive,
      @JsonKey(name: 'CustomerDTO')
          required this.customerDto,
      @JsonKey(name: 'RelatedCustomerDTO')
          required this.relatedCustomerDto,
      @JsonKey(name: 'IsChanged')
          required this.isChanged});

  factory _$_UpdateRelationshipRequest.fromJson(Map<String, dynamic> json) =>
      _$$_UpdateRelationshipRequestFromJson(json);

  @override
  @JsonKey(name: 'CustomerId')
  final int? customerId;
  @override
  @JsonKey(name: 'CustomerName')
  final String? customerName;
  @override
  @JsonKey(name: 'RelatedCustomerId')
  final int? relatedCustomerId;
  @override
  @JsonKey(name: 'RelatedCustomerName')
  final String? relatedCustomerName;
  @override
  @JsonKey(name: 'CustomerRelationshipTypeId')
  final int? customerRelationshipTypeId;
  @override
  @JsonKey(name: 'EffectiveDate')
  final dynamic effectiveDate;
  @override
  @JsonKey(name: 'ExpiryDate')
  final dynamic expiryDate;
  @override
  @JsonKey(name: 'IsActive')
  final bool? isActive;
  @override
  @JsonKey(name: 'CustomerDTO')
  final dynamic customerDto;
  @override
  @JsonKey(name: 'RelatedCustomerDTO')
  final dynamic relatedCustomerDto;
  @override
  @JsonKey(name: 'IsChanged')
  final bool? isChanged;

  @override
  String toString() {
    return 'UpdateRelationshipRequest(customerId: $customerId, customerName: $customerName, relatedCustomerId: $relatedCustomerId, relatedCustomerName: $relatedCustomerName, customerRelationshipTypeId: $customerRelationshipTypeId, effectiveDate: $effectiveDate, expiryDate: $expiryDate, isActive: $isActive, customerDto: $customerDto, relatedCustomerDto: $relatedCustomerDto, isChanged: $isChanged)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UpdateRelationshipRequest &&
            (identical(other.customerId, customerId) ||
                other.customerId == customerId) &&
            (identical(other.customerName, customerName) ||
                other.customerName == customerName) &&
            (identical(other.relatedCustomerId, relatedCustomerId) ||
                other.relatedCustomerId == relatedCustomerId) &&
            (identical(other.relatedCustomerName, relatedCustomerName) ||
                other.relatedCustomerName == relatedCustomerName) &&
            (identical(other.customerRelationshipTypeId,
                    customerRelationshipTypeId) ||
                other.customerRelationshipTypeId ==
                    customerRelationshipTypeId) &&
            const DeepCollectionEquality()
                .equals(other.effectiveDate, effectiveDate) &&
            const DeepCollectionEquality()
                .equals(other.expiryDate, expiryDate) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            const DeepCollectionEquality()
                .equals(other.customerDto, customerDto) &&
            const DeepCollectionEquality()
                .equals(other.relatedCustomerDto, relatedCustomerDto) &&
            (identical(other.isChanged, isChanged) ||
                other.isChanged == isChanged));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      customerId,
      customerName,
      relatedCustomerId,
      relatedCustomerName,
      customerRelationshipTypeId,
      const DeepCollectionEquality().hash(effectiveDate),
      const DeepCollectionEquality().hash(expiryDate),
      isActive,
      const DeepCollectionEquality().hash(customerDto),
      const DeepCollectionEquality().hash(relatedCustomerDto),
      isChanged);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UpdateRelationshipRequestCopyWith<_$_UpdateRelationshipRequest>
      get copyWith => __$$_UpdateRelationshipRequestCopyWithImpl<
          _$_UpdateRelationshipRequest>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UpdateRelationshipRequestToJson(
      this,
    );
  }
}

abstract class _UpdateRelationshipRequest implements UpdateRelationshipRequest {
  const factory _UpdateRelationshipRequest(
      {@JsonKey(name: 'CustomerId')
          required final int? customerId,
      @JsonKey(name: 'CustomerName')
          required final String? customerName,
      @JsonKey(name: 'RelatedCustomerId')
          required final int? relatedCustomerId,
      @JsonKey(name: 'RelatedCustomerName')
          required final String? relatedCustomerName,
      @JsonKey(name: 'CustomerRelationshipTypeId')
          required final int? customerRelationshipTypeId,
      @JsonKey(name: 'EffectiveDate')
          required final dynamic effectiveDate,
      @JsonKey(name: 'ExpiryDate')
          required final dynamic expiryDate,
      @JsonKey(name: 'IsActive')
          required final bool? isActive,
      @JsonKey(name: 'CustomerDTO')
          required final dynamic customerDto,
      @JsonKey(name: 'RelatedCustomerDTO')
          required final dynamic relatedCustomerDto,
      @JsonKey(name: 'IsChanged')
          required final bool? isChanged}) = _$_UpdateRelationshipRequest;

  factory _UpdateRelationshipRequest.fromJson(Map<String, dynamic> json) =
      _$_UpdateRelationshipRequest.fromJson;

  @override
  @JsonKey(name: 'CustomerId')
  int? get customerId;
  @override
  @JsonKey(name: 'CustomerName')
  String? get customerName;
  @override
  @JsonKey(name: 'RelatedCustomerId')
  int? get relatedCustomerId;
  @override
  @JsonKey(name: 'RelatedCustomerName')
  String? get relatedCustomerName;
  @override
  @JsonKey(name: 'CustomerRelationshipTypeId')
  int? get customerRelationshipTypeId;
  @override
  @JsonKey(name: 'EffectiveDate')
  dynamic get effectiveDate;
  @override
  @JsonKey(name: 'ExpiryDate')
  dynamic get expiryDate;
  @override
  @JsonKey(name: 'IsActive')
  bool? get isActive;
  @override
  @JsonKey(name: 'CustomerDTO')
  dynamic get customerDto;
  @override
  @JsonKey(name: 'RelatedCustomerDTO')
  dynamic get relatedCustomerDto;
  @override
  @JsonKey(name: 'IsChanged')
  bool? get isChanged;
  @override
  @JsonKey(ignore: true)
  _$$_UpdateRelationshipRequestCopyWith<_$_UpdateRelationshipRequest>
      get copyWith => throw _privateConstructorUsedError;
}
