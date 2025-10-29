// test/features/home/presentation/widgets/mood_filter_bar_test.dart
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:yorus_mobile/features/home/presentation/widgets/mood_filter_bar.dart';

void main() {
  testWidgets('MoodFilterBar displays filters and handles taps', (WidgetTester tester) async {
    final filters = [
      {'icon': 'assets/icons/icon_home_active.svg', 'label': 'All'},
      {'icon': 'assets/icons/icon_media_movie.svg', 'label': 'Movies'},
      {'icon': 'assets/icons/icon_media_tv.svg', 'label': 'Shows'},
      {'icon': 'assets/icons/icon_media_book.svg', 'label': 'Books'},
      {'icon': 'assets/icons/icon_media_music.svg', 'label': 'Music'},
    ];
    String selectedFilter = 'All';

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: MoodFilterBar(
            filters: filters,
            selectedFilter: selectedFilter,
            onFilterSelected: (filter) {
              selectedFilter = filter;
            },
          ),
        ),
      ),
    );

    // Verify that all filter chips are displayed.
    for (final filter in filters) {
      expect(find.text(filter['label']!), findsOneWidget);
      expect(find.byWidgetPredicate((widget) => widget is SvgPicture && widget.bytesLoader is SvgAssetLoader && (widget.bytesLoader as SvgAssetLoader).assetName == filter['icon']), findsOneWidget);
    }

    // Simulate a tap on the 'Movies' filter.
    await tester.tap(find.text('Movies'));
    await tester.pump();

    // Verify that the callback was called and the selected filter was updated.
    expect(selectedFilter, 'Movies');
  });
}
