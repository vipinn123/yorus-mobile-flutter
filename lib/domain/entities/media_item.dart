// lib/domain/entities/media_item.dart
import 'package:freezed_annotation/freezed_annotation.dart';

part 'media_item.freezed.dart';
part 'media_item.g.dart';

enum MediaType { movie, book, music, tv }

@freezed
class MediaItem with _$MediaItem {
  const factory MediaItem({
    required String id,
    required String title,
    required String subtitle,
    required String imageUrl,
    required MediaType mediaType,
    required String whyYoullLikeIt,
  }) = _MediaItem;

  factory MediaItem.fromJson(Map<String, dynamic> json) => _$MediaItemFromJson(json);
}
