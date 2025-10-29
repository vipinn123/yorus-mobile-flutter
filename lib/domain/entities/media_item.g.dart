// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'media_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MediaItemImpl _$$MediaItemImplFromJson(Map<String, dynamic> json) =>
    _$MediaItemImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      subtitle: json['subtitle'] as String,
      imageUrl: json['imageUrl'] as String,
      mediaType: $enumDecode(_$MediaTypeEnumMap, json['mediaType']),
      whyYoullLikeIt: json['whyYoullLikeIt'] as String,
    );

Map<String, dynamic> _$$MediaItemImplToJson(_$MediaItemImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'subtitle': instance.subtitle,
      'imageUrl': instance.imageUrl,
      'mediaType': _$MediaTypeEnumMap[instance.mediaType]!,
      'whyYoullLikeIt': instance.whyYoullLikeIt,
    };

const _$MediaTypeEnumMap = {
  MediaType.movie: 'movie',
  MediaType.book: 'book',
  MediaType.music: 'music',
  MediaType.tv: 'tv',
};
