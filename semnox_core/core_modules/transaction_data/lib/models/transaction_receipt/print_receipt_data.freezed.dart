// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'print_receipt_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PrintReceiptData _$PrintReceiptDataFromJson(Map<String, dynamic> json) {
  return _PrintReceiptData.fromJson(json);
}

/// @nodoc
mixin _$PrintReceiptData {
  @JsonKey(name: 'Name')
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'PrintDocumentType')
  String? get printDocumentType => throw _privateConstructorUsedError;
  @JsonKey(name: 'TemplateId')
  int get templateId => throw _privateConstructorUsedError;
  @JsonKey(name: 'POSPrinterId')
  int get posPrinterId => throw _privateConstructorUsedError;
  @JsonKey(name: 'ReceiptLineDTOList')
  List<ReceiptLineDto> get receiptLineDtoList =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PrintReceiptDataCopyWith<PrintReceiptData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PrintReceiptDataCopyWith<$Res> {
  factory $PrintReceiptDataCopyWith(
          PrintReceiptData value, $Res Function(PrintReceiptData) then) =
      _$PrintReceiptDataCopyWithImpl<$Res, PrintReceiptData>;
  @useResult
  $Res call(
      {@JsonKey(name: 'Name')
          String name,
      @JsonKey(name: 'PrintDocumentType')
          String? printDocumentType,
      @JsonKey(name: 'TemplateId')
          int templateId,
      @JsonKey(name: 'POSPrinterId')
          int posPrinterId,
      @JsonKey(name: 'ReceiptLineDTOList')
          List<ReceiptLineDto> receiptLineDtoList});
}

/// @nodoc
class _$PrintReceiptDataCopyWithImpl<$Res, $Val extends PrintReceiptData>
    implements $PrintReceiptDataCopyWith<$Res> {
  _$PrintReceiptDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? printDocumentType = freezed,
    Object? templateId = null,
    Object? posPrinterId = null,
    Object? receiptLineDtoList = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      printDocumentType: freezed == printDocumentType
          ? _value.printDocumentType
          : printDocumentType // ignore: cast_nullable_to_non_nullable
              as String?,
      templateId: null == templateId
          ? _value.templateId
          : templateId // ignore: cast_nullable_to_non_nullable
              as int,
      posPrinterId: null == posPrinterId
          ? _value.posPrinterId
          : posPrinterId // ignore: cast_nullable_to_non_nullable
              as int,
      receiptLineDtoList: null == receiptLineDtoList
          ? _value.receiptLineDtoList
          : receiptLineDtoList // ignore: cast_nullable_to_non_nullable
              as List<ReceiptLineDto>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PrintReceiptDataCopyWith<$Res>
    implements $PrintReceiptDataCopyWith<$Res> {
  factory _$$_PrintReceiptDataCopyWith(
          _$_PrintReceiptData value, $Res Function(_$_PrintReceiptData) then) =
      __$$_PrintReceiptDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'Name')
          String name,
      @JsonKey(name: 'PrintDocumentType')
          String? printDocumentType,
      @JsonKey(name: 'TemplateId')
          int templateId,
      @JsonKey(name: 'POSPrinterId')
          int posPrinterId,
      @JsonKey(name: 'ReceiptLineDTOList')
          List<ReceiptLineDto> receiptLineDtoList});
}

/// @nodoc
class __$$_PrintReceiptDataCopyWithImpl<$Res>
    extends _$PrintReceiptDataCopyWithImpl<$Res, _$_PrintReceiptData>
    implements _$$_PrintReceiptDataCopyWith<$Res> {
  __$$_PrintReceiptDataCopyWithImpl(
      _$_PrintReceiptData _value, $Res Function(_$_PrintReceiptData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? printDocumentType = freezed,
    Object? templateId = null,
    Object? posPrinterId = null,
    Object? receiptLineDtoList = null,
  }) {
    return _then(_$_PrintReceiptData(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      printDocumentType: freezed == printDocumentType
          ? _value.printDocumentType
          : printDocumentType // ignore: cast_nullable_to_non_nullable
              as String?,
      templateId: null == templateId
          ? _value.templateId
          : templateId // ignore: cast_nullable_to_non_nullable
              as int,
      posPrinterId: null == posPrinterId
          ? _value.posPrinterId
          : posPrinterId // ignore: cast_nullable_to_non_nullable
              as int,
      receiptLineDtoList: null == receiptLineDtoList
          ? _value._receiptLineDtoList
          : receiptLineDtoList // ignore: cast_nullable_to_non_nullable
              as List<ReceiptLineDto>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PrintReceiptData implements _PrintReceiptData {
  const _$_PrintReceiptData(
      {@JsonKey(name: 'Name')
          required this.name,
      @JsonKey(name: 'PrintDocumentType')
          required this.printDocumentType,
      @JsonKey(name: 'TemplateId')
          required this.templateId,
      @JsonKey(name: 'POSPrinterId')
          required this.posPrinterId,
      @JsonKey(name: 'ReceiptLineDTOList')
          required final List<ReceiptLineDto> receiptLineDtoList})
      : _receiptLineDtoList = receiptLineDtoList;

  factory _$_PrintReceiptData.fromJson(Map<String, dynamic> json) =>
      _$$_PrintReceiptDataFromJson(json);

  @override
  @JsonKey(name: 'Name')
  final String name;
  @override
  @JsonKey(name: 'PrintDocumentType')
  final String? printDocumentType;
  @override
  @JsonKey(name: 'TemplateId')
  final int templateId;
  @override
  @JsonKey(name: 'POSPrinterId')
  final int posPrinterId;
  final List<ReceiptLineDto> _receiptLineDtoList;
  @override
  @JsonKey(name: 'ReceiptLineDTOList')
  List<ReceiptLineDto> get receiptLineDtoList {
    if (_receiptLineDtoList is EqualUnmodifiableListView)
      return _receiptLineDtoList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_receiptLineDtoList);
  }

  @override
  String toString() {
    return 'PrintReceiptData(name: $name, printDocumentType: $printDocumentType, templateId: $templateId, posPrinterId: $posPrinterId, receiptLineDtoList: $receiptLineDtoList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PrintReceiptData &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.printDocumentType, printDocumentType) ||
                other.printDocumentType == printDocumentType) &&
            (identical(other.templateId, templateId) ||
                other.templateId == templateId) &&
            (identical(other.posPrinterId, posPrinterId) ||
                other.posPrinterId == posPrinterId) &&
            const DeepCollectionEquality()
                .equals(other._receiptLineDtoList, _receiptLineDtoList));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      name,
      printDocumentType,
      templateId,
      posPrinterId,
      const DeepCollectionEquality().hash(_receiptLineDtoList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PrintReceiptDataCopyWith<_$_PrintReceiptData> get copyWith =>
      __$$_PrintReceiptDataCopyWithImpl<_$_PrintReceiptData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PrintReceiptDataToJson(
      this,
    );
  }
}

abstract class _PrintReceiptData implements PrintReceiptData {
  const factory _PrintReceiptData(
          {@JsonKey(name: 'Name')
              required final String name,
          @JsonKey(name: 'PrintDocumentType')
              required final String? printDocumentType,
          @JsonKey(name: 'TemplateId')
              required final int templateId,
          @JsonKey(name: 'POSPrinterId')
              required final int posPrinterId,
          @JsonKey(name: 'ReceiptLineDTOList')
              required final List<ReceiptLineDto> receiptLineDtoList}) =
      _$_PrintReceiptData;

  factory _PrintReceiptData.fromJson(Map<String, dynamic> json) =
      _$_PrintReceiptData.fromJson;

  @override
  @JsonKey(name: 'Name')
  String get name;
  @override
  @JsonKey(name: 'PrintDocumentType')
  String? get printDocumentType;
  @override
  @JsonKey(name: 'TemplateId')
  int get templateId;
  @override
  @JsonKey(name: 'POSPrinterId')
  int get posPrinterId;
  @override
  @JsonKey(name: 'ReceiptLineDTOList')
  List<ReceiptLineDto> get receiptLineDtoList;
  @override
  @JsonKey(ignore: true)
  _$$_PrintReceiptDataCopyWith<_$_PrintReceiptData> get copyWith =>
      throw _privateConstructorUsedError;
}
