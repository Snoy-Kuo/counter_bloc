import 'package:counter_bloc/counter/view/counter_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:counter_bloc/main.dart';

void main() {
  group('CounterApp', () {
    testWidgets('App is a MaterialApp', (tester) async {
      expect(CounterApp(), isA<MaterialApp>());
    });

    testWidgets('title is a Counter Bloc', (tester) async {
      expect(CounterApp().title, 'Counter Bloc');
    });

    testWidgets('primaryColor is 0xFF4AB953', (tester) async {
      expect(CounterApp().theme.primaryColor.value, Color(0xFF4AB953).value);
    });

    testWidgets('home is a CounterPage', (tester) async {
      expect(CounterApp().home, isA<CounterPage>());
    });

    testWidgets('renders CounterPage', (tester) async {
      await tester.pumpWidget(CounterApp());
      expect(find.byType(CounterPage), findsOneWidget);
    });
  });
}
