// lib/features/done/presentation/screens/done_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yorus_mobile/features/done/presentation/view_models/done_view_model.dart';
import 'package:yorus_mobile/features/done/presentation/widgets/done_grid_item.dart';
import 'package:yorus_mobile/features/home/presentation/widgets/mood_filter_bar.dart';

class DoneScreen extends ConsumerWidget {
  const DoneScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final doneItems = ref.watch(doneViewModelProvider);

    return Scaffold(
      body: Column(
        children: [
          MoodFilterBar(
            filters: const [
              {'icon': 'assets/icons/icon_home_active.svg', 'label': 'All'},
              {'icon': 'assets/icons/icon_media_movie.svg', 'label': 'Movies'},
              {'icon': 'assets/icons/icon_media_tv.svg', 'label': 'Shows'},
              {'icon': 'assets/icons/icon_media_book.svg', 'label': 'Books'},
              {'icon': 'assets/icons/icon_media_music.svg', 'label': 'Music'},
            ],
            selectedFilter: 'All', // TODO: Connect to a view model
            onFilterSelected: (filter) {},
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 2 / 3,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
              ),
              itemCount: doneItems.length,
              itemBuilder: (context, index) {
                final item = doneItems[index];
                return DoneGridItem(item: item);
              },
            ),
          ),
        ],
      ),
    );
  }
}
