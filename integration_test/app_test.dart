import 'package:flutter/material.dart';
///To run this integration test, use following command:
/// flutter drive --target=integration_test/app_test.dart --driver=test_driver/integration_test.dart
///ref = https://flutter.dev/docs/testing/integration-tests

import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:counter_bloc/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('CounterApp', () {
    testWidgets('renders correct AppBar text', (tester) async {
      await tester.pumpApp();
      expect(find.text('Counter Bloc'), findsOneWidget);
    });

    testWidgets('renders correct initial count', (tester) async {
      await tester.pumpApp();
      expect(find.text('0'), findsOneWidget);
    });

    testWidgets('increment button updates the count', (tester) async {
      await tester.pumpApp();

      await tester.incrementCounter();
      expect(find.text('1'), findsOneWidget);

      await tester.incrementCounter();
      expect(find.text('2'), findsOneWidget);

      await tester.incrementCounter();
      expect(find.text('3'), findsOneWidget);
    });

    testWidgets('decrement button updates the count', (tester) async {
      await tester.pumpApp();

      await tester.decrementCounter();
      expect(find.text('-1'), findsOneWidget);

      await tester.decrementCounter();
      expect(find.text('-2'), findsOneWidget);

      await tester.decrementCounter();
      expect(find.text('-3'), findsOneWidget);
    });
  });
}

extension on WidgetTester {
  Future<void> pumpApp() async {
    app.main();
    await pumpAndSettle();
  }

  Future<void> incrementCounter() async {
    await tap(
      find.byKey(const Key('main_increment_fab')),
    );
    await pump();
  }

  Future<void> decrementCounter() async {
    await tap(
      find.byKey(const Key('main_decrement_fab')),
    );
    await pump();
  }
}
