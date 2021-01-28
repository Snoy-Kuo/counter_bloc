import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'counter/view/counter_page.dart';

void main() {
  Bloc.observer = BlocObserver();
  runApp(const MyApp());
}

class MyApp extends MaterialApp {
  const MyApp({Key key}) : super(key: key, home: const CounterPage());
}
