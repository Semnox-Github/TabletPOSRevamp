// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'site_list.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SiteList _$SiteListFromJson(Map<String, dynamic> json) {
  return _SiteList.fromJson(json);
}

/// @nodoc
mixin _$SiteList {
  @JsonKey(name: 'SiteContainerDTOList')
  List<SiteDTO> get siteContainerDTOList => throw _privateConstructorUsedError;
  @JsonKey(name: 'Hash')
  String get hash => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SiteListCopyWith<SiteList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SiteListCopyWith<$Res> {
  factory $SiteListCopyWith(SiteList value, $Res Function(SiteList) then) =
      _$SiteListCopyWithImpl<$Res, SiteList>;
  @useResult
  $Res call(
      {@JsonKey(name: 'SiteContainerDTOList')
          List<SiteDTO> siteContainerDTOList,
      @JsonKey(name: 'Hash')
          String hash});
}

/// @nodoc
class _$SiteListCopyWithImpl<$Res, $Val extends SiteList>
    implements $SiteListCopyWith<$Res> {
  _$SiteListCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? siteContainerDTOList = null,
    Object? hash = null,
  }) {
    return _then(_value.copyWith(
      siteContainerDTOList: null == siteContainerDTOList
          ? _value.siteContainerDTOList
          : siteContainerDTOList // ignore: cast_nullable_to_non_nullable
              as List<SiteDTO>,
      hash: null == hash
          ? _value.hash
          : hash // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SiteListCopyWith<$Res> implements $SiteListCopyWith<$Res> {
  factory _$$_SiteListCopyWith(
          _$_SiteList value, $Res Function(_$_SiteList) then) =
      __$$_SiteListCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'SiteContainerDTOList')
          List<SiteDTO> siteContainerDTOList,
      @JsonKey(name: 'Hash')
          String hash});
}

/// @nodoc
class __$$_SiteListCopyWithImpl<$Res>
    extends _$SiteListCopyWithImpl<$Res, _$_SiteList>
    implements _$$_SiteListCopyWith<$Res> {
  __$$_SiteListCopyWithImpl(
      _$_SiteList _value, $Res Function(_$_SiteList) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? siteContainerDTOList = null,
    Object? hash = null,
  }) {
    return _then(_$_SiteList(
      siteContainerDTOList: null == siteContainerDTOList
          ? _value._siteContainerDTOList
          : siteContainerDTOList // ignore: cast_nullable_to_non_nullable
              as List<SiteDTO>,
      hash: null == hash
          ? _value.hash
          : hash // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SiteList with DiagnosticableTreeMixin implements _SiteList {
  const _$_SiteList(
      {@JsonKey(name: 'SiteContainerDTOList')
          required final List<SiteDTO> siteContainerDTOList,
      @JsonKey(name: 'Hash')
          required this.hash})
      : _siteContainerDTOList = siteContainerDTOList;

  factory _$_SiteList.fromJson(Map<String, dynamic> json) =>
      _$$_SiteListFromJson(json);

  final List<SiteDTO> _siteContainerDTOList;
  @override
  @JsonKey(name: 'SiteContainerDTOList')
  List<SiteDTO> get siteContainerDTOList {
    if (_siteContainerDTOList is EqualUnmodifiableListView)
      return _siteContainerDTOList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_siteContainerDTOList);
  }

  @override
  @JsonKey(name: 'Hash')
  final String hash;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SiteList(siteContainerDTOList: $siteContainerDTOList, hash: $hash)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SiteList'))
      ..add(DiagnosticsProperty('siteContainerDTOList', siteContainerDTOList))
      ..add(DiagnosticsProperty('hash', hash));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SiteList &&
            const DeepCollectionEquality()
                .equals(other._siteContainerDTOList, _siteContainerDTOList) &&
            (identical(other.hash, hash) || other.hash == hash));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_siteContainerDTOList), hash);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SiteListCopyWith<_$_SiteList> get copyWith =>
      __$$_SiteListCopyWithImpl<_$_SiteList>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SiteListToJson(
      this,
    );
  }
}

abstract class _SiteList implements SiteList {
  const factory _SiteList(
      {@JsonKey(name: 'SiteContainerDTOList')
          required final List<SiteDTO> siteContainerDTOList,
      @JsonKey(name: 'Hash')
          required final String hash}) = _$_SiteList;

  factory _SiteList.fromJson(Map<String, dynamic> json) = _$_SiteList.fromJson;

  @override
  @JsonKey(name: 'SiteContainerDTOList')
  List<SiteDTO> get siteContainerDTOList;
  @override
  @JsonKey(name: 'Hash')
  String get hash;
  @override
  @JsonKey(ignore: true)
  _$$_SiteListCopyWith<_$_SiteList> get copyWith =>
      throw _privateConstructorUsedError;
}
