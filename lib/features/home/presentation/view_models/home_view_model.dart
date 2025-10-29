// lib/features/home/presentation/view_models/home_view_model.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:yorus_mobile/domain/entities/media_item.dart';
import 'package:yorus_mobile/domain/repositories/media_repository.dart';
import 'package:yorus_mobile/data/repositories/mock_media_repository.dart';

part 'home_view_model.freezed.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    @Default([]) List<MediaItem> recommendations,
    @Default(true) bool isLoading,
    @Default('All') String selectedFilter,
  }) = _HomeState;
}

final mediaRepositoryProvider = Provider<MediaRepository>((ref) => MockMediaRepository());

class HomeViewModel extends StateNotifier<HomeState> {
  final MediaRepository _repository;

  HomeViewModel(this._repository) : super(const HomeState()) {
    fetchRecommendations();
  }

  Future<void> fetchRecommendations() async {
    state = state.copyWith(isLoading: true);
    final recommendations = await _repository.getRecommendations();
    state = state.copyWith(recommendations: recommendations, isLoading: false);
  }

  void setFilter(String filter) {
    state = state.copyWith(selectedFilter: filter);
    // In the future, this would also trigger a new fetch
  }
}

final homeViewModelProvider = StateNotifierProvider<HomeViewModel, HomeState>((ref) {
  final repository = ref.watch(mediaRepositoryProvider);
  return HomeViewModel(repository);
});
