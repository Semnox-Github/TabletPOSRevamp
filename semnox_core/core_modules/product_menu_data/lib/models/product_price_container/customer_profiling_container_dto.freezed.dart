// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'customer_profiling_container_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CustomerProfilingGroupContainerDTO _$CustomerProfilingGroupContainerDTOFromJson(
    Map<String, dynamic> json) {
  return _CustomerProfilingGroupContainerDTO.fromJson(json);
}

/// @nodoc
mixin _$CustomerProfilingGroupContainerDTO {
  @JsonKey(name: 'CustomerProfilingGroupId')
  int get customerProfilingGroupId => throw _privateConstructorUsedError;
  @JsonKey(name: 'ProfilingGroupName')
  String get profilingGroupName => throw _privateConstructorUsedError;
  @JsonKey(name: 'CustomerProfilingContainerDTOList')
  List<dynamic> get customerProfilingContainerDTOList =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CustomerProfilingGroupContainerDTOCopyWith<
          CustomerProfilingGroupContainerDTO>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomerProfilingGroupContainerDTOCopyWith<$Res> {
  factory $CustomerProfilingGroupContainerDTOCopyWith(
          CustomerProfilingGroupContainerDTO value,
          $Res Function(CustomerProfilingGroupContainerDTO) then) =
      _$CustomerProfilingGroupContainerDTOCopyWithImpl<$Res,
          CustomerProfilingGroupContainerDTO>;
  @useResult
  $Res call(
      {@JsonKey(name: 'CustomerProfilingGroupId')
          int customerProfilingGroupId,
      @JsonKey(name: 'ProfilingGroupName')
          String profilingGroupName,
      @JsonKey(name: 'CustomerProfilingContainerDTOList')
          List<dynamic> customerProfilingContainerDTOList});
}

/// @nodoc
class _$CustomerProfilingGroupContainerDTOCopyWithImpl<$Res,
        $Val extends CustomerProfilingGroupContainerDTO>
    implements $CustomerProfilingGroupContainerDTOCopyWith<$Res> {
  _$CustomerProfilingGroupContainerDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? customerProfilingGroupId = null,
    Object? profilingGroupName = null,
    Object? customerProfilingContainerDTOList = null,
  }) {
    return _then(_value.copyWith(
      customerProfilingGroupId: null == customerProfilingGroupId
          ? _value.customerProfilingGroupId
          : customerProfilingGroupId // ignore: cast_nullable_to_non_nullable
              as int,
      profilingGroupName: null == profilingGroupName
          ? _value.profilingGroupName
          : profilingGroupName // ignore: cast_nullable_to_non_nullable
              as String,
      customerProfilingContainerDTOList: null ==
              customerProfilingContainerDTOList
          ? _value.customerProfilingContainerDTOList
          : customerProfilingContainerDTOList // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CustomerProfilingGroupContainerDTOCopyWith<$Res>
    implements $CustomerProfilingGroupContainerDTOCopyWith<$Res> {
  factory _$$_CustomerProfilingGroupContainerDTOCopyWith(
          _$_CustomerProfilingGroupContainerDTO value,
          $Res Function(_$_CustomerProfilingGroupContainerDTO) then) =
      __$$_CustomerProfilingGroupContainerDTOCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'CustomerProfilingGroupId')
          int customerProfilingGroupId,
      @JsonKey(name: 'ProfilingGroupName')
          String profilingGroupName,
      @JsonKey(name: 'CustomerProfilingContainerDTOList')
          List<dynamic> customerProfilingContainerDTOList});
}

/// @nodoc
class __$$_CustomerProfilingGroupContainerDTOCopyWithImpl<$Res>
    extends _$CustomerProfilingGroupContainerDTOCopyWithImpl<$Res,
        _$_CustomerProfilingGroupContainerDTO>
    implements _$$_CustomerProfilingGroupContainerDTOCopyWith<$Res> {
  __$$_CustomerProfilingGroupContainerDTOCopyWithImpl(
      _$_CustomerProfilingGroupContainerDTO _value,
      $Res Function(_$_CustomerProfilingGroupContainerDTO) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? customerProfilingGroupId = null,
    Object? profilingGroupName = null,
    Object? customerProfilingContainerDTOList = null,
  }) {
    return _then(_$_CustomerProfilingGroupContainerDTO(
      customerProfilingGroupId: null == customerProfilingGroupId
          ? _value.customerProfilingGroupId
          : customerProfilingGroupId // ignore: cast_nullable_to_non_nullable
              as int,
      profilingGroupName: null == profilingGroupName
          ? _value.profilingGroupName
          : profilingGroupName // ignore: cast_nullable_to_non_nullable
              as String,
      customerProfilingContainerDTOList: null ==
              customerProfilingContainerDTOList
          ? _value._customerProfilingContainerDTOList
          : customerProfilingContainerDTOList // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CustomerProfilingGroupContainerDTO
    implements _CustomerProfilingGroupContainerDTO {
  const _$_CustomerProfilingGroupContainerDTO(
      {@JsonKey(name: 'CustomerProfilingGroupId')
          required this.customerProfilingGroupId,
      @JsonKey(name: 'ProfilingGroupName')
          required this.profilingGroupName,
      @JsonKey(name: 'CustomerProfilingContainerDTOList')
          required final List<dynamic> customerProfilingContainerDTOList})
      : _customerProfilingContainerDTOList = customerProfilingContainerDTOList;

  factory _$_CustomerProfilingGroupContainerDTO.fromJson(
          Map<String, dynamic> json) =>
      _$$_CustomerProfilingGroupContainerDTOFromJson(json);

  @override
  @JsonKey(name: 'CustomerProfilingGroupId')
  final int customerProfilingGroupId;
  @override
  @JsonKey(name: 'ProfilingGroupName')
  final String profilingGroupName;
  final List<dynamic> _customerProfilingContainerDTOList;
  @override
  @JsonKey(name: 'CustomerProfilingContainerDTOList')
  List<dynamic> get customerProfilingContainerDTOList {
    if (_customerProfilingContainerDTOList is EqualUnmodifiableListView)
      return _customerProfilingContainerDTOList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_customerProfilingContainerDTOList);
  }

  @override
  String toString() {
    return 'CustomerProfilingGroupContainerDTO(customerProfilingGroupId: $customerProfilingGroupId, profilingGroupName: $profilingGroupName, customerProfilingContainerDTOList: $customerProfilingContainerDTOList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CustomerProfilingGroupContainerDTO &&
            (identical(
                    other.customerProfilingGroupId, customerProfilingGroupId) ||
                other.customerProfilingGroupId == customerProfilingGroupId) &&
            (identical(other.profilingGroupName, profilingGroupName) ||
                other.profilingGroupName == profilingGroupName) &&
            const DeepCollectionEquality().equals(
                other._customerProfilingContainerDTOList,
                _customerProfilingContainerDTOList));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      customerProfilingGroupId,
      profilingGroupName,
      const DeepCollectionEquality().hash(_customerProfilingContainerDTOList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CustomerProfilingGroupContainerDTOCopyWith<
          _$_CustomerProfilingGroupContainerDTO>
      get copyWith => __$$_CustomerProfilingGroupContainerDTOCopyWithImpl<
          _$_CustomerProfilingGroupContainerDTO>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CustomerProfilingGroupContainerDTOToJson(
      this,
    );
  }
}

abstract class _CustomerProfilingGroupContainerDTO
    implements CustomerProfilingGroupContainerDTO {
  const factory _CustomerProfilingGroupContainerDTO(
          {@JsonKey(name: 'CustomerProfilingGroupId')
              required final int customerProfilingGroupId,
          @JsonKey(name: 'ProfilingGroupName')
              required final String profilingGroupName,
          @JsonKey(name: 'CustomerProfilingContainerDTOList')
              required final List<dynamic> customerProfilingContainerDTOList}) =
      _$_CustomerProfilingGroupContainerDTO;

  factory _CustomerProfilingGroupContainerDTO.fromJson(
          Map<String, dynamic> json) =
      _$_CustomerProfilingGroupContainerDTO.fromJson;

  @override
  @JsonKey(name: 'CustomerProfilingGroupId')
  int get customerProfilingGroupId;
  @override
  @JsonKey(name: 'ProfilingGroupName')
  String get profilingGroupName;
  @override
  @JsonKey(name: 'CustomerProfilingContainerDTOList')
  List<dynamic> get customerProfilingContainerDTOList;
  @override
  @JsonKey(ignore: true)
  _$$_CustomerProfilingGroupContainerDTOCopyWith<
          _$_CustomerProfilingGroupContainerDTO>
      get copyWith => throw _privateConstructorUsedError;
}
