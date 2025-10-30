// lib/domain/repositories/media_repository.dart
import 'package:yorus_mobile/domain/entities/media_item.dart';

abstract class MediaRepository {
  Future<List<MediaItem>> getRecommendations();
}