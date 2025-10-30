// lib/features/home/presentation/view_models/home_view_model.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:yorus_mobile/domain/entities/media_item.dart';
import 'package:yorus_mobile/domain/repositories/media_repository.dart';
import 'package:yorus_mobile/data/repositories/mock_media_repository.dart';
import 'package:yorus_mobile/features/queue/presentation/view_models/queue_view_model.dart';

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
  final QueueViewModel _queueViewModel;

  HomeViewModel(this._repository, this._queueViewModel) : super(const HomeState()) {
    fetchRecommendations();
  }

  Future<void> fetchRecommendations() async {
    state = state.copyWith(isLoading: true);
    final recommendations = await _repository.getRecommendations();
    state = state.copyWith(recommendations: recommendations, isLoading: false);
  }

  void nextRecommendation() {
    final currentRecommendations = List<MediaItem>.from(state.recommendations);
    if (currentRecommendations.isNotEmpty) {
      currentRecommendations.removeAt(0);
      state = state.copyWith(recommendations: currentRecommendations);
    }
  }

  void addToQueue() {
    if (state.recommendations.isNotEmpty) {
      _queueViewModel.addToQueue(state.recommendations.first);
      nextRecommendation();
    }
  }

  void setFilter(String filter) {
    state = state.copyWith(selectedFilter: filter);
    // In the future, this would also trigger a new fetch
  }
}

final homeViewModelProvider = StateNotifierProvider<HomeViewModel, HomeState>((ref) {
  final repository = ref.watch(mediaRepositoryProvider);
  final queueViewModel = ref.watch(queueViewModelProvider.notifier);
  return HomeViewModel(repository, queueViewModel);
});