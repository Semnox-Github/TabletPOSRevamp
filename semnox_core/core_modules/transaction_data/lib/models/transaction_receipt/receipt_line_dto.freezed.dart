// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'receipt_line_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ReceiptLineDto _$ReceiptLineDtoFromJson(Map<String, dynamic> json) {
  return _ReceiptLineDto.fromJson(json);
}

/// @nodoc
mixin _$ReceiptLineDto {
  @JsonKey(name: 'TemplateSection')
  String get templateSection => throw _privateConstructorUsedError;
  @JsonKey(name: 'Data')
  List<String?>? get data => throw _privateConstructorUsedError;
  @JsonKey(name: 'Alignments')
  List<String?>? get alignments => throw _privateConstructorUsedError;
  @JsonKey(name: 'ColumnCount')
  int get columnCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'Font')
  String? get font => throw _privateConstructorUsedError;
  @JsonKey(name: 'BarCode')
  String? get barCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'LineId')
  int get lineId => throw _privateConstructorUsedError;
  @JsonKey(name: 'LineHeight')
  int get lineHeight => throw _privateConstructorUsedError;
  @JsonKey(name: 'StrikeThrough')
  bool? get strikeThrough => throw _privateConstructorUsedError;
  @JsonKey(name: 'PrintAttributeType')
  String get printAttributeType => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReceiptLineDtoCopyWith<ReceiptLineDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReceiptLineDtoCopyWith<$Res> {
  factory $ReceiptLineDtoCopyWith(
          ReceiptLineDto value, $Res Function(ReceiptLineDto) then) =
      _$ReceiptLineDtoCopyWithImpl<$Res, ReceiptLineDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'TemplateSection') String templateSection,
      @JsonKey(name: 'Data') List<String?>? data,
      @JsonKey(name: 'Alignments') List<String?>? alignments,
      @JsonKey(name: 'ColumnCount') int columnCount,
      @JsonKey(name: 'Font') String? font,
      @JsonKey(name: 'BarCode') String? barCode,
      @JsonKey(name: 'LineId') int lineId,
      @JsonKey(name: 'LineHeight') int lineHeight,
      @JsonKey(name: 'StrikeThrough') bool? strikeThrough,
      @JsonKey(name: 'PrintAttributeType') String printAttributeType});
}

/// @nodoc
class _$ReceiptLineDtoCopyWithImpl<$Res, $Val extends ReceiptLineDto>
    implements $ReceiptLineDtoCopyWith<$Res> {
  _$ReceiptLineDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? templateSection = null,
    Object? data = freezed,
    Object? alignments = freezed,
    Object? columnCount = null,
    Object? font = freezed,
    Object? barCode = freezed,
    Object? lineId = null,
    Object? lineHeight = null,
    Object? strikeThrough = freezed,
    Object? printAttributeType = null,
  }) {
    return _then(_value.copyWith(
      templateSection: null == templateSection
          ? _value.templateSection
          : templateSection // ignore: cast_nullable_to_non_nullable
              as String,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<String?>?,
      alignments: freezed == alignments
          ? _value.alignments
          : alignments // ignore: cast_nullable_to_non_nullable
              as List<String?>?,
      columnCount: null == columnCount
          ? _value.columnCount
          : columnCount // ignore: cast_nullable_to_non_nullable
              as int,
      font: freezed == font
          ? _value.font
          : font // ignore: cast_nullable_to_non_nullable
              as String?,
      barCode: freezed == barCode
          ? _value.barCode
          : barCode // ignore: cast_nullable_to_non_nullable
              as String?,
      lineId: null == lineId
          ? _value.lineId
          : lineId // ignore: cast_nullable_to_non_nullable
              as int,
      lineHeight: null == lineHeight
          ? _value.lineHeight
          : lineHeight // ignore: cast_nullable_to_non_nullable
              as int,
      strikeThrough: freezed == strikeThrough
          ? _value.strikeThrough
          : strikeThrough // ignore: cast_nullable_to_non_nullable
              as bool?,
      printAttributeType: null == printAttributeType
          ? _value.printAttributeType
          : printAttributeType // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ReceiptLineDtoCopyWith<$Res>
    implements $ReceiptLineDtoCopyWith<$Res> {
  factory _$$_ReceiptLineDtoCopyWith(
          _$_ReceiptLineDto value, $Res Function(_$_ReceiptLineDto) then) =
      __$$_ReceiptLineDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'TemplateSection') String templateSection,
      @JsonKey(name: 'Data') List<String?>? data,
      @JsonKey(name: 'Alignments') List<String?>? alignments,
      @JsonKey(name: 'ColumnCount') int columnCount,
      @JsonKey(name: 'Font') String? font,
      @JsonKey(name: 'BarCode') String? barCode,
      @JsonKey(name: 'LineId') int lineId,
      @JsonKey(name: 'LineHeight') int lineHeight,
      @JsonKey(name: 'StrikeThrough') bool? strikeThrough,
      @JsonKey(name: 'PrintAttributeType') String printAttributeType});
}

/// @nodoc
class __$$_ReceiptLineDtoCopyWithImpl<$Res>
    extends _$ReceiptLineDtoCopyWithImpl<$Res, _$_ReceiptLineDto>
    implements _$$_ReceiptLineDtoCopyWith<$Res> {
  __$$_ReceiptLineDtoCopyWithImpl(
      _$_ReceiptLineDto _value, $Res Function(_$_ReceiptLineDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? templateSection = null,
    Object? data = freezed,
    Object? alignments = freezed,
    Object? columnCount = null,
    Object? font = freezed,
    Object? barCode = freezed,
    Object? lineId = null,
    Object? lineHeight = null,
    Object? strikeThrough = freezed,
    Object? printAttributeType = null,
  }) {
    return _then(_$_ReceiptLineDto(
      templateSection: null == templateSection
          ? _value.templateSection
          : templateSection // ignore: cast_nullable_to_non_nullable
              as String,
      data: freezed == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<String?>?,
      alignments: freezed == alignments
          ? _value._alignments
          : alignments // ignore: cast_nullable_to_non_nullable
              as List<String?>?,
      columnCount: null == columnCount
          ? _value.columnCount
          : columnCount // ignore: cast_nullable_to_non_nullable
              as int,
      font: freezed == font
          ? _value.font
          : font // ignore: cast_nullable_to_non_nullable
              as String?,
      barCode: freezed == barCode
          ? _value.barCode
          : barCode // ignore: cast_nullable_to_non_nullable
              as String?,
      lineId: null == lineId
          ? _value.lineId
          : lineId // ignore: cast_nullable_to_non_nullable
              as int,
      lineHeight: null == lineHeight
          ? _value.lineHeight
          : lineHeight // ignore: cast_nullable_to_non_nullable
              as int,
      strikeThrough: freezed == strikeThrough
          ? _value.strikeThrough
          : strikeThrough // ignore: cast_nullable_to_non_nullable
              as bool?,
      printAttributeType: null == printAttributeType
          ? _value.printAttributeType
          : printAttributeType // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ReceiptLineDto implements _ReceiptLineDto {
  const _$_ReceiptLineDto(
      {@JsonKey(name: 'TemplateSection') required this.templateSection,
      @JsonKey(name: 'Data') required final List<String?>? data,
      @JsonKey(name: 'Alignments') required final List<String?>? alignments,
      @JsonKey(name: 'ColumnCount') required this.columnCount,
      @JsonKey(name: 'Font') required this.font,
      @JsonKey(name: 'BarCode') required this.barCode,
      @JsonKey(name: 'LineId') required this.lineId,
      @JsonKey(name: 'LineHeight') required this.lineHeight,
      @JsonKey(name: 'StrikeThrough') required this.strikeThrough,
      @JsonKey(name: 'PrintAttributeType') required this.printAttributeType})
      : _data = data,
        _alignments = alignments;

  factory _$_ReceiptLineDto.fromJson(Map<String, dynamic> json) =>
      _$$_ReceiptLineDtoFromJson(json);

  @override
  @JsonKey(name: 'TemplateSection')
  final String templateSection;
  final List<String?>? _data;
  @override
  @JsonKey(name: 'Data')
  List<String?>? get data {
    final value = _data;
    if (value == null) return null;
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String?>? _alignments;
  @override
  @JsonKey(name: 'Alignments')
  List<String?>? get alignments {
    final value = _alignments;
    if (value == null) return null;
    if (_alignments is EqualUnmodifiableListView) return _alignments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'ColumnCount')
  final int columnCount;
  @override
  @JsonKey(name: 'Font')
  final String? font;
  @override
  @JsonKey(name: 'BarCode')
  final String? barCode;
  @override
  @JsonKey(name: 'LineId')
  final int lineId;
  @override
  @JsonKey(name: 'LineHeight')
  final int lineHeight;
  @override
  @JsonKey(name: 'StrikeThrough')
  final bool? strikeThrough;
  @override
  @JsonKey(name: 'PrintAttributeType')
  final String printAttributeType;

  @override
  String toString() {
    return 'ReceiptLineDto(templateSection: $templateSection, data: $data, alignments: $alignments, columnCount: $columnCount, font: $font, barCode: $barCode, lineId: $lineId, lineHeight: $lineHeight, strikeThrough: $strikeThrough, printAttributeType: $printAttributeType)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ReceiptLineDto &&
            (identical(other.templateSection, templateSection) ||
                other.templateSection == templateSection) &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            const DeepCollectionEquality()
                .equals(other._alignments, _alignments) &&
            (identical(other.columnCount, columnCount) ||
                other.columnCount == columnCount) &&
            (identical(other.font, font) || other.font == font) &&
            (identical(other.barCode, barCode) || other.barCode == barCode) &&
            (identical(other.lineId, lineId) || other.lineId == lineId) &&
            (identical(other.lineHeight, lineHeight) ||
                other.lineHeight == lineHeight) &&
            (identical(other.strikeThrough, strikeThrough) ||
                other.strikeThrough == strikeThrough) &&
            (identical(other.printAttributeType, printAttributeType) ||
                other.printAttributeType == printAttributeType));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      templateSection,
      const DeepCollectionEquality().hash(_data),
      const DeepCollectionEquality().hash(_alignments),
      columnCount,
      font,
      barCode,
      lineId,
      lineHeight,
      strikeThrough,
      printAttributeType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ReceiptLineDtoCopyWith<_$_ReceiptLineDto> get copyWith =>
      __$$_ReceiptLineDtoCopyWithImpl<_$_ReceiptLineDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ReceiptLineDtoToJson(
      this,
    );
  }
}

abstract class _ReceiptLineDto implements ReceiptLineDto {
  const factory _ReceiptLineDto(
      {@JsonKey(name: 'TemplateSection')
          required final String templateSection,
      @JsonKey(name: 'Data')
          required final List<String?>? data,
      @JsonKey(name: 'Alignments')
          required final List<String?>? alignments,
      @JsonKey(name: 'ColumnCount')
          required final int columnCount,
      @JsonKey(name: 'Font')
          required final String? font,
      @JsonKey(name: 'BarCode')
          required final String? barCode,
      @JsonKey(name: 'LineId')
          required final int lineId,
      @JsonKey(name: 'LineHeight')
          required final int lineHeight,
      @JsonKey(name: 'StrikeThrough')
          required final bool? strikeThrough,
      @JsonKey(name: 'PrintAttributeType')
          required final String printAttributeType}) = _$_ReceiptLineDto;

  factory _ReceiptLineDto.fromJson(Map<String, dynamic> json) =
      _$_ReceiptLineDto.fromJson;

  @override
  @JsonKey(name: 'TemplateSection')
  String get templateSection;
  @override
  @JsonKey(name: 'Data')
  List<String?>? get data;
  @override
  @JsonKey(name: 'Alignments')
  List<String?>? get alignments;
  @override
  @JsonKey(name: 'ColumnCount')
  int get columnCount;
  @override
  @JsonKey(name: 'Font')
  String? get font;
  @override
  @JsonKey(name: 'BarCode')
  String? get barCode;
  @override
  @JsonKey(name: 'LineId')
  int get lineId;
  @override
  @JsonKey(name: 'LineHeight')
  int get lineHeight;
  @override
  @JsonKey(name: 'StrikeThrough')
  bool? get strikeThrough;
  @override
  @JsonKey(name: 'PrintAttributeType')
  String get printAttributeType;
  @override
  @JsonKey(ignore: true)
  _$$_ReceiptLineDtoCopyWith<_$_ReceiptLineDto> get copyWith =>
      throw _privateConstructorUsedError;
}
