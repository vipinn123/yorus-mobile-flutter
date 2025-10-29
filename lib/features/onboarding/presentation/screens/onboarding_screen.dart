import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:yorus_mobile/domain/entities/media_item.dart';
import 'package:yorus_mobile/features/onboarding/presentation/widgets/media_card.dart';
import 'package:yorus_mobile/features/onboarding/presentation/widgets/rating_overlay.dart';

final vibeFinderSamplesProvider = FutureProvider<List<MediaItem>>((ref) async {
  final String response = await rootBundle.loadString('assets/content/samples/vibe_finder_samples.json');
  final data = await json.decode(response) as List;
  return data.map((item) => MediaItem.fromJson(item as Map<String, dynamic>)).toList();
});

class OnboardingScreen extends ConsumerStatefulWidget {
  const OnboardingScreen({super.key});

  @override
  ConsumerState<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends ConsumerState<OnboardingScreen> {
  final CardSwiperController _controller = CardSwiperController();
  int? _tappedCardIndex;
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final samples = ref.watch(vibeFinderSamplesProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Do you like this?'),
        actions: [
          TextButton(
            onPressed: () => context.go('/home'),
            child: const Text('Skip'),
          ),
        ],
      ),
      body: samples.when(
        data: (cards) => Column(
          children: [
            LinearProgressIndicator(value: (_currentIndex) / cards.length),
            Expanded(
              child: CardSwiper(
                controller: _controller,
                cardsCount: cards.length,
                onSwipe: (previousIndex, currentIndex, direction) {
                  setState(() {
                    _currentIndex = (currentIndex ?? 0);
                  });
                  return true;
                },
                onEnd: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('All set! We\'ve found your vibe.')),
                  );
                  context.go('/home');
                },
                cardBuilder: (context, index, percentThresholdX, percentThresholdY) {
                  final card = cards[index];
                  return Stack(
                    children: [
                      MediaCard(title: card.title),
                      if (_tappedCardIndex == index)
                        RatingOverlay(
                          onRatingSelected: (rating) {
                            print('Rated ${card.title} as $rating');
                            setState(() {
                              _tappedCardIndex = null;
                            });
                            _controller.swipeLeft(); // Or right, depending on logic
                          },
                        ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(child: Text('Error: $error')),
      ),
    );
  }
}
