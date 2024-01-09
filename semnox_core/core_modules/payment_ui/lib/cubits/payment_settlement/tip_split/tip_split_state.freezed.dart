// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tip_split_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TipSplitState _$TipSplitStateFromJson(Map<String, dynamic> json) {
  return _TipSplitState.fromJson(json);
}

/// @nodoc
mixin _$TipSplitState {
  int get loadingStatus => throw _privateConstructorUsedError;
  bool get isPercentageCompleted => throw _privateConstructorUsedError;
  bool get isClockedInUser => throw _privateConstructorUsedError;
  double get enteredAmount => throw _privateConstructorUsedError;
  double get tipAmount => throw _privateConstructorUsedError;
  TransactionResponse? get transactionResponse =>
      throw _privateConstructorUsedError;
  List<UserRoleContainerDTO> get userRoles =>
      throw _privateConstructorUsedError;
  List<UserContainerDto> get users => throw _privateConstructorUsedError;
  List<EmployeeTipData> get employeeTips => throw _privateConstructorUsedError;
  String? get loadingMessage => throw _privateConstructorUsedError;
  String? get validationError => throw _privateConstructorUsedError;
  String? get apiError => throw _privateConstructorUsedError;
  String? get notificationMessage => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TipSplitStateCopyWith<TipSplitState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TipSplitStateCopyWith<$Res> {
  factory $TipSplitStateCopyWith(
          TipSplitState value, $Res Function(TipSplitState) then) =
      _$TipSplitStateCopyWithImpl<$Res, TipSplitState>;
  @useResult
  $Res call(
      {int loadingStatus,
      bool isPercentageCompleted,
      bool isClockedInUser,
      double enteredAmount,
      double tipAmount,
      TransactionResponse? transactionResponse,
      List<UserRoleContainerDTO> userRoles,
      List<UserContainerDto> users,
      List<EmployeeTipData> employeeTips,
      String? loadingMessage,
      String? validationError,
      String? apiError,
      String? notificationMessage});

  $TransactionResponseCopyWith<$Res>? get transactionResponse;
}

/// @nodoc
class _$TipSplitStateCopyWithImpl<$Res, $Val extends TipSplitState>
    implements $TipSplitStateCopyWith<$Res> {
  _$TipSplitStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loadingStatus = null,
    Object? isPercentageCompleted = null,
    Object? isClockedInUser = null,
    Object? enteredAmount = null,
    Object? tipAmount = null,
    Object? transactionResponse = freezed,
    Object? userRoles = null,
    Object? users = null,
    Object? employeeTips = null,
    Object? loadingMessage = freezed,
    Object? validationError = freezed,
    Object? apiError = freezed,
    Object? notificationMessage = freezed,
  }) {
    return _then(_value.copyWith(
      loadingStatus: null == loadingStatus
          ? _value.loadingStatus
          : loadingStatus // ignore: cast_nullable_to_non_nullable
              as int,
      isPercentageCompleted: null == isPercentageCompleted
          ? _value.isPercentageCompleted
          : isPercentageCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
      isClockedInUser: null == isClockedInUser
          ? _value.isClockedInUser
          : isClockedInUser // ignore: cast_nullable_to_non_nullable
              as bool,
      enteredAmount: null == enteredAmount
          ? _value.enteredAmount
          : enteredAmount // ignore: cast_nullable_to_non_nullable
              as double,
      tipAmount: null == tipAmount
          ? _value.tipAmount
          : tipAmount // ignore: cast_nullable_to_non_nullable
              as double,
      transactionResponse: freezed == transactionResponse
          ? _value.transactionResponse
          : transactionResponse // ignore: cast_nullable_to_non_nullable
              as TransactionResponse?,
      userRoles: null == userRoles
          ? _value.userRoles
          : userRoles // ignore: cast_nullable_to_non_nullable
              as List<UserRoleContainerDTO>,
      users: null == users
          ? _value.users
          : users // ignore: cast_nullable_to_non_nullable
              as List<UserContainerDto>,
      employeeTips: null == employeeTips
          ? _value.employeeTips
          : employeeTips // ignore: cast_nullable_to_non_nullable
              as List<EmployeeTipData>,
      loadingMessage: freezed == loadingMessage
          ? _value.loadingMessage
          : loadingMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      validationError: freezed == validationError
          ? _value.validationError
          : validationError // ignore: cast_nullable_to_non_nullable
              as String?,
      apiError: freezed == apiError
          ? _value.apiError
          : apiError // ignore: cast_nullable_to_non_nullable
              as String?,
      notificationMessage: freezed == notificationMessage
          ? _value.notificationMessage
          : notificationMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $TransactionResponseCopyWith<$Res>? get transactionResponse {
    if (_value.transactionResponse == null) {
      return null;
    }

    return $TransactionResponseCopyWith<$Res>(_value.transactionResponse!,
        (value) {
      return _then(_value.copyWith(transactionResponse: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$TipSplitStateImplCopyWith<$Res>
    implements $TipSplitStateCopyWith<$Res> {
  factory _$$TipSplitStateImplCopyWith(
          _$TipSplitStateImpl value, $Res Function(_$TipSplitStateImpl) then) =
      __$$TipSplitStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int loadingStatus,
      bool isPercentageCompleted,
      bool isClockedInUser,
      double enteredAmount,
      double tipAmount,
      TransactionResponse? transactionResponse,
      List<UserRoleContainerDTO> userRoles,
      List<UserContainerDto> users,
      List<EmployeeTipData> employeeTips,
      String? loadingMessage,
      String? validationError,
      String? apiError,
      String? notificationMessage});

  @override
  $TransactionResponseCopyWith<$Res>? get transactionResponse;
}

/// @nodoc
class __$$TipSplitStateImplCopyWithImpl<$Res>
    extends _$TipSplitStateCopyWithImpl<$Res, _$TipSplitStateImpl>
    implements _$$TipSplitStateImplCopyWith<$Res> {
  __$$TipSplitStateImplCopyWithImpl(
      _$TipSplitStateImpl _value, $Res Function(_$TipSplitStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loadingStatus = null,
    Object? isPercentageCompleted = null,
    Object? isClockedInUser = null,
    Object? enteredAmount = null,
    Object? tipAmount = null,
    Object? transactionResponse = freezed,
    Object? userRoles = null,
    Object? users = null,
    Object? employeeTips = null,
    Object? loadingMessage = freezed,
    Object? validationError = freezed,
    Object? apiError = freezed,
    Object? notificationMessage = freezed,
  }) {
    return _then(_$TipSplitStateImpl(
      loadingStatus: null == loadingStatus
          ? _value.loadingStatus
          : loadingStatus // ignore: cast_nullable_to_non_nullable
              as int,
      isPercentageCompleted: null == isPercentageCompleted
          ? _value.isPercentageCompleted
          : isPercentageCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
      isClockedInUser: null == isClockedInUser
          ? _value.isClockedInUser
          : isClockedInUser // ignore: cast_nullable_to_non_nullable
              as bool,
      enteredAmount: null == enteredAmount
          ? _value.enteredAmount
          : enteredAmount // ignore: cast_nullable_to_non_nullable
              as double,
      tipAmount: null == tipAmount
          ? _value.tipAmount
          : tipAmount // ignore: cast_nullable_to_non_nullable
              as double,
      transactionResponse: freezed == transactionResponse
          ? _value.transactionResponse
          : transactionResponse // ignore: cast_nullable_to_non_nullable
              as TransactionResponse?,
      userRoles: null == userRoles
          ? _value._userRoles
          : userRoles // ignore: cast_nullable_to_non_nullable
              as List<UserRoleContainerDTO>,
      users: null == users
          ? _value._users
          : users // ignore: cast_nullable_to_non_nullable
              as List<UserContainerDto>,
      employeeTips: null == employeeTips
          ? _value._employeeTips
          : employeeTips // ignore: cast_nullable_to_non_nullable
              as List<EmployeeTipData>,
      loadingMessage: freezed == loadingMessage
          ? _value.loadingMessage
          : loadingMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      validationError: freezed == validationError
          ? _value.validationError
          : validationError // ignore: cast_nullable_to_non_nullable
              as String?,
      apiError: freezed == apiError
          ? _value.apiError
          : apiError // ignore: cast_nullable_to_non_nullable
              as String?,
      notificationMessage: freezed == notificationMessage
          ? _value.notificationMessage
          : notificationMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TipSplitStateImpl implements _TipSplitState {
  const _$TipSplitStateImpl(
      {this.loadingStatus = -1,
      this.isPercentageCompleted = false,
      this.isClockedInUser = false,
      this.enteredAmount = 0,
      this.tipAmount = 0,
      this.transactionResponse,
      final List<UserRoleContainerDTO> userRoles = const [],
      final List<UserContainerDto> users = const [],
      final List<EmployeeTipData> employeeTips = const [],
      this.loadingMessage,
      this.validationError,
      this.apiError,
      this.notificationMessage})
      : _userRoles = userRoles,
        _users = users,
        _employeeTips = employeeTips;

  factory _$TipSplitStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$TipSplitStateImplFromJson(json);

  @override
  @JsonKey()
  final int loadingStatus;
  @override
  @JsonKey()
  final bool isPercentageCompleted;
  @override
  @JsonKey()
  final bool isClockedInUser;
  @override
  @JsonKey()
  final double enteredAmount;
  @override
  @JsonKey()
  final double tipAmount;
  @override
  final TransactionResponse? transactionResponse;
  final List<UserRoleContainerDTO> _userRoles;
  @override
  @JsonKey()
  List<UserRoleContainerDTO> get userRoles {
    if (_userRoles is EqualUnmodifiableListView) return _userRoles;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_userRoles);
  }

  final List<UserContainerDto> _users;
  @override
  @JsonKey()
  List<UserContainerDto> get users {
    if (_users is EqualUnmodifiableListView) return _users;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_users);
  }

  final List<EmployeeTipData> _employeeTips;
  @override
  @JsonKey()
  List<EmployeeTipData> get employeeTips {
    if (_employeeTips is EqualUnmodifiableListView) return _employeeTips;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_employeeTips);
  }

  @override
  final String? loadingMessage;
  @override
  final String? validationError;
  @override
  final String? apiError;
  @override
  final String? notificationMessage;

  @override
  String toString() {
    return 'TipSplitState(loadingStatus: $loadingStatus, isPercentageCompleted: $isPercentageCompleted, isClockedInUser: $isClockedInUser, enteredAmount: $enteredAmount, tipAmount: $tipAmount, transactionResponse: $transactionResponse, userRoles: $userRoles, users: $users, employeeTips: $employeeTips, loadingMessage: $loadingMessage, validationError: $validationError, apiError: $apiError, notificationMessage: $notificationMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TipSplitStateImpl &&
            (identical(other.loadingStatus, loadingStatus) ||
                other.loadingStatus == loadingStatus) &&
            (identical(other.isPercentageCompleted, isPercentageCompleted) ||
                other.isPercentageCompleted == isPercentageCompleted) &&
            (identical(other.isClockedInUser, isClockedInUser) ||
                other.isClockedInUser == isClockedInUser) &&
            (identical(other.enteredAmount, enteredAmount) ||
                other.enteredAmount == enteredAmount) &&
            (identical(other.tipAmount, tipAmount) ||
                other.tipAmount == tipAmount) &&
            (identical(other.transactionResponse, transactionResponse) ||
                other.transactionResponse == transactionResponse) &&
            const DeepCollectionEquality()
                .equals(other._userRoles, _userRoles) &&
            const DeepCollectionEquality().equals(other._users, _users) &&
            const DeepCollectionEquality()
                .equals(other._employeeTips, _employeeTips) &&
            (identical(other.loadingMessage, loadingMessage) ||
                other.loadingMessage == loadingMessage) &&
            (identical(other.validationError, validationError) ||
                other.validationError == validationError) &&
            (identical(other.apiError, apiError) ||
                other.apiError == apiError) &&
            (identical(other.notificationMessage, notificationMessage) ||
                other.notificationMessage == notificationMessage));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      loadingStatus,
      isPercentageCompleted,
      isClockedInUser,
      enteredAmount,
      tipAmount,
      transactionResponse,
      const DeepCollectionEquality().hash(_userRoles),
      const DeepCollectionEquality().hash(_users),
      const DeepCollectionEquality().hash(_employeeTips),
      loadingMessage,
      validationError,
      apiError,
      notificationMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TipSplitStateImplCopyWith<_$TipSplitStateImpl> get copyWith =>
      __$$TipSplitStateImplCopyWithImpl<_$TipSplitStateImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TipSplitStateImplToJson(
      this,
    );
  }
}

abstract class _TipSplitState implements TipSplitState {
  const factory _TipSplitState(
      {final int loadingStatus,
      final bool isPercentageCompleted,
      final bool isClockedInUser,
      final double enteredAmount,
      final double tipAmount,
      final TransactionResponse? transactionResponse,
      final List<UserRoleContainerDTO> userRoles,
      final List<UserContainerDto> users,
      final List<EmployeeTipData> employeeTips,
      final String? loadingMessage,
      final String? validationError,
      final String? apiError,
      final String? notificationMessage}) = _$TipSplitStateImpl;

  factory _TipSplitState.fromJson(Map<String, dynamic> json) =
      _$TipSplitStateImpl.fromJson;

  @override
  int get loadingStatus;
  @override
  bool get isPercentageCompleted;
  @override
  bool get isClockedInUser;
  @override
  double get enteredAmount;
  @override
  double get tipAmount;
  @override
  TransactionResponse? get transactionResponse;
  @override
  List<UserRoleContainerDTO> get userRoles;
  @override
  List<UserContainerDto> get users;
  @override
  List<EmployeeTipData> get employeeTips;
  @override
  String? get loadingMessage;
  @override
  String? get validationError;
  @override
  String? get apiError;
  @override
  String? get notificationMessage;
  @override
  @JsonKey(ignore: true)
  _$$TipSplitStateImplCopyWith<_$TipSplitStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
