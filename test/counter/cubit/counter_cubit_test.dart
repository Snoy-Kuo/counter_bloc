import 'package:bloc_test/bloc_test.dart';
import 'package:counter_bloc/counter/cubit/counter_cubit.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CounterCubit', () {
    test('initial state is 0', () {
      expect(CounterCubit().state, 0);
    });

    group('increment', () {
      blocTest<CounterCubit, int>(
        'emits [1] when state is 0',
        build: () => CounterCubit(),
        act: (cubit) => cubit.increment(),
        expect: const <int>[1],
      );

      blocTest<CounterCubit, int>(
        'emits [1, 2] when state is 0 and invoked twice',
        build: () => CounterCubit(),
        act: (cubit) => cubit..increment()..increment(),
        expect: const <int>[1, 2],
      );

      blocTest<CounterCubit, int>(
        'emits [5566] when state is 5565',
        build: () => CounterCubit(),
        seed: 5565,
        act: (cubit) => cubit.increment(),
        expect: const <int>[5566],
      );
    });

    group('decrement', () {
      blocTest<CounterCubit, int>(
        'emits [-1] when state is 0',
        build: () => CounterCubit(),
        act: (cubit) => cubit.decrement(),
        expect: const <int>[-1],
      );

      blocTest<CounterCubit, int>(
        'emits [-1, -2] when state is 0 and invoked twice',
        build: () => CounterCubit(),
        act: (cubit) => cubit..decrement()..decrement(),
        expect: const <int>[-1, -2],
      );

      blocTest<CounterCubit, int>(
        'emits [5566] when state is 5567',
        build: () => CounterCubit(),
        seed: 5567,
        act: (cubit) => cubit.decrement(),
        expect: const <int>[5566],
      );
    });
  });
}
