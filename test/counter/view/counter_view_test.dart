import 'package:bloc_test/bloc_test.dart';
import 'package:counter_bloc/counter/cubit/counter_cubit.dart';
import 'package:counter_bloc/counter/view/counter_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockCounterCubit extends MockBloc<int> implements CounterCubit {}

const _incrementButtonKey = Key('main_increment_fab');
const _decrementButtonKey = Key('main_decrement_fab');

void main() {
  CounterCubit counterCubit;

  setUp(() {
    counterCubit = MockCounterCubit();
    when(counterCubit.state).thenReturn(0);
  });

  group('CounterView', () {
    testWidgets('renders current CounterCubit state', (tester) async {
      when(counterCubit.state).thenReturn(5566);
      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider.value(
            value: counterCubit,
            child: CounterView(title: 'Counter Bloc'),
          ),
        ),
      );
      expect(find.text('5566'), findsOneWidget);
    });

    testWidgets('tapping increment button invokes increment', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider.value(
            value: counterCubit,
            child: CounterView(title: 'Counter Bloc'),
          ),
        ),
      );
      await tester.tap(find.byKey(_incrementButtonKey));
      verify(counterCubit.increment()).called(1);
    });

    testWidgets('tapping decrement button invokes decrement', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
            home: BlocProvider.value(
              value: counterCubit,
              child: CounterView(),
            ),
        ),
      );
      await tester.tap(find.byKey(_decrementButtonKey));
      verify(counterCubit.decrement()).called(1);
    });
  });
}
