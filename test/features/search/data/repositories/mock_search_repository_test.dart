// test/features/search/data/repositories/mock_search_repository_test.dart
import 'package:flutter_test/flutter_test.dart';
import 'package:yorus_mobile/features/search/data/repositories/mock_search_repository.dart';
import 'package:yorus_mobile/domain/entities/media_item.dart';

void main() {
  test('MockSearchRepository returns results for a non-empty query', () async {
    final repository = MockSearchRepository();
    final results = await repository.search('test');

    expect(results, isA<List<MediaItem>>());
    expect(results.isNotEmpty, isTrue);
  });

  test('MockSearchRepository returns an empty list for an empty query', () async {
    final repository = MockSearchRepository();
    final results = await repository.search('');

    expect(results, isA<List<MediaItem>>());
    expect(results.isEmpty, isTrue);
  });
}
