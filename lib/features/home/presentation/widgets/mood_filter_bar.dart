// lib/features/home/presentation/widgets/mood_filter_bar.dart
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MoodFilterBar extends StatelessWidget {
  final List<Map<String, String>> filters;
  final String selectedFilter;
  final Function(String) onFilterSelected;

  const MoodFilterBar({
    super.key,
    required this.filters,
    required this.selectedFilter,
    required this.onFilterSelected,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 44,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: filters.length,
        separatorBuilder: (context, index) => const SizedBox(width: 8),
        itemBuilder: (context, index) {
          final filter = filters[index];
          final isSelected = filter['label'] == selectedFilter;
          return ActionChip(
            avatar: SvgPicture.asset(filter['icon']!, height: 24, width: 24),
            label: Text(filter['label']!),
            onPressed: () => onFilterSelected(filter['label']!),
            backgroundColor: isSelected ? Colors.blue : Colors.grey[200],
          );
        },
      ),
    );
  }
}
