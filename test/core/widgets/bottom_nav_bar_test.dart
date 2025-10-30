// test/core/widgets/bottom_nav_bar_test.dart
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:yorus_mobile/core/widgets/bottom_nav_bar.dart';

void main() {
  testWidgets('BottomNavBar displays tabs and handles taps', (WidgetTester tester) async {
    int selectedIndex = 0;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          bottomNavigationBar: BottomNavBar(
            currentIndex: selectedIndex,
            onTap: (index) {
              selectedIndex = index;
            },
          ),
        ),
      ),
    );

    // Verify that all tabs are displayed.
    expect(find.text('Home'), findsOneWidget);
    expect(find.text('Queue'), findsOneWidget);
    expect(find.text('Done'), findsOneWidget);

    // Simulate a tap on the 'Queue' tab.
    await tester.tap(find.text('Queue'));
    await tester.pump();

    // Verify that the callback was called and the selected index was updated.
    expect(selectedIndex, 1);
  });
}
