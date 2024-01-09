// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_transaction_lines_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

OrderTransactionLinesState _$OrderTransactionLinesStateFromJson(
    Map<String, dynamic> json) {
  return _OrderTransactionLinesState.fromJson(json);
}

/// @nodoc
mixin _$OrderTransactionLinesState {
  int get loadingStatus => throw _privateConstructorUsedError;
  List<String>? get seats => throw _privateConstructorUsedError;
  List<String>? get course => throw _privateConstructorUsedError;
  List<String>? get products => throw _privateConstructorUsedError;
  List<TransactionLinesGroup>? get transactionLinesGroup =>
      throw _privateConstructorUsedError;
  bool? get isSuccess => throw _privateConstructorUsedError;
  bool? get isError => throw _privateConstructorUsedError;
  String? get statusMessage => throw _privateConstructorUsedError;
  TransactionResponse? get transactionResponse =>
      throw _privateConstructorUsedError;
  Map<String, List<TransactionLinesGroup>>? get transactionLinesGroupsBySeat =>
      throw _privateConstructorUsedError;
  List<TransactionLinesGroup>? get selectedTransactionLinesGroup =>
      throw _privateConstructorUsedError;
  bool? get shouldClearSearchFilter => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OrderTransactionLinesStateCopyWith<OrderTransactionLinesState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderTransactionLinesStateCopyWith<$Res> {
  factory $OrderTransactionLinesStateCopyWith(OrderTransactionLinesState value,
          $Res Function(OrderTransactionLinesState) then) =
      _$OrderTransactionLinesStateCopyWithImpl<$Res,
          OrderTransactionLinesState>;
  @useResult
  $Res call(
      {int loadingStatus,
      List<String>? seats,
      List<String>? course,
      List<String>? products,
      List<TransactionLinesGroup>? transactionLinesGroup,
      bool? isSuccess,
      bool? isError,
      String? statusMessage,
      TransactionResponse? transactionResponse,
      Map<String, List<TransactionLinesGroup>>? transactionLinesGroupsBySeat,
      List<TransactionLinesGroup>? selectedTransactionLinesGroup,
      bool? shouldClearSearchFilter});

  $TransactionResponseCopyWith<$Res>? get transactionResponse;
}

/// @nodoc
class _$OrderTransactionLinesStateCopyWithImpl<$Res,
        $Val extends OrderTransactionLinesState>
    implements $OrderTransactionLinesStateCopyWith<$Res> {
  _$OrderTransactionLinesStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loadingStatus = null,
    Object? seats = freezed,
    Object? course = freezed,
    Object? products = freezed,
    Object? transactionLinesGroup = freezed,
    Object? isSuccess = freezed,
    Object? isError = freezed,
    Object? statusMessage = freezed,
    Object? transactionResponse = freezed,
    Object? transactionLinesGroupsBySeat = freezed,
    Object? selectedTransactionLinesGroup = freezed,
    Object? shouldClearSearchFilter = freezed,
  }) {
    return _then(_value.copyWith(
      loadingStatus: null == loadingStatus
          ? _value.loadingStatus
          : loadingStatus // ignore: cast_nullable_to_non_nullable
              as int,
      seats: freezed == seats
          ? _value.seats
          : seats // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      course: freezed == course
          ? _value.course
          : course // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      products: freezed == products
          ? _value.products
          : products // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      transactionLinesGroup: freezed == transactionLinesGroup
          ? _value.transactionLinesGroup
          : transactionLinesGroup // ignore: cast_nullable_to_non_nullable
              as List<TransactionLinesGroup>?,
      isSuccess: freezed == isSuccess
          ? _value.isSuccess
          : isSuccess // ignore: cast_nullable_to_non_nullable
              as bool?,
      isError: freezed == isError
          ? _value.isError
          : isError // ignore: cast_nullable_to_non_nullable
              as bool?,
      statusMessage: freezed == statusMessage
          ? _value.statusMessage
          : statusMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      transactionResponse: freezed == transactionResponse
          ? _value.transactionResponse
          : transactionResponse // ignore: cast_nullable_to_non_nullable
              as TransactionResponse?,
      transactionLinesGroupsBySeat: freezed == transactionLinesGroupsBySeat
          ? _value.transactionLinesGroupsBySeat
          : transactionLinesGroupsBySeat // ignore: cast_nullable_to_non_nullable
              as Map<String, List<TransactionLinesGroup>>?,
      selectedTransactionLinesGroup: freezed == selectedTransactionLinesGroup
          ? _value.selectedTransactionLinesGroup
          : selectedTransactionLinesGroup // ignore: cast_nullable_to_non_nullable
              as List<TransactionLinesGroup>?,
      shouldClearSearchFilter: freezed == shouldClearSearchFilter
          ? _value.shouldClearSearchFilter
          : shouldClearSearchFilter // ignore: cast_nullable_to_non_nullable
              as bool?,
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
abstract class _$$_OrderTransactionLinesStateCopyWith<$Res>
    implements $OrderTransactionLinesStateCopyWith<$Res> {
  factory _$$_OrderTransactionLinesStateCopyWith(
          _$_OrderTransactionLinesState value,
          $Res Function(_$_OrderTransactionLinesState) then) =
      __$$_OrderTransactionLinesStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int loadingStatus,
      List<String>? seats,
      List<String>? course,
      List<String>? products,
      List<TransactionLinesGroup>? transactionLinesGroup,
      bool? isSuccess,
      bool? isError,
      String? statusMessage,
      TransactionResponse? transactionResponse,
      Map<String, List<TransactionLinesGroup>>? transactionLinesGroupsBySeat,
      List<TransactionLinesGroup>? selectedTransactionLinesGroup,
      bool? shouldClearSearchFilter});

  @override
  $TransactionResponseCopyWith<$Res>? get transactionResponse;
}

/// @nodoc
class __$$_OrderTransactionLinesStateCopyWithImpl<$Res>
    extends _$OrderTransactionLinesStateCopyWithImpl<$Res,
        _$_OrderTransactionLinesState>
    implements _$$_OrderTransactionLinesStateCopyWith<$Res> {
  __$$_OrderTransactionLinesStateCopyWithImpl(
      _$_OrderTransactionLinesState _value,
      $Res Function(_$_OrderTransactionLinesState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loadingStatus = null,
    Object? seats = freezed,
    Object? course = freezed,
    Object? products = freezed,
    Object? transactionLinesGroup = freezed,
    Object? isSuccess = freezed,
    Object? isError = freezed,
    Object? statusMessage = freezed,
    Object? transactionResponse = freezed,
    Object? transactionLinesGroupsBySeat = freezed,
    Object? selectedTransactionLinesGroup = freezed,
    Object? shouldClearSearchFilter = freezed,
  }) {
    return _then(_$_OrderTransactionLinesState(
      loadingStatus: null == loadingStatus
          ? _value.loadingStatus
          : loadingStatus // ignore: cast_nullable_to_non_nullable
              as int,
      seats: freezed == seats
          ? _value._seats
          : seats // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      course: freezed == course
          ? _value._course
          : course // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      products: freezed == products
          ? _value._products
          : products // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      transactionLinesGroup: freezed == transactionLinesGroup
          ? _value._transactionLinesGroup
          : transactionLinesGroup // ignore: cast_nullable_to_non_nullable
              as List<TransactionLinesGroup>?,
      isSuccess: freezed == isSuccess
          ? _value.isSuccess
          : isSuccess // ignore: cast_nullable_to_non_nullable
              as bool?,
      isError: freezed == isError
          ? _value.isError
          : isError // ignore: cast_nullable_to_non_nullable
              as bool?,
      statusMessage: freezed == statusMessage
          ? _value.statusMessage
          : statusMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      transactionResponse: freezed == transactionResponse
          ? _value.transactionResponse
          : transactionResponse // ignore: cast_nullable_to_non_nullable
              as TransactionResponse?,
      transactionLinesGroupsBySeat: freezed == transactionLinesGroupsBySeat
          ? _value._transactionLinesGroupsBySeat
          : transactionLinesGroupsBySeat // ignore: cast_nullable_to_non_nullable
              as Map<String, List<TransactionLinesGroup>>?,
      selectedTransactionLinesGroup: freezed == selectedTransactionLinesGroup
          ? _value._selectedTransactionLinesGroup
          : selectedTransactionLinesGroup // ignore: cast_nullable_to_non_nullable
              as List<TransactionLinesGroup>?,
      shouldClearSearchFilter: freezed == shouldClearSearchFilter
          ? _value.shouldClearSearchFilter
          : shouldClearSearchFilter // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_OrderTransactionLinesState implements _OrderTransactionLinesState {
  const _$_OrderTransactionLinesState(
      {this.loadingStatus = -1,
      final List<String>? seats,
      final List<String>? course,
      final List<String>? products,
      final List<TransactionLinesGroup>? transactionLinesGroup,
      this.isSuccess,
      this.isError,
      this.statusMessage,
      this.transactionResponse,
      final Map<String, List<TransactionLinesGroup>>?
          transactionLinesGroupsBySeat,
      final List<TransactionLinesGroup>? selectedTransactionLinesGroup,
      this.shouldClearSearchFilter})
      : _seats = seats,
        _course = course,
        _products = products,
        _transactionLinesGroup = transactionLinesGroup,
        _transactionLinesGroupsBySeat = transactionLinesGroupsBySeat,
        _selectedTransactionLinesGroup = selectedTransactionLinesGroup;

  factory _$_OrderTransactionLinesState.fromJson(Map<String, dynamic> json) =>
      _$$_OrderTransactionLinesStateFromJson(json);

  @override
  @JsonKey()
  final int loadingStatus;
  final List<String>? _seats;
  @override
  List<String>? get seats {
    final value = _seats;
    if (value == null) return null;
    if (_seats is EqualUnmodifiableListView) return _seats;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String>? _course;
  @override
  List<String>? get course {
    final value = _course;
    if (value == null) return null;
    if (_course is EqualUnmodifiableListView) return _course;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String>? _products;
  @override
  List<String>? get products {
    final value = _products;
    if (value == null) return null;
    if (_products is EqualUnmodifiableListView) return _products;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<TransactionLinesGroup>? _transactionLinesGroup;
  @override
  List<TransactionLinesGroup>? get transactionLinesGroup {
    final value = _transactionLinesGroup;
    if (value == null) return null;
    if (_transactionLinesGroup is EqualUnmodifiableListView)
      return _transactionLinesGroup;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final bool? isSuccess;
  @override
  final bool? isError;
  @override
  final String? statusMessage;
  @override
  final TransactionResponse? transactionResponse;
  final Map<String, List<TransactionLinesGroup>>? _transactionLinesGroupsBySeat;
  @override
  Map<String, List<TransactionLinesGroup>>? get transactionLinesGroupsBySeat {
    final value = _transactionLinesGroupsBySeat;
    if (value == null) return null;
    if (_transactionLinesGroupsBySeat is EqualUnmodifiableMapView)
      return _transactionLinesGroupsBySeat;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  final List<TransactionLinesGroup>? _selectedTransactionLinesGroup;
  @override
  List<TransactionLinesGroup>? get selectedTransactionLinesGroup {
    final value = _selectedTransactionLinesGroup;
    if (value == null) return null;
    if (_selectedTransactionLinesGroup is EqualUnmodifiableListView)
      return _selectedTransactionLinesGroup;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final bool? shouldClearSearchFilter;

  @override
  String toString() {
    return 'OrderTransactionLinesState(loadingStatus: $loadingStatus, seats: $seats, course: $course, products: $products, transactionLinesGroup: $transactionLinesGroup, isSuccess: $isSuccess, isError: $isError, statusMessage: $statusMessage, transactionResponse: $transactionResponse, transactionLinesGroupsBySeat: $transactionLinesGroupsBySeat, selectedTransactionLinesGroup: $selectedTransactionLinesGroup, shouldClearSearchFilter: $shouldClearSearchFilter)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OrderTransactionLinesState &&
            (identical(other.loadingStatus, loadingStatus) ||
                other.loadingStatus == loadingStatus) &&
            const DeepCollectionEquality().equals(other._seats, _seats) &&
            const DeepCollectionEquality().equals(other._course, _course) &&
            const DeepCollectionEquality().equals(other._products, _products) &&
            const DeepCollectionEquality()
                .equals(other._transactionLinesGroup, _transactionLinesGroup) &&
            (identical(other.isSuccess, isSuccess) ||
                other.isSuccess == isSuccess) &&
            (identical(other.isError, isError) || other.isError == isError) &&
            (identical(other.statusMessage, statusMessage) ||
                other.statusMessage == statusMessage) &&
            (identical(other.transactionResponse, transactionResponse) ||
                other.transactionResponse == transactionResponse) &&
            const DeepCollectionEquality().equals(
                other._transactionLinesGroupsBySeat,
                _transactionLinesGroupsBySeat) &&
            const DeepCollectionEquality().equals(
                other._selectedTransactionLinesGroup,
                _selectedTransactionLinesGroup) &&
            (identical(
                    other.shouldClearSearchFilter, shouldClearSearchFilter) ||
                other.shouldClearSearchFilter == shouldClearSearchFilter));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      loadingStatus,
      const DeepCollectionEquality().hash(_seats),
      const DeepCollectionEquality().hash(_course),
      const DeepCollectionEquality().hash(_products),
      const DeepCollectionEquality().hash(_transactionLinesGroup),
      isSuccess,
      isError,
      statusMessage,
      transactionResponse,
      const DeepCollectionEquality().hash(_transactionLinesGroupsBySeat),
      const DeepCollectionEquality().hash(_selectedTransactionLinesGroup),
      shouldClearSearchFilter);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_OrderTransactionLinesStateCopyWith<_$_OrderTransactionLinesState>
      get copyWith => __$$_OrderTransactionLinesStateCopyWithImpl<
          _$_OrderTransactionLinesState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_OrderTransactionLinesStateToJson(
      this,
    );
  }
}

abstract class _OrderTransactionLinesState
    implements OrderTransactionLinesState {
  const factory _OrderTransactionLinesState(
      {final int loadingStatus,
      final List<String>? seats,
      final List<String>? course,
      final List<String>? products,
      final List<TransactionLinesGroup>? transactionLinesGroup,
      final bool? isSuccess,
      final bool? isError,
      final String? statusMessage,
      final TransactionResponse? transactionResponse,
      final Map<String, List<TransactionLinesGroup>>?
          transactionLinesGroupsBySeat,
      final List<TransactionLinesGroup>? selectedTransactionLinesGroup,
      final bool? shouldClearSearchFilter}) = _$_OrderTransactionLinesState;

  factory _OrderTransactionLinesState.fromJson(Map<String, dynamic> json) =
      _$_OrderTransactionLinesState.fromJson;

  @override
  int get loadingStatus;
  @override
  List<String>? get seats;
  @override
  List<String>? get course;
  @override
  List<String>? get products;
  @override
  List<TransactionLinesGroup>? get transactionLinesGroup;
  @override
  bool? get isSuccess;
  @override
  bool? get isError;
  @override
  String? get statusMessage;
  @override
  TransactionResponse? get transactionResponse;
  @override
  Map<String, List<TransactionLinesGroup>>? get transactionLinesGroupsBySeat;
  @override
  List<TransactionLinesGroup>? get selectedTransactionLinesGroup;
  @override
  bool? get shouldClearSearchFilter;
  @override
  @JsonKey(ignore: true)
  _$$_OrderTransactionLinesStateCopyWith<_$_OrderTransactionLinesState>
      get copyWith => throw _privateConstructorUsedError;
}
