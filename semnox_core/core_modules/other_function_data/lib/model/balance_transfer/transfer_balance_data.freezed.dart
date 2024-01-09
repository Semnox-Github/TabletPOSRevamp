// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transfer_balance_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TransferBalanceData _$TransferBalanceDataFromJson(Map<String, dynamic> json) {
  return _TransferBalanceData.fromJson(json);
}

/// @nodoc
mixin _$TransferBalanceData {
  @JsonKey(name: 'SourceAccountId')
  int? get sourceAccountId => throw _privateConstructorUsedError;
  @JsonKey(name: 'DestinationAccountId')
  int? get destinationAccountId => throw _privateConstructorUsedError;
  @JsonKey(name: 'ValueLoaded')
  double? get valueLoaded => throw _privateConstructorUsedError;
  @JsonKey(name: 'Remarks')
  String? get remarks => throw _privateConstructorUsedError;
  @JsonKey(name: 'ActivityDate')
  String? get activityDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'SourceAccountNumber')
  String? get sourceAccountNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'DestinationAccountNumber')
  String? get destinationAccountNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'POSMachineId')
  int? get pOSMachineId => throw _privateConstructorUsedError;
  @JsonKey(name: 'UserId')
  int? get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'ApprovedBy')
  String? get approvedBy => throw _privateConstructorUsedError;
  @JsonKey(name: 'ApprovalDate')
  String? get approvalDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'EntitlementType')
  String? get entitlementType => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TransferBalanceDataCopyWith<TransferBalanceData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransferBalanceDataCopyWith<$Res> {
  factory $TransferBalanceDataCopyWith(
          TransferBalanceData value, $Res Function(TransferBalanceData) then) =
      _$TransferBalanceDataCopyWithImpl<$Res, TransferBalanceData>;
  @useResult
  $Res call(
      {@JsonKey(name: 'SourceAccountId')
          int? sourceAccountId,
      @JsonKey(name: 'DestinationAccountId')
          int? destinationAccountId,
      @JsonKey(name: 'ValueLoaded')
          double? valueLoaded,
      @JsonKey(name: 'Remarks')
          String? remarks,
      @JsonKey(name: 'ActivityDate')
          String? activityDate,
      @JsonKey(name: 'SourceAccountNumber')
          String? sourceAccountNumber,
      @JsonKey(name: 'DestinationAccountNumber')
          String? destinationAccountNumber,
      @JsonKey(name: 'POSMachineId')
          int? pOSMachineId,
      @JsonKey(name: 'UserId')
          int? userId,
      @JsonKey(name: 'ApprovedBy')
          String? approvedBy,
      @JsonKey(name: 'ApprovalDate')
          String? approvalDate,
      @JsonKey(name: 'EntitlementType')
          String? entitlementType});
}

/// @nodoc
class _$TransferBalanceDataCopyWithImpl<$Res, $Val extends TransferBalanceData>
    implements $TransferBalanceDataCopyWith<$Res> {
  _$TransferBalanceDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sourceAccountId = freezed,
    Object? destinationAccountId = freezed,
    Object? valueLoaded = freezed,
    Object? remarks = freezed,
    Object? activityDate = freezed,
    Object? sourceAccountNumber = freezed,
    Object? destinationAccountNumber = freezed,
    Object? pOSMachineId = freezed,
    Object? userId = freezed,
    Object? approvedBy = freezed,
    Object? approvalDate = freezed,
    Object? entitlementType = freezed,
  }) {
    return _then(_value.copyWith(
      sourceAccountId: freezed == sourceAccountId
          ? _value.sourceAccountId
          : sourceAccountId // ignore: cast_nullable_to_non_nullable
              as int?,
      destinationAccountId: freezed == destinationAccountId
          ? _value.destinationAccountId
          : destinationAccountId // ignore: cast_nullable_to_non_nullable
              as int?,
      valueLoaded: freezed == valueLoaded
          ? _value.valueLoaded
          : valueLoaded // ignore: cast_nullable_to_non_nullable
              as double?,
      remarks: freezed == remarks
          ? _value.remarks
          : remarks // ignore: cast_nullable_to_non_nullable
              as String?,
      activityDate: freezed == activityDate
          ? _value.activityDate
          : activityDate // ignore: cast_nullable_to_non_nullable
              as String?,
      sourceAccountNumber: freezed == sourceAccountNumber
          ? _value.sourceAccountNumber
          : sourceAccountNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      destinationAccountNumber: freezed == destinationAccountNumber
          ? _value.destinationAccountNumber
          : destinationAccountNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      pOSMachineId: freezed == pOSMachineId
          ? _value.pOSMachineId
          : pOSMachineId // ignore: cast_nullable_to_non_nullable
              as int?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
      approvedBy: freezed == approvedBy
          ? _value.approvedBy
          : approvedBy // ignore: cast_nullable_to_non_nullable
              as String?,
      approvalDate: freezed == approvalDate
          ? _value.approvalDate
          : approvalDate // ignore: cast_nullable_to_non_nullable
              as String?,
      entitlementType: freezed == entitlementType
          ? _value.entitlementType
          : entitlementType // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TransferBalanceDataCopyWith<$Res>
    implements $TransferBalanceDataCopyWith<$Res> {
  factory _$$_TransferBalanceDataCopyWith(_$_TransferBalanceData value,
          $Res Function(_$_TransferBalanceData) then) =
      __$$_TransferBalanceDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'SourceAccountId')
          int? sourceAccountId,
      @JsonKey(name: 'DestinationAccountId')
          int? destinationAccountId,
      @JsonKey(name: 'ValueLoaded')
          double? valueLoaded,
      @JsonKey(name: 'Remarks')
          String? remarks,
      @JsonKey(name: 'ActivityDate')
          String? activityDate,
      @JsonKey(name: 'SourceAccountNumber')
          String? sourceAccountNumber,
      @JsonKey(name: 'DestinationAccountNumber')
          String? destinationAccountNumber,
      @JsonKey(name: 'POSMachineId')
          int? pOSMachineId,
      @JsonKey(name: 'UserId')
          int? userId,
      @JsonKey(name: 'ApprovedBy')
          String? approvedBy,
      @JsonKey(name: 'ApprovalDate')
          String? approvalDate,
      @JsonKey(name: 'EntitlementType')
          String? entitlementType});
}

/// @nodoc
class __$$_TransferBalanceDataCopyWithImpl<$Res>
    extends _$TransferBalanceDataCopyWithImpl<$Res, _$_TransferBalanceData>
    implements _$$_TransferBalanceDataCopyWith<$Res> {
  __$$_TransferBalanceDataCopyWithImpl(_$_TransferBalanceData _value,
      $Res Function(_$_TransferBalanceData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sourceAccountId = freezed,
    Object? destinationAccountId = freezed,
    Object? valueLoaded = freezed,
    Object? remarks = freezed,
    Object? activityDate = freezed,
    Object? sourceAccountNumber = freezed,
    Object? destinationAccountNumber = freezed,
    Object? pOSMachineId = freezed,
    Object? userId = freezed,
    Object? approvedBy = freezed,
    Object? approvalDate = freezed,
    Object? entitlementType = freezed,
  }) {
    return _then(_$_TransferBalanceData(
      sourceAccountId: freezed == sourceAccountId
          ? _value.sourceAccountId
          : sourceAccountId // ignore: cast_nullable_to_non_nullable
              as int?,
      destinationAccountId: freezed == destinationAccountId
          ? _value.destinationAccountId
          : destinationAccountId // ignore: cast_nullable_to_non_nullable
              as int?,
      valueLoaded: freezed == valueLoaded
          ? _value.valueLoaded
          : valueLoaded // ignore: cast_nullable_to_non_nullable
              as double?,
      remarks: freezed == remarks
          ? _value.remarks
          : remarks // ignore: cast_nullable_to_non_nullable
              as String?,
      activityDate: freezed == activityDate
          ? _value.activityDate
          : activityDate // ignore: cast_nullable_to_non_nullable
              as String?,
      sourceAccountNumber: freezed == sourceAccountNumber
          ? _value.sourceAccountNumber
          : sourceAccountNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      destinationAccountNumber: freezed == destinationAccountNumber
          ? _value.destinationAccountNumber
          : destinationAccountNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      pOSMachineId: freezed == pOSMachineId
          ? _value.pOSMachineId
          : pOSMachineId // ignore: cast_nullable_to_non_nullable
              as int?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
      approvedBy: freezed == approvedBy
          ? _value.approvedBy
          : approvedBy // ignore: cast_nullable_to_non_nullable
              as String?,
      approvalDate: freezed == approvalDate
          ? _value.approvalDate
          : approvalDate // ignore: cast_nullable_to_non_nullable
              as String?,
      entitlementType: freezed == entitlementType
          ? _value.entitlementType
          : entitlementType // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TransferBalanceData implements _TransferBalanceData {
  const _$_TransferBalanceData(
      {@JsonKey(name: 'SourceAccountId') this.sourceAccountId,
      @JsonKey(name: 'DestinationAccountId') this.destinationAccountId,
      @JsonKey(name: 'ValueLoaded') this.valueLoaded,
      @JsonKey(name: 'Remarks') this.remarks,
      @JsonKey(name: 'ActivityDate') this.activityDate,
      @JsonKey(name: 'SourceAccountNumber') this.sourceAccountNumber,
      @JsonKey(name: 'DestinationAccountNumber') this.destinationAccountNumber,
      @JsonKey(name: 'POSMachineId') this.pOSMachineId,
      @JsonKey(name: 'UserId') this.userId,
      @JsonKey(name: 'ApprovedBy') this.approvedBy,
      @JsonKey(name: 'ApprovalDate') this.approvalDate,
      @JsonKey(name: 'EntitlementType') this.entitlementType});

  factory _$_TransferBalanceData.fromJson(Map<String, dynamic> json) =>
      _$$_TransferBalanceDataFromJson(json);

  @override
  @JsonKey(name: 'SourceAccountId')
  final int? sourceAccountId;
  @override
  @JsonKey(name: 'DestinationAccountId')
  final int? destinationAccountId;
  @override
  @JsonKey(name: 'ValueLoaded')
  final double? valueLoaded;
  @override
  @JsonKey(name: 'Remarks')
  final String? remarks;
  @override
  @JsonKey(name: 'ActivityDate')
  final String? activityDate;
  @override
  @JsonKey(name: 'SourceAccountNumber')
  final String? sourceAccountNumber;
  @override
  @JsonKey(name: 'DestinationAccountNumber')
  final String? destinationAccountNumber;
  @override
  @JsonKey(name: 'POSMachineId')
  final int? pOSMachineId;
  @override
  @JsonKey(name: 'UserId')
  final int? userId;
  @override
  @JsonKey(name: 'ApprovedBy')
  final String? approvedBy;
  @override
  @JsonKey(name: 'ApprovalDate')
  final String? approvalDate;
  @override
  @JsonKey(name: 'EntitlementType')
  final String? entitlementType;

  @override
  String toString() {
    return 'TransferBalanceData(sourceAccountId: $sourceAccountId, destinationAccountId: $destinationAccountId, valueLoaded: $valueLoaded, remarks: $remarks, activityDate: $activityDate, sourceAccountNumber: $sourceAccountNumber, destinationAccountNumber: $destinationAccountNumber, pOSMachineId: $pOSMachineId, userId: $userId, approvedBy: $approvedBy, approvalDate: $approvalDate, entitlementType: $entitlementType)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TransferBalanceData &&
            (identical(other.sourceAccountId, sourceAccountId) ||
                other.sourceAccountId == sourceAccountId) &&
            (identical(other.destinationAccountId, destinationAccountId) ||
                other.destinationAccountId == destinationAccountId) &&
            (identical(other.valueLoaded, valueLoaded) ||
                other.valueLoaded == valueLoaded) &&
            (identical(other.remarks, remarks) || other.remarks == remarks) &&
            (identical(other.activityDate, activityDate) ||
                other.activityDate == activityDate) &&
            (identical(other.sourceAccountNumber, sourceAccountNumber) ||
                other.sourceAccountNumber == sourceAccountNumber) &&
            (identical(
                    other.destinationAccountNumber, destinationAccountNumber) ||
                other.destinationAccountNumber == destinationAccountNumber) &&
            (identical(other.pOSMachineId, pOSMachineId) ||
                other.pOSMachineId == pOSMachineId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.approvedBy, approvedBy) ||
                other.approvedBy == approvedBy) &&
            (identical(other.approvalDate, approvalDate) ||
                other.approvalDate == approvalDate) &&
            (identical(other.entitlementType, entitlementType) ||
                other.entitlementType == entitlementType));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      sourceAccountId,
      destinationAccountId,
      valueLoaded,
      remarks,
      activityDate,
      sourceAccountNumber,
      destinationAccountNumber,
      pOSMachineId,
      userId,
      approvedBy,
      approvalDate,
      entitlementType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TransferBalanceDataCopyWith<_$_TransferBalanceData> get copyWith =>
      __$$_TransferBalanceDataCopyWithImpl<_$_TransferBalanceData>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TransferBalanceDataToJson(
      this,
    );
  }
}

abstract class _TransferBalanceData implements TransferBalanceData {
  const factory _TransferBalanceData(
      {@JsonKey(name: 'SourceAccountId')
          final int? sourceAccountId,
      @JsonKey(name: 'DestinationAccountId')
          final int? destinationAccountId,
      @JsonKey(name: 'ValueLoaded')
          final double? valueLoaded,
      @JsonKey(name: 'Remarks')
          final String? remarks,
      @JsonKey(name: 'ActivityDate')
          final String? activityDate,
      @JsonKey(name: 'SourceAccountNumber')
          final String? sourceAccountNumber,
      @JsonKey(name: 'DestinationAccountNumber')
          final String? destinationAccountNumber,
      @JsonKey(name: 'POSMachineId')
          final int? pOSMachineId,
      @JsonKey(name: 'UserId')
          final int? userId,
      @JsonKey(name: 'ApprovedBy')
          final String? approvedBy,
      @JsonKey(name: 'ApprovalDate')
          final String? approvalDate,
      @JsonKey(name: 'EntitlementType')
          final String? entitlementType}) = _$_TransferBalanceData;

  factory _TransferBalanceData.fromJson(Map<String, dynamic> json) =
      _$_TransferBalanceData.fromJson;

  @override
  @JsonKey(name: 'SourceAccountId')
  int? get sourceAccountId;
  @override
  @JsonKey(name: 'DestinationAccountId')
  int? get destinationAccountId;
  @override
  @JsonKey(name: 'ValueLoaded')
  double? get valueLoaded;
  @override
  @JsonKey(name: 'Remarks')
  String? get remarks;
  @override
  @JsonKey(name: 'ActivityDate')
  String? get activityDate;
  @override
  @JsonKey(name: 'SourceAccountNumber')
  String? get sourceAccountNumber;
  @override
  @JsonKey(name: 'DestinationAccountNumber')
  String? get destinationAccountNumber;
  @override
  @JsonKey(name: 'POSMachineId')
  int? get pOSMachineId;
  @override
  @JsonKey(name: 'UserId')
  int? get userId;
  @override
  @JsonKey(name: 'ApprovedBy')
  String? get approvedBy;
  @override
  @JsonKey(name: 'ApprovalDate')
  String? get approvalDate;
  @override
  @JsonKey(name: 'EntitlementType')
  String? get entitlementType;
  @override
  @JsonKey(ignore: true)
  _$$_TransferBalanceDataCopyWith<_$_TransferBalanceData> get copyWith =>
      throw _privateConstructorUsedError;
}
