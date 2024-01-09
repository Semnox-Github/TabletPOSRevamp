// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'customer_relationship_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CustomerRelationshipData _$CustomerRelationshipDataFromJson(
    Map<String, dynamic> json) {
  return _CustomerRelationshipData.fromJson(json);
}

/// @nodoc
mixin _$CustomerRelationshipData {
  @JsonKey(name: 'Id')
  int? get id => throw _privateConstructorUsedError;
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
  String? get effectiveDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'ExpiryDate')
  String? get expiryDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsActive')
  bool? get isActive => throw _privateConstructorUsedError;
  @JsonKey(name: 'CreatedBy')
  String? get createdBy => throw _privateConstructorUsedError;
  @JsonKey(name: 'CreationDate')
  String? get creationDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'LastUpdatedBy')
  String? get lastUpdatedBy => throw _privateConstructorUsedError;
  @JsonKey(name: 'LastUpdateDate')
  String? get lastUpdateDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'SiteId')
  int? get siteId => throw _privateConstructorUsedError;
  @JsonKey(name: 'MasterEntityId')
  int? get masterEntityId => throw _privateConstructorUsedError;
  @JsonKey(name: 'SynchStatus')
  bool? get synchStatus => throw _privateConstructorUsedError;
  @JsonKey(name: 'Guid')
  String? get guid => throw _privateConstructorUsedError;
  @JsonKey(name: 'CustomerDTO')
  CustomerData get customerDTO => throw _privateConstructorUsedError;
  @JsonKey(name: 'RelatedCustomerDTO')
  CustomerData get relatedCustomerDTO => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsChanged')
  bool? get isChanged => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CustomerRelationshipDataCopyWith<CustomerRelationshipData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomerRelationshipDataCopyWith<$Res> {
  factory $CustomerRelationshipDataCopyWith(CustomerRelationshipData value,
          $Res Function(CustomerRelationshipData) then) =
      _$CustomerRelationshipDataCopyWithImpl<$Res, CustomerRelationshipData>;
  @useResult
  $Res call(
      {@JsonKey(name: 'Id')
          int? id,
      @JsonKey(name: 'CustomerId')
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
          String? effectiveDate,
      @JsonKey(name: 'ExpiryDate')
          String? expiryDate,
      @JsonKey(name: 'IsActive')
          bool? isActive,
      @JsonKey(name: 'CreatedBy')
          String? createdBy,
      @JsonKey(name: 'CreationDate')
          String? creationDate,
      @JsonKey(name: 'LastUpdatedBy')
          String? lastUpdatedBy,
      @JsonKey(name: 'LastUpdateDate')
          String? lastUpdateDate,
      @JsonKey(name: 'SiteId')
          int? siteId,
      @JsonKey(name: 'MasterEntityId')
          int? masterEntityId,
      @JsonKey(name: 'SynchStatus')
          bool? synchStatus,
      @JsonKey(name: 'Guid')
          String? guid,
      @JsonKey(name: 'CustomerDTO')
          CustomerData customerDTO,
      @JsonKey(name: 'RelatedCustomerDTO')
          CustomerData relatedCustomerDTO,
      @JsonKey(name: 'IsChanged')
          bool? isChanged});

  $CustomerDataCopyWith<$Res> get customerDTO;
  $CustomerDataCopyWith<$Res> get relatedCustomerDTO;
}

/// @nodoc
class _$CustomerRelationshipDataCopyWithImpl<$Res,
        $Val extends CustomerRelationshipData>
    implements $CustomerRelationshipDataCopyWith<$Res> {
  _$CustomerRelationshipDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? customerId = freezed,
    Object? customerName = freezed,
    Object? relatedCustomerId = freezed,
    Object? relatedCustomerName = freezed,
    Object? customerRelationshipTypeId = freezed,
    Object? effectiveDate = freezed,
    Object? expiryDate = freezed,
    Object? isActive = freezed,
    Object? createdBy = freezed,
    Object? creationDate = freezed,
    Object? lastUpdatedBy = freezed,
    Object? lastUpdateDate = freezed,
    Object? siteId = freezed,
    Object? masterEntityId = freezed,
    Object? synchStatus = freezed,
    Object? guid = freezed,
    Object? customerDTO = null,
    Object? relatedCustomerDTO = null,
    Object? isChanged = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
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
              as String?,
      expiryDate: freezed == expiryDate
          ? _value.expiryDate
          : expiryDate // ignore: cast_nullable_to_non_nullable
              as String?,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      createdBy: freezed == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String?,
      creationDate: freezed == creationDate
          ? _value.creationDate
          : creationDate // ignore: cast_nullable_to_non_nullable
              as String?,
      lastUpdatedBy: freezed == lastUpdatedBy
          ? _value.lastUpdatedBy
          : lastUpdatedBy // ignore: cast_nullable_to_non_nullable
              as String?,
      lastUpdateDate: freezed == lastUpdateDate
          ? _value.lastUpdateDate
          : lastUpdateDate // ignore: cast_nullable_to_non_nullable
              as String?,
      siteId: freezed == siteId
          ? _value.siteId
          : siteId // ignore: cast_nullable_to_non_nullable
              as int?,
      masterEntityId: freezed == masterEntityId
          ? _value.masterEntityId
          : masterEntityId // ignore: cast_nullable_to_non_nullable
              as int?,
      synchStatus: freezed == synchStatus
          ? _value.synchStatus
          : synchStatus // ignore: cast_nullable_to_non_nullable
              as bool?,
      guid: freezed == guid
          ? _value.guid
          : guid // ignore: cast_nullable_to_non_nullable
              as String?,
      customerDTO: null == customerDTO
          ? _value.customerDTO
          : customerDTO // ignore: cast_nullable_to_non_nullable
              as CustomerData,
      relatedCustomerDTO: null == relatedCustomerDTO
          ? _value.relatedCustomerDTO
          : relatedCustomerDTO // ignore: cast_nullable_to_non_nullable
              as CustomerData,
      isChanged: freezed == isChanged
          ? _value.isChanged
          : isChanged // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $CustomerDataCopyWith<$Res> get customerDTO {
    return $CustomerDataCopyWith<$Res>(_value.customerDTO, (value) {
      return _then(_value.copyWith(customerDTO: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $CustomerDataCopyWith<$Res> get relatedCustomerDTO {
    return $CustomerDataCopyWith<$Res>(_value.relatedCustomerDTO, (value) {
      return _then(_value.copyWith(relatedCustomerDTO: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_CustomerRelationshipDataCopyWith<$Res>
    implements $CustomerRelationshipDataCopyWith<$Res> {
  factory _$$_CustomerRelationshipDataCopyWith(
          _$_CustomerRelationshipData value,
          $Res Function(_$_CustomerRelationshipData) then) =
      __$$_CustomerRelationshipDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'Id')
          int? id,
      @JsonKey(name: 'CustomerId')
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
          String? effectiveDate,
      @JsonKey(name: 'ExpiryDate')
          String? expiryDate,
      @JsonKey(name: 'IsActive')
          bool? isActive,
      @JsonKey(name: 'CreatedBy')
          String? createdBy,
      @JsonKey(name: 'CreationDate')
          String? creationDate,
      @JsonKey(name: 'LastUpdatedBy')
          String? lastUpdatedBy,
      @JsonKey(name: 'LastUpdateDate')
          String? lastUpdateDate,
      @JsonKey(name: 'SiteId')
          int? siteId,
      @JsonKey(name: 'MasterEntityId')
          int? masterEntityId,
      @JsonKey(name: 'SynchStatus')
          bool? synchStatus,
      @JsonKey(name: 'Guid')
          String? guid,
      @JsonKey(name: 'CustomerDTO')
          CustomerData customerDTO,
      @JsonKey(name: 'RelatedCustomerDTO')
          CustomerData relatedCustomerDTO,
      @JsonKey(name: 'IsChanged')
          bool? isChanged});

  @override
  $CustomerDataCopyWith<$Res> get customerDTO;
  @override
  $CustomerDataCopyWith<$Res> get relatedCustomerDTO;
}

/// @nodoc
class __$$_CustomerRelationshipDataCopyWithImpl<$Res>
    extends _$CustomerRelationshipDataCopyWithImpl<$Res,
        _$_CustomerRelationshipData>
    implements _$$_CustomerRelationshipDataCopyWith<$Res> {
  __$$_CustomerRelationshipDataCopyWithImpl(_$_CustomerRelationshipData _value,
      $Res Function(_$_CustomerRelationshipData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? customerId = freezed,
    Object? customerName = freezed,
    Object? relatedCustomerId = freezed,
    Object? relatedCustomerName = freezed,
    Object? customerRelationshipTypeId = freezed,
    Object? effectiveDate = freezed,
    Object? expiryDate = freezed,
    Object? isActive = freezed,
    Object? createdBy = freezed,
    Object? creationDate = freezed,
    Object? lastUpdatedBy = freezed,
    Object? lastUpdateDate = freezed,
    Object? siteId = freezed,
    Object? masterEntityId = freezed,
    Object? synchStatus = freezed,
    Object? guid = freezed,
    Object? customerDTO = null,
    Object? relatedCustomerDTO = null,
    Object? isChanged = freezed,
  }) {
    return _then(_$_CustomerRelationshipData(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
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
              as String?,
      expiryDate: freezed == expiryDate
          ? _value.expiryDate
          : expiryDate // ignore: cast_nullable_to_non_nullable
              as String?,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      createdBy: freezed == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String?,
      creationDate: freezed == creationDate
          ? _value.creationDate
          : creationDate // ignore: cast_nullable_to_non_nullable
              as String?,
      lastUpdatedBy: freezed == lastUpdatedBy
          ? _value.lastUpdatedBy
          : lastUpdatedBy // ignore: cast_nullable_to_non_nullable
              as String?,
      lastUpdateDate: freezed == lastUpdateDate
          ? _value.lastUpdateDate
          : lastUpdateDate // ignore: cast_nullable_to_non_nullable
              as String?,
      siteId: freezed == siteId
          ? _value.siteId
          : siteId // ignore: cast_nullable_to_non_nullable
              as int?,
      masterEntityId: freezed == masterEntityId
          ? _value.masterEntityId
          : masterEntityId // ignore: cast_nullable_to_non_nullable
              as int?,
      synchStatus: freezed == synchStatus
          ? _value.synchStatus
          : synchStatus // ignore: cast_nullable_to_non_nullable
              as bool?,
      guid: freezed == guid
          ? _value.guid
          : guid // ignore: cast_nullable_to_non_nullable
              as String?,
      customerDTO: null == customerDTO
          ? _value.customerDTO
          : customerDTO // ignore: cast_nullable_to_non_nullable
              as CustomerData,
      relatedCustomerDTO: null == relatedCustomerDTO
          ? _value.relatedCustomerDTO
          : relatedCustomerDTO // ignore: cast_nullable_to_non_nullable
              as CustomerData,
      isChanged: freezed == isChanged
          ? _value.isChanged
          : isChanged // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CustomerRelationshipData implements _CustomerRelationshipData {
  const _$_CustomerRelationshipData(
      {@JsonKey(name: 'Id')
          this.id,
      @JsonKey(name: 'CustomerId')
          this.customerId,
      @JsonKey(name: 'CustomerName')
          this.customerName,
      @JsonKey(name: 'RelatedCustomerId')
          this.relatedCustomerId,
      @JsonKey(name: 'RelatedCustomerName')
          this.relatedCustomerName,
      @JsonKey(name: 'CustomerRelationshipTypeId')
          this.customerRelationshipTypeId,
      @JsonKey(name: 'EffectiveDate')
          this.effectiveDate,
      @JsonKey(name: 'ExpiryDate')
          this.expiryDate,
      @JsonKey(name: 'IsActive')
          this.isActive,
      @JsonKey(name: 'CreatedBy')
          this.createdBy,
      @JsonKey(name: 'CreationDate')
          this.creationDate,
      @JsonKey(name: 'LastUpdatedBy')
          this.lastUpdatedBy,
      @JsonKey(name: 'LastUpdateDate')
          this.lastUpdateDate,
      @JsonKey(name: 'SiteId')
          this.siteId,
      @JsonKey(name: 'MasterEntityId')
          this.masterEntityId,
      @JsonKey(name: 'SynchStatus')
          this.synchStatus,
      @JsonKey(name: 'Guid')
          this.guid,
      @JsonKey(name: 'CustomerDTO')
          required this.customerDTO,
      @JsonKey(name: 'RelatedCustomerDTO')
          required this.relatedCustomerDTO,
      @JsonKey(name: 'IsChanged')
          this.isChanged});

  factory _$_CustomerRelationshipData.fromJson(Map<String, dynamic> json) =>
      _$$_CustomerRelationshipDataFromJson(json);

  @override
  @JsonKey(name: 'Id')
  final int? id;
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
  final String? effectiveDate;
  @override
  @JsonKey(name: 'ExpiryDate')
  final String? expiryDate;
  @override
  @JsonKey(name: 'IsActive')
  final bool? isActive;
  @override
  @JsonKey(name: 'CreatedBy')
  final String? createdBy;
  @override
  @JsonKey(name: 'CreationDate')
  final String? creationDate;
  @override
  @JsonKey(name: 'LastUpdatedBy')
  final String? lastUpdatedBy;
  @override
  @JsonKey(name: 'LastUpdateDate')
  final String? lastUpdateDate;
  @override
  @JsonKey(name: 'SiteId')
  final int? siteId;
  @override
  @JsonKey(name: 'MasterEntityId')
  final int? masterEntityId;
  @override
  @JsonKey(name: 'SynchStatus')
  final bool? synchStatus;
  @override
  @JsonKey(name: 'Guid')
  final String? guid;
  @override
  @JsonKey(name: 'CustomerDTO')
  final CustomerData customerDTO;
  @override
  @JsonKey(name: 'RelatedCustomerDTO')
  final CustomerData relatedCustomerDTO;
  @override
  @JsonKey(name: 'IsChanged')
  final bool? isChanged;

  @override
  String toString() {
    return 'CustomerRelationshipData(id: $id, customerId: $customerId, customerName: $customerName, relatedCustomerId: $relatedCustomerId, relatedCustomerName: $relatedCustomerName, customerRelationshipTypeId: $customerRelationshipTypeId, effectiveDate: $effectiveDate, expiryDate: $expiryDate, isActive: $isActive, createdBy: $createdBy, creationDate: $creationDate, lastUpdatedBy: $lastUpdatedBy, lastUpdateDate: $lastUpdateDate, siteId: $siteId, masterEntityId: $masterEntityId, synchStatus: $synchStatus, guid: $guid, customerDTO: $customerDTO, relatedCustomerDTO: $relatedCustomerDTO, isChanged: $isChanged)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CustomerRelationshipData &&
            (identical(other.id, id) || other.id == id) &&
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
            (identical(other.effectiveDate, effectiveDate) ||
                other.effectiveDate == effectiveDate) &&
            (identical(other.expiryDate, expiryDate) ||
                other.expiryDate == expiryDate) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.createdBy, createdBy) ||
                other.createdBy == createdBy) &&
            (identical(other.creationDate, creationDate) ||
                other.creationDate == creationDate) &&
            (identical(other.lastUpdatedBy, lastUpdatedBy) ||
                other.lastUpdatedBy == lastUpdatedBy) &&
            (identical(other.lastUpdateDate, lastUpdateDate) ||
                other.lastUpdateDate == lastUpdateDate) &&
            (identical(other.siteId, siteId) || other.siteId == siteId) &&
            (identical(other.masterEntityId, masterEntityId) ||
                other.masterEntityId == masterEntityId) &&
            (identical(other.synchStatus, synchStatus) ||
                other.synchStatus == synchStatus) &&
            (identical(other.guid, guid) || other.guid == guid) &&
            (identical(other.customerDTO, customerDTO) ||
                other.customerDTO == customerDTO) &&
            (identical(other.relatedCustomerDTO, relatedCustomerDTO) ||
                other.relatedCustomerDTO == relatedCustomerDTO) &&
            (identical(other.isChanged, isChanged) ||
                other.isChanged == isChanged));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        customerId,
        customerName,
        relatedCustomerId,
        relatedCustomerName,
        customerRelationshipTypeId,
        effectiveDate,
        expiryDate,
        isActive,
        createdBy,
        creationDate,
        lastUpdatedBy,
        lastUpdateDate,
        siteId,
        masterEntityId,
        synchStatus,
        guid,
        customerDTO,
        relatedCustomerDTO,
        isChanged
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CustomerRelationshipDataCopyWith<_$_CustomerRelationshipData>
      get copyWith => __$$_CustomerRelationshipDataCopyWithImpl<
          _$_CustomerRelationshipData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CustomerRelationshipDataToJson(
      this,
    );
  }
}

abstract class _CustomerRelationshipData implements CustomerRelationshipData {
  const factory _CustomerRelationshipData(
      {@JsonKey(name: 'Id')
          final int? id,
      @JsonKey(name: 'CustomerId')
          final int? customerId,
      @JsonKey(name: 'CustomerName')
          final String? customerName,
      @JsonKey(name: 'RelatedCustomerId')
          final int? relatedCustomerId,
      @JsonKey(name: 'RelatedCustomerName')
          final String? relatedCustomerName,
      @JsonKey(name: 'CustomerRelationshipTypeId')
          final int? customerRelationshipTypeId,
      @JsonKey(name: 'EffectiveDate')
          final String? effectiveDate,
      @JsonKey(name: 'ExpiryDate')
          final String? expiryDate,
      @JsonKey(name: 'IsActive')
          final bool? isActive,
      @JsonKey(name: 'CreatedBy')
          final String? createdBy,
      @JsonKey(name: 'CreationDate')
          final String? creationDate,
      @JsonKey(name: 'LastUpdatedBy')
          final String? lastUpdatedBy,
      @JsonKey(name: 'LastUpdateDate')
          final String? lastUpdateDate,
      @JsonKey(name: 'SiteId')
          final int? siteId,
      @JsonKey(name: 'MasterEntityId')
          final int? masterEntityId,
      @JsonKey(name: 'SynchStatus')
          final bool? synchStatus,
      @JsonKey(name: 'Guid')
          final String? guid,
      @JsonKey(name: 'CustomerDTO')
          required final CustomerData customerDTO,
      @JsonKey(name: 'RelatedCustomerDTO')
          required final CustomerData relatedCustomerDTO,
      @JsonKey(name: 'IsChanged')
          final bool? isChanged}) = _$_CustomerRelationshipData;

  factory _CustomerRelationshipData.fromJson(Map<String, dynamic> json) =
      _$_CustomerRelationshipData.fromJson;

  @override
  @JsonKey(name: 'Id')
  int? get id;
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
  String? get effectiveDate;
  @override
  @JsonKey(name: 'ExpiryDate')
  String? get expiryDate;
  @override
  @JsonKey(name: 'IsActive')
  bool? get isActive;
  @override
  @JsonKey(name: 'CreatedBy')
  String? get createdBy;
  @override
  @JsonKey(name: 'CreationDate')
  String? get creationDate;
  @override
  @JsonKey(name: 'LastUpdatedBy')
  String? get lastUpdatedBy;
  @override
  @JsonKey(name: 'LastUpdateDate')
  String? get lastUpdateDate;
  @override
  @JsonKey(name: 'SiteId')
  int? get siteId;
  @override
  @JsonKey(name: 'MasterEntityId')
  int? get masterEntityId;
  @override
  @JsonKey(name: 'SynchStatus')
  bool? get synchStatus;
  @override
  @JsonKey(name: 'Guid')
  String? get guid;
  @override
  @JsonKey(name: 'CustomerDTO')
  CustomerData get customerDTO;
  @override
  @JsonKey(name: 'RelatedCustomerDTO')
  CustomerData get relatedCustomerDTO;
  @override
  @JsonKey(name: 'IsChanged')
  bool? get isChanged;
  @override
  @JsonKey(ignore: true)
  _$$_CustomerRelationshipDataCopyWith<_$_CustomerRelationshipData>
      get copyWith => throw _privateConstructorUsedError;
}
