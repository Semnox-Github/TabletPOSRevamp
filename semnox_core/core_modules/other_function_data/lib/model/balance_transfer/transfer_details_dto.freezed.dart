// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transfer_details_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TransferDetailsDto _$TransferDetailsDtoFromJson(Map<String, dynamic> json) {
  return _TransferDetailsDto.fromJson(json);
}

/// @nodoc
mixin _$TransferDetailsDto {
  @JsonKey(name: 'CardId')
  int? get cardId => throw _privateConstructorUsedError;
  @JsonKey(name: 'Entitlements')
  Entitlements? get entitlements => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TransferDetailsDtoCopyWith<TransferDetailsDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransferDetailsDtoCopyWith<$Res> {
  factory $TransferDetailsDtoCopyWith(
          TransferDetailsDto value, $Res Function(TransferDetailsDto) then) =
      _$TransferDetailsDtoCopyWithImpl<$Res, TransferDetailsDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'CardId') int? cardId,
      @JsonKey(name: 'Entitlements') Entitlements? entitlements});

  $EntitlementsCopyWith<$Res>? get entitlements;
}

/// @nodoc
class _$TransferDetailsDtoCopyWithImpl<$Res, $Val extends TransferDetailsDto>
    implements $TransferDetailsDtoCopyWith<$Res> {
  _$TransferDetailsDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cardId = freezed,
    Object? entitlements = freezed,
  }) {
    return _then(_value.copyWith(
      cardId: freezed == cardId
          ? _value.cardId
          : cardId // ignore: cast_nullable_to_non_nullable
              as int?,
      entitlements: freezed == entitlements
          ? _value.entitlements
          : entitlements // ignore: cast_nullable_to_non_nullable
              as Entitlements?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $EntitlementsCopyWith<$Res>? get entitlements {
    if (_value.entitlements == null) {
      return null;
    }

    return $EntitlementsCopyWith<$Res>(_value.entitlements!, (value) {
      return _then(_value.copyWith(entitlements: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_TransferDetailsDtoCopyWith<$Res>
    implements $TransferDetailsDtoCopyWith<$Res> {
  factory _$$_TransferDetailsDtoCopyWith(_$_TransferDetailsDto value,
          $Res Function(_$_TransferDetailsDto) then) =
      __$$_TransferDetailsDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'CardId') int? cardId,
      @JsonKey(name: 'Entitlements') Entitlements? entitlements});

  @override
  $EntitlementsCopyWith<$Res>? get entitlements;
}

/// @nodoc
class __$$_TransferDetailsDtoCopyWithImpl<$Res>
    extends _$TransferDetailsDtoCopyWithImpl<$Res, _$_TransferDetailsDto>
    implements _$$_TransferDetailsDtoCopyWith<$Res> {
  __$$_TransferDetailsDtoCopyWithImpl(
      _$_TransferDetailsDto _value, $Res Function(_$_TransferDetailsDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cardId = freezed,
    Object? entitlements = freezed,
  }) {
    return _then(_$_TransferDetailsDto(
      cardId: freezed == cardId
          ? _value.cardId
          : cardId // ignore: cast_nullable_to_non_nullable
              as int?,
      entitlements: freezed == entitlements
          ? _value.entitlements
          : entitlements // ignore: cast_nullable_to_non_nullable
              as Entitlements?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TransferDetailsDto implements _TransferDetailsDto {
  const _$_TransferDetailsDto(
      {@JsonKey(name: 'CardId') this.cardId,
      @JsonKey(name: 'Entitlements') this.entitlements});

  factory _$_TransferDetailsDto.fromJson(Map<String, dynamic> json) =>
      _$$_TransferDetailsDtoFromJson(json);

  @override
  @JsonKey(name: 'CardId')
  final int? cardId;
  @override
  @JsonKey(name: 'Entitlements')
  final Entitlements? entitlements;

  @override
  String toString() {
    return 'TransferDetailsDto(cardId: $cardId, entitlements: $entitlements)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TransferDetailsDto &&
            (identical(other.cardId, cardId) || other.cardId == cardId) &&
            (identical(other.entitlements, entitlements) ||
                other.entitlements == entitlements));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, cardId, entitlements);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TransferDetailsDtoCopyWith<_$_TransferDetailsDto> get copyWith =>
      __$$_TransferDetailsDtoCopyWithImpl<_$_TransferDetailsDto>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TransferDetailsDtoToJson(
      this,
    );
  }
}

abstract class _TransferDetailsDto implements TransferDetailsDto {
  const factory _TransferDetailsDto(
          {@JsonKey(name: 'CardId') final int? cardId,
          @JsonKey(name: 'Entitlements') final Entitlements? entitlements}) =
      _$_TransferDetailsDto;

  factory _TransferDetailsDto.fromJson(Map<String, dynamic> json) =
      _$_TransferDetailsDto.fromJson;

  @override
  @JsonKey(name: 'CardId')
  int? get cardId;
  @override
  @JsonKey(name: 'Entitlements')
  Entitlements? get entitlements;
  @override
  @JsonKey(ignore: true)
  _$$_TransferDetailsDtoCopyWith<_$_TransferDetailsDto> get copyWith =>
      throw _privateConstructorUsedError;
}
