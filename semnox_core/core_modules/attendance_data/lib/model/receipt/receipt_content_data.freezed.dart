// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'receipt_content_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ReceiptContentData _$ReceiptContentDataFromJson(Map<String, dynamic> json) {
  return _ReceiptContentData.fromJson(json);
}

/// @nodoc
mixin _$ReceiptContentData {
  @JsonKey(name: 'Name')
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'Format')
  String get format => throw _privateConstructorUsedError;
  @JsonKey(name: 'DocumentType')
  dynamic get documentType => throw _privateConstructorUsedError;
  @JsonKey(name: 'TemplateId')
  int get templateId => throw _privateConstructorUsedError;
  @JsonKey(name: 'POSPrinterId')
  int get posPrinterId => throw _privateConstructorUsedError;
  @JsonKey(name: 'Data')
  String get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReceiptContentDataCopyWith<ReceiptContentData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReceiptContentDataCopyWith<$Res> {
  factory $ReceiptContentDataCopyWith(
          ReceiptContentData value, $Res Function(ReceiptContentData) then) =
      _$ReceiptContentDataCopyWithImpl<$Res, ReceiptContentData>;
  @useResult
  $Res call(
      {@JsonKey(name: 'Name') String name,
      @JsonKey(name: 'Format') String format,
      @JsonKey(name: 'DocumentType') dynamic documentType,
      @JsonKey(name: 'TemplateId') int templateId,
      @JsonKey(name: 'POSPrinterId') int posPrinterId,
      @JsonKey(name: 'Data') String data});
}

/// @nodoc
class _$ReceiptContentDataCopyWithImpl<$Res, $Val extends ReceiptContentData>
    implements $ReceiptContentDataCopyWith<$Res> {
  _$ReceiptContentDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? format = null,
    Object? documentType = freezed,
    Object? templateId = null,
    Object? posPrinterId = null,
    Object? data = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      format: null == format
          ? _value.format
          : format // ignore: cast_nullable_to_non_nullable
              as String,
      documentType: freezed == documentType
          ? _value.documentType
          : documentType // ignore: cast_nullable_to_non_nullable
              as dynamic,
      templateId: null == templateId
          ? _value.templateId
          : templateId // ignore: cast_nullable_to_non_nullable
              as int,
      posPrinterId: null == posPrinterId
          ? _value.posPrinterId
          : posPrinterId // ignore: cast_nullable_to_non_nullable
              as int,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ReceiptContentDataCopyWith<$Res>
    implements $ReceiptContentDataCopyWith<$Res> {
  factory _$$_ReceiptContentDataCopyWith(_$_ReceiptContentData value,
          $Res Function(_$_ReceiptContentData) then) =
      __$$_ReceiptContentDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'Name') String name,
      @JsonKey(name: 'Format') String format,
      @JsonKey(name: 'DocumentType') dynamic documentType,
      @JsonKey(name: 'TemplateId') int templateId,
      @JsonKey(name: 'POSPrinterId') int posPrinterId,
      @JsonKey(name: 'Data') String data});
}

/// @nodoc
class __$$_ReceiptContentDataCopyWithImpl<$Res>
    extends _$ReceiptContentDataCopyWithImpl<$Res, _$_ReceiptContentData>
    implements _$$_ReceiptContentDataCopyWith<$Res> {
  __$$_ReceiptContentDataCopyWithImpl(
      _$_ReceiptContentData _value, $Res Function(_$_ReceiptContentData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? format = null,
    Object? documentType = freezed,
    Object? templateId = null,
    Object? posPrinterId = null,
    Object? data = null,
  }) {
    return _then(_$_ReceiptContentData(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      format: null == format
          ? _value.format
          : format // ignore: cast_nullable_to_non_nullable
              as String,
      documentType: freezed == documentType
          ? _value.documentType
          : documentType // ignore: cast_nullable_to_non_nullable
              as dynamic,
      templateId: null == templateId
          ? _value.templateId
          : templateId // ignore: cast_nullable_to_non_nullable
              as int,
      posPrinterId: null == posPrinterId
          ? _value.posPrinterId
          : posPrinterId // ignore: cast_nullable_to_non_nullable
              as int,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ReceiptContentData implements _ReceiptContentData {
  const _$_ReceiptContentData(
      {@JsonKey(name: 'Name') required this.name,
      @JsonKey(name: 'Format') required this.format,
      @JsonKey(name: 'DocumentType') this.documentType,
      @JsonKey(name: 'TemplateId') required this.templateId,
      @JsonKey(name: 'POSPrinterId') required this.posPrinterId,
      @JsonKey(name: 'Data') required this.data});

  factory _$_ReceiptContentData.fromJson(Map<String, dynamic> json) =>
      _$$_ReceiptContentDataFromJson(json);

  @override
  @JsonKey(name: 'Name')
  final String name;
  @override
  @JsonKey(name: 'Format')
  final String format;
  @override
  @JsonKey(name: 'DocumentType')
  final dynamic documentType;
  @override
  @JsonKey(name: 'TemplateId')
  final int templateId;
  @override
  @JsonKey(name: 'POSPrinterId')
  final int posPrinterId;
  @override
  @JsonKey(name: 'Data')
  final String data;

  @override
  String toString() {
    return 'ReceiptContentData(name: $name, format: $format, documentType: $documentType, templateId: $templateId, posPrinterId: $posPrinterId, data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ReceiptContentData &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.format, format) || other.format == format) &&
            const DeepCollectionEquality()
                .equals(other.documentType, documentType) &&
            (identical(other.templateId, templateId) ||
                other.templateId == templateId) &&
            (identical(other.posPrinterId, posPrinterId) ||
                other.posPrinterId == posPrinterId) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      name,
      format,
      const DeepCollectionEquality().hash(documentType),
      templateId,
      posPrinterId,
      data);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ReceiptContentDataCopyWith<_$_ReceiptContentData> get copyWith =>
      __$$_ReceiptContentDataCopyWithImpl<_$_ReceiptContentData>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ReceiptContentDataToJson(
      this,
    );
  }
}

abstract class _ReceiptContentData implements ReceiptContentData {
  const factory _ReceiptContentData(
          {@JsonKey(name: 'Name') required final String name,
          @JsonKey(name: 'Format') required final String format,
          @JsonKey(name: 'DocumentType') final dynamic documentType,
          @JsonKey(name: 'TemplateId') required final int templateId,
          @JsonKey(name: 'POSPrinterId') required final int posPrinterId,
          @JsonKey(name: 'Data') required final String data}) =
      _$_ReceiptContentData;

  factory _ReceiptContentData.fromJson(Map<String, dynamic> json) =
      _$_ReceiptContentData.fromJson;

  @override
  @JsonKey(name: 'Name')
  String get name;
  @override
  @JsonKey(name: 'Format')
  String get format;
  @override
  @JsonKey(name: 'DocumentType')
  dynamic get documentType;
  @override
  @JsonKey(name: 'TemplateId')
  int get templateId;
  @override
  @JsonKey(name: 'POSPrinterId')
  int get posPrinterId;
  @override
  @JsonKey(name: 'Data')
  String get data;
  @override
  @JsonKey(ignore: true)
  _$$_ReceiptContentDataCopyWith<_$_ReceiptContentData> get copyWith =>
      throw _privateConstructorUsedError;
}
