// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'job.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$Job {
  @HiveField(1)
  String get id => throw _privateConstructorUsedError;
  @HiveField(2)
  String get description => throw _privateConstructorUsedError;
  @HiveField(3)
  String? get aiInsight => throw _privateConstructorUsedError;
  @HiveField(4)
  DateTime? get date => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $JobCopyWith<Job> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $JobCopyWith<$Res> {
  factory $JobCopyWith(Job value, $Res Function(Job) then) =
      _$JobCopyWithImpl<$Res, Job>;
  @useResult
  $Res call(
      {@HiveField(1) String id,
      @HiveField(2) String description,
      @HiveField(3) String? aiInsight,
      @HiveField(4) DateTime? date});
}

/// @nodoc
class _$JobCopyWithImpl<$Res, $Val extends Job> implements $JobCopyWith<$Res> {
  _$JobCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? description = null,
    Object? aiInsight = freezed,
    Object? date = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      aiInsight: freezed == aiInsight
          ? _value.aiInsight
          : aiInsight // ignore: cast_nullable_to_non_nullable
              as String?,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$JobImplCopyWith<$Res> implements $JobCopyWith<$Res> {
  factory _$$JobImplCopyWith(_$JobImpl value, $Res Function(_$JobImpl) then) =
      __$$JobImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(1) String id,
      @HiveField(2) String description,
      @HiveField(3) String? aiInsight,
      @HiveField(4) DateTime? date});
}

/// @nodoc
class __$$JobImplCopyWithImpl<$Res> extends _$JobCopyWithImpl<$Res, _$JobImpl>
    implements _$$JobImplCopyWith<$Res> {
  __$$JobImplCopyWithImpl(_$JobImpl _value, $Res Function(_$JobImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? description = null,
    Object? aiInsight = freezed,
    Object? date = freezed,
  }) {
    return _then(_$JobImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      aiInsight: freezed == aiInsight
          ? _value.aiInsight
          : aiInsight // ignore: cast_nullable_to_non_nullable
              as String?,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc

@HiveType(typeId: 2)
class _$JobImpl extends _Job {
  _$JobImpl(
      {@HiveField(1) required this.id,
      @HiveField(2) required this.description,
      @HiveField(3) this.aiInsight,
      @HiveField(4) this.date})
      : super._();

  @override
  @HiveField(1)
  final String id;
  @override
  @HiveField(2)
  final String description;
  @override
  @HiveField(3)
  final String? aiInsight;
  @override
  @HiveField(4)
  final DateTime? date;

  @override
  String toString() {
    return 'Job(id: $id, description: $description, aiInsight: $aiInsight, date: $date)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$JobImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.aiInsight, aiInsight) ||
                other.aiInsight == aiInsight) &&
            (identical(other.date, date) || other.date == date));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, id, description, aiInsight, date);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$JobImplCopyWith<_$JobImpl> get copyWith =>
      __$$JobImplCopyWithImpl<_$JobImpl>(this, _$identity);
}

abstract class _Job extends Job {
  factory _Job(
      {@HiveField(1) required final String id,
      @HiveField(2) required final String description,
      @HiveField(3) final String? aiInsight,
      @HiveField(4) final DateTime? date}) = _$JobImpl;
  _Job._() : super._();

  @override
  @HiveField(1)
  String get id;
  @override
  @HiveField(2)
  String get description;
  @override
  @HiveField(3)
  String? get aiInsight;
  @override
  @HiveField(4)
  DateTime? get date;
  @override
  @JsonKey(ignore: true)
  _$$JobImplCopyWith<_$JobImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
