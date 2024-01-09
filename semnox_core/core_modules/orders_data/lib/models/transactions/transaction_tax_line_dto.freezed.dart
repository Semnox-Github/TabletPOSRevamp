// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transaction_tax_line_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TransactionTaxLineDTO _$TransactionTaxLineDTOFromJson(
    Map<String, dynamic> json) {
  return _TransactionTaxLineDTO.fromJson(json);
}

/// @nodoc
mixin _$TransactionTaxLineDTO {
  @JsonKey(name: 'TransactionTaxLineId')
  int get transactionTaxLineId => throw _privateConstructorUsedError;
  @JsonKey(name: 'TransactionLineId')
  int get transactionLineId => throw _privateConstructorUsedError;
  @JsonKey(name: 'TransactionId')
  int get transactionId => throw _privateConstructorUsedError;
  @JsonKey(name: 'TaxId')
  int get taxId => throw _privateConstructorUsedError;
  @JsonKey(name: 'TaxStructureId')
  int get taxStructureId => throw _privateConstructorUsedError;
  @JsonKey(name: 'TaxPercentage')
  double get taxPercentage => throw _privateConstructorUsedError;
  @JsonKey(name: 'TaxAmount')
  double get taxAmount => throw _privateConstructorUsedError;
  @JsonKey(name: 'TaxName')
  String get taxName => throw _privateConstructorUsedError;
  @JsonKey(name: 'TaxCode')
  String get taxCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'Exempted')
  bool get exempted => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsActive')
  bool get isActive => throw _privateConstructorUsedError;
  @JsonKey(name: 'CreatedBy')
  String get createdBy => throw _privateConstructorUsedError;
  @JsonKey(name: 'CreationDate')
  String get creationDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'LastUpdatedBy')
  String get lastUpdatedBy => throw _privateConstructorUsedError;
  @JsonKey(name: 'LastUpdatedDate')
  String get lastUpdatedDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'Guid')
  String get guid => throw _privateConstructorUsedError;
  @JsonKey(name: 'SiteId')
  int get siteId => throw _privateConstructorUsedError;
  @JsonKey(name: 'SynchStatus')
  bool get synchStatus => throw _privateConstructorUsedError;
  @JsonKey(name: 'MasterEntityId')
  int get masterEntityId => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsChanged')
  bool get isChanged => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TransactionTaxLineDTOCopyWith<TransactionTaxLineDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionTaxLineDTOCopyWith<$Res> {
  factory $TransactionTaxLineDTOCopyWith(TransactionTaxLineDTO value,
          $Res Function(TransactionTaxLineDTO) then) =
      _$TransactionTaxLineDTOCopyWithImpl<$Res, TransactionTaxLineDTO>;
  @useResult
  $Res call(
      {@JsonKey(name: 'TransactionTaxLineId') int transactionTaxLineId,
      @JsonKey(name: 'TransactionLineId') int transactionLineId,
      @JsonKey(name: 'TransactionId') int transactionId,
      @JsonKey(name: 'TaxId') int taxId,
      @JsonKey(name: 'TaxStructureId') int taxStructureId,
      @JsonKey(name: 'TaxPercentage') double taxPercentage,
      @JsonKey(name: 'TaxAmount') double taxAmount,
      @JsonKey(name: 'TaxName') String taxName,
      @JsonKey(name: 'TaxCode') String taxCode,
      @JsonKey(name: 'Exempted') bool exempted,
      @JsonKey(name: 'IsActive') bool isActive,
      @JsonKey(name: 'CreatedBy') String createdBy,
      @JsonKey(name: 'CreationDate') String creationDate,
      @JsonKey(name: 'LastUpdatedBy') String lastUpdatedBy,
      @JsonKey(name: 'LastUpdatedDate') String lastUpdatedDate,
      @JsonKey(name: 'Guid') String guid,
      @JsonKey(name: 'SiteId') int siteId,
      @JsonKey(name: 'SynchStatus') bool synchStatus,
      @JsonKey(name: 'MasterEntityId') int masterEntityId,
      @JsonKey(name: 'IsChanged') bool isChanged});
}

/// @nodoc
class _$TransactionTaxLineDTOCopyWithImpl<$Res,
        $Val extends TransactionTaxLineDTO>
    implements $TransactionTaxLineDTOCopyWith<$Res> {
  _$TransactionTaxLineDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transactionTaxLineId = null,
    Object? transactionLineId = null,
    Object? transactionId = null,
    Object? taxId = null,
    Object? taxStructureId = null,
    Object? taxPercentage = null,
    Object? taxAmount = null,
    Object? taxName = null,
    Object? taxCode = null,
    Object? exempted = null,
    Object? isActive = null,
    Object? createdBy = null,
    Object? creationDate = null,
    Object? lastUpdatedBy = null,
    Object? lastUpdatedDate = null,
    Object? guid = null,
    Object? siteId = null,
    Object? synchStatus = null,
    Object? masterEntityId = null,
    Object? isChanged = null,
  }) {
    return _then(_value.copyWith(
      transactionTaxLineId: null == transactionTaxLineId
          ? _value.transactionTaxLineId
          : transactionTaxLineId // ignore: cast_nullable_to_non_nullable
              as int,
      transactionLineId: null == transactionLineId
          ? _value.transactionLineId
          : transactionLineId // ignore: cast_nullable_to_non_nullable
              as int,
      transactionId: null == transactionId
          ? _value.transactionId
          : transactionId // ignore: cast_nullable_to_non_nullable
              as int,
      taxId: null == taxId
          ? _value.taxId
          : taxId // ignore: cast_nullable_to_non_nullable
              as int,
      taxStructureId: null == taxStructureId
          ? _value.taxStructureId
          : taxStructureId // ignore: cast_nullable_to_non_nullable
              as int,
      taxPercentage: null == taxPercentage
          ? _value.taxPercentage
          : taxPercentage // ignore: cast_nullable_to_non_nullable
              as double,
      taxAmount: null == taxAmount
          ? _value.taxAmount
          : taxAmount // ignore: cast_nullable_to_non_nullable
              as double,
      taxName: null == taxName
          ? _value.taxName
          : taxName // ignore: cast_nullable_to_non_nullable
              as String,
      taxCode: null == taxCode
          ? _value.taxCode
          : taxCode // ignore: cast_nullable_to_non_nullable
              as String,
      exempted: null == exempted
          ? _value.exempted
          : exempted // ignore: cast_nullable_to_non_nullable
              as bool,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      createdBy: null == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String,
      creationDate: null == creationDate
          ? _value.creationDate
          : creationDate // ignore: cast_nullable_to_non_nullable
              as String,
      lastUpdatedBy: null == lastUpdatedBy
          ? _value.lastUpdatedBy
          : lastUpdatedBy // ignore: cast_nullable_to_non_nullable
              as String,
      lastUpdatedDate: null == lastUpdatedDate
          ? _value.lastUpdatedDate
          : lastUpdatedDate // ignore: cast_nullable_to_non_nullable
              as String,
      guid: null == guid
          ? _value.guid
          : guid // ignore: cast_nullable_to_non_nullable
              as String,
      siteId: null == siteId
          ? _value.siteId
          : siteId // ignore: cast_nullable_to_non_nullable
              as int,
      synchStatus: null == synchStatus
          ? _value.synchStatus
          : synchStatus // ignore: cast_nullable_to_non_nullable
              as bool,
      masterEntityId: null == masterEntityId
          ? _value.masterEntityId
          : masterEntityId // ignore: cast_nullable_to_non_nullable
              as int,
      isChanged: null == isChanged
          ? _value.isChanged
          : isChanged // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TransactionTaxLineDTOCopyWith<$Res>
    implements $TransactionTaxLineDTOCopyWith<$Res> {
  factory _$$_TransactionTaxLineDTOCopyWith(_$_TransactionTaxLineDTO value,
          $Res Function(_$_TransactionTaxLineDTO) then) =
      __$$_TransactionTaxLineDTOCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'TransactionTaxLineId') int transactionTaxLineId,
      @JsonKey(name: 'TransactionLineId') int transactionLineId,
      @JsonKey(name: 'TransactionId') int transactionId,
      @JsonKey(name: 'TaxId') int taxId,
      @JsonKey(name: 'TaxStructureId') int taxStructureId,
      @JsonKey(name: 'TaxPercentage') double taxPercentage,
      @JsonKey(name: 'TaxAmount') double taxAmount,
      @JsonKey(name: 'TaxName') String taxName,
      @JsonKey(name: 'TaxCode') String taxCode,
      @JsonKey(name: 'Exempted') bool exempted,
      @JsonKey(name: 'IsActive') bool isActive,
      @JsonKey(name: 'CreatedBy') String createdBy,
      @JsonKey(name: 'CreationDate') String creationDate,
      @JsonKey(name: 'LastUpdatedBy') String lastUpdatedBy,
      @JsonKey(name: 'LastUpdatedDate') String lastUpdatedDate,
      @JsonKey(name: 'Guid') String guid,
      @JsonKey(name: 'SiteId') int siteId,
      @JsonKey(name: 'SynchStatus') bool synchStatus,
      @JsonKey(name: 'MasterEntityId') int masterEntityId,
      @JsonKey(name: 'IsChanged') bool isChanged});
}

/// @nodoc
class __$$_TransactionTaxLineDTOCopyWithImpl<$Res>
    extends _$TransactionTaxLineDTOCopyWithImpl<$Res, _$_TransactionTaxLineDTO>
    implements _$$_TransactionTaxLineDTOCopyWith<$Res> {
  __$$_TransactionTaxLineDTOCopyWithImpl(_$_TransactionTaxLineDTO _value,
      $Res Function(_$_TransactionTaxLineDTO) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transactionTaxLineId = null,
    Object? transactionLineId = null,
    Object? transactionId = null,
    Object? taxId = null,
    Object? taxStructureId = null,
    Object? taxPercentage = null,
    Object? taxAmount = null,
    Object? taxName = null,
    Object? taxCode = null,
    Object? exempted = null,
    Object? isActive = null,
    Object? createdBy = null,
    Object? creationDate = null,
    Object? lastUpdatedBy = null,
    Object? lastUpdatedDate = null,
    Object? guid = null,
    Object? siteId = null,
    Object? synchStatus = null,
    Object? masterEntityId = null,
    Object? isChanged = null,
  }) {
    return _then(_$_TransactionTaxLineDTO(
      transactionTaxLineId: null == transactionTaxLineId
          ? _value.transactionTaxLineId
          : transactionTaxLineId // ignore: cast_nullable_to_non_nullable
              as int,
      transactionLineId: null == transactionLineId
          ? _value.transactionLineId
          : transactionLineId // ignore: cast_nullable_to_non_nullable
              as int,
      transactionId: null == transactionId
          ? _value.transactionId
          : transactionId // ignore: cast_nullable_to_non_nullable
              as int,
      taxId: null == taxId
          ? _value.taxId
          : taxId // ignore: cast_nullable_to_non_nullable
              as int,
      taxStructureId: null == taxStructureId
          ? _value.taxStructureId
          : taxStructureId // ignore: cast_nullable_to_non_nullable
              as int,
      taxPercentage: null == taxPercentage
          ? _value.taxPercentage
          : taxPercentage // ignore: cast_nullable_to_non_nullable
              as double,
      taxAmount: null == taxAmount
          ? _value.taxAmount
          : taxAmount // ignore: cast_nullable_to_non_nullable
              as double,
      taxName: null == taxName
          ? _value.taxName
          : taxName // ignore: cast_nullable_to_non_nullable
              as String,
      taxCode: null == taxCode
          ? _value.taxCode
          : taxCode // ignore: cast_nullable_to_non_nullable
              as String,
      exempted: null == exempted
          ? _value.exempted
          : exempted // ignore: cast_nullable_to_non_nullable
              as bool,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      createdBy: null == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String,
      creationDate: null == creationDate
          ? _value.creationDate
          : creationDate // ignore: cast_nullable_to_non_nullable
              as String,
      lastUpdatedBy: null == lastUpdatedBy
          ? _value.lastUpdatedBy
          : lastUpdatedBy // ignore: cast_nullable_to_non_nullable
              as String,
      lastUpdatedDate: null == lastUpdatedDate
          ? _value.lastUpdatedDate
          : lastUpdatedDate // ignore: cast_nullable_to_non_nullable
              as String,
      guid: null == guid
          ? _value.guid
          : guid // ignore: cast_nullable_to_non_nullable
              as String,
      siteId: null == siteId
          ? _value.siteId
          : siteId // ignore: cast_nullable_to_non_nullable
              as int,
      synchStatus: null == synchStatus
          ? _value.synchStatus
          : synchStatus // ignore: cast_nullable_to_non_nullable
              as bool,
      masterEntityId: null == masterEntityId
          ? _value.masterEntityId
          : masterEntityId // ignore: cast_nullable_to_non_nullable
              as int,
      isChanged: null == isChanged
          ? _value.isChanged
          : isChanged // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TransactionTaxLineDTO implements _TransactionTaxLineDTO {
  const _$_TransactionTaxLineDTO(
      {@JsonKey(name: 'TransactionTaxLineId')
          required this.transactionTaxLineId,
      @JsonKey(name: 'TransactionLineId')
          required this.transactionLineId,
      @JsonKey(name: 'TransactionId')
          required this.transactionId,
      @JsonKey(name: 'TaxId')
          required this.taxId,
      @JsonKey(name: 'TaxStructureId')
          required this.taxStructureId,
      @JsonKey(name: 'TaxPercentage')
          required this.taxPercentage,
      @JsonKey(name: 'TaxAmount')
          required this.taxAmount,
      @JsonKey(name: 'TaxName')
          required this.taxName,
      @JsonKey(name: 'TaxCode')
          required this.taxCode,
      @JsonKey(name: 'Exempted')
          required this.exempted,
      @JsonKey(name: 'IsActive')
          required this.isActive,
      @JsonKey(name: 'CreatedBy')
          required this.createdBy,
      @JsonKey(name: 'CreationDate')
          required this.creationDate,
      @JsonKey(name: 'LastUpdatedBy')
          required this.lastUpdatedBy,
      @JsonKey(name: 'LastUpdatedDate')
          required this.lastUpdatedDate,
      @JsonKey(name: 'Guid')
          required this.guid,
      @JsonKey(name: 'SiteId')
          required this.siteId,
      @JsonKey(name: 'SynchStatus')
          required this.synchStatus,
      @JsonKey(name: 'MasterEntityId')
          required this.masterEntityId,
      @JsonKey(name: 'IsChanged')
          required this.isChanged});

  factory _$_TransactionTaxLineDTO.fromJson(Map<String, dynamic> json) =>
      _$$_TransactionTaxLineDTOFromJson(json);

  @override
  @JsonKey(name: 'TransactionTaxLineId')
  final int transactionTaxLineId;
  @override
  @JsonKey(name: 'TransactionLineId')
  final int transactionLineId;
  @override
  @JsonKey(name: 'TransactionId')
  final int transactionId;
  @override
  @JsonKey(name: 'TaxId')
  final int taxId;
  @override
  @JsonKey(name: 'TaxStructureId')
  final int taxStructureId;
  @override
  @JsonKey(name: 'TaxPercentage')
  final double taxPercentage;
  @override
  @JsonKey(name: 'TaxAmount')
  final double taxAmount;
  @override
  @JsonKey(name: 'TaxName')
  final String taxName;
  @override
  @JsonKey(name: 'TaxCode')
  final String taxCode;
  @override
  @JsonKey(name: 'Exempted')
  final bool exempted;
  @override
  @JsonKey(name: 'IsActive')
  final bool isActive;
  @override
  @JsonKey(name: 'CreatedBy')
  final String createdBy;
  @override
  @JsonKey(name: 'CreationDate')
  final String creationDate;
  @override
  @JsonKey(name: 'LastUpdatedBy')
  final String lastUpdatedBy;
  @override
  @JsonKey(name: 'LastUpdatedDate')
  final String lastUpdatedDate;
  @override
  @JsonKey(name: 'Guid')
  final String guid;
  @override
  @JsonKey(name: 'SiteId')
  final int siteId;
  @override
  @JsonKey(name: 'SynchStatus')
  final bool synchStatus;
  @override
  @JsonKey(name: 'MasterEntityId')
  final int masterEntityId;
  @override
  @JsonKey(name: 'IsChanged')
  final bool isChanged;

  @override
  String toString() {
    return 'TransactionTaxLineDTO(transactionTaxLineId: $transactionTaxLineId, transactionLineId: $transactionLineId, transactionId: $transactionId, taxId: $taxId, taxStructureId: $taxStructureId, taxPercentage: $taxPercentage, taxAmount: $taxAmount, taxName: $taxName, taxCode: $taxCode, exempted: $exempted, isActive: $isActive, createdBy: $createdBy, creationDate: $creationDate, lastUpdatedBy: $lastUpdatedBy, lastUpdatedDate: $lastUpdatedDate, guid: $guid, siteId: $siteId, synchStatus: $synchStatus, masterEntityId: $masterEntityId, isChanged: $isChanged)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TransactionTaxLineDTO &&
            (identical(other.transactionTaxLineId, transactionTaxLineId) ||
                other.transactionTaxLineId == transactionTaxLineId) &&
            (identical(other.transactionLineId, transactionLineId) ||
                other.transactionLineId == transactionLineId) &&
            (identical(other.transactionId, transactionId) ||
                other.transactionId == transactionId) &&
            (identical(other.taxId, taxId) || other.taxId == taxId) &&
            (identical(other.taxStructureId, taxStructureId) ||
                other.taxStructureId == taxStructureId) &&
            (identical(other.taxPercentage, taxPercentage) ||
                other.taxPercentage == taxPercentage) &&
            (identical(other.taxAmount, taxAmount) ||
                other.taxAmount == taxAmount) &&
            (identical(other.taxName, taxName) || other.taxName == taxName) &&
            (identical(other.taxCode, taxCode) || other.taxCode == taxCode) &&
            (identical(other.exempted, exempted) ||
                other.exempted == exempted) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.createdBy, createdBy) ||
                other.createdBy == createdBy) &&
            (identical(other.creationDate, creationDate) ||
                other.creationDate == creationDate) &&
            (identical(other.lastUpdatedBy, lastUpdatedBy) ||
                other.lastUpdatedBy == lastUpdatedBy) &&
            (identical(other.lastUpdatedDate, lastUpdatedDate) ||
                other.lastUpdatedDate == lastUpdatedDate) &&
            (identical(other.guid, guid) || other.guid == guid) &&
            (identical(other.siteId, siteId) || other.siteId == siteId) &&
            (identical(other.synchStatus, synchStatus) ||
                other.synchStatus == synchStatus) &&
            (identical(other.masterEntityId, masterEntityId) ||
                other.masterEntityId == masterEntityId) &&
            (identical(other.isChanged, isChanged) ||
                other.isChanged == isChanged));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        transactionTaxLineId,
        transactionLineId,
        transactionId,
        taxId,
        taxStructureId,
        taxPercentage,
        taxAmount,
        taxName,
        taxCode,
        exempted,
        isActive,
        createdBy,
        creationDate,
        lastUpdatedBy,
        lastUpdatedDate,
        guid,
        siteId,
        synchStatus,
        masterEntityId,
        isChanged
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TransactionTaxLineDTOCopyWith<_$_TransactionTaxLineDTO> get copyWith =>
      __$$_TransactionTaxLineDTOCopyWithImpl<_$_TransactionTaxLineDTO>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TransactionTaxLineDTOToJson(
      this,
    );
  }
}

abstract class _TransactionTaxLineDTO implements TransactionTaxLineDTO {
  const factory _TransactionTaxLineDTO(
      {@JsonKey(name: 'TransactionTaxLineId')
          required final int transactionTaxLineId,
      @JsonKey(name: 'TransactionLineId')
          required final int transactionLineId,
      @JsonKey(name: 'TransactionId')
          required final int transactionId,
      @JsonKey(name: 'TaxId')
          required final int taxId,
      @JsonKey(name: 'TaxStructureId')
          required final int taxStructureId,
      @JsonKey(name: 'TaxPercentage')
          required final double taxPercentage,
      @JsonKey(name: 'TaxAmount')
          required final double taxAmount,
      @JsonKey(name: 'TaxName')
          required final String taxName,
      @JsonKey(name: 'TaxCode')
          required final String taxCode,
      @JsonKey(name: 'Exempted')
          required final bool exempted,
      @JsonKey(name: 'IsActive')
          required final bool isActive,
      @JsonKey(name: 'CreatedBy')
          required final String createdBy,
      @JsonKey(name: 'CreationDate')
          required final String creationDate,
      @JsonKey(name: 'LastUpdatedBy')
          required final String lastUpdatedBy,
      @JsonKey(name: 'LastUpdatedDate')
          required final String lastUpdatedDate,
      @JsonKey(name: 'Guid')
          required final String guid,
      @JsonKey(name: 'SiteId')
          required final int siteId,
      @JsonKey(name: 'SynchStatus')
          required final bool synchStatus,
      @JsonKey(name: 'MasterEntityId')
          required final int masterEntityId,
      @JsonKey(name: 'IsChanged')
          required final bool isChanged}) = _$_TransactionTaxLineDTO;

  factory _TransactionTaxLineDTO.fromJson(Map<String, dynamic> json) =
      _$_TransactionTaxLineDTO.fromJson;

  @override
  @JsonKey(name: 'TransactionTaxLineId')
  int get transactionTaxLineId;
  @override
  @JsonKey(name: 'TransactionLineId')
  int get transactionLineId;
  @override
  @JsonKey(name: 'TransactionId')
  int get transactionId;
  @override
  @JsonKey(name: 'TaxId')
  int get taxId;
  @override
  @JsonKey(name: 'TaxStructureId')
  int get taxStructureId;
  @override
  @JsonKey(name: 'TaxPercentage')
  double get taxPercentage;
  @override
  @JsonKey(name: 'TaxAmount')
  double get taxAmount;
  @override
  @JsonKey(name: 'TaxName')
  String get taxName;
  @override
  @JsonKey(name: 'TaxCode')
  String get taxCode;
  @override
  @JsonKey(name: 'Exempted')
  bool get exempted;
  @override
  @JsonKey(name: 'IsActive')
  bool get isActive;
  @override
  @JsonKey(name: 'CreatedBy')
  String get createdBy;
  @override
  @JsonKey(name: 'CreationDate')
  String get creationDate;
  @override
  @JsonKey(name: 'LastUpdatedBy')
  String get lastUpdatedBy;
  @override
  @JsonKey(name: 'LastUpdatedDate')
  String get lastUpdatedDate;
  @override
  @JsonKey(name: 'Guid')
  String get guid;
  @override
  @JsonKey(name: 'SiteId')
  int get siteId;
  @override
  @JsonKey(name: 'SynchStatus')
  bool get synchStatus;
  @override
  @JsonKey(name: 'MasterEntityId')
  int get masterEntityId;
  @override
  @JsonKey(name: 'IsChanged')
  bool get isChanged;
  @override
  @JsonKey(ignore: true)
  _$$_TransactionTaxLineDTOCopyWith<_$_TransactionTaxLineDTO> get copyWith =>
      throw _privateConstructorUsedError;
}
