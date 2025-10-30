// lib/features/home/presentation/screens/home_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yorus_mobile/features/home/presentation/view_models/home_view_model.dart';
import 'package:yorus_mobile/features/home/presentation/widgets/home_action_buttons.dart';
import 'package:yorus_mobile/features/home/presentation/widgets/mood_filter_bar.dart';
import 'package:yorus_mobile/features/home/presentation/widgets/recommendation_card.dart';
import 'package:yorus_mobile/services/google_sign_in_service.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(homeViewModelProvider);
    final viewModel = ref.read(homeViewModelProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Yorus Home'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () => ref.read(googleSignInServiceProvider).signOutGoogle(),
          ),
        ],
      ),
      body: state.isLoading
          ? const Center(child: CircularProgressIndicator())
          : Column(
              children: [
                MoodFilterBar(
                  filters: const [
                    {'icon': 'assets/icons/icon_home_active.svg', 'label': 'All'},
                    {'icon': 'assets/icons/icon_media_movie.svg', 'label': 'Movies'},
                    {'icon': 'assets/icons/icon_media_tv.svg', 'label': 'Shows'},
                    {'icon': 'assets/icons/icon_media_book.svg', 'label': 'Books'},
                    {'icon': 'assets/icons/icon_media_music.svg', 'label': 'Music'},
                  ],
                  selectedFilter: state.selectedFilter,
                  onFilterSelected: (filter) => viewModel.setFilter(filter),
                ),
                Expanded(
                  child: GestureDetector(
                    onVerticalDragEnd: (details) {
                      if (details.primaryVelocity! > 0) {
                        viewModel.nextRecommendation();
                      }
                    },
                    child: state.recommendations.isNotEmpty
                        ? RecommendationCard(item: state.recommendations.first)
                        : const Center(child: Text('No recommendations available.')),
                  ),
                ),
                if (state.recommendations.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: HomeActionButtons(
                      onAddToQueue: () => viewModel.addToQueue(),
                      onSeenIt: () {},
                      onNotForMe: () => viewModel.nextRecommendation(),
                    ),
                  ),
              ],
            ),
    );
  }
}