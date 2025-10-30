// lib/features/done/domain/repositories/done_repository.dart
import 'package:yorus_mobile/domain/entities/media_item.dart';

abstract class DoneRepository {
  Future<void> addToDone(MediaItem item);
  Future<List<MediaItem>> getDoneItems();
}
