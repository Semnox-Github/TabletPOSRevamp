// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'facility_container_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FacilityContainerDTO _$FacilityContainerDTOFromJson(Map<String, dynamic> json) {
  return _FacilityContainerDTO.fromJson(json);
}

/// @nodoc
mixin _$FacilityContainerDTO {
  @JsonKey(name: "FacilityId")
  int get facilityId => throw _privateConstructorUsedError;
  @JsonKey(name: "FacilityName")
  String get facilityName => throw _privateConstructorUsedError;
  @JsonKey(name: "Description")
  String get description => throw _privateConstructorUsedError;
  @JsonKey(name: "ActiveFlag")
  bool get activeFlag => throw _privateConstructorUsedError;
  @JsonKey(name: "AllowMultipleBookings")
  bool get allowMultipleBookings => throw _privateConstructorUsedError;
  @JsonKey(name: "Capacity")
  dynamic get capacity => throw _privateConstructorUsedError;
  @JsonKey(name: "InternetKey")
  dynamic get internetKey => throw _privateConstructorUsedError;
  @JsonKey(name: "Guid")
  String get guid => throw _privateConstructorUsedError;
  @JsonKey(name: "ScreenPosition")
  String get screenPosition => throw _privateConstructorUsedError;
  @JsonKey(name: "FacilityType")
  int get facilityType => throw _privateConstructorUsedError;
  @JsonKey(name: "MaxRowIndex")
  dynamic get maxRowIndex => throw _privateConstructorUsedError;
  @JsonKey(name: "MaxColIndex")
  dynamic get maxColIndex => throw _privateConstructorUsedError;
  @JsonKey(name: "InterfaceType")
  int get interfaceType => throw _privateConstructorUsedError;
  @JsonKey(name: "InterfaceName")
  int get interfaceName => throw _privateConstructorUsedError;
  @JsonKey(name: "ExternalSystemReference")
  String get externalSystemReference => throw _privateConstructorUsedError;
  @JsonKey(name: "ImageFileName")
  String get imageFileName => throw _privateConstructorUsedError;
  @JsonKey(name: "FacilityWidth")
  dynamic get facilityWidth => throw _privateConstructorUsedError;
  @JsonKey(name: "FacilityHeight")
  dynamic get facilityHeight => throw _privateConstructorUsedError;
  @JsonKey(name: "AutoTableLayout")
  bool get autoTableLayout =>
      throw _privateConstructorUsedError; /* @JsonKey(name: "FacilitySeatsContainerDTOList")
    List<FacilitySeatsContainerDTO> facilitySeatsContainerDTOList,
    @JsonKey(name: "FacilitySeatLayoutContainerDTOList")
    List<FacilitySeatLayoutContainerDTO> facilitySeatLayoutContainerDTOList,
    @JsonKey(name: "FacilityWaiverContainerDTOList")
    List<FacilityWaiverContainerDTO> int facilityWaiverContainerDTOList,*/
  @JsonKey(name: "FacilityTableContainerDTOList")
  List<FacilityTableContainerDTO> get facilityTableContainerDTOList =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FacilityContainerDTOCopyWith<FacilityContainerDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FacilityContainerDTOCopyWith<$Res> {
  factory $FacilityContainerDTOCopyWith(FacilityContainerDTO value,
          $Res Function(FacilityContainerDTO) then) =
      _$FacilityContainerDTOCopyWithImpl<$Res, FacilityContainerDTO>;
  @useResult
  $Res call(
      {@JsonKey(name: "FacilityId")
          int facilityId,
      @JsonKey(name: "FacilityName")
          String facilityName,
      @JsonKey(name: "Description")
          String description,
      @JsonKey(name: "ActiveFlag")
          bool activeFlag,
      @JsonKey(name: "AllowMultipleBookings")
          bool allowMultipleBookings,
      @JsonKey(name: "Capacity")
          dynamic capacity,
      @JsonKey(name: "InternetKey")
          dynamic internetKey,
      @JsonKey(name: "Guid")
          String guid,
      @JsonKey(name: "ScreenPosition")
          String screenPosition,
      @JsonKey(name: "FacilityType")
          int facilityType,
      @JsonKey(name: "MaxRowIndex")
          dynamic maxRowIndex,
      @JsonKey(name: "MaxColIndex")
          dynamic maxColIndex,
      @JsonKey(name: "InterfaceType")
          int interfaceType,
      @JsonKey(name: "InterfaceName")
          int interfaceName,
      @JsonKey(name: "ExternalSystemReference")
          String externalSystemReference,
      @JsonKey(name: "ImageFileName")
          String imageFileName,
      @JsonKey(name: "FacilityWidth")
          dynamic facilityWidth,
      @JsonKey(name: "FacilityHeight")
          dynamic facilityHeight,
      @JsonKey(name: "AutoTableLayout")
          bool autoTableLayout,
      @JsonKey(name: "FacilityTableContainerDTOList")
          List<FacilityTableContainerDTO> facilityTableContainerDTOList});
}

/// @nodoc
class _$FacilityContainerDTOCopyWithImpl<$Res,
        $Val extends FacilityContainerDTO>
    implements $FacilityContainerDTOCopyWith<$Res> {
  _$FacilityContainerDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? facilityId = null,
    Object? facilityName = null,
    Object? description = null,
    Object? activeFlag = null,
    Object? allowMultipleBookings = null,
    Object? capacity = freezed,
    Object? internetKey = freezed,
    Object? guid = null,
    Object? screenPosition = null,
    Object? facilityType = null,
    Object? maxRowIndex = freezed,
    Object? maxColIndex = freezed,
    Object? interfaceType = null,
    Object? interfaceName = null,
    Object? externalSystemReference = null,
    Object? imageFileName = null,
    Object? facilityWidth = freezed,
    Object? facilityHeight = freezed,
    Object? autoTableLayout = null,
    Object? facilityTableContainerDTOList = null,
  }) {
    return _then(_value.copyWith(
      facilityId: null == facilityId
          ? _value.facilityId
          : facilityId // ignore: cast_nullable_to_non_nullable
              as int,
      facilityName: null == facilityName
          ? _value.facilityName
          : facilityName // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      activeFlag: null == activeFlag
          ? _value.activeFlag
          : activeFlag // ignore: cast_nullable_to_non_nullable
              as bool,
      allowMultipleBookings: null == allowMultipleBookings
          ? _value.allowMultipleBookings
          : allowMultipleBookings // ignore: cast_nullable_to_non_nullable
              as bool,
      capacity: freezed == capacity
          ? _value.capacity
          : capacity // ignore: cast_nullable_to_non_nullable
              as dynamic,
      internetKey: freezed == internetKey
          ? _value.internetKey
          : internetKey // ignore: cast_nullable_to_non_nullable
              as dynamic,
      guid: null == guid
          ? _value.guid
          : guid // ignore: cast_nullable_to_non_nullable
              as String,
      screenPosition: null == screenPosition
          ? _value.screenPosition
          : screenPosition // ignore: cast_nullable_to_non_nullable
              as String,
      facilityType: null == facilityType
          ? _value.facilityType
          : facilityType // ignore: cast_nullable_to_non_nullable
              as int,
      maxRowIndex: freezed == maxRowIndex
          ? _value.maxRowIndex
          : maxRowIndex // ignore: cast_nullable_to_non_nullable
              as dynamic,
      maxColIndex: freezed == maxColIndex
          ? _value.maxColIndex
          : maxColIndex // ignore: cast_nullable_to_non_nullable
              as dynamic,
      interfaceType: null == interfaceType
          ? _value.interfaceType
          : interfaceType // ignore: cast_nullable_to_non_nullable
              as int,
      interfaceName: null == interfaceName
          ? _value.interfaceName
          : interfaceName // ignore: cast_nullable_to_non_nullable
              as int,
      externalSystemReference: null == externalSystemReference
          ? _value.externalSystemReference
          : externalSystemReference // ignore: cast_nullable_to_non_nullable
              as String,
      imageFileName: null == imageFileName
          ? _value.imageFileName
          : imageFileName // ignore: cast_nullable_to_non_nullable
              as String,
      facilityWidth: freezed == facilityWidth
          ? _value.facilityWidth
          : facilityWidth // ignore: cast_nullable_to_non_nullable
              as dynamic,
      facilityHeight: freezed == facilityHeight
          ? _value.facilityHeight
          : facilityHeight // ignore: cast_nullable_to_non_nullable
              as dynamic,
      autoTableLayout: null == autoTableLayout
          ? _value.autoTableLayout
          : autoTableLayout // ignore: cast_nullable_to_non_nullable
              as bool,
      facilityTableContainerDTOList: null == facilityTableContainerDTOList
          ? _value.facilityTableContainerDTOList
          : facilityTableContainerDTOList // ignore: cast_nullable_to_non_nullable
              as List<FacilityTableContainerDTO>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_FacilityContainerDTOCopyWith<$Res>
    implements $FacilityContainerDTOCopyWith<$Res> {
  factory _$$_FacilityContainerDTOCopyWith(_$_FacilityContainerDTO value,
          $Res Function(_$_FacilityContainerDTO) then) =
      __$$_FacilityContainerDTOCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "FacilityId")
          int facilityId,
      @JsonKey(name: "FacilityName")
          String facilityName,
      @JsonKey(name: "Description")
          String description,
      @JsonKey(name: "ActiveFlag")
          bool activeFlag,
      @JsonKey(name: "AllowMultipleBookings")
          bool allowMultipleBookings,
      @JsonKey(name: "Capacity")
          dynamic capacity,
      @JsonKey(name: "InternetKey")
          dynamic internetKey,
      @JsonKey(name: "Guid")
          String guid,
      @JsonKey(name: "ScreenPosition")
          String screenPosition,
      @JsonKey(name: "FacilityType")
          int facilityType,
      @JsonKey(name: "MaxRowIndex")
          dynamic maxRowIndex,
      @JsonKey(name: "MaxColIndex")
          dynamic maxColIndex,
      @JsonKey(name: "InterfaceType")
          int interfaceType,
      @JsonKey(name: "InterfaceName")
          int interfaceName,
      @JsonKey(name: "ExternalSystemReference")
          String externalSystemReference,
      @JsonKey(name: "ImageFileName")
          String imageFileName,
      @JsonKey(name: "FacilityWidth")
          dynamic facilityWidth,
      @JsonKey(name: "FacilityHeight")
          dynamic facilityHeight,
      @JsonKey(name: "AutoTableLayout")
          bool autoTableLayout,
      @JsonKey(name: "FacilityTableContainerDTOList")
          List<FacilityTableContainerDTO> facilityTableContainerDTOList});
}

/// @nodoc
class __$$_FacilityContainerDTOCopyWithImpl<$Res>
    extends _$FacilityContainerDTOCopyWithImpl<$Res, _$_FacilityContainerDTO>
    implements _$$_FacilityContainerDTOCopyWith<$Res> {
  __$$_FacilityContainerDTOCopyWithImpl(_$_FacilityContainerDTO _value,
      $Res Function(_$_FacilityContainerDTO) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? facilityId = null,
    Object? facilityName = null,
    Object? description = null,
    Object? activeFlag = null,
    Object? allowMultipleBookings = null,
    Object? capacity = freezed,
    Object? internetKey = freezed,
    Object? guid = null,
    Object? screenPosition = null,
    Object? facilityType = null,
    Object? maxRowIndex = freezed,
    Object? maxColIndex = freezed,
    Object? interfaceType = null,
    Object? interfaceName = null,
    Object? externalSystemReference = null,
    Object? imageFileName = null,
    Object? facilityWidth = freezed,
    Object? facilityHeight = freezed,
    Object? autoTableLayout = null,
    Object? facilityTableContainerDTOList = null,
  }) {
    return _then(_$_FacilityContainerDTO(
      facilityId: null == facilityId
          ? _value.facilityId
          : facilityId // ignore: cast_nullable_to_non_nullable
              as int,
      facilityName: null == facilityName
          ? _value.facilityName
          : facilityName // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      activeFlag: null == activeFlag
          ? _value.activeFlag
          : activeFlag // ignore: cast_nullable_to_non_nullable
              as bool,
      allowMultipleBookings: null == allowMultipleBookings
          ? _value.allowMultipleBookings
          : allowMultipleBookings // ignore: cast_nullable_to_non_nullable
              as bool,
      capacity: freezed == capacity
          ? _value.capacity
          : capacity // ignore: cast_nullable_to_non_nullable
              as dynamic,
      internetKey: freezed == internetKey
          ? _value.internetKey
          : internetKey // ignore: cast_nullable_to_non_nullable
              as dynamic,
      guid: null == guid
          ? _value.guid
          : guid // ignore: cast_nullable_to_non_nullable
              as String,
      screenPosition: null == screenPosition
          ? _value.screenPosition
          : screenPosition // ignore: cast_nullable_to_non_nullable
              as String,
      facilityType: null == facilityType
          ? _value.facilityType
          : facilityType // ignore: cast_nullable_to_non_nullable
              as int,
      maxRowIndex: freezed == maxRowIndex
          ? _value.maxRowIndex
          : maxRowIndex // ignore: cast_nullable_to_non_nullable
              as dynamic,
      maxColIndex: freezed == maxColIndex
          ? _value.maxColIndex
          : maxColIndex // ignore: cast_nullable_to_non_nullable
              as dynamic,
      interfaceType: null == interfaceType
          ? _value.interfaceType
          : interfaceType // ignore: cast_nullable_to_non_nullable
              as int,
      interfaceName: null == interfaceName
          ? _value.interfaceName
          : interfaceName // ignore: cast_nullable_to_non_nullable
              as int,
      externalSystemReference: null == externalSystemReference
          ? _value.externalSystemReference
          : externalSystemReference // ignore: cast_nullable_to_non_nullable
              as String,
      imageFileName: null == imageFileName
          ? _value.imageFileName
          : imageFileName // ignore: cast_nullable_to_non_nullable
              as String,
      facilityWidth: freezed == facilityWidth
          ? _value.facilityWidth
          : facilityWidth // ignore: cast_nullable_to_non_nullable
              as dynamic,
      facilityHeight: freezed == facilityHeight
          ? _value.facilityHeight
          : facilityHeight // ignore: cast_nullable_to_non_nullable
              as dynamic,
      autoTableLayout: null == autoTableLayout
          ? _value.autoTableLayout
          : autoTableLayout // ignore: cast_nullable_to_non_nullable
              as bool,
      facilityTableContainerDTOList: null == facilityTableContainerDTOList
          ? _value._facilityTableContainerDTOList
          : facilityTableContainerDTOList // ignore: cast_nullable_to_non_nullable
              as List<FacilityTableContainerDTO>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_FacilityContainerDTO implements _FacilityContainerDTO {
  const _$_FacilityContainerDTO(
      {@JsonKey(name: "FacilityId")
          required this.facilityId,
      @JsonKey(name: "FacilityName")
          required this.facilityName,
      @JsonKey(name: "Description")
          required this.description,
      @JsonKey(name: "ActiveFlag")
          required this.activeFlag,
      @JsonKey(name: "AllowMultipleBookings")
          required this.allowMultipleBookings,
      @JsonKey(name: "Capacity")
          this.capacity,
      @JsonKey(name: "InternetKey")
          this.internetKey,
      @JsonKey(name: "Guid")
          required this.guid,
      @JsonKey(name: "ScreenPosition")
          required this.screenPosition,
      @JsonKey(name: "FacilityType")
          required this.facilityType,
      @JsonKey(name: "MaxRowIndex")
          this.maxRowIndex,
      @JsonKey(name: "MaxColIndex")
          this.maxColIndex,
      @JsonKey(name: "InterfaceType")
          required this.interfaceType,
      @JsonKey(name: "InterfaceName")
          required this.interfaceName,
      @JsonKey(name: "ExternalSystemReference")
          required this.externalSystemReference,
      @JsonKey(name: "ImageFileName")
          required this.imageFileName,
      @JsonKey(name: "FacilityWidth")
          this.facilityWidth,
      @JsonKey(name: "FacilityHeight")
          this.facilityHeight,
      @JsonKey(name: "AutoTableLayout")
          required this.autoTableLayout,
      @JsonKey(name: "FacilityTableContainerDTOList")
          required final List<FacilityTableContainerDTO>
              facilityTableContainerDTOList})
      : _facilityTableContainerDTOList = facilityTableContainerDTOList;

  factory _$_FacilityContainerDTO.fromJson(Map<String, dynamic> json) =>
      _$$_FacilityContainerDTOFromJson(json);

  @override
  @JsonKey(name: "FacilityId")
  final int facilityId;
  @override
  @JsonKey(name: "FacilityName")
  final String facilityName;
  @override
  @JsonKey(name: "Description")
  final String description;
  @override
  @JsonKey(name: "ActiveFlag")
  final bool activeFlag;
  @override
  @JsonKey(name: "AllowMultipleBookings")
  final bool allowMultipleBookings;
  @override
  @JsonKey(name: "Capacity")
  final dynamic capacity;
  @override
  @JsonKey(name: "InternetKey")
  final dynamic internetKey;
  @override
  @JsonKey(name: "Guid")
  final String guid;
  @override
  @JsonKey(name: "ScreenPosition")
  final String screenPosition;
  @override
  @JsonKey(name: "FacilityType")
  final int facilityType;
  @override
  @JsonKey(name: "MaxRowIndex")
  final dynamic maxRowIndex;
  @override
  @JsonKey(name: "MaxColIndex")
  final dynamic maxColIndex;
  @override
  @JsonKey(name: "InterfaceType")
  final int interfaceType;
  @override
  @JsonKey(name: "InterfaceName")
  final int interfaceName;
  @override
  @JsonKey(name: "ExternalSystemReference")
  final String externalSystemReference;
  @override
  @JsonKey(name: "ImageFileName")
  final String imageFileName;
  @override
  @JsonKey(name: "FacilityWidth")
  final dynamic facilityWidth;
  @override
  @JsonKey(name: "FacilityHeight")
  final dynamic facilityHeight;
  @override
  @JsonKey(name: "AutoTableLayout")
  final bool autoTableLayout;
/* @JsonKey(name: "FacilitySeatsContainerDTOList")
    List<FacilitySeatsContainerDTO> facilitySeatsContainerDTOList,
    @JsonKey(name: "FacilitySeatLayoutContainerDTOList")
    List<FacilitySeatLayoutContainerDTO> facilitySeatLayoutContainerDTOList,
    @JsonKey(name: "FacilityWaiverContainerDTOList")
    List<FacilityWaiverContainerDTO> int facilityWaiverContainerDTOList,*/
  final List<FacilityTableContainerDTO> _facilityTableContainerDTOList;
/* @JsonKey(name: "FacilitySeatsContainerDTOList")
    List<FacilitySeatsContainerDTO> facilitySeatsContainerDTOList,
    @JsonKey(name: "FacilitySeatLayoutContainerDTOList")
    List<FacilitySeatLayoutContainerDTO> facilitySeatLayoutContainerDTOList,
    @JsonKey(name: "FacilityWaiverContainerDTOList")
    List<FacilityWaiverContainerDTO> int facilityWaiverContainerDTOList,*/
  @override
  @JsonKey(name: "FacilityTableContainerDTOList")
  List<FacilityTableContainerDTO> get facilityTableContainerDTOList {
    if (_facilityTableContainerDTOList is EqualUnmodifiableListView)
      return _facilityTableContainerDTOList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_facilityTableContainerDTOList);
  }

  @override
  String toString() {
    return 'FacilityContainerDTO(facilityId: $facilityId, facilityName: $facilityName, description: $description, activeFlag: $activeFlag, allowMultipleBookings: $allowMultipleBookings, capacity: $capacity, internetKey: $internetKey, guid: $guid, screenPosition: $screenPosition, facilityType: $facilityType, maxRowIndex: $maxRowIndex, maxColIndex: $maxColIndex, interfaceType: $interfaceType, interfaceName: $interfaceName, externalSystemReference: $externalSystemReference, imageFileName: $imageFileName, facilityWidth: $facilityWidth, facilityHeight: $facilityHeight, autoTableLayout: $autoTableLayout, facilityTableContainerDTOList: $facilityTableContainerDTOList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FacilityContainerDTO &&
            (identical(other.facilityId, facilityId) ||
                other.facilityId == facilityId) &&
            (identical(other.facilityName, facilityName) ||
                other.facilityName == facilityName) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.activeFlag, activeFlag) ||
                other.activeFlag == activeFlag) &&
            (identical(other.allowMultipleBookings, allowMultipleBookings) ||
                other.allowMultipleBookings == allowMultipleBookings) &&
            const DeepCollectionEquality().equals(other.capacity, capacity) &&
            const DeepCollectionEquality()
                .equals(other.internetKey, internetKey) &&
            (identical(other.guid, guid) || other.guid == guid) &&
            (identical(other.screenPosition, screenPosition) ||
                other.screenPosition == screenPosition) &&
            (identical(other.facilityType, facilityType) ||
                other.facilityType == facilityType) &&
            const DeepCollectionEquality()
                .equals(other.maxRowIndex, maxRowIndex) &&
            const DeepCollectionEquality()
                .equals(other.maxColIndex, maxColIndex) &&
            (identical(other.interfaceType, interfaceType) ||
                other.interfaceType == interfaceType) &&
            (identical(other.interfaceName, interfaceName) ||
                other.interfaceName == interfaceName) &&
            (identical(
                    other.externalSystemReference, externalSystemReference) ||
                other.externalSystemReference == externalSystemReference) &&
            (identical(other.imageFileName, imageFileName) ||
                other.imageFileName == imageFileName) &&
            const DeepCollectionEquality()
                .equals(other.facilityWidth, facilityWidth) &&
            const DeepCollectionEquality()
                .equals(other.facilityHeight, facilityHeight) &&
            (identical(other.autoTableLayout, autoTableLayout) ||
                other.autoTableLayout == autoTableLayout) &&
            const DeepCollectionEquality().equals(
                other._facilityTableContainerDTOList,
                _facilityTableContainerDTOList));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        facilityId,
        facilityName,
        description,
        activeFlag,
        allowMultipleBookings,
        const DeepCollectionEquality().hash(capacity),
        const DeepCollectionEquality().hash(internetKey),
        guid,
        screenPosition,
        facilityType,
        const DeepCollectionEquality().hash(maxRowIndex),
        const DeepCollectionEquality().hash(maxColIndex),
        interfaceType,
        interfaceName,
        externalSystemReference,
        imageFileName,
        const DeepCollectionEquality().hash(facilityWidth),
        const DeepCollectionEquality().hash(facilityHeight),
        autoTableLayout,
        const DeepCollectionEquality().hash(_facilityTableContainerDTOList)
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FacilityContainerDTOCopyWith<_$_FacilityContainerDTO> get copyWith =>
      __$$_FacilityContainerDTOCopyWithImpl<_$_FacilityContainerDTO>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FacilityContainerDTOToJson(
      this,
    );
  }
}

abstract class _FacilityContainerDTO implements FacilityContainerDTO {
  const factory _FacilityContainerDTO(
      {@JsonKey(name: "FacilityId")
          required final int facilityId,
      @JsonKey(name: "FacilityName")
          required final String facilityName,
      @JsonKey(name: "Description")
          required final String description,
      @JsonKey(name: "ActiveFlag")
          required final bool activeFlag,
      @JsonKey(name: "AllowMultipleBookings")
          required final bool allowMultipleBookings,
      @JsonKey(name: "Capacity")
          final dynamic capacity,
      @JsonKey(name: "InternetKey")
          final dynamic internetKey,
      @JsonKey(name: "Guid")
          required final String guid,
      @JsonKey(name: "ScreenPosition")
          required final String screenPosition,
      @JsonKey(name: "FacilityType")
          required final int facilityType,
      @JsonKey(name: "MaxRowIndex")
          final dynamic maxRowIndex,
      @JsonKey(name: "MaxColIndex")
          final dynamic maxColIndex,
      @JsonKey(name: "InterfaceType")
          required final int interfaceType,
      @JsonKey(name: "InterfaceName")
          required final int interfaceName,
      @JsonKey(name: "ExternalSystemReference")
          required final String externalSystemReference,
      @JsonKey(name: "ImageFileName")
          required final String imageFileName,
      @JsonKey(name: "FacilityWidth")
          final dynamic facilityWidth,
      @JsonKey(name: "FacilityHeight")
          final dynamic facilityHeight,
      @JsonKey(name: "AutoTableLayout")
          required final bool autoTableLayout,
      @JsonKey(name: "FacilityTableContainerDTOList")
          required final List<FacilityTableContainerDTO>
              facilityTableContainerDTOList}) = _$_FacilityContainerDTO;

  factory _FacilityContainerDTO.fromJson(Map<String, dynamic> json) =
      _$_FacilityContainerDTO.fromJson;

  @override
  @JsonKey(name: "FacilityId")
  int get facilityId;
  @override
  @JsonKey(name: "FacilityName")
  String get facilityName;
  @override
  @JsonKey(name: "Description")
  String get description;
  @override
  @JsonKey(name: "ActiveFlag")
  bool get activeFlag;
  @override
  @JsonKey(name: "AllowMultipleBookings")
  bool get allowMultipleBookings;
  @override
  @JsonKey(name: "Capacity")
  dynamic get capacity;
  @override
  @JsonKey(name: "InternetKey")
  dynamic get internetKey;
  @override
  @JsonKey(name: "Guid")
  String get guid;
  @override
  @JsonKey(name: "ScreenPosition")
  String get screenPosition;
  @override
  @JsonKey(name: "FacilityType")
  int get facilityType;
  @override
  @JsonKey(name: "MaxRowIndex")
  dynamic get maxRowIndex;
  @override
  @JsonKey(name: "MaxColIndex")
  dynamic get maxColIndex;
  @override
  @JsonKey(name: "InterfaceType")
  int get interfaceType;
  @override
  @JsonKey(name: "InterfaceName")
  int get interfaceName;
  @override
  @JsonKey(name: "ExternalSystemReference")
  String get externalSystemReference;
  @override
  @JsonKey(name: "ImageFileName")
  String get imageFileName;
  @override
  @JsonKey(name: "FacilityWidth")
  dynamic get facilityWidth;
  @override
  @JsonKey(name: "FacilityHeight")
  dynamic get facilityHeight;
  @override
  @JsonKey(name: "AutoTableLayout")
  bool get autoTableLayout;
  @override /* @JsonKey(name: "FacilitySeatsContainerDTOList")
    List<FacilitySeatsContainerDTO> facilitySeatsContainerDTOList,
    @JsonKey(name: "FacilitySeatLayoutContainerDTOList")
    List<FacilitySeatLayoutContainerDTO> facilitySeatLayoutContainerDTOList,
    @JsonKey(name: "FacilityWaiverContainerDTOList")
    List<FacilityWaiverContainerDTO> int facilityWaiverContainerDTOList,*/
  @JsonKey(name: "FacilityTableContainerDTOList")
  List<FacilityTableContainerDTO> get facilityTableContainerDTOList;
  @override
  @JsonKey(ignore: true)
  _$$_FacilityContainerDTOCopyWith<_$_FacilityContainerDTO> get copyWith =>
      throw _privateConstructorUsedError;
}
