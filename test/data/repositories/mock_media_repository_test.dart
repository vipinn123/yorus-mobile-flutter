// test/data/repositories/mock_media_repository_test.dart
import 'dart:io';
import 'package:flutter_test/flutter_test.dart';
import 'package:yorus_mobile/data/repositories/mock_media_repository.dart';
import 'package:yorus_mobile/domain/entities/media_item.dart';

void main() {
  test('MockMediaRepository returns a list of media items from JSON', () async {
    final file = File('web/assets/content/samples/home_queue_samples.json');
    final jsonString = await file.readAsString();

    final repository = MockMediaRepository(jsonString: jsonString);
    final recommendations = await repository.getRecommendations();

    expect(recommendations, isA<List<MediaItem>>());
    expect(recommendations.isNotEmpty, isTrue);
  });
}
