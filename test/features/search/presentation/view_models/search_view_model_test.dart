// test/features/search/presentation/view_models/search_view_model_test.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:yorus_mobile/features/search/data/repositories/mock_search_repository.dart';
import 'package:yorus_mobile/domain/entities/media_item.dart';
import 'package:yorus_mobile/features/search/domain/repositories/search_repository.dart';
import 'package:yorus_mobile/features/search/presentation/view_models/search_view_model.dart';

void main() {
  test('SearchViewModel searches and updates state', () async {
    final container = ProviderContainer(
      overrides: [
        searchRepositoryProvider.overrideWithValue(MockSearchRepository()),
      ],
    );

    final viewModel = container.read(searchViewModelProvider.notifier);

    await viewModel.search('test');

    final state = container.read(searchViewModelProvider);

    expect(state, isA<AsyncData<List<MediaItem>>>());
    expect(state.asData!.value.isNotEmpty, isTrue);
  });
}
