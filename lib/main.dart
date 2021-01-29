import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'colors_util.dart';
import 'counter/view/counter_page.dart';

void main() {
  Bloc.observer = BlocObserver();
  runApp(CounterApp());
}

class CounterApp extends MaterialApp {
  CounterApp({Key key}) : super(
      key: key,
      title: 'Counter Bloc',
      theme: ThemeData(primarySwatch: createMaterialColor(Color(0xFF4AB953))),
      home: const CounterPage(),
  );
}
