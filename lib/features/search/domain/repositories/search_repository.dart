// lib/features/search/domain/repositories/search_repository.dart
import 'package:yorus_mobile/domain/entities/media_item.dart';

abstract class SearchRepository {
  Future<List<MediaItem>> search(String query);
}
