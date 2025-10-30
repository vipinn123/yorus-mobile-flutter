// lib/features/queue/presentation/screens/queue_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yorus_mobile/features/home/presentation/widgets/mood_filter_bar.dart';
import 'package:yorus_mobile/features/queue/presentation/view_models/queue_view_model.dart';
import 'package:yorus_mobile/features/queue/presentation/widgets/media_list_item.dart';

class QueueScreen extends ConsumerWidget {
  const QueueScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final queue = ref.watch(queueViewModelProvider);
    final viewModel = ref.read(queueViewModelProvider.notifier);

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
            child: ListView.builder(
              itemCount: queue.length,
              itemBuilder: (context, index) {
                final item = queue[index];
                return Dismissible(
                  key: Key(item.id),
                  onDismissed: (direction) {
                    viewModel.removeFromQueue(item);
                  },
                  background: Container(color: Colors.red),
                  child: MediaListItem(item: item),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
