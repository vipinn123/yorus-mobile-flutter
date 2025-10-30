// lib/features/done/presentation/view_models/done_view_model.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yorus_mobile/domain/entities/media_item.dart';
import 'package:yorus_mobile/features/done/domain/repositories/done_repository.dart';
import 'package:yorus_mobile/features/done/data/repositories/mock_done_repository.dart';

final doneRepositoryProvider = Provider<DoneRepository>((ref) => MockDoneRepository());

class DoneViewModel extends StateNotifier<List<MediaItem>> {
  final DoneRepository _repository;

  DoneViewModel(this._repository) : super([]);

  Future<void> getDoneItems() async {
    state = await _repository.getDoneItems();
  }

  Future<void> addToDone(MediaItem item) async {
    await _repository.addToDone(item);
    await getDoneItems();
  }
}

final doneViewModelProvider = StateNotifierProvider<DoneViewModel, List<MediaItem>>((ref) {
  final repository = ref.watch(doneRepositoryProvider);
  return DoneViewModel(repository);
});
