import 'package:flutter_test/flutter_test.dart';
import 'package:community/features/feed/presentation/pages/feed_screen.dart';
import 'package:flutter/material.dart';

void main() {
  testWidgets('FeedScreen renders', (tester) async {
    await tester.pumpWidget(const MaterialApp(home: FeedScreen()));
    expect(find.byType(FeedScreen), findsOneWidget);
  });
}
