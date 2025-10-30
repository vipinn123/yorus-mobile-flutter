// lib/features/done/data/repositories/mock_done_repository.dart
import 'package:yorus_mobile/domain/entities/media_item.dart';
import 'package:yorus_mobile/features/done/domain/repositories/done_repository.dart';

class MockDoneRepository implements DoneRepository {
  final List<MediaItem> _doneItems = [];

  @override
  Future<void> addToDone(MediaItem item) async {
    _doneItems.add(item);
  }

  @override
  Future<List<MediaItem>> getDoneItems() async {
    return _doneItems;
  }
}
