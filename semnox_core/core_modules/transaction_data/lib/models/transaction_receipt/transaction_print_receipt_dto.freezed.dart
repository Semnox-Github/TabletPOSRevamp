// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transaction_print_receipt_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TransactionPrintReceiptDto _$TransactionPrintReceiptDtoFromJson(
    Map<String, dynamic> json) {
  return _TransactionPrintReceiptDto.fromJson(json);
}

/// @nodoc
mixin _$TransactionPrintReceiptDto {
  @JsonKey(name: 'Name')
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'Format')
  String? get format => throw _privateConstructorUsedError;
  @JsonKey(name: 'DocumentType')
  String get documentType => throw _privateConstructorUsedError;
  @JsonKey(name: 'TemplateId')
  int get templateId => throw _privateConstructorUsedError;
  @JsonKey(name: 'POSPrinterId')
  int get posPrinterId => throw _privateConstructorUsedError;
  @JsonKey(name: 'Data')
  PrintReceiptData get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TransactionPrintReceiptDtoCopyWith<TransactionPrintReceiptDto>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionPrintReceiptDtoCopyWith<$Res> {
  factory $TransactionPrintReceiptDtoCopyWith(TransactionPrintReceiptDto value,
          $Res Function(TransactionPrintReceiptDto) then) =
      _$TransactionPrintReceiptDtoCopyWithImpl<$Res,
          TransactionPrintReceiptDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'Name') String name,
      @JsonKey(name: 'Format') String? format,
      @JsonKey(name: 'DocumentType') String documentType,
      @JsonKey(name: 'TemplateId') int templateId,
      @JsonKey(name: 'POSPrinterId') int posPrinterId,
      @JsonKey(name: 'Data') PrintReceiptData data});

  $PrintReceiptDataCopyWith<$Res> get data;
}

/// @nodoc
class _$TransactionPrintReceiptDtoCopyWithImpl<$Res,
        $Val extends TransactionPrintReceiptDto>
    implements $TransactionPrintReceiptDtoCopyWith<$Res> {
  _$TransactionPrintReceiptDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? format = freezed,
    Object? documentType = null,
    Object? templateId = null,
    Object? posPrinterId = null,
    Object? data = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      format: freezed == format
          ? _value.format
          : format // ignore: cast_nullable_to_non_nullable
              as String?,
      documentType: null == documentType
          ? _value.documentType
          : documentType // ignore: cast_nullable_to_non_nullable
              as String,
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
              as PrintReceiptData,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PrintReceiptDataCopyWith<$Res> get data {
    return $PrintReceiptDataCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_TransactionPrintReceiptDtoCopyWith<$Res>
    implements $TransactionPrintReceiptDtoCopyWith<$Res> {
  factory _$$_TransactionPrintReceiptDtoCopyWith(
          _$_TransactionPrintReceiptDto value,
          $Res Function(_$_TransactionPrintReceiptDto) then) =
      __$$_TransactionPrintReceiptDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'Name') String name,
      @JsonKey(name: 'Format') String? format,
      @JsonKey(name: 'DocumentType') String documentType,
      @JsonKey(name: 'TemplateId') int templateId,
      @JsonKey(name: 'POSPrinterId') int posPrinterId,
      @JsonKey(name: 'Data') PrintReceiptData data});

  @override
  $PrintReceiptDataCopyWith<$Res> get data;
}

/// @nodoc
class __$$_TransactionPrintReceiptDtoCopyWithImpl<$Res>
    extends _$TransactionPrintReceiptDtoCopyWithImpl<$Res,
        _$_TransactionPrintReceiptDto>
    implements _$$_TransactionPrintReceiptDtoCopyWith<$Res> {
  __$$_TransactionPrintReceiptDtoCopyWithImpl(
      _$_TransactionPrintReceiptDto _value,
      $Res Function(_$_TransactionPrintReceiptDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? format = freezed,
    Object? documentType = null,
    Object? templateId = null,
    Object? posPrinterId = null,
    Object? data = null,
  }) {
    return _then(_$_TransactionPrintReceiptDto(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      format: freezed == format
          ? _value.format
          : format // ignore: cast_nullable_to_non_nullable
              as String?,
      documentType: null == documentType
          ? _value.documentType
          : documentType // ignore: cast_nullable_to_non_nullable
              as String,
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
              as PrintReceiptData,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TransactionPrintReceiptDto implements _TransactionPrintReceiptDto {
  const _$_TransactionPrintReceiptDto(
      {@JsonKey(name: 'Name') required this.name,
      @JsonKey(name: 'Format') required this.format,
      @JsonKey(name: 'DocumentType') required this.documentType,
      @JsonKey(name: 'TemplateId') required this.templateId,
      @JsonKey(name: 'POSPrinterId') required this.posPrinterId,
      @JsonKey(name: 'Data') required this.data});

  factory _$_TransactionPrintReceiptDto.fromJson(Map<String, dynamic> json) =>
      _$$_TransactionPrintReceiptDtoFromJson(json);

  @override
  @JsonKey(name: 'Name')
  final String name;
  @override
  @JsonKey(name: 'Format')
  final String? format;
  @override
  @JsonKey(name: 'DocumentType')
  final String documentType;
  @override
  @JsonKey(name: 'TemplateId')
  final int templateId;
  @override
  @JsonKey(name: 'POSPrinterId')
  final int posPrinterId;
  @override
  @JsonKey(name: 'Data')
  final PrintReceiptData data;

  @override
  String toString() {
    return 'TransactionPrintReceiptDto(name: $name, format: $format, documentType: $documentType, templateId: $templateId, posPrinterId: $posPrinterId, data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TransactionPrintReceiptDto &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.format, format) || other.format == format) &&
            (identical(other.documentType, documentType) ||
                other.documentType == documentType) &&
            (identical(other.templateId, templateId) ||
                other.templateId == templateId) &&
            (identical(other.posPrinterId, posPrinterId) ||
                other.posPrinterId == posPrinterId) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, name, format, documentType, templateId, posPrinterId, data);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TransactionPrintReceiptDtoCopyWith<_$_TransactionPrintReceiptDto>
      get copyWith => __$$_TransactionPrintReceiptDtoCopyWithImpl<
          _$_TransactionPrintReceiptDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TransactionPrintReceiptDtoToJson(
      this,
    );
  }
}

abstract class _TransactionPrintReceiptDto
    implements TransactionPrintReceiptDto {
  const factory _TransactionPrintReceiptDto(
          {@JsonKey(name: 'Name') required final String name,
          @JsonKey(name: 'Format') required final String? format,
          @JsonKey(name: 'DocumentType') required final String documentType,
          @JsonKey(name: 'TemplateId') required final int templateId,
          @JsonKey(name: 'POSPrinterId') required final int posPrinterId,
          @JsonKey(name: 'Data') required final PrintReceiptData data}) =
      _$_TransactionPrintReceiptDto;

  factory _TransactionPrintReceiptDto.fromJson(Map<String, dynamic> json) =
      _$_TransactionPrintReceiptDto.fromJson;

  @override
  @JsonKey(name: 'Name')
  String get name;
  @override
  @JsonKey(name: 'Format')
  String? get format;
  @override
  @JsonKey(name: 'DocumentType')
  String get documentType;
  @override
  @JsonKey(name: 'TemplateId')
  int get templateId;
  @override
  @JsonKey(name: 'POSPrinterId')
  int get posPrinterId;
  @override
  @JsonKey(name: 'Data')
  PrintReceiptData get data;
  @override
  @JsonKey(ignore: true)
  _$$_TransactionPrintReceiptDtoCopyWith<_$_TransactionPrintReceiptDto>
      get copyWith => throw _privateConstructorUsedError;
}
