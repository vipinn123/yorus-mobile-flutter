// lib/features/search/presentation/view_models/search_view_model.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yorus_mobile/domain/entities/media_item.dart';
import 'package:yorus_mobile/features/search/domain/repositories/search_repository.dart';
import 'package:yorus_mobile/features/search/data/repositories/mock_search_repository.dart';

final searchRepositoryProvider = Provider<SearchRepository>((ref) => MockSearchRepository());

class SearchViewModel extends StateNotifier<AsyncValue<List<MediaItem>>> {
  final SearchRepository _repository;

  SearchViewModel(this._repository) : super(const AsyncValue.data([]));

  Future<void> search(String query) async {
    state = const AsyncValue.loading();
    try {
      final results = await _repository.search(query);
      state = AsyncValue.data(results);
    } catch (e, s) {
      state = AsyncValue.error(e, s);
    }
  }
}

final searchViewModelProvider = StateNotifierProvider<SearchViewModel, AsyncValue<List<MediaItem>>>((ref) {
  final repository = ref.watch(searchRepositoryProvider);
  return SearchViewModel(repository);
});
