import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:yorus_mobile/domain/entities/media_item.dart';
import 'package:yorus_mobile/features/onboarding/presentation/widgets/media_card.dart';
import 'package:yorus_mobile/features/onboarding/presentation/widgets/rating_overlay.dart';

class OnboardingScreen extends ConsumerStatefulWidget {
  const OnboardingScreen({super.key});

  @override
  ConsumerState<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends ConsumerState<OnboardingScreen> {
  final CardSwiperController _controller = CardSwiperController();
  int? _tappedCardIndex;
  int _currentIndex = 0;

  final List<MediaItem> cards = [
    const MediaItem(id: '501', mediaType: MediaType.movie, title: 'Inception', subtitle: '', whyYoullLikeIt: '', imageUrl: 'https://picsum.photos/seed/inception/300/400'),
    const MediaItem(id: '502', mediaType: MediaType.music, title: 'Dark Side of the Moon', subtitle: '', whyYoullLikeIt: '', imageUrl: 'https://picsum.photos/seed/darksidemoon/300/300'),
    const MediaItem(id: '503', mediaType: MediaType.book, title: 'Dune', subtitle: '', whyYoullLikeIt: '', imageUrl: 'https://picsum.photos/seed/dune/300/400'),
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
