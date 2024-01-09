// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'receipt_template_header_container_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ReceiptTemplateHeaderContainerDTO _$ReceiptTemplateHeaderContainerDTOFromJson(
    Map<String, dynamic> json) {
  return _ReceiptTemplateHeaderContainerDTO.fromJson(json);
}

/// @nodoc
mixin _$ReceiptTemplateHeaderContainerDTO {
  @JsonKey(name: 'TemplateId')
  int get templateId => throw _privateConstructorUsedError;
  @JsonKey(name: 'TemplateName')
  String get templateName => throw _privateConstructorUsedError;
  @JsonKey(name: 'FontName')
  String get fontName => throw _privateConstructorUsedError;
  @JsonKey(name: 'FontSize')
  dynamic get fontSize => throw _privateConstructorUsedError;
  @JsonKey(name: 'GUID')
  String get guid => throw _privateConstructorUsedError;
  @JsonKey(name: 'TicketTemplateContainerDTO')
  TicketTemplateContainerDTO? get ticketTemplateContainerDTO =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'ReceiptPrintTemplateContainerDTOList')
  List<ReceiptTemplateContainerDTO> get receiptPrintTemplateContainerDTOList =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReceiptTemplateHeaderContainerDTOCopyWith<ReceiptTemplateHeaderContainerDTO>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReceiptTemplateHeaderContainerDTOCopyWith<$Res> {
  factory $ReceiptTemplateHeaderContainerDTOCopyWith(
          ReceiptTemplateHeaderContainerDTO value,
          $Res Function(ReceiptTemplateHeaderContainerDTO) then) =
      _$ReceiptTemplateHeaderContainerDTOCopyWithImpl<$Res,
          ReceiptTemplateHeaderContainerDTO>;
  @useResult
  $Res call(
      {@JsonKey(name: 'TemplateId')
          int templateId,
      @JsonKey(name: 'TemplateName')
          String templateName,
      @JsonKey(name: 'FontName')
          String fontName,
      @JsonKey(name: 'FontSize')
          dynamic fontSize,
      @JsonKey(name: 'GUID')
          String guid,
      @JsonKey(name: 'TicketTemplateContainerDTO')
          TicketTemplateContainerDTO? ticketTemplateContainerDTO,
      @JsonKey(name: 'ReceiptPrintTemplateContainerDTOList')
          List<ReceiptTemplateContainerDTO>
              receiptPrintTemplateContainerDTOList});

  $TicketTemplateContainerDTOCopyWith<$Res>? get ticketTemplateContainerDTO;
}

/// @nodoc
class _$ReceiptTemplateHeaderContainerDTOCopyWithImpl<$Res,
        $Val extends ReceiptTemplateHeaderContainerDTO>
    implements $ReceiptTemplateHeaderContainerDTOCopyWith<$Res> {
  _$ReceiptTemplateHeaderContainerDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? templateId = null,
    Object? templateName = null,
    Object? fontName = null,
    Object? fontSize = freezed,
    Object? guid = null,
    Object? ticketTemplateContainerDTO = freezed,
    Object? receiptPrintTemplateContainerDTOList = null,
  }) {
    return _then(_value.copyWith(
      templateId: null == templateId
          ? _value.templateId
          : templateId // ignore: cast_nullable_to_non_nullable
              as int,
      templateName: null == templateName
          ? _value.templateName
          : templateName // ignore: cast_nullable_to_non_nullable
              as String,
      fontName: null == fontName
          ? _value.fontName
          : fontName // ignore: cast_nullable_to_non_nullable
              as String,
      fontSize: freezed == fontSize
          ? _value.fontSize
          : fontSize // ignore: cast_nullable_to_non_nullable
              as dynamic,
      guid: null == guid
          ? _value.guid
          : guid // ignore: cast_nullable_to_non_nullable
              as String,
      ticketTemplateContainerDTO: freezed == ticketTemplateContainerDTO
          ? _value.ticketTemplateContainerDTO
          : ticketTemplateContainerDTO // ignore: cast_nullable_to_non_nullable
              as TicketTemplateContainerDTO?,
      receiptPrintTemplateContainerDTOList: null ==
              receiptPrintTemplateContainerDTOList
          ? _value.receiptPrintTemplateContainerDTOList
          : receiptPrintTemplateContainerDTOList // ignore: cast_nullable_to_non_nullable
              as List<ReceiptTemplateContainerDTO>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $TicketTemplateContainerDTOCopyWith<$Res>? get ticketTemplateContainerDTO {
    if (_value.ticketTemplateContainerDTO == null) {
      return null;
    }

    return $TicketTemplateContainerDTOCopyWith<$Res>(
        _value.ticketTemplateContainerDTO!, (value) {
      return _then(_value.copyWith(ticketTemplateContainerDTO: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_ReceiptTemplateHeaderContainerDTOCopyWith<$Res>
    implements $ReceiptTemplateHeaderContainerDTOCopyWith<$Res> {
  factory _$$_ReceiptTemplateHeaderContainerDTOCopyWith(
          _$_ReceiptTemplateHeaderContainerDTO value,
          $Res Function(_$_ReceiptTemplateHeaderContainerDTO) then) =
      __$$_ReceiptTemplateHeaderContainerDTOCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'TemplateId')
          int templateId,
      @JsonKey(name: 'TemplateName')
          String templateName,
      @JsonKey(name: 'FontName')
          String fontName,
      @JsonKey(name: 'FontSize')
          dynamic fontSize,
      @JsonKey(name: 'GUID')
          String guid,
      @JsonKey(name: 'TicketTemplateContainerDTO')
          TicketTemplateContainerDTO? ticketTemplateContainerDTO,
      @JsonKey(name: 'ReceiptPrintTemplateContainerDTOList')
          List<ReceiptTemplateContainerDTO>
              receiptPrintTemplateContainerDTOList});

  @override
  $TicketTemplateContainerDTOCopyWith<$Res>? get ticketTemplateContainerDTO;
}

/// @nodoc
class __$$_ReceiptTemplateHeaderContainerDTOCopyWithImpl<$Res>
    extends _$ReceiptTemplateHeaderContainerDTOCopyWithImpl<$Res,
        _$_ReceiptTemplateHeaderContainerDTO>
    implements _$$_ReceiptTemplateHeaderContainerDTOCopyWith<$Res> {
  __$$_ReceiptTemplateHeaderContainerDTOCopyWithImpl(
      _$_ReceiptTemplateHeaderContainerDTO _value,
      $Res Function(_$_ReceiptTemplateHeaderContainerDTO) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? templateId = null,
    Object? templateName = null,
    Object? fontName = null,
    Object? fontSize = freezed,
    Object? guid = null,
    Object? ticketTemplateContainerDTO = freezed,
    Object? receiptPrintTemplateContainerDTOList = null,
  }) {
    return _then(_$_ReceiptTemplateHeaderContainerDTO(
      templateId: null == templateId
          ? _value.templateId
          : templateId // ignore: cast_nullable_to_non_nullable
              as int,
      templateName: null == templateName
          ? _value.templateName
          : templateName // ignore: cast_nullable_to_non_nullable
              as String,
      fontName: null == fontName
          ? _value.fontName
          : fontName // ignore: cast_nullable_to_non_nullable
              as String,
      fontSize: freezed == fontSize
          ? _value.fontSize
          : fontSize // ignore: cast_nullable_to_non_nullable
              as dynamic,
      guid: null == guid
          ? _value.guid
          : guid // ignore: cast_nullable_to_non_nullable
              as String,
      ticketTemplateContainerDTO: freezed == ticketTemplateContainerDTO
          ? _value.ticketTemplateContainerDTO
          : ticketTemplateContainerDTO // ignore: cast_nullable_to_non_nullable
              as TicketTemplateContainerDTO?,
      receiptPrintTemplateContainerDTOList: null ==
              receiptPrintTemplateContainerDTOList
          ? _value._receiptPrintTemplateContainerDTOList
          : receiptPrintTemplateContainerDTOList // ignore: cast_nullable_to_non_nullable
              as List<ReceiptTemplateContainerDTO>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ReceiptTemplateHeaderContainerDTO
    implements _ReceiptTemplateHeaderContainerDTO {
  const _$_ReceiptTemplateHeaderContainerDTO(
      {@JsonKey(name: 'TemplateId')
          required this.templateId,
      @JsonKey(name: 'TemplateName')
          required this.templateName,
      @JsonKey(name: 'FontName')
          required this.fontName,
      @JsonKey(name: 'FontSize')
          this.fontSize,
      @JsonKey(name: 'GUID')
          required this.guid,
      @JsonKey(name: 'TicketTemplateContainerDTO')
          this.ticketTemplateContainerDTO,
      @JsonKey(name: 'ReceiptPrintTemplateContainerDTOList')
          required final List<ReceiptTemplateContainerDTO>
              receiptPrintTemplateContainerDTOList})
      : _receiptPrintTemplateContainerDTOList =
            receiptPrintTemplateContainerDTOList;

  factory _$_ReceiptTemplateHeaderContainerDTO.fromJson(
          Map<String, dynamic> json) =>
      _$$_ReceiptTemplateHeaderContainerDTOFromJson(json);

  @override
  @JsonKey(name: 'TemplateId')
  final int templateId;
  @override
  @JsonKey(name: 'TemplateName')
  final String templateName;
  @override
  @JsonKey(name: 'FontName')
  final String fontName;
  @override
  @JsonKey(name: 'FontSize')
  final dynamic fontSize;
  @override
  @JsonKey(name: 'GUID')
  final String guid;
  @override
  @JsonKey(name: 'TicketTemplateContainerDTO')
  final TicketTemplateContainerDTO? ticketTemplateContainerDTO;
  final List<ReceiptTemplateContainerDTO> _receiptPrintTemplateContainerDTOList;
  @override
  @JsonKey(name: 'ReceiptPrintTemplateContainerDTOList')
  List<ReceiptTemplateContainerDTO> get receiptPrintTemplateContainerDTOList {
    if (_receiptPrintTemplateContainerDTOList is EqualUnmodifiableListView)
      return _receiptPrintTemplateContainerDTOList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_receiptPrintTemplateContainerDTOList);
  }

  @override
  String toString() {
    return 'ReceiptTemplateHeaderContainerDTO(templateId: $templateId, templateName: $templateName, fontName: $fontName, fontSize: $fontSize, guid: $guid, ticketTemplateContainerDTO: $ticketTemplateContainerDTO, receiptPrintTemplateContainerDTOList: $receiptPrintTemplateContainerDTOList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ReceiptTemplateHeaderContainerDTO &&
            (identical(other.templateId, templateId) ||
                other.templateId == templateId) &&
            (identical(other.templateName, templateName) ||
                other.templateName == templateName) &&
            (identical(other.fontName, fontName) ||
                other.fontName == fontName) &&
            const DeepCollectionEquality().equals(other.fontSize, fontSize) &&
            (identical(other.guid, guid) || other.guid == guid) &&
            (identical(other.ticketTemplateContainerDTO,
                    ticketTemplateContainerDTO) ||
                other.ticketTemplateContainerDTO ==
                    ticketTemplateContainerDTO) &&
            const DeepCollectionEquality().equals(
                other._receiptPrintTemplateContainerDTOList,
                _receiptPrintTemplateContainerDTOList));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      templateId,
      templateName,
      fontName,
      const DeepCollectionEquality().hash(fontSize),
      guid,
      ticketTemplateContainerDTO,
      const DeepCollectionEquality()
          .hash(_receiptPrintTemplateContainerDTOList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ReceiptTemplateHeaderContainerDTOCopyWith<
          _$_ReceiptTemplateHeaderContainerDTO>
      get copyWith => __$$_ReceiptTemplateHeaderContainerDTOCopyWithImpl<
          _$_ReceiptTemplateHeaderContainerDTO>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ReceiptTemplateHeaderContainerDTOToJson(
      this,
    );
  }
}

abstract class _ReceiptTemplateHeaderContainerDTO
    implements ReceiptTemplateHeaderContainerDTO {
  const factory _ReceiptTemplateHeaderContainerDTO(
          {@JsonKey(name: 'TemplateId')
              required final int templateId,
          @JsonKey(name: 'TemplateName')
              required final String templateName,
          @JsonKey(name: 'FontName')
              required final String fontName,
          @JsonKey(name: 'FontSize')
              final dynamic fontSize,
          @JsonKey(name: 'GUID')
              required final String guid,
          @JsonKey(name: 'TicketTemplateContainerDTO')
              final TicketTemplateContainerDTO? ticketTemplateContainerDTO,
          @JsonKey(name: 'ReceiptPrintTemplateContainerDTOList')
              required final List<ReceiptTemplateContainerDTO>
                  receiptPrintTemplateContainerDTOList}) =
      _$_ReceiptTemplateHeaderContainerDTO;

  factory _ReceiptTemplateHeaderContainerDTO.fromJson(
          Map<String, dynamic> json) =
      _$_ReceiptTemplateHeaderContainerDTO.fromJson;

  @override
  @JsonKey(name: 'TemplateId')
  int get templateId;
  @override
  @JsonKey(name: 'TemplateName')
  String get templateName;
  @override
  @JsonKey(name: 'FontName')
  String get fontName;
  @override
  @JsonKey(name: 'FontSize')
  dynamic get fontSize;
  @override
  @JsonKey(name: 'GUID')
  String get guid;
  @override
  @JsonKey(name: 'TicketTemplateContainerDTO')
  TicketTemplateContainerDTO? get ticketTemplateContainerDTO;
  @override
  @JsonKey(name: 'ReceiptPrintTemplateContainerDTOList')
  List<ReceiptTemplateContainerDTO> get receiptPrintTemplateContainerDTOList;
  @override
  @JsonKey(ignore: true)
  _$$_ReceiptTemplateHeaderContainerDTOCopyWith<
          _$_ReceiptTemplateHeaderContainerDTO>
      get copyWith => throw _privateConstructorUsedError;
}
