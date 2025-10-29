// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'media_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MediaItem _$MediaItemFromJson(Map<String, dynamic> json) {
  return _MediaItem.fromJson(json);
}

/// @nodoc
mixin _$MediaItem {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get subtitle => throw _privateConstructorUsedError;
  String get imageUrl => throw _privateConstructorUsedError;
  MediaType get mediaType => throw _privateConstructorUsedError;
  String get whyYoullLikeIt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MediaItemCopyWith<MediaItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MediaItemCopyWith<$Res> {
  factory $MediaItemCopyWith(MediaItem value, $Res Function(MediaItem) then) =
      _$MediaItemCopyWithImpl<$Res, MediaItem>;
  @useResult
  $Res call(
      {String id,
      String title,
      String subtitle,
      String imageUrl,
      MediaType mediaType,
      String whyYoullLikeIt});
}

/// @nodoc
class _$MediaItemCopyWithImpl<$Res, $Val extends MediaItem>
    implements $MediaItemCopyWith<$Res> {
  _$MediaItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? subtitle = null,
    Object? imageUrl = null,
    Object? mediaType = null,
    Object? whyYoullLikeIt = null,
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
      subtitle: null == subtitle
          ? _value.subtitle
          : subtitle // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      mediaType: null == mediaType
          ? _value.mediaType
          : mediaType // ignore: cast_nullable_to_non_nullable
              as MediaType,
      whyYoullLikeIt: null == whyYoullLikeIt
          ? _value.whyYoullLikeIt
          : whyYoullLikeIt // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MediaItemImplCopyWith<$Res>
    implements $MediaItemCopyWith<$Res> {
  factory _$$MediaItemImplCopyWith(
          _$MediaItemImpl value, $Res Function(_$MediaItemImpl) then) =
      __$$MediaItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String title,
      String subtitle,
      String imageUrl,
      MediaType mediaType,
      String whyYoullLikeIt});
}

/// @nodoc
class __$$MediaItemImplCopyWithImpl<$Res>
    extends _$MediaItemCopyWithImpl<$Res, _$MediaItemImpl>
    implements _$$MediaItemImplCopyWith<$Res> {
  __$$MediaItemImplCopyWithImpl(
      _$MediaItemImpl _value, $Res Function(_$MediaItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? subtitle = null,
    Object? imageUrl = null,
    Object? mediaType = null,
    Object? whyYoullLikeIt = null,
  }) {
    return _then(_$MediaItemImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      subtitle: null == subtitle
          ? _value.subtitle
          : subtitle // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      mediaType: null == mediaType
          ? _value.mediaType
          : mediaType // ignore: cast_nullable_to_non_nullable
              as MediaType,
      whyYoullLikeIt: null == whyYoullLikeIt
          ? _value.whyYoullLikeIt
          : whyYoullLikeIt // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MediaItemImpl implements _MediaItem {
  const _$MediaItemImpl(
      {required this.id,
      required this.title,
      required this.subtitle,
      required this.imageUrl,
      required this.mediaType,
      required this.whyYoullLikeIt});

  factory _$MediaItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$MediaItemImplFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  final String subtitle;
  @override
  final String imageUrl;
  @override
  final MediaType mediaType;
  @override
  final String whyYoullLikeIt;

  @override
  String toString() {
    return 'MediaItem(id: $id, title: $title, subtitle: $subtitle, imageUrl: $imageUrl, mediaType: $mediaType, whyYoullLikeIt: $whyYoullLikeIt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MediaItemImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.subtitle, subtitle) ||
                other.subtitle == subtitle) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.mediaType, mediaType) ||
                other.mediaType == mediaType) &&
            (identical(other.whyYoullLikeIt, whyYoullLikeIt) ||
                other.whyYoullLikeIt == whyYoullLikeIt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, title, subtitle, imageUrl, mediaType, whyYoullLikeIt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MediaItemImplCopyWith<_$MediaItemImpl> get copyWith =>
      __$$MediaItemImplCopyWithImpl<_$MediaItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MediaItemImplToJson(
      this,
    );
  }
}

abstract class _MediaItem implements MediaItem {
  const factory _MediaItem(
      {required final String id,
      required final String title,
      required final String subtitle,
      required final String imageUrl,
      required final MediaType mediaType,
      required final String whyYoullLikeIt}) = _$MediaItemImpl;

  factory _MediaItem.fromJson(Map<String, dynamic> json) =
      _$MediaItemImpl.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  String get subtitle;
  @override
  String get imageUrl;
  @override
  MediaType get mediaType;
  @override
  String get whyYoullLikeIt;
  @override
  @JsonKey(ignore: true)
  _$$MediaItemImplCopyWith<_$MediaItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
