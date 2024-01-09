// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transaction_line_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TransactionLineDTORequest _$TransactionLineDTORequestFromJson(
    Map<String, dynamic> json) {
  return _TransactionLineDTORequest.fromJson(json);
}

/// @nodoc
mixin _$TransactionLineDTORequest {
  @JsonKey(name: 'ModifierSetId')
  int get modifierSetId => throw _privateConstructorUsedError;
  @JsonKey(name: 'ModifierSetDetailId')
  int get modifierSetDetailId => throw _privateConstructorUsedError;
  @JsonKey(name: 'ProductId')
  int get productId => throw _privateConstructorUsedError;
  @JsonKey(name: 'ProductName')
  String get productName => throw _privateConstructorUsedError;
  @JsonKey(name: 'Remarks')
  String? get remarks => throw _privateConstructorUsedError;
  @JsonKey(name: 'ApprovedBy')
  String? get approvedBy => throw _privateConstructorUsedError;
  @JsonKey(name: 'Quantity')
  double get quantity => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsParentModifier')
  bool get isParentModifier => throw _privateConstructorUsedError;
  @JsonKey(name: 'TransactionLineDTOList')
  List<TransactionLineDTORequest>? get transactionLineDTOList =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TransactionLineDTORequestCopyWith<TransactionLineDTORequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionLineDTORequestCopyWith<$Res> {
  factory $TransactionLineDTORequestCopyWith(TransactionLineDTORequest value,
          $Res Function(TransactionLineDTORequest) then) =
      _$TransactionLineDTORequestCopyWithImpl<$Res, TransactionLineDTORequest>;
  @useResult
  $Res call(
      {@JsonKey(name: 'ModifierSetId')
          int modifierSetId,
      @JsonKey(name: 'ModifierSetDetailId')
          int modifierSetDetailId,
      @JsonKey(name: 'ProductId')
          int productId,
      @JsonKey(name: 'ProductName')
          String productName,
      @JsonKey(name: 'Remarks')
          String? remarks,
      @JsonKey(name: 'ApprovedBy')
          String? approvedBy,
      @JsonKey(name: 'Quantity')
          double quantity,
      @JsonKey(name: 'IsParentModifier')
          bool isParentModifier,
      @JsonKey(name: 'TransactionLineDTOList')
          List<TransactionLineDTORequest>? transactionLineDTOList});
}

/// @nodoc
class _$TransactionLineDTORequestCopyWithImpl<$Res,
        $Val extends TransactionLineDTORequest>
    implements $TransactionLineDTORequestCopyWith<$Res> {
  _$TransactionLineDTORequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? modifierSetId = null,
    Object? modifierSetDetailId = null,
    Object? productId = null,
    Object? productName = null,
    Object? remarks = freezed,
    Object? approvedBy = freezed,
    Object? quantity = null,
    Object? isParentModifier = null,
    Object? transactionLineDTOList = freezed,
  }) {
    return _then(_value.copyWith(
      modifierSetId: null == modifierSetId
          ? _value.modifierSetId
          : modifierSetId // ignore: cast_nullable_to_non_nullable
              as int,
      modifierSetDetailId: null == modifierSetDetailId
          ? _value.modifierSetDetailId
          : modifierSetDetailId // ignore: cast_nullable_to_non_nullable
              as int,
      productId: null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as int,
      productName: null == productName
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String,
      remarks: freezed == remarks
          ? _value.remarks
          : remarks // ignore: cast_nullable_to_non_nullable
              as String?,
      approvedBy: freezed == approvedBy
          ? _value.approvedBy
          : approvedBy // ignore: cast_nullable_to_non_nullable
              as String?,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as double,
      isParentModifier: null == isParentModifier
          ? _value.isParentModifier
          : isParentModifier // ignore: cast_nullable_to_non_nullable
              as bool,
      transactionLineDTOList: freezed == transactionLineDTOList
          ? _value.transactionLineDTOList
          : transactionLineDTOList // ignore: cast_nullable_to_non_nullable
              as List<TransactionLineDTORequest>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TransactionLineDTORequestCopyWith<$Res>
    implements $TransactionLineDTORequestCopyWith<$Res> {
  factory _$$_TransactionLineDTORequestCopyWith(
          _$_TransactionLineDTORequest value,
          $Res Function(_$_TransactionLineDTORequest) then) =
      __$$_TransactionLineDTORequestCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'ModifierSetId')
          int modifierSetId,
      @JsonKey(name: 'ModifierSetDetailId')
          int modifierSetDetailId,
      @JsonKey(name: 'ProductId')
          int productId,
      @JsonKey(name: 'ProductName')
          String productName,
      @JsonKey(name: 'Remarks')
          String? remarks,
      @JsonKey(name: 'ApprovedBy')
          String? approvedBy,
      @JsonKey(name: 'Quantity')
          double quantity,
      @JsonKey(name: 'IsParentModifier')
          bool isParentModifier,
      @JsonKey(name: 'TransactionLineDTOList')
          List<TransactionLineDTORequest>? transactionLineDTOList});
}

/// @nodoc
class __$$_TransactionLineDTORequestCopyWithImpl<$Res>
    extends _$TransactionLineDTORequestCopyWithImpl<$Res,
        _$_TransactionLineDTORequest>
    implements _$$_TransactionLineDTORequestCopyWith<$Res> {
  __$$_TransactionLineDTORequestCopyWithImpl(
      _$_TransactionLineDTORequest _value,
      $Res Function(_$_TransactionLineDTORequest) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? modifierSetId = null,
    Object? modifierSetDetailId = null,
    Object? productId = null,
    Object? productName = null,
    Object? remarks = freezed,
    Object? approvedBy = freezed,
    Object? quantity = null,
    Object? isParentModifier = null,
    Object? transactionLineDTOList = freezed,
  }) {
    return _then(_$_TransactionLineDTORequest(
      modifierSetId: null == modifierSetId
          ? _value.modifierSetId
          : modifierSetId // ignore: cast_nullable_to_non_nullable
              as int,
      modifierSetDetailId: null == modifierSetDetailId
          ? _value.modifierSetDetailId
          : modifierSetDetailId // ignore: cast_nullable_to_non_nullable
              as int,
      productId: null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as int,
      productName: null == productName
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String,
      remarks: freezed == remarks
          ? _value.remarks
          : remarks // ignore: cast_nullable_to_non_nullable
              as String?,
      approvedBy: freezed == approvedBy
          ? _value.approvedBy
          : approvedBy // ignore: cast_nullable_to_non_nullable
              as String?,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as double,
      isParentModifier: null == isParentModifier
          ? _value.isParentModifier
          : isParentModifier // ignore: cast_nullable_to_non_nullable
              as bool,
      transactionLineDTOList: freezed == transactionLineDTOList
          ? _value._transactionLineDTOList
          : transactionLineDTOList // ignore: cast_nullable_to_non_nullable
              as List<TransactionLineDTORequest>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TransactionLineDTORequest implements _TransactionLineDTORequest {
  const _$_TransactionLineDTORequest(
      {@JsonKey(name: 'ModifierSetId')
          required this.modifierSetId,
      @JsonKey(name: 'ModifierSetDetailId')
          required this.modifierSetDetailId,
      @JsonKey(name: 'ProductId')
          required this.productId,
      @JsonKey(name: 'ProductName')
          required this.productName,
      @JsonKey(name: 'Remarks')
          this.remarks,
      @JsonKey(name: 'ApprovedBy')
          this.approvedBy,
      @JsonKey(name: 'Quantity')
          this.quantity = 0.0,
      @JsonKey(name: 'IsParentModifier')
          this.isParentModifier = false,
      @JsonKey(name: 'TransactionLineDTOList')
          final List<TransactionLineDTORequest>?
              transactionLineDTOList = const []})
      : _transactionLineDTOList = transactionLineDTOList;

  factory _$_TransactionLineDTORequest.fromJson(Map<String, dynamic> json) =>
      _$$_TransactionLineDTORequestFromJson(json);

  @override
  @JsonKey(name: 'ModifierSetId')
  final int modifierSetId;
  @override
  @JsonKey(name: 'ModifierSetDetailId')
  final int modifierSetDetailId;
  @override
  @JsonKey(name: 'ProductId')
  final int productId;
  @override
  @JsonKey(name: 'ProductName')
  final String productName;
  @override
  @JsonKey(name: 'Remarks')
  final String? remarks;
  @override
  @JsonKey(name: 'ApprovedBy')
  final String? approvedBy;
  @override
  @JsonKey(name: 'Quantity')
  final double quantity;
  @override
  @JsonKey(name: 'IsParentModifier')
  final bool isParentModifier;
  final List<TransactionLineDTORequest>? _transactionLineDTOList;
  @override
  @JsonKey(name: 'TransactionLineDTOList')
  List<TransactionLineDTORequest>? get transactionLineDTOList {
    final value = _transactionLineDTOList;
    if (value == null) return null;
    if (_transactionLineDTOList is EqualUnmodifiableListView)
      return _transactionLineDTOList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'TransactionLineDTORequest(modifierSetId: $modifierSetId, modifierSetDetailId: $modifierSetDetailId, productId: $productId, productName: $productName, remarks: $remarks, approvedBy: $approvedBy, quantity: $quantity, isParentModifier: $isParentModifier, transactionLineDTOList: $transactionLineDTOList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TransactionLineDTORequest &&
            (identical(other.modifierSetId, modifierSetId) ||
                other.modifierSetId == modifierSetId) &&
            (identical(other.modifierSetDetailId, modifierSetDetailId) ||
                other.modifierSetDetailId == modifierSetDetailId) &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.productName, productName) ||
                other.productName == productName) &&
            (identical(other.remarks, remarks) || other.remarks == remarks) &&
            (identical(other.approvedBy, approvedBy) ||
                other.approvedBy == approvedBy) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.isParentModifier, isParentModifier) ||
                other.isParentModifier == isParentModifier) &&
            const DeepCollectionEquality().equals(
                other._transactionLineDTOList, _transactionLineDTOList));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      modifierSetId,
      modifierSetDetailId,
      productId,
      productName,
      remarks,
      approvedBy,
      quantity,
      isParentModifier,
      const DeepCollectionEquality().hash(_transactionLineDTOList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TransactionLineDTORequestCopyWith<_$_TransactionLineDTORequest>
      get copyWith => __$$_TransactionLineDTORequestCopyWithImpl<
          _$_TransactionLineDTORequest>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TransactionLineDTORequestToJson(
      this,
    );
  }
}

abstract class _TransactionLineDTORequest implements TransactionLineDTORequest {
  const factory _TransactionLineDTORequest(
          {@JsonKey(name: 'ModifierSetId')
              required final int modifierSetId,
          @JsonKey(name: 'ModifierSetDetailId')
              required final int modifierSetDetailId,
          @JsonKey(name: 'ProductId')
              required final int productId,
          @JsonKey(name: 'ProductName')
              required final String productName,
          @JsonKey(name: 'Remarks')
              final String? remarks,
          @JsonKey(name: 'ApprovedBy')
              final String? approvedBy,
          @JsonKey(name: 'Quantity')
              final double quantity,
          @JsonKey(name: 'IsParentModifier')
              final bool isParentModifier,
          @JsonKey(name: 'TransactionLineDTOList')
              final List<TransactionLineDTORequest>? transactionLineDTOList}) =
      _$_TransactionLineDTORequest;

  factory _TransactionLineDTORequest.fromJson(Map<String, dynamic> json) =
      _$_TransactionLineDTORequest.fromJson;

  @override
  @JsonKey(name: 'ModifierSetId')
  int get modifierSetId;
  @override
  @JsonKey(name: 'ModifierSetDetailId')
  int get modifierSetDetailId;
  @override
  @JsonKey(name: 'ProductId')
  int get productId;
  @override
  @JsonKey(name: 'ProductName')
  String get productName;
  @override
  @JsonKey(name: 'Remarks')
  String? get remarks;
  @override
  @JsonKey(name: 'ApprovedBy')
  String? get approvedBy;
  @override
  @JsonKey(name: 'Quantity')
  double get quantity;
  @override
  @JsonKey(name: 'IsParentModifier')
  bool get isParentModifier;
  @override
  @JsonKey(name: 'TransactionLineDTOList')
  List<TransactionLineDTORequest>? get transactionLineDTOList;
  @override
  @JsonKey(ignore: true)
  _$$_TransactionLineDTORequestCopyWith<_$_TransactionLineDTORequest>
      get copyWith => throw _privateConstructorUsedError;
}
