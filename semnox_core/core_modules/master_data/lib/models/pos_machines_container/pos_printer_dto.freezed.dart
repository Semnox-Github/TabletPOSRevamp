// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pos_printer_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

POSPrinterContainerDTO _$POSPrinterContainerDTOFromJson(
    Map<String, dynamic> json) {
  return _POSPrinterContainerDTO.fromJson(json);
}

/// @nodoc
mixin _$POSPrinterContainerDTO {
  @JsonKey(name: 'POSPrinterId')
  int get posPrinterId => throw _privateConstructorUsedError;
  @JsonKey(name: 'PrinterId')
  int get printerId => throw _privateConstructorUsedError;
  @JsonKey(name: 'SecondaryPrinterId')
  int? get secondaryPrinterId => throw _privateConstructorUsedError;
  @JsonKey(name: 'OrderTypeGroupId')
  int get orderTypeGroupId => throw _privateConstructorUsedError;
  @JsonKey(name: 'POSMachineId')
  int get posMachineId => throw _privateConstructorUsedError;
  @JsonKey(name: 'POSTypeId')
  int get posTypeId => throw _privateConstructorUsedError;
  @JsonKey(name: 'PrintTemplateId')
  int get printTemplateId => throw _privateConstructorUsedError;
  @JsonKey(name: 'PrinterTypeId')
  int get printerTypeId => throw _privateConstructorUsedError;
  @JsonKey(name: 'PrinterName')
  String get printerName => throw _privateConstructorUsedError;
  @JsonKey(name: 'POSPrinterOverrideRulesContainerDTOList')
  List<dynamic>? get posPrinterOverrideRulesContainerDTOList =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $POSPrinterContainerDTOCopyWith<POSPrinterContainerDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $POSPrinterContainerDTOCopyWith<$Res> {
  factory $POSPrinterContainerDTOCopyWith(POSPrinterContainerDTO value,
          $Res Function(POSPrinterContainerDTO) then) =
      _$POSPrinterContainerDTOCopyWithImpl<$Res, POSPrinterContainerDTO>;
  @useResult
  $Res call(
      {@JsonKey(name: 'POSPrinterId')
          int posPrinterId,
      @JsonKey(name: 'PrinterId')
          int printerId,
      @JsonKey(name: 'SecondaryPrinterId')
          int? secondaryPrinterId,
      @JsonKey(name: 'OrderTypeGroupId')
          int orderTypeGroupId,
      @JsonKey(name: 'POSMachineId')
          int posMachineId,
      @JsonKey(name: 'POSTypeId')
          int posTypeId,
      @JsonKey(name: 'PrintTemplateId')
          int printTemplateId,
      @JsonKey(name: 'PrinterTypeId')
          int printerTypeId,
      @JsonKey(name: 'PrinterName')
          String printerName,
      @JsonKey(name: 'POSPrinterOverrideRulesContainerDTOList')
          List<dynamic>? posPrinterOverrideRulesContainerDTOList});
}

/// @nodoc
class _$POSPrinterContainerDTOCopyWithImpl<$Res,
        $Val extends POSPrinterContainerDTO>
    implements $POSPrinterContainerDTOCopyWith<$Res> {
  _$POSPrinterContainerDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? posPrinterId = null,
    Object? printerId = null,
    Object? secondaryPrinterId = freezed,
    Object? orderTypeGroupId = null,
    Object? posMachineId = null,
    Object? posTypeId = null,
    Object? printTemplateId = null,
    Object? printerTypeId = null,
    Object? printerName = null,
    Object? posPrinterOverrideRulesContainerDTOList = freezed,
  }) {
    return _then(_value.copyWith(
      posPrinterId: null == posPrinterId
          ? _value.posPrinterId
          : posPrinterId // ignore: cast_nullable_to_non_nullable
              as int,
      printerId: null == printerId
          ? _value.printerId
          : printerId // ignore: cast_nullable_to_non_nullable
              as int,
      secondaryPrinterId: freezed == secondaryPrinterId
          ? _value.secondaryPrinterId
          : secondaryPrinterId // ignore: cast_nullable_to_non_nullable
              as int?,
      orderTypeGroupId: null == orderTypeGroupId
          ? _value.orderTypeGroupId
          : orderTypeGroupId // ignore: cast_nullable_to_non_nullable
              as int,
      posMachineId: null == posMachineId
          ? _value.posMachineId
          : posMachineId // ignore: cast_nullable_to_non_nullable
              as int,
      posTypeId: null == posTypeId
          ? _value.posTypeId
          : posTypeId // ignore: cast_nullable_to_non_nullable
              as int,
      printTemplateId: null == printTemplateId
          ? _value.printTemplateId
          : printTemplateId // ignore: cast_nullable_to_non_nullable
              as int,
      printerTypeId: null == printerTypeId
          ? _value.printerTypeId
          : printerTypeId // ignore: cast_nullable_to_non_nullable
              as int,
      printerName: null == printerName
          ? _value.printerName
          : printerName // ignore: cast_nullable_to_non_nullable
              as String,
      posPrinterOverrideRulesContainerDTOList: freezed ==
              posPrinterOverrideRulesContainerDTOList
          ? _value.posPrinterOverrideRulesContainerDTOList
          : posPrinterOverrideRulesContainerDTOList // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_POSPrinterContainerDTOCopyWith<$Res>
    implements $POSPrinterContainerDTOCopyWith<$Res> {
  factory _$$_POSPrinterContainerDTOCopyWith(_$_POSPrinterContainerDTO value,
          $Res Function(_$_POSPrinterContainerDTO) then) =
      __$$_POSPrinterContainerDTOCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'POSPrinterId')
          int posPrinterId,
      @JsonKey(name: 'PrinterId')
          int printerId,
      @JsonKey(name: 'SecondaryPrinterId')
          int? secondaryPrinterId,
      @JsonKey(name: 'OrderTypeGroupId')
          int orderTypeGroupId,
      @JsonKey(name: 'POSMachineId')
          int posMachineId,
      @JsonKey(name: 'POSTypeId')
          int posTypeId,
      @JsonKey(name: 'PrintTemplateId')
          int printTemplateId,
      @JsonKey(name: 'PrinterTypeId')
          int printerTypeId,
      @JsonKey(name: 'PrinterName')
          String printerName,
      @JsonKey(name: 'POSPrinterOverrideRulesContainerDTOList')
          List<dynamic>? posPrinterOverrideRulesContainerDTOList});
}

/// @nodoc
class __$$_POSPrinterContainerDTOCopyWithImpl<$Res>
    extends _$POSPrinterContainerDTOCopyWithImpl<$Res,
        _$_POSPrinterContainerDTO>
    implements _$$_POSPrinterContainerDTOCopyWith<$Res> {
  __$$_POSPrinterContainerDTOCopyWithImpl(_$_POSPrinterContainerDTO _value,
      $Res Function(_$_POSPrinterContainerDTO) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? posPrinterId = null,
    Object? printerId = null,
    Object? secondaryPrinterId = freezed,
    Object? orderTypeGroupId = null,
    Object? posMachineId = null,
    Object? posTypeId = null,
    Object? printTemplateId = null,
    Object? printerTypeId = null,
    Object? printerName = null,
    Object? posPrinterOverrideRulesContainerDTOList = freezed,
  }) {
    return _then(_$_POSPrinterContainerDTO(
      posPrinterId: null == posPrinterId
          ? _value.posPrinterId
          : posPrinterId // ignore: cast_nullable_to_non_nullable
              as int,
      printerId: null == printerId
          ? _value.printerId
          : printerId // ignore: cast_nullable_to_non_nullable
              as int,
      secondaryPrinterId: freezed == secondaryPrinterId
          ? _value.secondaryPrinterId
          : secondaryPrinterId // ignore: cast_nullable_to_non_nullable
              as int?,
      orderTypeGroupId: null == orderTypeGroupId
          ? _value.orderTypeGroupId
          : orderTypeGroupId // ignore: cast_nullable_to_non_nullable
              as int,
      posMachineId: null == posMachineId
          ? _value.posMachineId
          : posMachineId // ignore: cast_nullable_to_non_nullable
              as int,
      posTypeId: null == posTypeId
          ? _value.posTypeId
          : posTypeId // ignore: cast_nullable_to_non_nullable
              as int,
      printTemplateId: null == printTemplateId
          ? _value.printTemplateId
          : printTemplateId // ignore: cast_nullable_to_non_nullable
              as int,
      printerTypeId: null == printerTypeId
          ? _value.printerTypeId
          : printerTypeId // ignore: cast_nullable_to_non_nullable
              as int,
      printerName: null == printerName
          ? _value.printerName
          : printerName // ignore: cast_nullable_to_non_nullable
              as String,
      posPrinterOverrideRulesContainerDTOList: freezed ==
              posPrinterOverrideRulesContainerDTOList
          ? _value._posPrinterOverrideRulesContainerDTOList
          : posPrinterOverrideRulesContainerDTOList // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_POSPrinterContainerDTO implements _POSPrinterContainerDTO {
  const _$_POSPrinterContainerDTO(
      {@JsonKey(name: 'POSPrinterId')
          required this.posPrinterId,
      @JsonKey(name: 'PrinterId')
          required this.printerId,
      @JsonKey(name: 'SecondaryPrinterId')
          this.secondaryPrinterId,
      @JsonKey(name: 'OrderTypeGroupId')
          required this.orderTypeGroupId,
      @JsonKey(name: 'POSMachineId')
          required this.posMachineId,
      @JsonKey(name: 'POSTypeId')
          required this.posTypeId,
      @JsonKey(name: 'PrintTemplateId')
          required this.printTemplateId,
      @JsonKey(name: 'PrinterTypeId')
          required this.printerTypeId,
      @JsonKey(name: 'PrinterName')
          required this.printerName,
      @JsonKey(name: 'POSPrinterOverrideRulesContainerDTOList')
          final List<dynamic>? posPrinterOverrideRulesContainerDTOList})
      : _posPrinterOverrideRulesContainerDTOList =
            posPrinterOverrideRulesContainerDTOList;

  factory _$_POSPrinterContainerDTO.fromJson(Map<String, dynamic> json) =>
      _$$_POSPrinterContainerDTOFromJson(json);

  @override
  @JsonKey(name: 'POSPrinterId')
  final int posPrinterId;
  @override
  @JsonKey(name: 'PrinterId')
  final int printerId;
  @override
  @JsonKey(name: 'SecondaryPrinterId')
  final int? secondaryPrinterId;
  @override
  @JsonKey(name: 'OrderTypeGroupId')
  final int orderTypeGroupId;
  @override
  @JsonKey(name: 'POSMachineId')
  final int posMachineId;
  @override
  @JsonKey(name: 'POSTypeId')
  final int posTypeId;
  @override
  @JsonKey(name: 'PrintTemplateId')
  final int printTemplateId;
  @override
  @JsonKey(name: 'PrinterTypeId')
  final int printerTypeId;
  @override
  @JsonKey(name: 'PrinterName')
  final String printerName;
  final List<dynamic>? _posPrinterOverrideRulesContainerDTOList;
  @override
  @JsonKey(name: 'POSPrinterOverrideRulesContainerDTOList')
  List<dynamic>? get posPrinterOverrideRulesContainerDTOList {
    final value = _posPrinterOverrideRulesContainerDTOList;
    if (value == null) return null;
    if (_posPrinterOverrideRulesContainerDTOList is EqualUnmodifiableListView)
      return _posPrinterOverrideRulesContainerDTOList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'POSPrinterContainerDTO(posPrinterId: $posPrinterId, printerId: $printerId, secondaryPrinterId: $secondaryPrinterId, orderTypeGroupId: $orderTypeGroupId, posMachineId: $posMachineId, posTypeId: $posTypeId, printTemplateId: $printTemplateId, printerTypeId: $printerTypeId, printerName: $printerName, posPrinterOverrideRulesContainerDTOList: $posPrinterOverrideRulesContainerDTOList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_POSPrinterContainerDTO &&
            (identical(other.posPrinterId, posPrinterId) ||
                other.posPrinterId == posPrinterId) &&
            (identical(other.printerId, printerId) ||
                other.printerId == printerId) &&
            (identical(other.secondaryPrinterId, secondaryPrinterId) ||
                other.secondaryPrinterId == secondaryPrinterId) &&
            (identical(other.orderTypeGroupId, orderTypeGroupId) ||
                other.orderTypeGroupId == orderTypeGroupId) &&
            (identical(other.posMachineId, posMachineId) ||
                other.posMachineId == posMachineId) &&
            (identical(other.posTypeId, posTypeId) ||
                other.posTypeId == posTypeId) &&
            (identical(other.printTemplateId, printTemplateId) ||
                other.printTemplateId == printTemplateId) &&
            (identical(other.printerTypeId, printerTypeId) ||
                other.printerTypeId == printerTypeId) &&
            (identical(other.printerName, printerName) ||
                other.printerName == printerName) &&
            const DeepCollectionEquality().equals(
                other._posPrinterOverrideRulesContainerDTOList,
                _posPrinterOverrideRulesContainerDTOList));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      posPrinterId,
      printerId,
      secondaryPrinterId,
      orderTypeGroupId,
      posMachineId,
      posTypeId,
      printTemplateId,
      printerTypeId,
      printerName,
      const DeepCollectionEquality()
          .hash(_posPrinterOverrideRulesContainerDTOList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_POSPrinterContainerDTOCopyWith<_$_POSPrinterContainerDTO> get copyWith =>
      __$$_POSPrinterContainerDTOCopyWithImpl<_$_POSPrinterContainerDTO>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_POSPrinterContainerDTOToJson(
      this,
    );
  }
}

abstract class _POSPrinterContainerDTO implements POSPrinterContainerDTO {
  const factory _POSPrinterContainerDTO(
          {@JsonKey(name: 'POSPrinterId')
              required final int posPrinterId,
          @JsonKey(name: 'PrinterId')
              required final int printerId,
          @JsonKey(name: 'SecondaryPrinterId')
              final int? secondaryPrinterId,
          @JsonKey(name: 'OrderTypeGroupId')
              required final int orderTypeGroupId,
          @JsonKey(name: 'POSMachineId')
              required final int posMachineId,
          @JsonKey(name: 'POSTypeId')
              required final int posTypeId,
          @JsonKey(name: 'PrintTemplateId')
              required final int printTemplateId,
          @JsonKey(name: 'PrinterTypeId')
              required final int printerTypeId,
          @JsonKey(name: 'PrinterName')
              required final String printerName,
          @JsonKey(name: 'POSPrinterOverrideRulesContainerDTOList')
              final List<dynamic>? posPrinterOverrideRulesContainerDTOList}) =
      _$_POSPrinterContainerDTO;

  factory _POSPrinterContainerDTO.fromJson(Map<String, dynamic> json) =
      _$_POSPrinterContainerDTO.fromJson;

  @override
  @JsonKey(name: 'POSPrinterId')
  int get posPrinterId;
  @override
  @JsonKey(name: 'PrinterId')
  int get printerId;
  @override
  @JsonKey(name: 'SecondaryPrinterId')
  int? get secondaryPrinterId;
  @override
  @JsonKey(name: 'OrderTypeGroupId')
  int get orderTypeGroupId;
  @override
  @JsonKey(name: 'POSMachineId')
  int get posMachineId;
  @override
  @JsonKey(name: 'POSTypeId')
  int get posTypeId;
  @override
  @JsonKey(name: 'PrintTemplateId')
  int get printTemplateId;
  @override
  @JsonKey(name: 'PrinterTypeId')
  int get printerTypeId;
  @override
  @JsonKey(name: 'PrinterName')
  String get printerName;
  @override
  @JsonKey(name: 'POSPrinterOverrideRulesContainerDTOList')
  List<dynamic>? get posPrinterOverrideRulesContainerDTOList;
  @override
  @JsonKey(ignore: true)
  _$$_POSPrinterContainerDTOCopyWith<_$_POSPrinterContainerDTO> get copyWith =>
      throw _privateConstructorUsedError;
}
