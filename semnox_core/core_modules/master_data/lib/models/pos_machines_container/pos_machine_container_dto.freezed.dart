// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pos_machine_container_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

POSMachineContainerDTO _$POSMachineContainerDTOFromJson(
    Map<String, dynamic> json) {
  return _POSMachineContainerDTO.fromJson(json);
}

/// @nodoc
mixin _$POSMachineContainerDTO {
  @JsonKey(name: 'POSMachineId')
  int get posMachineId => throw _privateConstructorUsedError;
  @JsonKey(name: 'POSName')
  String get posName => throw _privateConstructorUsedError;
  @JsonKey(name: 'PosTypeName')
  String get posTypeName => throw _privateConstructorUsedError;
  @JsonKey(name: 'POSTypeId')
  int get posTypeId => throw _privateConstructorUsedError;
  @JsonKey(name: 'ComputerName')
  String get computerName => throw _privateConstructorUsedError;
  @JsonKey(name: 'IPAddress')
  String? get ipAddress => throw _privateConstructorUsedError;
  @JsonKey(name: 'Attribute1')
  String get attribute1 => throw _privateConstructorUsedError;
  @JsonKey(name: 'InventoryLocationId')
  int get inventoryLocationId => throw _privateConstructorUsedError;
  @JsonKey(name: 'Guid')
  String get guid => throw _privateConstructorUsedError;
  @JsonKey(name: 'PeripheralContainerDTOList')
  List<PeripheralContainerDTO> get peripheralContainerDTOList =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'POSProductExclusionsContainerDTOList')
  List<POSProductExclusionsContainerDTO>
      get posProductExclusionsContainerDTOList =>
          throw _privateConstructorUsedError;
  @JsonKey(name: 'POSPaymentModeInclusionContainerDTOList')
  List<POSPaymentModeInclusionContainerDTO>
      get posPaymentModeInclusionContainerDTOList =>
          throw _privateConstructorUsedError;
  @JsonKey(name: 'ProductDisplayGroupFormatContainerDTOList')
  List<ProductDisplayGroupFormatContainerDTO>
      get productDisplayGroupFormatContainerDTOList =>
          throw _privateConstructorUsedError;
  @JsonKey(name: 'POSPrinterContainerDTOList')
  List<POSPrinterContainerDTO> get posPrinterContainerDTOList =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'IncludedProductIdList')
  List<int> get includedProductIdList => throw _privateConstructorUsedError;
  @JsonKey(name: 'ProductMenuIdList')
  List<int> get productMenuIdList => throw _privateConstructorUsedError;
  @JsonKey(name: 'FacilityIdList')
  List<int> get facilityIdList => throw _privateConstructorUsedError;
  @JsonKey(name: 'ExcludedProductMenuPanelIdList')
  List<dynamic> get excludedProductMenuPanelIdList =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'POSCashdrawerContainerDTOList')
  List<POSCashDrawerContainerDTO>? get posCashdrawerContainerDTOList =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $POSMachineContainerDTOCopyWith<POSMachineContainerDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $POSMachineContainerDTOCopyWith<$Res> {
  factory $POSMachineContainerDTOCopyWith(POSMachineContainerDTO value,
          $Res Function(POSMachineContainerDTO) then) =
      _$POSMachineContainerDTOCopyWithImpl<$Res, POSMachineContainerDTO>;
  @useResult
  $Res call(
      {@JsonKey(name: 'POSMachineId')
          int posMachineId,
      @JsonKey(name: 'POSName')
          String posName,
      @JsonKey(name: 'PosTypeName')
          String posTypeName,
      @JsonKey(name: 'POSTypeId')
          int posTypeId,
      @JsonKey(name: 'ComputerName')
          String computerName,
      @JsonKey(name: 'IPAddress')
          String? ipAddress,
      @JsonKey(name: 'Attribute1')
          String attribute1,
      @JsonKey(name: 'InventoryLocationId')
          int inventoryLocationId,
      @JsonKey(name: 'Guid')
          String guid,
      @JsonKey(name: 'PeripheralContainerDTOList')
          List<PeripheralContainerDTO> peripheralContainerDTOList,
      @JsonKey(name: 'POSProductExclusionsContainerDTOList')
          List<POSProductExclusionsContainerDTO>
              posProductExclusionsContainerDTOList,
      @JsonKey(name: 'POSPaymentModeInclusionContainerDTOList')
          List<POSPaymentModeInclusionContainerDTO>
              posPaymentModeInclusionContainerDTOList,
      @JsonKey(name: 'ProductDisplayGroupFormatContainerDTOList')
          List<ProductDisplayGroupFormatContainerDTO>
              productDisplayGroupFormatContainerDTOList,
      @JsonKey(name: 'POSPrinterContainerDTOList')
          List<POSPrinterContainerDTO> posPrinterContainerDTOList,
      @JsonKey(name: 'IncludedProductIdList')
          List<int> includedProductIdList,
      @JsonKey(name: 'ProductMenuIdList')
          List<int> productMenuIdList,
      @JsonKey(name: 'FacilityIdList')
          List<int> facilityIdList,
      @JsonKey(name: 'ExcludedProductMenuPanelIdList')
          List<dynamic> excludedProductMenuPanelIdList,
      @JsonKey(name: 'POSCashdrawerContainerDTOList')
          List<POSCashDrawerContainerDTO>? posCashdrawerContainerDTOList});
}

/// @nodoc
class _$POSMachineContainerDTOCopyWithImpl<$Res,
        $Val extends POSMachineContainerDTO>
    implements $POSMachineContainerDTOCopyWith<$Res> {
  _$POSMachineContainerDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? posMachineId = null,
    Object? posName = null,
    Object? posTypeName = null,
    Object? posTypeId = null,
    Object? computerName = null,
    Object? ipAddress = freezed,
    Object? attribute1 = null,
    Object? inventoryLocationId = null,
    Object? guid = null,
    Object? peripheralContainerDTOList = null,
    Object? posProductExclusionsContainerDTOList = null,
    Object? posPaymentModeInclusionContainerDTOList = null,
    Object? productDisplayGroupFormatContainerDTOList = null,
    Object? posPrinterContainerDTOList = null,
    Object? includedProductIdList = null,
    Object? productMenuIdList = null,
    Object? facilityIdList = null,
    Object? excludedProductMenuPanelIdList = null,
    Object? posCashdrawerContainerDTOList = freezed,
  }) {
    return _then(_value.copyWith(
      posMachineId: null == posMachineId
          ? _value.posMachineId
          : posMachineId // ignore: cast_nullable_to_non_nullable
              as int,
      posName: null == posName
          ? _value.posName
          : posName // ignore: cast_nullable_to_non_nullable
              as String,
      posTypeName: null == posTypeName
          ? _value.posTypeName
          : posTypeName // ignore: cast_nullable_to_non_nullable
              as String,
      posTypeId: null == posTypeId
          ? _value.posTypeId
          : posTypeId // ignore: cast_nullable_to_non_nullable
              as int,
      computerName: null == computerName
          ? _value.computerName
          : computerName // ignore: cast_nullable_to_non_nullable
              as String,
      ipAddress: freezed == ipAddress
          ? _value.ipAddress
          : ipAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      attribute1: null == attribute1
          ? _value.attribute1
          : attribute1 // ignore: cast_nullable_to_non_nullable
              as String,
      inventoryLocationId: null == inventoryLocationId
          ? _value.inventoryLocationId
          : inventoryLocationId // ignore: cast_nullable_to_non_nullable
              as int,
      guid: null == guid
          ? _value.guid
          : guid // ignore: cast_nullable_to_non_nullable
              as String,
      peripheralContainerDTOList: null == peripheralContainerDTOList
          ? _value.peripheralContainerDTOList
          : peripheralContainerDTOList // ignore: cast_nullable_to_non_nullable
              as List<PeripheralContainerDTO>,
      posProductExclusionsContainerDTOList: null ==
              posProductExclusionsContainerDTOList
          ? _value.posProductExclusionsContainerDTOList
          : posProductExclusionsContainerDTOList // ignore: cast_nullable_to_non_nullable
              as List<POSProductExclusionsContainerDTO>,
      posPaymentModeInclusionContainerDTOList: null ==
              posPaymentModeInclusionContainerDTOList
          ? _value.posPaymentModeInclusionContainerDTOList
          : posPaymentModeInclusionContainerDTOList // ignore: cast_nullable_to_non_nullable
              as List<POSPaymentModeInclusionContainerDTO>,
      productDisplayGroupFormatContainerDTOList: null ==
              productDisplayGroupFormatContainerDTOList
          ? _value.productDisplayGroupFormatContainerDTOList
          : productDisplayGroupFormatContainerDTOList // ignore: cast_nullable_to_non_nullable
              as List<ProductDisplayGroupFormatContainerDTO>,
      posPrinterContainerDTOList: null == posPrinterContainerDTOList
          ? _value.posPrinterContainerDTOList
          : posPrinterContainerDTOList // ignore: cast_nullable_to_non_nullable
              as List<POSPrinterContainerDTO>,
      includedProductIdList: null == includedProductIdList
          ? _value.includedProductIdList
          : includedProductIdList // ignore: cast_nullable_to_non_nullable
              as List<int>,
      productMenuIdList: null == productMenuIdList
          ? _value.productMenuIdList
          : productMenuIdList // ignore: cast_nullable_to_non_nullable
              as List<int>,
      facilityIdList: null == facilityIdList
          ? _value.facilityIdList
          : facilityIdList // ignore: cast_nullable_to_non_nullable
              as List<int>,
      excludedProductMenuPanelIdList: null == excludedProductMenuPanelIdList
          ? _value.excludedProductMenuPanelIdList
          : excludedProductMenuPanelIdList // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      posCashdrawerContainerDTOList: freezed == posCashdrawerContainerDTOList
          ? _value.posCashdrawerContainerDTOList
          : posCashdrawerContainerDTOList // ignore: cast_nullable_to_non_nullable
              as List<POSCashDrawerContainerDTO>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_POSMachineContainerDTOCopyWith<$Res>
    implements $POSMachineContainerDTOCopyWith<$Res> {
  factory _$$_POSMachineContainerDTOCopyWith(_$_POSMachineContainerDTO value,
          $Res Function(_$_POSMachineContainerDTO) then) =
      __$$_POSMachineContainerDTOCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'POSMachineId')
          int posMachineId,
      @JsonKey(name: 'POSName')
          String posName,
      @JsonKey(name: 'PosTypeName')
          String posTypeName,
      @JsonKey(name: 'POSTypeId')
          int posTypeId,
      @JsonKey(name: 'ComputerName')
          String computerName,
      @JsonKey(name: 'IPAddress')
          String? ipAddress,
      @JsonKey(name: 'Attribute1')
          String attribute1,
      @JsonKey(name: 'InventoryLocationId')
          int inventoryLocationId,
      @JsonKey(name: 'Guid')
          String guid,
      @JsonKey(name: 'PeripheralContainerDTOList')
          List<PeripheralContainerDTO> peripheralContainerDTOList,
      @JsonKey(name: 'POSProductExclusionsContainerDTOList')
          List<POSProductExclusionsContainerDTO>
              posProductExclusionsContainerDTOList,
      @JsonKey(name: 'POSPaymentModeInclusionContainerDTOList')
          List<POSPaymentModeInclusionContainerDTO>
              posPaymentModeInclusionContainerDTOList,
      @JsonKey(name: 'ProductDisplayGroupFormatContainerDTOList')
          List<ProductDisplayGroupFormatContainerDTO>
              productDisplayGroupFormatContainerDTOList,
      @JsonKey(name: 'POSPrinterContainerDTOList')
          List<POSPrinterContainerDTO> posPrinterContainerDTOList,
      @JsonKey(name: 'IncludedProductIdList')
          List<int> includedProductIdList,
      @JsonKey(name: 'ProductMenuIdList')
          List<int> productMenuIdList,
      @JsonKey(name: 'FacilityIdList')
          List<int> facilityIdList,
      @JsonKey(name: 'ExcludedProductMenuPanelIdList')
          List<dynamic> excludedProductMenuPanelIdList,
      @JsonKey(name: 'POSCashdrawerContainerDTOList')
          List<POSCashDrawerContainerDTO>? posCashdrawerContainerDTOList});
}

/// @nodoc
class __$$_POSMachineContainerDTOCopyWithImpl<$Res>
    extends _$POSMachineContainerDTOCopyWithImpl<$Res,
        _$_POSMachineContainerDTO>
    implements _$$_POSMachineContainerDTOCopyWith<$Res> {
  __$$_POSMachineContainerDTOCopyWithImpl(_$_POSMachineContainerDTO _value,
      $Res Function(_$_POSMachineContainerDTO) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? posMachineId = null,
    Object? posName = null,
    Object? posTypeName = null,
    Object? posTypeId = null,
    Object? computerName = null,
    Object? ipAddress = freezed,
    Object? attribute1 = null,
    Object? inventoryLocationId = null,
    Object? guid = null,
    Object? peripheralContainerDTOList = null,
    Object? posProductExclusionsContainerDTOList = null,
    Object? posPaymentModeInclusionContainerDTOList = null,
    Object? productDisplayGroupFormatContainerDTOList = null,
    Object? posPrinterContainerDTOList = null,
    Object? includedProductIdList = null,
    Object? productMenuIdList = null,
    Object? facilityIdList = null,
    Object? excludedProductMenuPanelIdList = null,
    Object? posCashdrawerContainerDTOList = freezed,
  }) {
    return _then(_$_POSMachineContainerDTO(
      posMachineId: null == posMachineId
          ? _value.posMachineId
          : posMachineId // ignore: cast_nullable_to_non_nullable
              as int,
      posName: null == posName
          ? _value.posName
          : posName // ignore: cast_nullable_to_non_nullable
              as String,
      posTypeName: null == posTypeName
          ? _value.posTypeName
          : posTypeName // ignore: cast_nullable_to_non_nullable
              as String,
      posTypeId: null == posTypeId
          ? _value.posTypeId
          : posTypeId // ignore: cast_nullable_to_non_nullable
              as int,
      computerName: null == computerName
          ? _value.computerName
          : computerName // ignore: cast_nullable_to_non_nullable
              as String,
      ipAddress: freezed == ipAddress
          ? _value.ipAddress
          : ipAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      attribute1: null == attribute1
          ? _value.attribute1
          : attribute1 // ignore: cast_nullable_to_non_nullable
              as String,
      inventoryLocationId: null == inventoryLocationId
          ? _value.inventoryLocationId
          : inventoryLocationId // ignore: cast_nullable_to_non_nullable
              as int,
      guid: null == guid
          ? _value.guid
          : guid // ignore: cast_nullable_to_non_nullable
              as String,
      peripheralContainerDTOList: null == peripheralContainerDTOList
          ? _value._peripheralContainerDTOList
          : peripheralContainerDTOList // ignore: cast_nullable_to_non_nullable
              as List<PeripheralContainerDTO>,
      posProductExclusionsContainerDTOList: null ==
              posProductExclusionsContainerDTOList
          ? _value._posProductExclusionsContainerDTOList
          : posProductExclusionsContainerDTOList // ignore: cast_nullable_to_non_nullable
              as List<POSProductExclusionsContainerDTO>,
      posPaymentModeInclusionContainerDTOList: null ==
              posPaymentModeInclusionContainerDTOList
          ? _value._posPaymentModeInclusionContainerDTOList
          : posPaymentModeInclusionContainerDTOList // ignore: cast_nullable_to_non_nullable
              as List<POSPaymentModeInclusionContainerDTO>,
      productDisplayGroupFormatContainerDTOList: null ==
              productDisplayGroupFormatContainerDTOList
          ? _value._productDisplayGroupFormatContainerDTOList
          : productDisplayGroupFormatContainerDTOList // ignore: cast_nullable_to_non_nullable
              as List<ProductDisplayGroupFormatContainerDTO>,
      posPrinterContainerDTOList: null == posPrinterContainerDTOList
          ? _value._posPrinterContainerDTOList
          : posPrinterContainerDTOList // ignore: cast_nullable_to_non_nullable
              as List<POSPrinterContainerDTO>,
      includedProductIdList: null == includedProductIdList
          ? _value._includedProductIdList
          : includedProductIdList // ignore: cast_nullable_to_non_nullable
              as List<int>,
      productMenuIdList: null == productMenuIdList
          ? _value._productMenuIdList
          : productMenuIdList // ignore: cast_nullable_to_non_nullable
              as List<int>,
      facilityIdList: null == facilityIdList
          ? _value._facilityIdList
          : facilityIdList // ignore: cast_nullable_to_non_nullable
              as List<int>,
      excludedProductMenuPanelIdList: null == excludedProductMenuPanelIdList
          ? _value._excludedProductMenuPanelIdList
          : excludedProductMenuPanelIdList // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      posCashdrawerContainerDTOList: freezed == posCashdrawerContainerDTOList
          ? _value._posCashdrawerContainerDTOList
          : posCashdrawerContainerDTOList // ignore: cast_nullable_to_non_nullable
              as List<POSCashDrawerContainerDTO>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_POSMachineContainerDTO implements _POSMachineContainerDTO {
  const _$_POSMachineContainerDTO(
      {@JsonKey(name: 'POSMachineId')
          required this.posMachineId,
      @JsonKey(name: 'POSName')
          required this.posName,
      @JsonKey(name: 'PosTypeName')
          required this.posTypeName,
      @JsonKey(name: 'POSTypeId')
          required this.posTypeId,
      @JsonKey(name: 'ComputerName')
          required this.computerName,
      @JsonKey(name: 'IPAddress')
          this.ipAddress,
      @JsonKey(name: 'Attribute1')
          required this.attribute1,
      @JsonKey(name: 'InventoryLocationId')
          required this.inventoryLocationId,
      @JsonKey(name: 'Guid')
          required this.guid,
      @JsonKey(name: 'PeripheralContainerDTOList')
          required final List<PeripheralContainerDTO>
              peripheralContainerDTOList,
      @JsonKey(name: 'POSProductExclusionsContainerDTOList')
          required final List<POSProductExclusionsContainerDTO>
              posProductExclusionsContainerDTOList,
      @JsonKey(name: 'POSPaymentModeInclusionContainerDTOList')
          required final List<POSPaymentModeInclusionContainerDTO>
              posPaymentModeInclusionContainerDTOList,
      @JsonKey(name: 'ProductDisplayGroupFormatContainerDTOList')
          required final List<ProductDisplayGroupFormatContainerDTO>
              productDisplayGroupFormatContainerDTOList,
      @JsonKey(name: 'POSPrinterContainerDTOList')
          required final List<POSPrinterContainerDTO>
              posPrinterContainerDTOList,
      @JsonKey(name: 'IncludedProductIdList')
          required final List<int> includedProductIdList,
      @JsonKey(name: 'ProductMenuIdList')
          required final List<int> productMenuIdList,
      @JsonKey(name: 'FacilityIdList')
          required final List<int> facilityIdList,
      @JsonKey(name: 'ExcludedProductMenuPanelIdList')
          required final List<dynamic> excludedProductMenuPanelIdList,
      @JsonKey(name: 'POSCashdrawerContainerDTOList')
          final List<POSCashDrawerContainerDTO>? posCashdrawerContainerDTOList})
      : _peripheralContainerDTOList = peripheralContainerDTOList,
        _posProductExclusionsContainerDTOList =
            posProductExclusionsContainerDTOList,
        _posPaymentModeInclusionContainerDTOList =
            posPaymentModeInclusionContainerDTOList,
        _productDisplayGroupFormatContainerDTOList =
            productDisplayGroupFormatContainerDTOList,
        _posPrinterContainerDTOList = posPrinterContainerDTOList,
        _includedProductIdList = includedProductIdList,
        _productMenuIdList = productMenuIdList,
        _facilityIdList = facilityIdList,
        _excludedProductMenuPanelIdList = excludedProductMenuPanelIdList,
        _posCashdrawerContainerDTOList = posCashdrawerContainerDTOList;

  factory _$_POSMachineContainerDTO.fromJson(Map<String, dynamic> json) =>
      _$$_POSMachineContainerDTOFromJson(json);

  @override
  @JsonKey(name: 'POSMachineId')
  final int posMachineId;
  @override
  @JsonKey(name: 'POSName')
  final String posName;
  @override
  @JsonKey(name: 'PosTypeName')
  final String posTypeName;
  @override
  @JsonKey(name: 'POSTypeId')
  final int posTypeId;
  @override
  @JsonKey(name: 'ComputerName')
  final String computerName;
  @override
  @JsonKey(name: 'IPAddress')
  final String? ipAddress;
  @override
  @JsonKey(name: 'Attribute1')
  final String attribute1;
  @override
  @JsonKey(name: 'InventoryLocationId')
  final int inventoryLocationId;
  @override
  @JsonKey(name: 'Guid')
  final String guid;
  final List<PeripheralContainerDTO> _peripheralContainerDTOList;
  @override
  @JsonKey(name: 'PeripheralContainerDTOList')
  List<PeripheralContainerDTO> get peripheralContainerDTOList {
    if (_peripheralContainerDTOList is EqualUnmodifiableListView)
      return _peripheralContainerDTOList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_peripheralContainerDTOList);
  }

  final List<POSProductExclusionsContainerDTO>
      _posProductExclusionsContainerDTOList;
  @override
  @JsonKey(name: 'POSProductExclusionsContainerDTOList')
  List<POSProductExclusionsContainerDTO>
      get posProductExclusionsContainerDTOList {
    if (_posProductExclusionsContainerDTOList is EqualUnmodifiableListView)
      return _posProductExclusionsContainerDTOList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_posProductExclusionsContainerDTOList);
  }

  final List<POSPaymentModeInclusionContainerDTO>
      _posPaymentModeInclusionContainerDTOList;
  @override
  @JsonKey(name: 'POSPaymentModeInclusionContainerDTOList')
  List<POSPaymentModeInclusionContainerDTO>
      get posPaymentModeInclusionContainerDTOList {
    if (_posPaymentModeInclusionContainerDTOList is EqualUnmodifiableListView)
      return _posPaymentModeInclusionContainerDTOList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_posPaymentModeInclusionContainerDTOList);
  }

  final List<ProductDisplayGroupFormatContainerDTO>
      _productDisplayGroupFormatContainerDTOList;
  @override
  @JsonKey(name: 'ProductDisplayGroupFormatContainerDTOList')
  List<ProductDisplayGroupFormatContainerDTO>
      get productDisplayGroupFormatContainerDTOList {
    if (_productDisplayGroupFormatContainerDTOList is EqualUnmodifiableListView)
      return _productDisplayGroupFormatContainerDTOList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(
        _productDisplayGroupFormatContainerDTOList);
  }

  final List<POSPrinterContainerDTO> _posPrinterContainerDTOList;
  @override
  @JsonKey(name: 'POSPrinterContainerDTOList')
  List<POSPrinterContainerDTO> get posPrinterContainerDTOList {
    if (_posPrinterContainerDTOList is EqualUnmodifiableListView)
      return _posPrinterContainerDTOList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_posPrinterContainerDTOList);
  }

  final List<int> _includedProductIdList;
  @override
  @JsonKey(name: 'IncludedProductIdList')
  List<int> get includedProductIdList {
    if (_includedProductIdList is EqualUnmodifiableListView)
      return _includedProductIdList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_includedProductIdList);
  }

  final List<int> _productMenuIdList;
  @override
  @JsonKey(name: 'ProductMenuIdList')
  List<int> get productMenuIdList {
    if (_productMenuIdList is EqualUnmodifiableListView)
      return _productMenuIdList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_productMenuIdList);
  }

  final List<int> _facilityIdList;
  @override
  @JsonKey(name: 'FacilityIdList')
  List<int> get facilityIdList {
    if (_facilityIdList is EqualUnmodifiableListView) return _facilityIdList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_facilityIdList);
  }

  final List<dynamic> _excludedProductMenuPanelIdList;
  @override
  @JsonKey(name: 'ExcludedProductMenuPanelIdList')
  List<dynamic> get excludedProductMenuPanelIdList {
    if (_excludedProductMenuPanelIdList is EqualUnmodifiableListView)
      return _excludedProductMenuPanelIdList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_excludedProductMenuPanelIdList);
  }

  final List<POSCashDrawerContainerDTO>? _posCashdrawerContainerDTOList;
  @override
  @JsonKey(name: 'POSCashdrawerContainerDTOList')
  List<POSCashDrawerContainerDTO>? get posCashdrawerContainerDTOList {
    final value = _posCashdrawerContainerDTOList;
    if (value == null) return null;
    if (_posCashdrawerContainerDTOList is EqualUnmodifiableListView)
      return _posCashdrawerContainerDTOList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'POSMachineContainerDTO(posMachineId: $posMachineId, posName: $posName, posTypeName: $posTypeName, posTypeId: $posTypeId, computerName: $computerName, ipAddress: $ipAddress, attribute1: $attribute1, inventoryLocationId: $inventoryLocationId, guid: $guid, peripheralContainerDTOList: $peripheralContainerDTOList, posProductExclusionsContainerDTOList: $posProductExclusionsContainerDTOList, posPaymentModeInclusionContainerDTOList: $posPaymentModeInclusionContainerDTOList, productDisplayGroupFormatContainerDTOList: $productDisplayGroupFormatContainerDTOList, posPrinterContainerDTOList: $posPrinterContainerDTOList, includedProductIdList: $includedProductIdList, productMenuIdList: $productMenuIdList, facilityIdList: $facilityIdList, excludedProductMenuPanelIdList: $excludedProductMenuPanelIdList, posCashdrawerContainerDTOList: $posCashdrawerContainerDTOList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_POSMachineContainerDTO &&
            (identical(other.posMachineId, posMachineId) ||
                other.posMachineId == posMachineId) &&
            (identical(other.posName, posName) || other.posName == posName) &&
            (identical(other.posTypeName, posTypeName) ||
                other.posTypeName == posTypeName) &&
            (identical(other.posTypeId, posTypeId) ||
                other.posTypeId == posTypeId) &&
            (identical(other.computerName, computerName) ||
                other.computerName == computerName) &&
            (identical(other.ipAddress, ipAddress) ||
                other.ipAddress == ipAddress) &&
            (identical(other.attribute1, attribute1) ||
                other.attribute1 == attribute1) &&
            (identical(other.inventoryLocationId, inventoryLocationId) ||
                other.inventoryLocationId == inventoryLocationId) &&
            (identical(other.guid, guid) || other.guid == guid) &&
            const DeepCollectionEquality().equals(
                other._peripheralContainerDTOList,
                _peripheralContainerDTOList) &&
            const DeepCollectionEquality().equals(
                other._posProductExclusionsContainerDTOList,
                _posProductExclusionsContainerDTOList) &&
            const DeepCollectionEquality().equals(
                other._posPaymentModeInclusionContainerDTOList,
                _posPaymentModeInclusionContainerDTOList) &&
            const DeepCollectionEquality().equals(
                other._productDisplayGroupFormatContainerDTOList,
                _productDisplayGroupFormatContainerDTOList) &&
            const DeepCollectionEquality().equals(
                other._posPrinterContainerDTOList,
                _posPrinterContainerDTOList) &&
            const DeepCollectionEquality()
                .equals(other._includedProductIdList, _includedProductIdList) &&
            const DeepCollectionEquality()
                .equals(other._productMenuIdList, _productMenuIdList) &&
            const DeepCollectionEquality()
                .equals(other._facilityIdList, _facilityIdList) &&
            const DeepCollectionEquality().equals(
                other._excludedProductMenuPanelIdList,
                _excludedProductMenuPanelIdList) &&
            const DeepCollectionEquality().equals(
                other._posCashdrawerContainerDTOList,
                _posCashdrawerContainerDTOList));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        posMachineId,
        posName,
        posTypeName,
        posTypeId,
        computerName,
        ipAddress,
        attribute1,
        inventoryLocationId,
        guid,
        const DeepCollectionEquality().hash(_peripheralContainerDTOList),
        const DeepCollectionEquality()
            .hash(_posProductExclusionsContainerDTOList),
        const DeepCollectionEquality()
            .hash(_posPaymentModeInclusionContainerDTOList),
        const DeepCollectionEquality()
            .hash(_productDisplayGroupFormatContainerDTOList),
        const DeepCollectionEquality().hash(_posPrinterContainerDTOList),
        const DeepCollectionEquality().hash(_includedProductIdList),
        const DeepCollectionEquality().hash(_productMenuIdList),
        const DeepCollectionEquality().hash(_facilityIdList),
        const DeepCollectionEquality().hash(_excludedProductMenuPanelIdList),
        const DeepCollectionEquality().hash(_posCashdrawerContainerDTOList)
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_POSMachineContainerDTOCopyWith<_$_POSMachineContainerDTO> get copyWith =>
      __$$_POSMachineContainerDTOCopyWithImpl<_$_POSMachineContainerDTO>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_POSMachineContainerDTOToJson(
      this,
    );
  }
}

abstract class _POSMachineContainerDTO implements POSMachineContainerDTO {
  const factory _POSMachineContainerDTO(
      {@JsonKey(name: 'POSMachineId')
          required final int posMachineId,
      @JsonKey(name: 'POSName')
          required final String posName,
      @JsonKey(name: 'PosTypeName')
          required final String posTypeName,
      @JsonKey(name: 'POSTypeId')
          required final int posTypeId,
      @JsonKey(name: 'ComputerName')
          required final String computerName,
      @JsonKey(name: 'IPAddress')
          final String? ipAddress,
      @JsonKey(name: 'Attribute1')
          required final String attribute1,
      @JsonKey(name: 'InventoryLocationId')
          required final int inventoryLocationId,
      @JsonKey(name: 'Guid')
          required final String guid,
      @JsonKey(name: 'PeripheralContainerDTOList')
          required final List<PeripheralContainerDTO>
              peripheralContainerDTOList,
      @JsonKey(name: 'POSProductExclusionsContainerDTOList')
          required final List<POSProductExclusionsContainerDTO>
              posProductExclusionsContainerDTOList,
      @JsonKey(name: 'POSPaymentModeInclusionContainerDTOList')
          required final List<POSPaymentModeInclusionContainerDTO>
              posPaymentModeInclusionContainerDTOList,
      @JsonKey(name: 'ProductDisplayGroupFormatContainerDTOList')
          required final List<ProductDisplayGroupFormatContainerDTO>
              productDisplayGroupFormatContainerDTOList,
      @JsonKey(name: 'POSPrinterContainerDTOList')
          required final List<POSPrinterContainerDTO>
              posPrinterContainerDTOList,
      @JsonKey(name: 'IncludedProductIdList')
          required final List<int> includedProductIdList,
      @JsonKey(name: 'ProductMenuIdList')
          required final List<int> productMenuIdList,
      @JsonKey(name: 'FacilityIdList')
          required final List<int> facilityIdList,
      @JsonKey(name: 'ExcludedProductMenuPanelIdList')
          required final List<dynamic> excludedProductMenuPanelIdList,
      @JsonKey(name: 'POSCashdrawerContainerDTOList')
          final List<POSCashDrawerContainerDTO>?
              posCashdrawerContainerDTOList}) = _$_POSMachineContainerDTO;

  factory _POSMachineContainerDTO.fromJson(Map<String, dynamic> json) =
      _$_POSMachineContainerDTO.fromJson;

  @override
  @JsonKey(name: 'POSMachineId')
  int get posMachineId;
  @override
  @JsonKey(name: 'POSName')
  String get posName;
  @override
  @JsonKey(name: 'PosTypeName')
  String get posTypeName;
  @override
  @JsonKey(name: 'POSTypeId')
  int get posTypeId;
  @override
  @JsonKey(name: 'ComputerName')
  String get computerName;
  @override
  @JsonKey(name: 'IPAddress')
  String? get ipAddress;
  @override
  @JsonKey(name: 'Attribute1')
  String get attribute1;
  @override
  @JsonKey(name: 'InventoryLocationId')
  int get inventoryLocationId;
  @override
  @JsonKey(name: 'Guid')
  String get guid;
  @override
  @JsonKey(name: 'PeripheralContainerDTOList')
  List<PeripheralContainerDTO> get peripheralContainerDTOList;
  @override
  @JsonKey(name: 'POSProductExclusionsContainerDTOList')
  List<POSProductExclusionsContainerDTO>
      get posProductExclusionsContainerDTOList;
  @override
  @JsonKey(name: 'POSPaymentModeInclusionContainerDTOList')
  List<POSPaymentModeInclusionContainerDTO>
      get posPaymentModeInclusionContainerDTOList;
  @override
  @JsonKey(name: 'ProductDisplayGroupFormatContainerDTOList')
  List<ProductDisplayGroupFormatContainerDTO>
      get productDisplayGroupFormatContainerDTOList;
  @override
  @JsonKey(name: 'POSPrinterContainerDTOList')
  List<POSPrinterContainerDTO> get posPrinterContainerDTOList;
  @override
  @JsonKey(name: 'IncludedProductIdList')
  List<int> get includedProductIdList;
  @override
  @JsonKey(name: 'ProductMenuIdList')
  List<int> get productMenuIdList;
  @override
  @JsonKey(name: 'FacilityIdList')
  List<int> get facilityIdList;
  @override
  @JsonKey(name: 'ExcludedProductMenuPanelIdList')
  List<dynamic> get excludedProductMenuPanelIdList;
  @override
  @JsonKey(name: 'POSCashdrawerContainerDTOList')
  List<POSCashDrawerContainerDTO>? get posCashdrawerContainerDTOList;
  @override
  @JsonKey(ignore: true)
  _$$_POSMachineContainerDTOCopyWith<_$_POSMachineContainerDTO> get copyWith =>
      throw _privateConstructorUsedError;
}
