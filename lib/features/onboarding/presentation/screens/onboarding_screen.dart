// lib/features/onboarding/presentation/screens/onboarding_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:go_router/go_router.dart';
import 'package:yorus_mobile/features/onboarding/presentation/widgets/media_card.dart';
import 'package:yorus_mobile/features/onboarding/presentation/widgets/rating_overlay.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final CardSwiperController _controller = CardSwiperController();
  int? _tappedCardIndex;
  int _currentIndex = 0;

  final cards = [
    const MediaCard(title: 'Movie 1'),
    const MediaCard(title: 'Book 2'),
    const MediaCard(title: 'Music 3'),
    const MediaCard(title: 'Movie 4'),
    const MediaCard(title: 'TV Show 5'),
  ];

  @override
  Widget build(BuildContext context) {
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
      body: Column(
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
                    MediaCard(
                      title: card.title,
                      onTap: () {
                        setState(() {
                          _tappedCardIndex = index;
                        });
                      },
                    ),
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
    );
  }
}
