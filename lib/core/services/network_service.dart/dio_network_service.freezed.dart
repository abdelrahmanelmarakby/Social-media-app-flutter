// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'dio_network_service.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$NetworkRequestBody {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() empty,
    required TResult Function(Map<String, dynamic> data) json,
    required TResult Function(String data) text,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? empty,
    TResult Function(Map<String, dynamic> data)? json,
    TResult Function(String data)? text,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? empty,
    TResult Function(Map<String, dynamic> data)? json,
    TResult Function(String data)? text,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Empty value) empty,
    required TResult Function(Json value) json,
    required TResult Function(Text value) text,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Empty value)? empty,
    TResult Function(Json value)? json,
    TResult Function(Text value)? text,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Empty value)? empty,
    TResult Function(Json value)? json,
    TResult Function(Text value)? text,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NetworkRequestBodyCopyWith<$Res> {
  factory $NetworkRequestBodyCopyWith(
          NetworkRequestBody value, $Res Function(NetworkRequestBody) then) =
      _$NetworkRequestBodyCopyWithImpl<$Res>;
}

/// @nodoc
class _$NetworkRequestBodyCopyWithImpl<$Res>
    implements $NetworkRequestBodyCopyWith<$Res> {
  _$NetworkRequestBodyCopyWithImpl(this._value, this._then);

  final NetworkRequestBody _value;
  // ignore: unused_field
  final $Res Function(NetworkRequestBody) _then;
}

/// @nodoc
abstract class _$$EmptyCopyWith<$Res> {
  factory _$$EmptyCopyWith(_$Empty value, $Res Function(_$Empty) then) =
      __$$EmptyCopyWithImpl<$Res>;
}

/// @nodoc
class __$$EmptyCopyWithImpl<$Res> extends _$NetworkRequestBodyCopyWithImpl<$Res>
    implements _$$EmptyCopyWith<$Res> {
  __$$EmptyCopyWithImpl(_$Empty _value, $Res Function(_$Empty) _then)
      : super(_value, (v) => _then(v as _$Empty));

  @override
  _$Empty get _value => super._value as _$Empty;
}

/// @nodoc

class _$Empty implements Empty {
  const _$Empty();

  @override
  String toString() {
    return 'NetworkRequestBody.empty()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$Empty);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() empty,
    required TResult Function(Map<String, dynamic> data) json,
    required TResult Function(String data) text,
  }) {
    return empty();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? empty,
    TResult Function(Map<String, dynamic> data)? json,
    TResult Function(String data)? text,
  }) {
    return empty?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? empty,
    TResult Function(Map<String, dynamic> data)? json,
    TResult Function(String data)? text,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Empty value) empty,
    required TResult Function(Json value) json,
    required TResult Function(Text value) text,
  }) {
    return empty(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Empty value)? empty,
    TResult Function(Json value)? json,
    TResult Function(Text value)? text,
  }) {
    return empty?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Empty value)? empty,
    TResult Function(Json value)? json,
    TResult Function(Text value)? text,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty(this);
    }
    return orElse();
  }
}

abstract class Empty implements NetworkRequestBody {
  const factory Empty() = _$Empty;
}

/// @nodoc
abstract class _$$JsonCopyWith<$Res> {
  factory _$$JsonCopyWith(_$Json value, $Res Function(_$Json) then) =
      __$$JsonCopyWithImpl<$Res>;
  $Res call({Map<String, dynamic> data});
}

/// @nodoc
class __$$JsonCopyWithImpl<$Res> extends _$NetworkRequestBodyCopyWithImpl<$Res>
    implements _$$JsonCopyWith<$Res> {
  __$$JsonCopyWithImpl(_$Json _value, $Res Function(_$Json) _then)
      : super(_value, (v) => _then(v as _$Json));

  @override
  _$Json get _value => super._value as _$Json;

  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_$Json(
      data == freezed
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc

class _$Json implements Json {
  const _$Json(final Map<String, dynamic> data) : _data = data;

  final Map<String, dynamic> _data;
  @override
  Map<String, dynamic> get data {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_data);
  }

  @override
  String toString() {
    return 'NetworkRequestBody.json(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Json &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  _$$JsonCopyWith<_$Json> get copyWith =>
      __$$JsonCopyWithImpl<_$Json>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() empty,
    required TResult Function(Map<String, dynamic> data) json,
    required TResult Function(String data) text,
  }) {
    return json(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? empty,
    TResult Function(Map<String, dynamic> data)? json,
    TResult Function(String data)? text,
  }) {
    return json?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? empty,
    TResult Function(Map<String, dynamic> data)? json,
    TResult Function(String data)? text,
    required TResult orElse(),
  }) {
    if (json != null) {
      return json(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Empty value) empty,
    required TResult Function(Json value) json,
    required TResult Function(Text value) text,
  }) {
    return json(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Empty value)? empty,
    TResult Function(Json value)? json,
    TResult Function(Text value)? text,
  }) {
    return json?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Empty value)? empty,
    TResult Function(Json value)? json,
    TResult Function(Text value)? text,
    required TResult orElse(),
  }) {
    if (json != null) {
      return json(this);
    }
    return orElse();
  }
}

abstract class Json implements NetworkRequestBody {
  const factory Json(final Map<String, dynamic> data) = _$Json;

  Map<String, dynamic> get data => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$JsonCopyWith<_$Json> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$TextCopyWith<$Res> {
  factory _$$TextCopyWith(_$Text value, $Res Function(_$Text) then) =
      __$$TextCopyWithImpl<$Res>;
  $Res call({String data});
}

/// @nodoc
class __$$TextCopyWithImpl<$Res> extends _$NetworkRequestBodyCopyWithImpl<$Res>
    implements _$$TextCopyWith<$Res> {
  __$$TextCopyWithImpl(_$Text _value, $Res Function(_$Text) _then)
      : super(_value, (v) => _then(v as _$Text));

  @override
  _$Text get _value => super._value as _$Text;

  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_$Text(
      data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$Text implements Text {
  const _$Text(this.data);

  @override
  final String data;

  @override
  String toString() {
    return 'NetworkRequestBody.text(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Text &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  @JsonKey(ignore: true)
  @override
  _$$TextCopyWith<_$Text> get copyWith =>
      __$$TextCopyWithImpl<_$Text>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() empty,
    required TResult Function(Map<String, dynamic> data) json,
    required TResult Function(String data) text,
  }) {
    return text(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? empty,
    TResult Function(Map<String, dynamic> data)? json,
    TResult Function(String data)? text,
  }) {
    return text?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? empty,
    TResult Function(Map<String, dynamic> data)? json,
    TResult Function(String data)? text,
    required TResult orElse(),
  }) {
    if (text != null) {
      return text(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Empty value) empty,
    required TResult Function(Json value) json,
    required TResult Function(Text value) text,
  }) {
    return text(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Empty value)? empty,
    TResult Function(Json value)? json,
    TResult Function(Text value)? text,
  }) {
    return text?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Empty value)? empty,
    TResult Function(Json value)? json,
    TResult Function(Text value)? text,
    required TResult orElse(),
  }) {
    if (text != null) {
      return text(this);
    }
    return orElse();
  }
}

abstract class Text implements NetworkRequestBody {
  const factory Text(final String data) = _$Text;

  String get data => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$TextCopyWith<_$Text> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$NetworkResponse<Model> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Model data) ok,
    required TResult Function(String message) invalidParameters,
    required TResult Function(String message) noAuth,
    required TResult Function(String message) noAccess,
    required TResult Function(String message) badRequest,
    required TResult Function(String message) notFound,
    required TResult Function(String message) conflict,
    required TResult Function(String message) noData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(Model data)? ok,
    TResult Function(String message)? invalidParameters,
    TResult Function(String message)? noAuth,
    TResult Function(String message)? noAccess,
    TResult Function(String message)? badRequest,
    TResult Function(String message)? notFound,
    TResult Function(String message)? conflict,
    TResult Function(String message)? noData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Model data)? ok,
    TResult Function(String message)? invalidParameters,
    TResult Function(String message)? noAuth,
    TResult Function(String message)? noAccess,
    TResult Function(String message)? badRequest,
    TResult Function(String message)? notFound,
    TResult Function(String message)? conflict,
    TResult Function(String message)? noData,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Ok<Model> value) ok,
    required TResult Function(InvalidParameters<Model> value) invalidParameters,
    required TResult Function(NoAuth<Model> value) noAuth,
    required TResult Function(NoAccess<Model> value) noAccess,
    required TResult Function(BadRequest<Model> value) badRequest,
    required TResult Function(NotFound<Model> value) notFound,
    required TResult Function(Conflict<Model> value) conflict,
    required TResult Function(NoData<Model> value) noData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Ok<Model> value)? ok,
    TResult Function(InvalidParameters<Model> value)? invalidParameters,
    TResult Function(NoAuth<Model> value)? noAuth,
    TResult Function(NoAccess<Model> value)? noAccess,
    TResult Function(BadRequest<Model> value)? badRequest,
    TResult Function(NotFound<Model> value)? notFound,
    TResult Function(Conflict<Model> value)? conflict,
    TResult Function(NoData<Model> value)? noData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Ok<Model> value)? ok,
    TResult Function(InvalidParameters<Model> value)? invalidParameters,
    TResult Function(NoAuth<Model> value)? noAuth,
    TResult Function(NoAccess<Model> value)? noAccess,
    TResult Function(BadRequest<Model> value)? badRequest,
    TResult Function(NotFound<Model> value)? notFound,
    TResult Function(Conflict<Model> value)? conflict,
    TResult Function(NoData<Model> value)? noData,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NetworkResponseCopyWith<Model, $Res> {
  factory $NetworkResponseCopyWith(NetworkResponse<Model> value,
          $Res Function(NetworkResponse<Model>) then) =
      _$NetworkResponseCopyWithImpl<Model, $Res>;
}

/// @nodoc
class _$NetworkResponseCopyWithImpl<Model, $Res>
    implements $NetworkResponseCopyWith<Model, $Res> {
  _$NetworkResponseCopyWithImpl(this._value, this._then);

  final NetworkResponse<Model> _value;
  // ignore: unused_field
  final $Res Function(NetworkResponse<Model>) _then;
}

/// @nodoc
abstract class _$$OkCopyWith<Model, $Res> {
  factory _$$OkCopyWith(_$Ok<Model> value, $Res Function(_$Ok<Model>) then) =
      __$$OkCopyWithImpl<Model, $Res>;
  $Res call({Model data});
}

/// @nodoc
class __$$OkCopyWithImpl<Model, $Res>
    extends _$NetworkResponseCopyWithImpl<Model, $Res>
    implements _$$OkCopyWith<Model, $Res> {
  __$$OkCopyWithImpl(_$Ok<Model> _value, $Res Function(_$Ok<Model>) _then)
      : super(_value, (v) => _then(v as _$Ok<Model>));

  @override
  _$Ok<Model> get _value => super._value as _$Ok<Model>;

  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_$Ok<Model>(
      data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as Model,
    ));
  }
}

/// @nodoc

class _$Ok<Model> implements Ok<Model> {
  const _$Ok(this.data);

  @override
  final Model data;

  @override
  String toString() {
    return 'NetworkResponse<$Model>.ok(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Ok<Model> &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  @JsonKey(ignore: true)
  @override
  _$$OkCopyWith<Model, _$Ok<Model>> get copyWith =>
      __$$OkCopyWithImpl<Model, _$Ok<Model>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Model data) ok,
    required TResult Function(String message) invalidParameters,
    required TResult Function(String message) noAuth,
    required TResult Function(String message) noAccess,
    required TResult Function(String message) badRequest,
    required TResult Function(String message) notFound,
    required TResult Function(String message) conflict,
    required TResult Function(String message) noData,
  }) {
    return ok(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(Model data)? ok,
    TResult Function(String message)? invalidParameters,
    TResult Function(String message)? noAuth,
    TResult Function(String message)? noAccess,
    TResult Function(String message)? badRequest,
    TResult Function(String message)? notFound,
    TResult Function(String message)? conflict,
    TResult Function(String message)? noData,
  }) {
    return ok?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Model data)? ok,
    TResult Function(String message)? invalidParameters,
    TResult Function(String message)? noAuth,
    TResult Function(String message)? noAccess,
    TResult Function(String message)? badRequest,
    TResult Function(String message)? notFound,
    TResult Function(String message)? conflict,
    TResult Function(String message)? noData,
    required TResult orElse(),
  }) {
    if (ok != null) {
      return ok(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Ok<Model> value) ok,
    required TResult Function(InvalidParameters<Model> value) invalidParameters,
    required TResult Function(NoAuth<Model> value) noAuth,
    required TResult Function(NoAccess<Model> value) noAccess,
    required TResult Function(BadRequest<Model> value) badRequest,
    required TResult Function(NotFound<Model> value) notFound,
    required TResult Function(Conflict<Model> value) conflict,
    required TResult Function(NoData<Model> value) noData,
  }) {
    return ok(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Ok<Model> value)? ok,
    TResult Function(InvalidParameters<Model> value)? invalidParameters,
    TResult Function(NoAuth<Model> value)? noAuth,
    TResult Function(NoAccess<Model> value)? noAccess,
    TResult Function(BadRequest<Model> value)? badRequest,
    TResult Function(NotFound<Model> value)? notFound,
    TResult Function(Conflict<Model> value)? conflict,
    TResult Function(NoData<Model> value)? noData,
  }) {
    return ok?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Ok<Model> value)? ok,
    TResult Function(InvalidParameters<Model> value)? invalidParameters,
    TResult Function(NoAuth<Model> value)? noAuth,
    TResult Function(NoAccess<Model> value)? noAccess,
    TResult Function(BadRequest<Model> value)? badRequest,
    TResult Function(NotFound<Model> value)? notFound,
    TResult Function(Conflict<Model> value)? conflict,
    TResult Function(NoData<Model> value)? noData,
    required TResult orElse(),
  }) {
    if (ok != null) {
      return ok(this);
    }
    return orElse();
  }
}

abstract class Ok<Model> implements NetworkResponse<Model> {
  const factory Ok(final Model data) = _$Ok<Model>;

  Model get data => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$OkCopyWith<Model, _$Ok<Model>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$InvalidParametersCopyWith<Model, $Res> {
  factory _$$InvalidParametersCopyWith(_$InvalidParameters<Model> value,
          $Res Function(_$InvalidParameters<Model>) then) =
      __$$InvalidParametersCopyWithImpl<Model, $Res>;
  $Res call({String message});
}

/// @nodoc
class __$$InvalidParametersCopyWithImpl<Model, $Res>
    extends _$NetworkResponseCopyWithImpl<Model, $Res>
    implements _$$InvalidParametersCopyWith<Model, $Res> {
  __$$InvalidParametersCopyWithImpl(_$InvalidParameters<Model> _value,
      $Res Function(_$InvalidParameters<Model>) _then)
      : super(_value, (v) => _then(v as _$InvalidParameters<Model>));

  @override
  _$InvalidParameters<Model> get _value =>
      super._value as _$InvalidParameters<Model>;

  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_$InvalidParameters<Model>(
      message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$InvalidParameters<Model> implements InvalidParameters<Model> {
  const _$InvalidParameters(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'NetworkResponse<$Model>.invalidParameters(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InvalidParameters<Model> &&
            const DeepCollectionEquality().equals(other.message, message));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(message));

  @JsonKey(ignore: true)
  @override
  _$$InvalidParametersCopyWith<Model, _$InvalidParameters<Model>>
      get copyWith =>
          __$$InvalidParametersCopyWithImpl<Model, _$InvalidParameters<Model>>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Model data) ok,
    required TResult Function(String message) invalidParameters,
    required TResult Function(String message) noAuth,
    required TResult Function(String message) noAccess,
    required TResult Function(String message) badRequest,
    required TResult Function(String message) notFound,
    required TResult Function(String message) conflict,
    required TResult Function(String message) noData,
  }) {
    return invalidParameters(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(Model data)? ok,
    TResult Function(String message)? invalidParameters,
    TResult Function(String message)? noAuth,
    TResult Function(String message)? noAccess,
    TResult Function(String message)? badRequest,
    TResult Function(String message)? notFound,
    TResult Function(String message)? conflict,
    TResult Function(String message)? noData,
  }) {
    return invalidParameters?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Model data)? ok,
    TResult Function(String message)? invalidParameters,
    TResult Function(String message)? noAuth,
    TResult Function(String message)? noAccess,
    TResult Function(String message)? badRequest,
    TResult Function(String message)? notFound,
    TResult Function(String message)? conflict,
    TResult Function(String message)? noData,
    required TResult orElse(),
  }) {
    if (invalidParameters != null) {
      return invalidParameters(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Ok<Model> value) ok,
    required TResult Function(InvalidParameters<Model> value) invalidParameters,
    required TResult Function(NoAuth<Model> value) noAuth,
    required TResult Function(NoAccess<Model> value) noAccess,
    required TResult Function(BadRequest<Model> value) badRequest,
    required TResult Function(NotFound<Model> value) notFound,
    required TResult Function(Conflict<Model> value) conflict,
    required TResult Function(NoData<Model> value) noData,
  }) {
    return invalidParameters(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Ok<Model> value)? ok,
    TResult Function(InvalidParameters<Model> value)? invalidParameters,
    TResult Function(NoAuth<Model> value)? noAuth,
    TResult Function(NoAccess<Model> value)? noAccess,
    TResult Function(BadRequest<Model> value)? badRequest,
    TResult Function(NotFound<Model> value)? notFound,
    TResult Function(Conflict<Model> value)? conflict,
    TResult Function(NoData<Model> value)? noData,
  }) {
    return invalidParameters?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Ok<Model> value)? ok,
    TResult Function(InvalidParameters<Model> value)? invalidParameters,
    TResult Function(NoAuth<Model> value)? noAuth,
    TResult Function(NoAccess<Model> value)? noAccess,
    TResult Function(BadRequest<Model> value)? badRequest,
    TResult Function(NotFound<Model> value)? notFound,
    TResult Function(Conflict<Model> value)? conflict,
    TResult Function(NoData<Model> value)? noData,
    required TResult orElse(),
  }) {
    if (invalidParameters != null) {
      return invalidParameters(this);
    }
    return orElse();
  }
}

abstract class InvalidParameters<Model> implements NetworkResponse<Model> {
  const factory InvalidParameters(final String message) =
      _$InvalidParameters<Model>;

  String get message => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$InvalidParametersCopyWith<Model, _$InvalidParameters<Model>>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$NoAuthCopyWith<Model, $Res> {
  factory _$$NoAuthCopyWith(
          _$NoAuth<Model> value, $Res Function(_$NoAuth<Model>) then) =
      __$$NoAuthCopyWithImpl<Model, $Res>;
  $Res call({String message});
}

/// @nodoc
class __$$NoAuthCopyWithImpl<Model, $Res>
    extends _$NetworkResponseCopyWithImpl<Model, $Res>
    implements _$$NoAuthCopyWith<Model, $Res> {
  __$$NoAuthCopyWithImpl(
      _$NoAuth<Model> _value, $Res Function(_$NoAuth<Model>) _then)
      : super(_value, (v) => _then(v as _$NoAuth<Model>));

  @override
  _$NoAuth<Model> get _value => super._value as _$NoAuth<Model>;

  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_$NoAuth<Model>(
      message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$NoAuth<Model> implements NoAuth<Model> {
  const _$NoAuth(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'NetworkResponse<$Model>.noAuth(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NoAuth<Model> &&
            const DeepCollectionEquality().equals(other.message, message));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(message));

  @JsonKey(ignore: true)
  @override
  _$$NoAuthCopyWith<Model, _$NoAuth<Model>> get copyWith =>
      __$$NoAuthCopyWithImpl<Model, _$NoAuth<Model>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Model data) ok,
    required TResult Function(String message) invalidParameters,
    required TResult Function(String message) noAuth,
    required TResult Function(String message) noAccess,
    required TResult Function(String message) badRequest,
    required TResult Function(String message) notFound,
    required TResult Function(String message) conflict,
    required TResult Function(String message) noData,
  }) {
    return noAuth(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(Model data)? ok,
    TResult Function(String message)? invalidParameters,
    TResult Function(String message)? noAuth,
    TResult Function(String message)? noAccess,
    TResult Function(String message)? badRequest,
    TResult Function(String message)? notFound,
    TResult Function(String message)? conflict,
    TResult Function(String message)? noData,
  }) {
    return noAuth?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Model data)? ok,
    TResult Function(String message)? invalidParameters,
    TResult Function(String message)? noAuth,
    TResult Function(String message)? noAccess,
    TResult Function(String message)? badRequest,
    TResult Function(String message)? notFound,
    TResult Function(String message)? conflict,
    TResult Function(String message)? noData,
    required TResult orElse(),
  }) {
    if (noAuth != null) {
      return noAuth(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Ok<Model> value) ok,
    required TResult Function(InvalidParameters<Model> value) invalidParameters,
    required TResult Function(NoAuth<Model> value) noAuth,
    required TResult Function(NoAccess<Model> value) noAccess,
    required TResult Function(BadRequest<Model> value) badRequest,
    required TResult Function(NotFound<Model> value) notFound,
    required TResult Function(Conflict<Model> value) conflict,
    required TResult Function(NoData<Model> value) noData,
  }) {
    return noAuth(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Ok<Model> value)? ok,
    TResult Function(InvalidParameters<Model> value)? invalidParameters,
    TResult Function(NoAuth<Model> value)? noAuth,
    TResult Function(NoAccess<Model> value)? noAccess,
    TResult Function(BadRequest<Model> value)? badRequest,
    TResult Function(NotFound<Model> value)? notFound,
    TResult Function(Conflict<Model> value)? conflict,
    TResult Function(NoData<Model> value)? noData,
  }) {
    return noAuth?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Ok<Model> value)? ok,
    TResult Function(InvalidParameters<Model> value)? invalidParameters,
    TResult Function(NoAuth<Model> value)? noAuth,
    TResult Function(NoAccess<Model> value)? noAccess,
    TResult Function(BadRequest<Model> value)? badRequest,
    TResult Function(NotFound<Model> value)? notFound,
    TResult Function(Conflict<Model> value)? conflict,
    TResult Function(NoData<Model> value)? noData,
    required TResult orElse(),
  }) {
    if (noAuth != null) {
      return noAuth(this);
    }
    return orElse();
  }
}

abstract class NoAuth<Model> implements NetworkResponse<Model> {
  const factory NoAuth(final String message) = _$NoAuth<Model>;

  String get message => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$NoAuthCopyWith<Model, _$NoAuth<Model>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$NoAccessCopyWith<Model, $Res> {
  factory _$$NoAccessCopyWith(
          _$NoAccess<Model> value, $Res Function(_$NoAccess<Model>) then) =
      __$$NoAccessCopyWithImpl<Model, $Res>;
  $Res call({String message});
}

/// @nodoc
class __$$NoAccessCopyWithImpl<Model, $Res>
    extends _$NetworkResponseCopyWithImpl<Model, $Res>
    implements _$$NoAccessCopyWith<Model, $Res> {
  __$$NoAccessCopyWithImpl(
      _$NoAccess<Model> _value, $Res Function(_$NoAccess<Model>) _then)
      : super(_value, (v) => _then(v as _$NoAccess<Model>));

  @override
  _$NoAccess<Model> get _value => super._value as _$NoAccess<Model>;

  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_$NoAccess<Model>(
      message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$NoAccess<Model> implements NoAccess<Model> {
  const _$NoAccess(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'NetworkResponse<$Model>.noAccess(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NoAccess<Model> &&
            const DeepCollectionEquality().equals(other.message, message));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(message));

  @JsonKey(ignore: true)
  @override
  _$$NoAccessCopyWith<Model, _$NoAccess<Model>> get copyWith =>
      __$$NoAccessCopyWithImpl<Model, _$NoAccess<Model>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Model data) ok,
    required TResult Function(String message) invalidParameters,
    required TResult Function(String message) noAuth,
    required TResult Function(String message) noAccess,
    required TResult Function(String message) badRequest,
    required TResult Function(String message) notFound,
    required TResult Function(String message) conflict,
    required TResult Function(String message) noData,
  }) {
    return noAccess(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(Model data)? ok,
    TResult Function(String message)? invalidParameters,
    TResult Function(String message)? noAuth,
    TResult Function(String message)? noAccess,
    TResult Function(String message)? badRequest,
    TResult Function(String message)? notFound,
    TResult Function(String message)? conflict,
    TResult Function(String message)? noData,
  }) {
    return noAccess?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Model data)? ok,
    TResult Function(String message)? invalidParameters,
    TResult Function(String message)? noAuth,
    TResult Function(String message)? noAccess,
    TResult Function(String message)? badRequest,
    TResult Function(String message)? notFound,
    TResult Function(String message)? conflict,
    TResult Function(String message)? noData,
    required TResult orElse(),
  }) {
    if (noAccess != null) {
      return noAccess(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Ok<Model> value) ok,
    required TResult Function(InvalidParameters<Model> value) invalidParameters,
    required TResult Function(NoAuth<Model> value) noAuth,
    required TResult Function(NoAccess<Model> value) noAccess,
    required TResult Function(BadRequest<Model> value) badRequest,
    required TResult Function(NotFound<Model> value) notFound,
    required TResult Function(Conflict<Model> value) conflict,
    required TResult Function(NoData<Model> value) noData,
  }) {
    return noAccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Ok<Model> value)? ok,
    TResult Function(InvalidParameters<Model> value)? invalidParameters,
    TResult Function(NoAuth<Model> value)? noAuth,
    TResult Function(NoAccess<Model> value)? noAccess,
    TResult Function(BadRequest<Model> value)? badRequest,
    TResult Function(NotFound<Model> value)? notFound,
    TResult Function(Conflict<Model> value)? conflict,
    TResult Function(NoData<Model> value)? noData,
  }) {
    return noAccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Ok<Model> value)? ok,
    TResult Function(InvalidParameters<Model> value)? invalidParameters,
    TResult Function(NoAuth<Model> value)? noAuth,
    TResult Function(NoAccess<Model> value)? noAccess,
    TResult Function(BadRequest<Model> value)? badRequest,
    TResult Function(NotFound<Model> value)? notFound,
    TResult Function(Conflict<Model> value)? conflict,
    TResult Function(NoData<Model> value)? noData,
    required TResult orElse(),
  }) {
    if (noAccess != null) {
      return noAccess(this);
    }
    return orElse();
  }
}

abstract class NoAccess<Model> implements NetworkResponse<Model> {
  const factory NoAccess(final String message) = _$NoAccess<Model>;

  String get message => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$NoAccessCopyWith<Model, _$NoAccess<Model>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$BadRequestCopyWith<Model, $Res> {
  factory _$$BadRequestCopyWith(
          _$BadRequest<Model> value, $Res Function(_$BadRequest<Model>) then) =
      __$$BadRequestCopyWithImpl<Model, $Res>;
  $Res call({String message});
}

/// @nodoc
class __$$BadRequestCopyWithImpl<Model, $Res>
    extends _$NetworkResponseCopyWithImpl<Model, $Res>
    implements _$$BadRequestCopyWith<Model, $Res> {
  __$$BadRequestCopyWithImpl(
      _$BadRequest<Model> _value, $Res Function(_$BadRequest<Model>) _then)
      : super(_value, (v) => _then(v as _$BadRequest<Model>));

  @override
  _$BadRequest<Model> get _value => super._value as _$BadRequest<Model>;

  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_$BadRequest<Model>(
      message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$BadRequest<Model> implements BadRequest<Model> {
  const _$BadRequest(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'NetworkResponse<$Model>.badRequest(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BadRequest<Model> &&
            const DeepCollectionEquality().equals(other.message, message));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(message));

  @JsonKey(ignore: true)
  @override
  _$$BadRequestCopyWith<Model, _$BadRequest<Model>> get copyWith =>
      __$$BadRequestCopyWithImpl<Model, _$BadRequest<Model>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Model data) ok,
    required TResult Function(String message) invalidParameters,
    required TResult Function(String message) noAuth,
    required TResult Function(String message) noAccess,
    required TResult Function(String message) badRequest,
    required TResult Function(String message) notFound,
    required TResult Function(String message) conflict,
    required TResult Function(String message) noData,
  }) {
    return badRequest(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(Model data)? ok,
    TResult Function(String message)? invalidParameters,
    TResult Function(String message)? noAuth,
    TResult Function(String message)? noAccess,
    TResult Function(String message)? badRequest,
    TResult Function(String message)? notFound,
    TResult Function(String message)? conflict,
    TResult Function(String message)? noData,
  }) {
    return badRequest?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Model data)? ok,
    TResult Function(String message)? invalidParameters,
    TResult Function(String message)? noAuth,
    TResult Function(String message)? noAccess,
    TResult Function(String message)? badRequest,
    TResult Function(String message)? notFound,
    TResult Function(String message)? conflict,
    TResult Function(String message)? noData,
    required TResult orElse(),
  }) {
    if (badRequest != null) {
      return badRequest(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Ok<Model> value) ok,
    required TResult Function(InvalidParameters<Model> value) invalidParameters,
    required TResult Function(NoAuth<Model> value) noAuth,
    required TResult Function(NoAccess<Model> value) noAccess,
    required TResult Function(BadRequest<Model> value) badRequest,
    required TResult Function(NotFound<Model> value) notFound,
    required TResult Function(Conflict<Model> value) conflict,
    required TResult Function(NoData<Model> value) noData,
  }) {
    return badRequest(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Ok<Model> value)? ok,
    TResult Function(InvalidParameters<Model> value)? invalidParameters,
    TResult Function(NoAuth<Model> value)? noAuth,
    TResult Function(NoAccess<Model> value)? noAccess,
    TResult Function(BadRequest<Model> value)? badRequest,
    TResult Function(NotFound<Model> value)? notFound,
    TResult Function(Conflict<Model> value)? conflict,
    TResult Function(NoData<Model> value)? noData,
  }) {
    return badRequest?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Ok<Model> value)? ok,
    TResult Function(InvalidParameters<Model> value)? invalidParameters,
    TResult Function(NoAuth<Model> value)? noAuth,
    TResult Function(NoAccess<Model> value)? noAccess,
    TResult Function(BadRequest<Model> value)? badRequest,
    TResult Function(NotFound<Model> value)? notFound,
    TResult Function(Conflict<Model> value)? conflict,
    TResult Function(NoData<Model> value)? noData,
    required TResult orElse(),
  }) {
    if (badRequest != null) {
      return badRequest(this);
    }
    return orElse();
  }
}

abstract class BadRequest<Model> implements NetworkResponse<Model> {
  const factory BadRequest(final String message) = _$BadRequest<Model>;

  String get message => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$BadRequestCopyWith<Model, _$BadRequest<Model>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$NotFoundCopyWith<Model, $Res> {
  factory _$$NotFoundCopyWith(
          _$NotFound<Model> value, $Res Function(_$NotFound<Model>) then) =
      __$$NotFoundCopyWithImpl<Model, $Res>;
  $Res call({String message});
}

/// @nodoc
class __$$NotFoundCopyWithImpl<Model, $Res>
    extends _$NetworkResponseCopyWithImpl<Model, $Res>
    implements _$$NotFoundCopyWith<Model, $Res> {
  __$$NotFoundCopyWithImpl(
      _$NotFound<Model> _value, $Res Function(_$NotFound<Model>) _then)
      : super(_value, (v) => _then(v as _$NotFound<Model>));

  @override
  _$NotFound<Model> get _value => super._value as _$NotFound<Model>;

  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_$NotFound<Model>(
      message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$NotFound<Model> implements NotFound<Model> {
  const _$NotFound(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'NetworkResponse<$Model>.notFound(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NotFound<Model> &&
            const DeepCollectionEquality().equals(other.message, message));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(message));

  @JsonKey(ignore: true)
  @override
  _$$NotFoundCopyWith<Model, _$NotFound<Model>> get copyWith =>
      __$$NotFoundCopyWithImpl<Model, _$NotFound<Model>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Model data) ok,
    required TResult Function(String message) invalidParameters,
    required TResult Function(String message) noAuth,
    required TResult Function(String message) noAccess,
    required TResult Function(String message) badRequest,
    required TResult Function(String message) notFound,
    required TResult Function(String message) conflict,
    required TResult Function(String message) noData,
  }) {
    return notFound(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(Model data)? ok,
    TResult Function(String message)? invalidParameters,
    TResult Function(String message)? noAuth,
    TResult Function(String message)? noAccess,
    TResult Function(String message)? badRequest,
    TResult Function(String message)? notFound,
    TResult Function(String message)? conflict,
    TResult Function(String message)? noData,
  }) {
    return notFound?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Model data)? ok,
    TResult Function(String message)? invalidParameters,
    TResult Function(String message)? noAuth,
    TResult Function(String message)? noAccess,
    TResult Function(String message)? badRequest,
    TResult Function(String message)? notFound,
    TResult Function(String message)? conflict,
    TResult Function(String message)? noData,
    required TResult orElse(),
  }) {
    if (notFound != null) {
      return notFound(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Ok<Model> value) ok,
    required TResult Function(InvalidParameters<Model> value) invalidParameters,
    required TResult Function(NoAuth<Model> value) noAuth,
    required TResult Function(NoAccess<Model> value) noAccess,
    required TResult Function(BadRequest<Model> value) badRequest,
    required TResult Function(NotFound<Model> value) notFound,
    required TResult Function(Conflict<Model> value) conflict,
    required TResult Function(NoData<Model> value) noData,
  }) {
    return notFound(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Ok<Model> value)? ok,
    TResult Function(InvalidParameters<Model> value)? invalidParameters,
    TResult Function(NoAuth<Model> value)? noAuth,
    TResult Function(NoAccess<Model> value)? noAccess,
    TResult Function(BadRequest<Model> value)? badRequest,
    TResult Function(NotFound<Model> value)? notFound,
    TResult Function(Conflict<Model> value)? conflict,
    TResult Function(NoData<Model> value)? noData,
  }) {
    return notFound?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Ok<Model> value)? ok,
    TResult Function(InvalidParameters<Model> value)? invalidParameters,
    TResult Function(NoAuth<Model> value)? noAuth,
    TResult Function(NoAccess<Model> value)? noAccess,
    TResult Function(BadRequest<Model> value)? badRequest,
    TResult Function(NotFound<Model> value)? notFound,
    TResult Function(Conflict<Model> value)? conflict,
    TResult Function(NoData<Model> value)? noData,
    required TResult orElse(),
  }) {
    if (notFound != null) {
      return notFound(this);
    }
    return orElse();
  }
}

abstract class NotFound<Model> implements NetworkResponse<Model> {
  const factory NotFound(final String message) = _$NotFound<Model>;

  String get message => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$NotFoundCopyWith<Model, _$NotFound<Model>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ConflictCopyWith<Model, $Res> {
  factory _$$ConflictCopyWith(
          _$Conflict<Model> value, $Res Function(_$Conflict<Model>) then) =
      __$$ConflictCopyWithImpl<Model, $Res>;
  $Res call({String message});
}

/// @nodoc
class __$$ConflictCopyWithImpl<Model, $Res>
    extends _$NetworkResponseCopyWithImpl<Model, $Res>
    implements _$$ConflictCopyWith<Model, $Res> {
  __$$ConflictCopyWithImpl(
      _$Conflict<Model> _value, $Res Function(_$Conflict<Model>) _then)
      : super(_value, (v) => _then(v as _$Conflict<Model>));

  @override
  _$Conflict<Model> get _value => super._value as _$Conflict<Model>;

  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_$Conflict<Model>(
      message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$Conflict<Model> implements Conflict<Model> {
  const _$Conflict(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'NetworkResponse<$Model>.conflict(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Conflict<Model> &&
            const DeepCollectionEquality().equals(other.message, message));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(message));

  @JsonKey(ignore: true)
  @override
  _$$ConflictCopyWith<Model, _$Conflict<Model>> get copyWith =>
      __$$ConflictCopyWithImpl<Model, _$Conflict<Model>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Model data) ok,
    required TResult Function(String message) invalidParameters,
    required TResult Function(String message) noAuth,
    required TResult Function(String message) noAccess,
    required TResult Function(String message) badRequest,
    required TResult Function(String message) notFound,
    required TResult Function(String message) conflict,
    required TResult Function(String message) noData,
  }) {
    return conflict(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(Model data)? ok,
    TResult Function(String message)? invalidParameters,
    TResult Function(String message)? noAuth,
    TResult Function(String message)? noAccess,
    TResult Function(String message)? badRequest,
    TResult Function(String message)? notFound,
    TResult Function(String message)? conflict,
    TResult Function(String message)? noData,
  }) {
    return conflict?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Model data)? ok,
    TResult Function(String message)? invalidParameters,
    TResult Function(String message)? noAuth,
    TResult Function(String message)? noAccess,
    TResult Function(String message)? badRequest,
    TResult Function(String message)? notFound,
    TResult Function(String message)? conflict,
    TResult Function(String message)? noData,
    required TResult orElse(),
  }) {
    if (conflict != null) {
      return conflict(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Ok<Model> value) ok,
    required TResult Function(InvalidParameters<Model> value) invalidParameters,
    required TResult Function(NoAuth<Model> value) noAuth,
    required TResult Function(NoAccess<Model> value) noAccess,
    required TResult Function(BadRequest<Model> value) badRequest,
    required TResult Function(NotFound<Model> value) notFound,
    required TResult Function(Conflict<Model> value) conflict,
    required TResult Function(NoData<Model> value) noData,
  }) {
    return conflict(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Ok<Model> value)? ok,
    TResult Function(InvalidParameters<Model> value)? invalidParameters,
    TResult Function(NoAuth<Model> value)? noAuth,
    TResult Function(NoAccess<Model> value)? noAccess,
    TResult Function(BadRequest<Model> value)? badRequest,
    TResult Function(NotFound<Model> value)? notFound,
    TResult Function(Conflict<Model> value)? conflict,
    TResult Function(NoData<Model> value)? noData,
  }) {
    return conflict?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Ok<Model> value)? ok,
    TResult Function(InvalidParameters<Model> value)? invalidParameters,
    TResult Function(NoAuth<Model> value)? noAuth,
    TResult Function(NoAccess<Model> value)? noAccess,
    TResult Function(BadRequest<Model> value)? badRequest,
    TResult Function(NotFound<Model> value)? notFound,
    TResult Function(Conflict<Model> value)? conflict,
    TResult Function(NoData<Model> value)? noData,
    required TResult orElse(),
  }) {
    if (conflict != null) {
      return conflict(this);
    }
    return orElse();
  }
}

abstract class Conflict<Model> implements NetworkResponse<Model> {
  const factory Conflict(final String message) = _$Conflict<Model>;

  String get message => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$ConflictCopyWith<Model, _$Conflict<Model>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$NoDataCopyWith<Model, $Res> {
  factory _$$NoDataCopyWith(
          _$NoData<Model> value, $Res Function(_$NoData<Model>) then) =
      __$$NoDataCopyWithImpl<Model, $Res>;
  $Res call({String message});
}

/// @nodoc
class __$$NoDataCopyWithImpl<Model, $Res>
    extends _$NetworkResponseCopyWithImpl<Model, $Res>
    implements _$$NoDataCopyWith<Model, $Res> {
  __$$NoDataCopyWithImpl(
      _$NoData<Model> _value, $Res Function(_$NoData<Model>) _then)
      : super(_value, (v) => _then(v as _$NoData<Model>));

  @override
  _$NoData<Model> get _value => super._value as _$NoData<Model>;

  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_$NoData<Model>(
      message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$NoData<Model> implements NoData<Model> {
  const _$NoData(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'NetworkResponse<$Model>.noData(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NoData<Model> &&
            const DeepCollectionEquality().equals(other.message, message));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(message));

  @JsonKey(ignore: true)
  @override
  _$$NoDataCopyWith<Model, _$NoData<Model>> get copyWith =>
      __$$NoDataCopyWithImpl<Model, _$NoData<Model>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Model data) ok,
    required TResult Function(String message) invalidParameters,
    required TResult Function(String message) noAuth,
    required TResult Function(String message) noAccess,
    required TResult Function(String message) badRequest,
    required TResult Function(String message) notFound,
    required TResult Function(String message) conflict,
    required TResult Function(String message) noData,
  }) {
    return noData(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(Model data)? ok,
    TResult Function(String message)? invalidParameters,
    TResult Function(String message)? noAuth,
    TResult Function(String message)? noAccess,
    TResult Function(String message)? badRequest,
    TResult Function(String message)? notFound,
    TResult Function(String message)? conflict,
    TResult Function(String message)? noData,
  }) {
    return noData?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Model data)? ok,
    TResult Function(String message)? invalidParameters,
    TResult Function(String message)? noAuth,
    TResult Function(String message)? noAccess,
    TResult Function(String message)? badRequest,
    TResult Function(String message)? notFound,
    TResult Function(String message)? conflict,
    TResult Function(String message)? noData,
    required TResult orElse(),
  }) {
    if (noData != null) {
      return noData(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Ok<Model> value) ok,
    required TResult Function(InvalidParameters<Model> value) invalidParameters,
    required TResult Function(NoAuth<Model> value) noAuth,
    required TResult Function(NoAccess<Model> value) noAccess,
    required TResult Function(BadRequest<Model> value) badRequest,
    required TResult Function(NotFound<Model> value) notFound,
    required TResult Function(Conflict<Model> value) conflict,
    required TResult Function(NoData<Model> value) noData,
  }) {
    return noData(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Ok<Model> value)? ok,
    TResult Function(InvalidParameters<Model> value)? invalidParameters,
    TResult Function(NoAuth<Model> value)? noAuth,
    TResult Function(NoAccess<Model> value)? noAccess,
    TResult Function(BadRequest<Model> value)? badRequest,
    TResult Function(NotFound<Model> value)? notFound,
    TResult Function(Conflict<Model> value)? conflict,
    TResult Function(NoData<Model> value)? noData,
  }) {
    return noData?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Ok<Model> value)? ok,
    TResult Function(InvalidParameters<Model> value)? invalidParameters,
    TResult Function(NoAuth<Model> value)? noAuth,
    TResult Function(NoAccess<Model> value)? noAccess,
    TResult Function(BadRequest<Model> value)? badRequest,
    TResult Function(NotFound<Model> value)? notFound,
    TResult Function(Conflict<Model> value)? conflict,
    TResult Function(NoData<Model> value)? noData,
    required TResult orElse(),
  }) {
    if (noData != null) {
      return noData(this);
    }
    return orElse();
  }
}

abstract class NoData<Model> implements NetworkResponse<Model> {
  const factory NoData(final String message) = _$NoData<Model>;

  String get message => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$NoDataCopyWith<Model, _$NoData<Model>> get copyWith =>
      throw _privateConstructorUsedError;
}
