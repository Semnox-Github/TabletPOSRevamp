// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'customer_register_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CustomerRegisterRequest _$CustomerRegisterRequestFromJson(
    Map<String, dynamic> json) {
  return _CustomerRegisterRequest.fromJson(json);
}

/// @nodoc
mixin _$CustomerRegisterRequest {
  @JsonKey(name: 'Id')
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'ProfileId')
  int get profileId => throw _privateConstructorUsedError;
  @JsonKey(name: 'MembershipId')
  int get membershipId => throw _privateConstructorUsedError;
  @JsonKey(name: 'MasterEntityId')
  int get masterEntityId => throw _privateConstructorUsedError;
  @JsonKey(name: 'ExternalSystemReference')
  String? get externalSystemReference => throw _privateConstructorUsedError;
  @JsonKey(name: 'Channel')
  String? get channel => throw _privateConstructorUsedError;
  @JsonKey(name: 'profileDTO')
  ProfileDTO get profileDTO => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CustomerRegisterRequestCopyWith<CustomerRegisterRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomerRegisterRequestCopyWith<$Res> {
  factory $CustomerRegisterRequestCopyWith(CustomerRegisterRequest value,
          $Res Function(CustomerRegisterRequest) then) =
      _$CustomerRegisterRequestCopyWithImpl<$Res, CustomerRegisterRequest>;
  @useResult
  $Res call(
      {@JsonKey(name: 'Id') int id,
      @JsonKey(name: 'ProfileId') int profileId,
      @JsonKey(name: 'MembershipId') int membershipId,
      @JsonKey(name: 'MasterEntityId') int masterEntityId,
      @JsonKey(name: 'ExternalSystemReference') String? externalSystemReference,
      @JsonKey(name: 'Channel') String? channel,
      @JsonKey(name: 'profileDTO') ProfileDTO profileDTO});

  $ProfileDTOCopyWith<$Res> get profileDTO;
}

/// @nodoc
class _$CustomerRegisterRequestCopyWithImpl<$Res,
        $Val extends CustomerRegisterRequest>
    implements $CustomerRegisterRequestCopyWith<$Res> {
  _$CustomerRegisterRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? profileId = null,
    Object? membershipId = null,
    Object? masterEntityId = null,
    Object? externalSystemReference = freezed,
    Object? channel = freezed,
    Object? profileDTO = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      profileId: null == profileId
          ? _value.profileId
          : profileId // ignore: cast_nullable_to_non_nullable
              as int,
      membershipId: null == membershipId
          ? _value.membershipId
          : membershipId // ignore: cast_nullable_to_non_nullable
              as int,
      masterEntityId: null == masterEntityId
          ? _value.masterEntityId
          : masterEntityId // ignore: cast_nullable_to_non_nullable
              as int,
      externalSystemReference: freezed == externalSystemReference
          ? _value.externalSystemReference
          : externalSystemReference // ignore: cast_nullable_to_non_nullable
              as String?,
      channel: freezed == channel
          ? _value.channel
          : channel // ignore: cast_nullable_to_non_nullable
              as String?,
      profileDTO: null == profileDTO
          ? _value.profileDTO
          : profileDTO // ignore: cast_nullable_to_non_nullable
              as ProfileDTO,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ProfileDTOCopyWith<$Res> get profileDTO {
    return $ProfileDTOCopyWith<$Res>(_value.profileDTO, (value) {
      return _then(_value.copyWith(profileDTO: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_CustomerRegisterRequestCopyWith<$Res>
    implements $CustomerRegisterRequestCopyWith<$Res> {
  factory _$$_CustomerRegisterRequestCopyWith(_$_CustomerRegisterRequest value,
          $Res Function(_$_CustomerRegisterRequest) then) =
      __$$_CustomerRegisterRequestCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'Id') int id,
      @JsonKey(name: 'ProfileId') int profileId,
      @JsonKey(name: 'MembershipId') int membershipId,
      @JsonKey(name: 'MasterEntityId') int masterEntityId,
      @JsonKey(name: 'ExternalSystemReference') String? externalSystemReference,
      @JsonKey(name: 'Channel') String? channel,
      @JsonKey(name: 'profileDTO') ProfileDTO profileDTO});

  @override
  $ProfileDTOCopyWith<$Res> get profileDTO;
}

/// @nodoc
class __$$_CustomerRegisterRequestCopyWithImpl<$Res>
    extends _$CustomerRegisterRequestCopyWithImpl<$Res,
        _$_CustomerRegisterRequest>
    implements _$$_CustomerRegisterRequestCopyWith<$Res> {
  __$$_CustomerRegisterRequestCopyWithImpl(_$_CustomerRegisterRequest _value,
      $Res Function(_$_CustomerRegisterRequest) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? profileId = null,
    Object? membershipId = null,
    Object? masterEntityId = null,
    Object? externalSystemReference = freezed,
    Object? channel = freezed,
    Object? profileDTO = null,
  }) {
    return _then(_$_CustomerRegisterRequest(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      profileId: null == profileId
          ? _value.profileId
          : profileId // ignore: cast_nullable_to_non_nullable
              as int,
      membershipId: null == membershipId
          ? _value.membershipId
          : membershipId // ignore: cast_nullable_to_non_nullable
              as int,
      masterEntityId: null == masterEntityId
          ? _value.masterEntityId
          : masterEntityId // ignore: cast_nullable_to_non_nullable
              as int,
      externalSystemReference: freezed == externalSystemReference
          ? _value.externalSystemReference
          : externalSystemReference // ignore: cast_nullable_to_non_nullable
              as String?,
      channel: freezed == channel
          ? _value.channel
          : channel // ignore: cast_nullable_to_non_nullable
              as String?,
      profileDTO: null == profileDTO
          ? _value.profileDTO
          : profileDTO // ignore: cast_nullable_to_non_nullable
              as ProfileDTO,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CustomerRegisterRequest implements _CustomerRegisterRequest {
  const _$_CustomerRegisterRequest(
      {@JsonKey(name: 'Id') required this.id,
      @JsonKey(name: 'ProfileId') required this.profileId,
      @JsonKey(name: 'MembershipId') required this.membershipId,
      @JsonKey(name: 'MasterEntityId') required this.masterEntityId,
      @JsonKey(name: 'ExternalSystemReference') this.externalSystemReference,
      @JsonKey(name: 'Channel') this.channel,
      @JsonKey(name: 'profileDTO') required this.profileDTO});

  factory _$_CustomerRegisterRequest.fromJson(Map<String, dynamic> json) =>
      _$$_CustomerRegisterRequestFromJson(json);

  @override
  @JsonKey(name: 'Id')
  final int id;
  @override
  @JsonKey(name: 'ProfileId')
  final int profileId;
  @override
  @JsonKey(name: 'MembershipId')
  final int membershipId;
  @override
  @JsonKey(name: 'MasterEntityId')
  final int masterEntityId;
  @override
  @JsonKey(name: 'ExternalSystemReference')
  final String? externalSystemReference;
  @override
  @JsonKey(name: 'Channel')
  final String? channel;
  @override
  @JsonKey(name: 'profileDTO')
  final ProfileDTO profileDTO;

  @override
  String toString() {
    return 'CustomerRegisterRequest(id: $id, profileId: $profileId, membershipId: $membershipId, masterEntityId: $masterEntityId, externalSystemReference: $externalSystemReference, channel: $channel, profileDTO: $profileDTO)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CustomerRegisterRequest &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.profileId, profileId) ||
                other.profileId == profileId) &&
            (identical(other.membershipId, membershipId) ||
                other.membershipId == membershipId) &&
            (identical(other.masterEntityId, masterEntityId) ||
                other.masterEntityId == masterEntityId) &&
            (identical(
                    other.externalSystemReference, externalSystemReference) ||
                other.externalSystemReference == externalSystemReference) &&
            (identical(other.channel, channel) || other.channel == channel) &&
            (identical(other.profileDTO, profileDTO) ||
                other.profileDTO == profileDTO));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, profileId, membershipId,
      masterEntityId, externalSystemReference, channel, profileDTO);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CustomerRegisterRequestCopyWith<_$_CustomerRegisterRequest>
      get copyWith =>
          __$$_CustomerRegisterRequestCopyWithImpl<_$_CustomerRegisterRequest>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CustomerRegisterRequestToJson(
      this,
    );
  }
}

abstract class _CustomerRegisterRequest implements CustomerRegisterRequest {
  const factory _CustomerRegisterRequest(
      {@JsonKey(name: 'Id')
          required final int id,
      @JsonKey(name: 'ProfileId')
          required final int profileId,
      @JsonKey(name: 'MembershipId')
          required final int membershipId,
      @JsonKey(name: 'MasterEntityId')
          required final int masterEntityId,
      @JsonKey(name: 'ExternalSystemReference')
          final String? externalSystemReference,
      @JsonKey(name: 'Channel')
          final String? channel,
      @JsonKey(name: 'profileDTO')
          required final ProfileDTO profileDTO}) = _$_CustomerRegisterRequest;

  factory _CustomerRegisterRequest.fromJson(Map<String, dynamic> json) =
      _$_CustomerRegisterRequest.fromJson;

  @override
  @JsonKey(name: 'Id')
  int get id;
  @override
  @JsonKey(name: 'ProfileId')
  int get profileId;
  @override
  @JsonKey(name: 'MembershipId')
  int get membershipId;
  @override
  @JsonKey(name: 'MasterEntityId')
  int get masterEntityId;
  @override
  @JsonKey(name: 'ExternalSystemReference')
  String? get externalSystemReference;
  @override
  @JsonKey(name: 'Channel')
  String? get channel;
  @override
  @JsonKey(name: 'profileDTO')
  ProfileDTO get profileDTO;
  @override
  @JsonKey(ignore: true)
  _$$_CustomerRegisterRequestCopyWith<_$_CustomerRegisterRequest>
      get copyWith => throw _privateConstructorUsedError;
}
