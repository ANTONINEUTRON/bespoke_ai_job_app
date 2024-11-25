// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'interview.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Interview _$InterviewFromJson(Map<String, dynamic> json) {
  return _Interview.fromJson(json);
}

/// @nodoc
mixin _$Interview {
  String get question => throw _privateConstructorUsedError;
  String get response => throw _privateConstructorUsedError;

  /// Serializes this Interview to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Interview
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $InterviewCopyWith<Interview> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InterviewCopyWith<$Res> {
  factory $InterviewCopyWith(Interview value, $Res Function(Interview) then) =
      _$InterviewCopyWithImpl<$Res, Interview>;
  @useResult
  $Res call({String question, String response});
}

/// @nodoc
class _$InterviewCopyWithImpl<$Res, $Val extends Interview>
    implements $InterviewCopyWith<$Res> {
  _$InterviewCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Interview
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? question = null,
    Object? response = null,
  }) {
    return _then(_value.copyWith(
      question: null == question
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as String,
      response: null == response
          ? _value.response
          : response // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InterviewImplCopyWith<$Res>
    implements $InterviewCopyWith<$Res> {
  factory _$$InterviewImplCopyWith(
          _$InterviewImpl value, $Res Function(_$InterviewImpl) then) =
      __$$InterviewImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String question, String response});
}

/// @nodoc
class __$$InterviewImplCopyWithImpl<$Res>
    extends _$InterviewCopyWithImpl<$Res, _$InterviewImpl>
    implements _$$InterviewImplCopyWith<$Res> {
  __$$InterviewImplCopyWithImpl(
      _$InterviewImpl _value, $Res Function(_$InterviewImpl) _then)
      : super(_value, _then);

  /// Create a copy of Interview
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? question = null,
    Object? response = null,
  }) {
    return _then(_$InterviewImpl(
      question: null == question
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as String,
      response: null == response
          ? _value.response
          : response // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$InterviewImpl implements _Interview {
  _$InterviewImpl({required this.question, required this.response});

  factory _$InterviewImpl.fromJson(Map<String, dynamic> json) =>
      _$$InterviewImplFromJson(json);

  @override
  final String question;
  @override
  final String response;

  @override
  String toString() {
    return 'Interview(question: $question, response: $response)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InterviewImpl &&
            (identical(other.question, question) ||
                other.question == question) &&
            (identical(other.response, response) ||
                other.response == response));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, question, response);

  /// Create a copy of Interview
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InterviewImplCopyWith<_$InterviewImpl> get copyWith =>
      __$$InterviewImplCopyWithImpl<_$InterviewImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$InterviewImplToJson(
      this,
    );
  }
}

abstract class _Interview implements Interview {
  factory _Interview(
      {required final String question,
      required final String response}) = _$InterviewImpl;

  factory _Interview.fromJson(Map<String, dynamic> json) =
      _$InterviewImpl.fromJson;

  @override
  String get question;
  @override
  String get response;

  /// Create a copy of Interview
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InterviewImplCopyWith<_$InterviewImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
