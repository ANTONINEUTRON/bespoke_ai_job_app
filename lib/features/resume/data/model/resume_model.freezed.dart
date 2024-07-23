// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'resume_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ResumeModel _$ResumeModelFromJson(Map<String, dynamic> json) {
  return _ResumeModel.fromJson(json);
}

/// @nodoc
mixin _$ResumeModel {
  @HiveField(1)
  String get id => throw _privateConstructorUsedError;
  @HiveField(2)
  String get title => throw _privateConstructorUsedError;
  @HiveField(3)
  String get filePath => throw _privateConstructorUsedError;
  @HiveField(4)
  DateTime get date => throw _privateConstructorUsedError;
  @HiveField(5)
  String? get aiInsight => throw _privateConstructorUsedError;
  @HiveField(6)
  List<String>? get screenshots => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ResumeModelCopyWith<ResumeModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResumeModelCopyWith<$Res> {
  factory $ResumeModelCopyWith(
          ResumeModel value, $Res Function(ResumeModel) then) =
      _$ResumeModelCopyWithImpl<$Res, ResumeModel>;
  @useResult
  $Res call(
      {@HiveField(1) String id,
      @HiveField(2) String title,
      @HiveField(3) String filePath,
      @HiveField(4) DateTime date,
      @HiveField(5) String? aiInsight,
      @HiveField(6) List<String>? screenshots});
}

/// @nodoc
class _$ResumeModelCopyWithImpl<$Res, $Val extends ResumeModel>
    implements $ResumeModelCopyWith<$Res> {
  _$ResumeModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? filePath = null,
    Object? date = null,
    Object? aiInsight = freezed,
    Object? screenshots = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      filePath: null == filePath
          ? _value.filePath
          : filePath // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      aiInsight: freezed == aiInsight
          ? _value.aiInsight
          : aiInsight // ignore: cast_nullable_to_non_nullable
              as String?,
      screenshots: freezed == screenshots
          ? _value.screenshots
          : screenshots // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ResumeModelImplCopyWith<$Res>
    implements $ResumeModelCopyWith<$Res> {
  factory _$$ResumeModelImplCopyWith(
          _$ResumeModelImpl value, $Res Function(_$ResumeModelImpl) then) =
      __$$ResumeModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(1) String id,
      @HiveField(2) String title,
      @HiveField(3) String filePath,
      @HiveField(4) DateTime date,
      @HiveField(5) String? aiInsight,
      @HiveField(6) List<String>? screenshots});
}

/// @nodoc
class __$$ResumeModelImplCopyWithImpl<$Res>
    extends _$ResumeModelCopyWithImpl<$Res, _$ResumeModelImpl>
    implements _$$ResumeModelImplCopyWith<$Res> {
  __$$ResumeModelImplCopyWithImpl(
      _$ResumeModelImpl _value, $Res Function(_$ResumeModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? filePath = null,
    Object? date = null,
    Object? aiInsight = freezed,
    Object? screenshots = freezed,
  }) {
    return _then(_$ResumeModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      filePath: null == filePath
          ? _value.filePath
          : filePath // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      aiInsight: freezed == aiInsight
          ? _value.aiInsight
          : aiInsight // ignore: cast_nullable_to_non_nullable
              as String?,
      screenshots: freezed == screenshots
          ? _value._screenshots
          : screenshots // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
@HiveType(typeId: 1)
class _$ResumeModelImpl extends _ResumeModel {
  _$ResumeModelImpl(
      {@HiveField(1) required this.id,
      @HiveField(2) required this.title,
      @HiveField(3) required this.filePath,
      @HiveField(4) required this.date,
      @HiveField(5) this.aiInsight = null,
      @HiveField(6) final List<String>? screenshots = null})
      : _screenshots = screenshots,
        super._();

  factory _$ResumeModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ResumeModelImplFromJson(json);

  @override
  @HiveField(1)
  final String id;
  @override
  @HiveField(2)
  final String title;
  @override
  @HiveField(3)
  final String filePath;
  @override
  @HiveField(4)
  final DateTime date;
  @override
  @JsonKey()
  @HiveField(5)
  final String? aiInsight;
  final List<String>? _screenshots;
  @override
  @JsonKey()
  @HiveField(6)
  List<String>? get screenshots {
    final value = _screenshots;
    if (value == null) return null;
    if (_screenshots is EqualUnmodifiableListView) return _screenshots;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'ResumeModel(id: $id, title: $title, filePath: $filePath, date: $date, aiInsight: $aiInsight, screenshots: $screenshots)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResumeModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.filePath, filePath) ||
                other.filePath == filePath) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.aiInsight, aiInsight) ||
                other.aiInsight == aiInsight) &&
            const DeepCollectionEquality()
                .equals(other._screenshots, _screenshots));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, title, filePath, date,
      aiInsight, const DeepCollectionEquality().hash(_screenshots));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ResumeModelImplCopyWith<_$ResumeModelImpl> get copyWith =>
      __$$ResumeModelImplCopyWithImpl<_$ResumeModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ResumeModelImplToJson(
      this,
    );
  }
}

abstract class _ResumeModel extends ResumeModel {
  factory _ResumeModel(
      {@HiveField(1) required final String id,
      @HiveField(2) required final String title,
      @HiveField(3) required final String filePath,
      @HiveField(4) required final DateTime date,
      @HiveField(5) final String? aiInsight,
      @HiveField(6) final List<String>? screenshots}) = _$ResumeModelImpl;
  _ResumeModel._() : super._();

  factory _ResumeModel.fromJson(Map<String, dynamic> json) =
      _$ResumeModelImpl.fromJson;

  @override
  @HiveField(1)
  String get id;
  @override
  @HiveField(2)
  String get title;
  @override
  @HiveField(3)
  String get filePath;
  @override
  @HiveField(4)
  DateTime get date;
  @override
  @HiveField(5)
  String? get aiInsight;
  @override
  @HiveField(6)
  List<String>? get screenshots;
  @override
  @JsonKey(ignore: true)
  _$$ResumeModelImplCopyWith<_$ResumeModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
