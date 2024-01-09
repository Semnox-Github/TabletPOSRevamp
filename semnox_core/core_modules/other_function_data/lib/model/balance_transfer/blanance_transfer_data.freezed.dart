// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'blanance_transfer_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

BalanceTransferData _$BalanceTransferDataFromJson(Map<String, dynamic> json) {
  return _BalanceTransferData.fromJson(json);
}

/// @nodoc
mixin _$BalanceTransferData {
  @JsonKey(name: 'FromCardId')
  int? get fromCardId => throw _privateConstructorUsedError;
  @JsonKey(name: 'TransferDetails')
  List<TransferDetailsDto>? get transferDetails =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'ManagerId')
  int? get managerId => throw _privateConstructorUsedError;
  @JsonKey(name: 'Remarks')
  String? get remarks => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BalanceTransferDataCopyWith<BalanceTransferData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BalanceTransferDataCopyWith<$Res> {
  factory $BalanceTransferDataCopyWith(
          BalanceTransferData value, $Res Function(BalanceTransferData) then) =
      _$BalanceTransferDataCopyWithImpl<$Res, BalanceTransferData>;
  @useResult
  $Res call(
      {@JsonKey(name: 'FromCardId')
          int? fromCardId,
      @JsonKey(name: 'TransferDetails')
          List<TransferDetailsDto>? transferDetails,
      @JsonKey(name: 'ManagerId')
          int? managerId,
      @JsonKey(name: 'Remarks')
          String? remarks});
}

/// @nodoc
class _$BalanceTransferDataCopyWithImpl<$Res, $Val extends BalanceTransferData>
    implements $BalanceTransferDataCopyWith<$Res> {
  _$BalanceTransferDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fromCardId = freezed,
    Object? transferDetails = freezed,
    Object? managerId = freezed,
    Object? remarks = freezed,
  }) {
    return _then(_value.copyWith(
      fromCardId: freezed == fromCardId
          ? _value.fromCardId
          : fromCardId // ignore: cast_nullable_to_non_nullable
              as int?,
      transferDetails: freezed == transferDetails
          ? _value.transferDetails
          : transferDetails // ignore: cast_nullable_to_non_nullable
              as List<TransferDetailsDto>?,
      managerId: freezed == managerId
          ? _value.managerId
          : managerId // ignore: cast_nullable_to_non_nullable
              as int?,
      remarks: freezed == remarks
          ? _value.remarks
          : remarks // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_BalanceTransferDataCopyWith<$Res>
    implements $BalanceTransferDataCopyWith<$Res> {
  factory _$$_BalanceTransferDataCopyWith(_$_BalanceTransferData value,
          $Res Function(_$_BalanceTransferData) then) =
      __$$_BalanceTransferDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'FromCardId')
          int? fromCardId,
      @JsonKey(name: 'TransferDetails')
          List<TransferDetailsDto>? transferDetails,
      @JsonKey(name: 'ManagerId')
          int? managerId,
      @JsonKey(name: 'Remarks')
          String? remarks});
}

/// @nodoc
class __$$_BalanceTransferDataCopyWithImpl<$Res>
    extends _$BalanceTransferDataCopyWithImpl<$Res, _$_BalanceTransferData>
    implements _$$_BalanceTransferDataCopyWith<$Res> {
  __$$_BalanceTransferDataCopyWithImpl(_$_BalanceTransferData _value,
      $Res Function(_$_BalanceTransferData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fromCardId = freezed,
    Object? transferDetails = freezed,
    Object? managerId = freezed,
    Object? remarks = freezed,
  }) {
    return _then(_$_BalanceTransferData(
      fromCardId: freezed == fromCardId
          ? _value.fromCardId
          : fromCardId // ignore: cast_nullable_to_non_nullable
              as int?,
      transferDetails: freezed == transferDetails
          ? _value._transferDetails
          : transferDetails // ignore: cast_nullable_to_non_nullable
              as List<TransferDetailsDto>?,
      managerId: freezed == managerId
          ? _value.managerId
          : managerId // ignore: cast_nullable_to_non_nullable
              as int?,
      remarks: freezed == remarks
          ? _value.remarks
          : remarks // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_BalanceTransferData implements _BalanceTransferData {
  const _$_BalanceTransferData(
      {@JsonKey(name: 'FromCardId')
          this.fromCardId,
      @JsonKey(name: 'TransferDetails')
          final List<TransferDetailsDto>? transferDetails,
      @JsonKey(name: 'ManagerId')
          this.managerId,
      @JsonKey(name: 'Remarks')
          this.remarks})
      : _transferDetails = transferDetails;

  factory _$_BalanceTransferData.fromJson(Map<String, dynamic> json) =>
      _$$_BalanceTransferDataFromJson(json);

  @override
  @JsonKey(name: 'FromCardId')
  final int? fromCardId;
  final List<TransferDetailsDto>? _transferDetails;
  @override
  @JsonKey(name: 'TransferDetails')
  List<TransferDetailsDto>? get transferDetails {
    final value = _transferDetails;
    if (value == null) return null;
    if (_transferDetails is EqualUnmodifiableListView) return _transferDetails;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'ManagerId')
  final int? managerId;
  @override
  @JsonKey(name: 'Remarks')
  final String? remarks;

  @override
  String toString() {
    return 'BalanceTransferData(fromCardId: $fromCardId, transferDetails: $transferDetails, managerId: $managerId, remarks: $remarks)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BalanceTransferData &&
            (identical(other.fromCardId, fromCardId) ||
                other.fromCardId == fromCardId) &&
            const DeepCollectionEquality()
                .equals(other._transferDetails, _transferDetails) &&
            (identical(other.managerId, managerId) ||
                other.managerId == managerId) &&
            (identical(other.remarks, remarks) || other.remarks == remarks));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      fromCardId,
      const DeepCollectionEquality().hash(_transferDetails),
      managerId,
      remarks);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BalanceTransferDataCopyWith<_$_BalanceTransferData> get copyWith =>
      __$$_BalanceTransferDataCopyWithImpl<_$_BalanceTransferData>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BalanceTransferDataToJson(
      this,
    );
  }
}

abstract class _BalanceTransferData implements BalanceTransferData {
  const factory _BalanceTransferData(
      {@JsonKey(name: 'FromCardId')
          final int? fromCardId,
      @JsonKey(name: 'TransferDetails')
          final List<TransferDetailsDto>? transferDetails,
      @JsonKey(name: 'ManagerId')
          final int? managerId,
      @JsonKey(name: 'Remarks')
          final String? remarks}) = _$_BalanceTransferData;

  factory _BalanceTransferData.fromJson(Map<String, dynamic> json) =
      _$_BalanceTransferData.fromJson;

  @override
  @JsonKey(name: 'FromCardId')
  int? get fromCardId;
  @override
  @JsonKey(name: 'TransferDetails')
  List<TransferDetailsDto>? get transferDetails;
  @override
  @JsonKey(name: 'ManagerId')
  int? get managerId;
  @override
  @JsonKey(name: 'Remarks')
  String? get remarks;
  @override
  @JsonKey(ignore: true)
  _$$_BalanceTransferDataCopyWith<_$_BalanceTransferData> get copyWith =>
      throw _privateConstructorUsedError;
}
