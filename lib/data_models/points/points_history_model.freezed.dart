// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'points_history_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PointHistoryModel _$PointHistoryModelFromJson(Map<String, dynamic> json) {
  return _PointHistoryModel.fromJson(json);
}

/// @nodoc
mixin _$PointHistoryModel {
  int get points => throw _privateConstructorUsedError;
  String get provider => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get detail => throw _privateConstructorUsedError;

  /// Serializes this PointHistoryModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PointHistoryModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PointHistoryModelCopyWith<PointHistoryModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PointHistoryModelCopyWith<$Res> {
  factory $PointHistoryModelCopyWith(
          PointHistoryModel value, $Res Function(PointHistoryModel) then) =
      _$PointHistoryModelCopyWithImpl<$Res, PointHistoryModel>;
  @useResult
  $Res call(
      {int points,
      String provider,
      String type,
      DateTime date,
      String title,
      String detail});
}

/// @nodoc
class _$PointHistoryModelCopyWithImpl<$Res, $Val extends PointHistoryModel>
    implements $PointHistoryModelCopyWith<$Res> {
  _$PointHistoryModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PointHistoryModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? points = null,
    Object? provider = null,
    Object? type = null,
    Object? date = null,
    Object? title = null,
    Object? detail = null,
  }) {
    return _then(_value.copyWith(
      points: null == points
          ? _value.points
          : points // ignore: cast_nullable_to_non_nullable
              as int,
      provider: null == provider
          ? _value.provider
          : provider // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      detail: null == detail
          ? _value.detail
          : detail // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PointHistoryModelImplCopyWith<$Res>
    implements $PointHistoryModelCopyWith<$Res> {
  factory _$$PointHistoryModelImplCopyWith(_$PointHistoryModelImpl value,
          $Res Function(_$PointHistoryModelImpl) then) =
      __$$PointHistoryModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int points,
      String provider,
      String type,
      DateTime date,
      String title,
      String detail});
}

/// @nodoc
class __$$PointHistoryModelImplCopyWithImpl<$Res>
    extends _$PointHistoryModelCopyWithImpl<$Res, _$PointHistoryModelImpl>
    implements _$$PointHistoryModelImplCopyWith<$Res> {
  __$$PointHistoryModelImplCopyWithImpl(_$PointHistoryModelImpl _value,
      $Res Function(_$PointHistoryModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of PointHistoryModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? points = null,
    Object? provider = null,
    Object? type = null,
    Object? date = null,
    Object? title = null,
    Object? detail = null,
  }) {
    return _then(_$PointHistoryModelImpl(
      points: null == points
          ? _value.points
          : points // ignore: cast_nullable_to_non_nullable
              as int,
      provider: null == provider
          ? _value.provider
          : provider // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      detail: null == detail
          ? _value.detail
          : detail // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PointHistoryModelImpl implements _PointHistoryModel {
  _$PointHistoryModelImpl(
      {required this.points,
      required this.provider,
      required this.type,
      required this.date,
      required this.title,
      required this.detail});

  factory _$PointHistoryModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PointHistoryModelImplFromJson(json);

  @override
  final int points;
  @override
  final String provider;
  @override
  final String type;
  @override
  final DateTime date;
  @override
  final String title;
  @override
  final String detail;

  @override
  String toString() {
    return 'PointHistoryModel(points: $points, provider: $provider, type: $type, date: $date, title: $title, detail: $detail)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PointHistoryModelImpl &&
            (identical(other.points, points) || other.points == points) &&
            (identical(other.provider, provider) ||
                other.provider == provider) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.detail, detail) || other.detail == detail));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, points, provider, type, date, title, detail);

  /// Create a copy of PointHistoryModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PointHistoryModelImplCopyWith<_$PointHistoryModelImpl> get copyWith =>
      __$$PointHistoryModelImplCopyWithImpl<_$PointHistoryModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PointHistoryModelImplToJson(
      this,
    );
  }
}

abstract class _PointHistoryModel implements PointHistoryModel {
  factory _PointHistoryModel(
      {required final int points,
      required final String provider,
      required final String type,
      required final DateTime date,
      required final String title,
      required final String detail}) = _$PointHistoryModelImpl;

  factory _PointHistoryModel.fromJson(Map<String, dynamic> json) =
      _$PointHistoryModelImpl.fromJson;

  @override
  int get points;
  @override
  String get provider;
  @override
  String get type;
  @override
  DateTime get date;
  @override
  String get title;
  @override
  String get detail;

  /// Create a copy of PointHistoryModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PointHistoryModelImplCopyWith<_$PointHistoryModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
