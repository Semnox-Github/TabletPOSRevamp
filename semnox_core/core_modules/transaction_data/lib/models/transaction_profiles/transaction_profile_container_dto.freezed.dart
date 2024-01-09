// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transaction_profile_container_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TransactionProfileContainerDTO _$TransactionProfileContainerDTOFromJson(
    Map<String, dynamic> json) {
  return _TransactionProfileContainerDTO.fromJson(json);
}

/// @nodoc
mixin _$TransactionProfileContainerDTO {
  @JsonKey(name: 'TransactionProfileId')
  int get transactionProfileId => throw _privateConstructorUsedError;
  @JsonKey(name: 'ProfileName')
  String get profileName => throw _privateConstructorUsedError;
  @JsonKey(name: 'Guid')
  String get guid => throw _privateConstructorUsedError;
  @JsonKey(name: 'VerificationRequired')
  bool get verificationRequired => throw _privateConstructorUsedError;
  @JsonKey(name: 'PriceListId')
  int get priceListId => throw _privateConstructorUsedError;
  @JsonKey(name: 'EnableModifiers')
  bool get enableModifiers => throw _privateConstructorUsedError;
  @JsonKey(name: 'TransactionRemarksMandatory')
  bool get transactionRemarksMandatory => throw _privateConstructorUsedError;
  @JsonKey(name: 'TransactionProfileTaxRuleContainerDTOList')
  List<TransactionProfileTaxRuleContainerDTO>
      get transactionProfileTaxRuleContainerDtoList =>
          throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TransactionProfileContainerDTOCopyWith<TransactionProfileContainerDTO>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionProfileContainerDTOCopyWith<$Res> {
  factory $TransactionProfileContainerDTOCopyWith(
          TransactionProfileContainerDTO value,
          $Res Function(TransactionProfileContainerDTO) then) =
      _$TransactionProfileContainerDTOCopyWithImpl<$Res,
          TransactionProfileContainerDTO>;
  @useResult
  $Res call(
      {@JsonKey(name: 'TransactionProfileId')
          int transactionProfileId,
      @JsonKey(name: 'ProfileName')
          String profileName,
      @JsonKey(name: 'Guid')
          String guid,
      @JsonKey(name: 'VerificationRequired')
          bool verificationRequired,
      @JsonKey(name: 'PriceListId')
          int priceListId,
      @JsonKey(name: 'EnableModifiers')
          bool enableModifiers,
      @JsonKey(name: 'TransactionRemarksMandatory')
          bool transactionRemarksMandatory,
      @JsonKey(name: 'TransactionProfileTaxRuleContainerDTOList')
          List<TransactionProfileTaxRuleContainerDTO>
              transactionProfileTaxRuleContainerDtoList});
}

/// @nodoc
class _$TransactionProfileContainerDTOCopyWithImpl<$Res,
        $Val extends TransactionProfileContainerDTO>
    implements $TransactionProfileContainerDTOCopyWith<$Res> {
  _$TransactionProfileContainerDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transactionProfileId = null,
    Object? profileName = null,
    Object? guid = null,
    Object? verificationRequired = null,
    Object? priceListId = null,
    Object? enableModifiers = null,
    Object? transactionRemarksMandatory = null,
    Object? transactionProfileTaxRuleContainerDtoList = null,
  }) {
    return _then(_value.copyWith(
      transactionProfileId: null == transactionProfileId
          ? _value.transactionProfileId
          : transactionProfileId // ignore: cast_nullable_to_non_nullable
              as int,
      profileName: null == profileName
          ? _value.profileName
          : profileName // ignore: cast_nullable_to_non_nullable
              as String,
      guid: null == guid
          ? _value.guid
          : guid // ignore: cast_nullable_to_non_nullable
              as String,
      verificationRequired: null == verificationRequired
          ? _value.verificationRequired
          : verificationRequired // ignore: cast_nullable_to_non_nullable
              as bool,
      priceListId: null == priceListId
          ? _value.priceListId
          : priceListId // ignore: cast_nullable_to_non_nullable
              as int,
      enableModifiers: null == enableModifiers
          ? _value.enableModifiers
          : enableModifiers // ignore: cast_nullable_to_non_nullable
              as bool,
      transactionRemarksMandatory: null == transactionRemarksMandatory
          ? _value.transactionRemarksMandatory
          : transactionRemarksMandatory // ignore: cast_nullable_to_non_nullable
              as bool,
      transactionProfileTaxRuleContainerDtoList: null ==
              transactionProfileTaxRuleContainerDtoList
          ? _value.transactionProfileTaxRuleContainerDtoList
          : transactionProfileTaxRuleContainerDtoList // ignore: cast_nullable_to_non_nullable
              as List<TransactionProfileTaxRuleContainerDTO>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TransactionProfileContainerDTOCopyWith<$Res>
    implements $TransactionProfileContainerDTOCopyWith<$Res> {
  factory _$$_TransactionProfileContainerDTOCopyWith(
          _$_TransactionProfileContainerDTO value,
          $Res Function(_$_TransactionProfileContainerDTO) then) =
      __$$_TransactionProfileContainerDTOCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'TransactionProfileId')
          int transactionProfileId,
      @JsonKey(name: 'ProfileName')
          String profileName,
      @JsonKey(name: 'Guid')
          String guid,
      @JsonKey(name: 'VerificationRequired')
          bool verificationRequired,
      @JsonKey(name: 'PriceListId')
          int priceListId,
      @JsonKey(name: 'EnableModifiers')
          bool enableModifiers,
      @JsonKey(name: 'TransactionRemarksMandatory')
          bool transactionRemarksMandatory,
      @JsonKey(name: 'TransactionProfileTaxRuleContainerDTOList')
          List<TransactionProfileTaxRuleContainerDTO>
              transactionProfileTaxRuleContainerDtoList});
}

/// @nodoc
class __$$_TransactionProfileContainerDTOCopyWithImpl<$Res>
    extends _$TransactionProfileContainerDTOCopyWithImpl<$Res,
        _$_TransactionProfileContainerDTO>
    implements _$$_TransactionProfileContainerDTOCopyWith<$Res> {
  __$$_TransactionProfileContainerDTOCopyWithImpl(
      _$_TransactionProfileContainerDTO _value,
      $Res Function(_$_TransactionProfileContainerDTO) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transactionProfileId = null,
    Object? profileName = null,
    Object? guid = null,
    Object? verificationRequired = null,
    Object? priceListId = null,
    Object? enableModifiers = null,
    Object? transactionRemarksMandatory = null,
    Object? transactionProfileTaxRuleContainerDtoList = null,
  }) {
    return _then(_$_TransactionProfileContainerDTO(
      transactionProfileId: null == transactionProfileId
          ? _value.transactionProfileId
          : transactionProfileId // ignore: cast_nullable_to_non_nullable
              as int,
      profileName: null == profileName
          ? _value.profileName
          : profileName // ignore: cast_nullable_to_non_nullable
              as String,
      guid: null == guid
          ? _value.guid
          : guid // ignore: cast_nullable_to_non_nullable
              as String,
      verificationRequired: null == verificationRequired
          ? _value.verificationRequired
          : verificationRequired // ignore: cast_nullable_to_non_nullable
              as bool,
      priceListId: null == priceListId
          ? _value.priceListId
          : priceListId // ignore: cast_nullable_to_non_nullable
              as int,
      enableModifiers: null == enableModifiers
          ? _value.enableModifiers
          : enableModifiers // ignore: cast_nullable_to_non_nullable
              as bool,
      transactionRemarksMandatory: null == transactionRemarksMandatory
          ? _value.transactionRemarksMandatory
          : transactionRemarksMandatory // ignore: cast_nullable_to_non_nullable
              as bool,
      transactionProfileTaxRuleContainerDtoList: null ==
              transactionProfileTaxRuleContainerDtoList
          ? _value._transactionProfileTaxRuleContainerDtoList
          : transactionProfileTaxRuleContainerDtoList // ignore: cast_nullable_to_non_nullable
              as List<TransactionProfileTaxRuleContainerDTO>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TransactionProfileContainerDTO
    implements _TransactionProfileContainerDTO {
  const _$_TransactionProfileContainerDTO(
      {@JsonKey(name: 'TransactionProfileId')
          required this.transactionProfileId,
      @JsonKey(name: 'ProfileName')
          required this.profileName,
      @JsonKey(name: 'Guid')
          required this.guid,
      @JsonKey(name: 'VerificationRequired')
          required this.verificationRequired,
      @JsonKey(name: 'PriceListId')
          required this.priceListId,
      @JsonKey(name: 'EnableModifiers')
          required this.enableModifiers,
      @JsonKey(name: 'TransactionRemarksMandatory')
          required this.transactionRemarksMandatory,
      @JsonKey(name: 'TransactionProfileTaxRuleContainerDTOList')
          required final List<TransactionProfileTaxRuleContainerDTO>
              transactionProfileTaxRuleContainerDtoList})
      : _transactionProfileTaxRuleContainerDtoList =
            transactionProfileTaxRuleContainerDtoList;

  factory _$_TransactionProfileContainerDTO.fromJson(
          Map<String, dynamic> json) =>
      _$$_TransactionProfileContainerDTOFromJson(json);

  @override
  @JsonKey(name: 'TransactionProfileId')
  final int transactionProfileId;
  @override
  @JsonKey(name: 'ProfileName')
  final String profileName;
  @override
  @JsonKey(name: 'Guid')
  final String guid;
  @override
  @JsonKey(name: 'VerificationRequired')
  final bool verificationRequired;
  @override
  @JsonKey(name: 'PriceListId')
  final int priceListId;
  @override
  @JsonKey(name: 'EnableModifiers')
  final bool enableModifiers;
  @override
  @JsonKey(name: 'TransactionRemarksMandatory')
  final bool transactionRemarksMandatory;
  final List<TransactionProfileTaxRuleContainerDTO>
      _transactionProfileTaxRuleContainerDtoList;
  @override
  @JsonKey(name: 'TransactionProfileTaxRuleContainerDTOList')
  List<TransactionProfileTaxRuleContainerDTO>
      get transactionProfileTaxRuleContainerDtoList {
    if (_transactionProfileTaxRuleContainerDtoList is EqualUnmodifiableListView)
      return _transactionProfileTaxRuleContainerDtoList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(
        _transactionProfileTaxRuleContainerDtoList);
  }

  @override
  String toString() {
    return 'TransactionProfileContainerDTO(transactionProfileId: $transactionProfileId, profileName: $profileName, guid: $guid, verificationRequired: $verificationRequired, priceListId: $priceListId, enableModifiers: $enableModifiers, transactionRemarksMandatory: $transactionRemarksMandatory, transactionProfileTaxRuleContainerDtoList: $transactionProfileTaxRuleContainerDtoList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TransactionProfileContainerDTO &&
            (identical(other.transactionProfileId, transactionProfileId) ||
                other.transactionProfileId == transactionProfileId) &&
            (identical(other.profileName, profileName) ||
                other.profileName == profileName) &&
            (identical(other.guid, guid) || other.guid == guid) &&
            (identical(other.verificationRequired, verificationRequired) ||
                other.verificationRequired == verificationRequired) &&
            (identical(other.priceListId, priceListId) ||
                other.priceListId == priceListId) &&
            (identical(other.enableModifiers, enableModifiers) ||
                other.enableModifiers == enableModifiers) &&
            (identical(other.transactionRemarksMandatory,
                    transactionRemarksMandatory) ||
                other.transactionRemarksMandatory ==
                    transactionRemarksMandatory) &&
            const DeepCollectionEquality().equals(
                other._transactionProfileTaxRuleContainerDtoList,
                _transactionProfileTaxRuleContainerDtoList));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      transactionProfileId,
      profileName,
      guid,
      verificationRequired,
      priceListId,
      enableModifiers,
      transactionRemarksMandatory,
      const DeepCollectionEquality()
          .hash(_transactionProfileTaxRuleContainerDtoList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TransactionProfileContainerDTOCopyWith<_$_TransactionProfileContainerDTO>
      get copyWith => __$$_TransactionProfileContainerDTOCopyWithImpl<
          _$_TransactionProfileContainerDTO>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TransactionProfileContainerDTOToJson(
      this,
    );
  }
}

abstract class _TransactionProfileContainerDTO
    implements TransactionProfileContainerDTO {
  const factory _TransactionProfileContainerDTO(
          {@JsonKey(name: 'TransactionProfileId')
              required final int transactionProfileId,
          @JsonKey(name: 'ProfileName')
              required final String profileName,
          @JsonKey(name: 'Guid')
              required final String guid,
          @JsonKey(name: 'VerificationRequired')
              required final bool verificationRequired,
          @JsonKey(name: 'PriceListId')
              required final int priceListId,
          @JsonKey(name: 'EnableModifiers')
              required final bool enableModifiers,
          @JsonKey(name: 'TransactionRemarksMandatory')
              required final bool transactionRemarksMandatory,
          @JsonKey(name: 'TransactionProfileTaxRuleContainerDTOList')
              required final List<TransactionProfileTaxRuleContainerDTO>
                  transactionProfileTaxRuleContainerDtoList}) =
      _$_TransactionProfileContainerDTO;

  factory _TransactionProfileContainerDTO.fromJson(Map<String, dynamic> json) =
      _$_TransactionProfileContainerDTO.fromJson;

  @override
  @JsonKey(name: 'TransactionProfileId')
  int get transactionProfileId;
  @override
  @JsonKey(name: 'ProfileName')
  String get profileName;
  @override
  @JsonKey(name: 'Guid')
  String get guid;
  @override
  @JsonKey(name: 'VerificationRequired')
  bool get verificationRequired;
  @override
  @JsonKey(name: 'PriceListId')
  int get priceListId;
  @override
  @JsonKey(name: 'EnableModifiers')
  bool get enableModifiers;
  @override
  @JsonKey(name: 'TransactionRemarksMandatory')
  bool get transactionRemarksMandatory;
  @override
  @JsonKey(name: 'TransactionProfileTaxRuleContainerDTOList')
  List<TransactionProfileTaxRuleContainerDTO>
      get transactionProfileTaxRuleContainerDtoList;
  @override
  @JsonKey(ignore: true)
  _$$_TransactionProfileContainerDTOCopyWith<_$_TransactionProfileContainerDTO>
      get copyWith => throw _privateConstructorUsedError;
}
