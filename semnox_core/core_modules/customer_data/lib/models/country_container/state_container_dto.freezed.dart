// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'state_container_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

StateContainerDTO _$StateContainerDTOFromJson(Map<String, dynamic> json) {
  return _StateContainerDTO.fromJson(json);
}

/// @nodoc
mixin _$StateContainerDTO {
  @JsonKey(name: 'StateId')
  int get stateId => throw _privateConstructorUsedError;
  @JsonKey(name: 'State')
  String get state => throw _privateConstructorUsedError;
  @JsonKey(name: 'Description')
  String get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'CountryId')
  int get countryId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StateContainerDTOCopyWith<StateContainerDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StateContainerDTOCopyWith<$Res> {
  factory $StateContainerDTOCopyWith(
          StateContainerDTO value, $Res Function(StateContainerDTO) then) =
      _$StateContainerDTOCopyWithImpl<$Res, StateContainerDTO>;
  @useResult
  $Res call(
      {@JsonKey(name: 'StateId') int stateId,
      @JsonKey(name: 'State') String state,
      @JsonKey(name: 'Description') String description,
      @JsonKey(name: 'CountryId') int countryId});
}

/// @nodoc
class _$StateContainerDTOCopyWithImpl<$Res, $Val extends StateContainerDTO>
    implements $StateContainerDTOCopyWith<$Res> {
  _$StateContainerDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? stateId = null,
    Object? state = null,
    Object? description = null,
    Object? countryId = null,
  }) {
    return _then(_value.copyWith(
      stateId: null == stateId
          ? _value.stateId
          : stateId // ignore: cast_nullable_to_non_nullable
              as int,
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      countryId: null == countryId
          ? _value.countryId
          : countryId // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_StateContainerDTOCopyWith<$Res>
    implements $StateContainerDTOCopyWith<$Res> {
  factory _$$_StateContainerDTOCopyWith(_$_StateContainerDTO value,
          $Res Function(_$_StateContainerDTO) then) =
      __$$_StateContainerDTOCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'StateId') int stateId,
      @JsonKey(name: 'State') String state,
      @JsonKey(name: 'Description') String description,
      @JsonKey(name: 'CountryId') int countryId});
}

/// @nodoc
class __$$_StateContainerDTOCopyWithImpl<$Res>
    extends _$StateContainerDTOCopyWithImpl<$Res, _$_StateContainerDTO>
    implements _$$_StateContainerDTOCopyWith<$Res> {
  __$$_StateContainerDTOCopyWithImpl(
      _$_StateContainerDTO _value, $Res Function(_$_StateContainerDTO) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? stateId = null,
    Object? state = null,
    Object? description = null,
    Object? countryId = null,
  }) {
    return _then(_$_StateContainerDTO(
      stateId: null == stateId
          ? _value.stateId
          : stateId // ignore: cast_nullable_to_non_nullable
              as int,
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      countryId: null == countryId
          ? _value.countryId
          : countryId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_StateContainerDTO implements _StateContainerDTO {
  const _$_StateContainerDTO(
      {@JsonKey(name: 'StateId') required this.stateId,
      @JsonKey(name: 'State') required this.state,
      @JsonKey(name: 'Description') required this.description,
      @JsonKey(name: 'CountryId') required this.countryId});

  factory _$_StateContainerDTO.fromJson(Map<String, dynamic> json) =>
      _$$_StateContainerDTOFromJson(json);

  @override
  @JsonKey(name: 'StateId')
  final int stateId;
  @override
  @JsonKey(name: 'State')
  final String state;
  @override
  @JsonKey(name: 'Description')
  final String description;
  @override
  @JsonKey(name: 'CountryId')
  final int countryId;

  @override
  String toString() {
    return 'StateContainerDTO(stateId: $stateId, state: $state, description: $description, countryId: $countryId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_StateContainerDTO &&
            (identical(other.stateId, stateId) || other.stateId == stateId) &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.countryId, countryId) ||
                other.countryId == countryId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, stateId, state, description, countryId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_StateContainerDTOCopyWith<_$_StateContainerDTO> get copyWith =>
      __$$_StateContainerDTOCopyWithImpl<_$_StateContainerDTO>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_StateContainerDTOToJson(
      this,
    );
  }
}

abstract class _StateContainerDTO implements StateContainerDTO {
  const factory _StateContainerDTO(
          {@JsonKey(name: 'StateId') required final int stateId,
          @JsonKey(name: 'State') required final String state,
          @JsonKey(name: 'Description') required final String description,
          @JsonKey(name: 'CountryId') required final int countryId}) =
      _$_StateContainerDTO;

  factory _StateContainerDTO.fromJson(Map<String, dynamic> json) =
      _$_StateContainerDTO.fromJson;

  @override
  @JsonKey(name: 'StateId')
  int get stateId;
  @override
  @JsonKey(name: 'State')
  String get state;
  @override
  @JsonKey(name: 'Description')
  String get description;
  @override
  @JsonKey(name: 'CountryId')
  int get countryId;
  @override
  @JsonKey(ignore: true)
  _$$_StateContainerDTOCopyWith<_$_StateContainerDTO> get copyWith =>
      throw _privateConstructorUsedError;
}
