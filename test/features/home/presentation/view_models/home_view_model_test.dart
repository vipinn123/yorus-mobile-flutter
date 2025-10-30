// test/features/home/presentation/view_models/home_view_model_test.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:yorus_mobile/data/repositories/mock_media_repository.dart';
import 'package:yorus_mobile/features/home/presentation/view_models/home_view_model.dart';

void main() {
  test('HomeViewModel fetches recommendations on initialization', () async {
    final container = ProviderContainer(
      overrides: [
        mediaRepositoryProvider.overrideWithValue(MockMediaRepository()),
      ],
    );

    final viewModel = container.read(homeViewModelProvider.notifier);

    // Give it a moment for the async fetch to complete
    await Future.delayed(const Duration(seconds: 2));

    final state = container.read(homeViewModelProvider);

    expect(state.isLoading, isFalse);
    expect(state.recommendations.isNotEmpty, isTrue);
  });

  test('HomeViewModel sets filter', () {
    final container = ProviderContainer(
      overrides: [
        mediaRepositoryProvider.overrideWithValue(MockMediaRepository()),
      ],
    );

    final viewModel = container.read(homeViewModelProvider.notifier);

    viewModel.setFilter('Movies');

    final state = container.read(homeViewModelProvider);

    expect(state.selectedFilter, 'Movies');
  });
}