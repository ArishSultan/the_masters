import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:the_masters/src/base/db.dart';
import 'package:the_masters/src/base/theme.dart';
import 'package:the_masters/src/modules/home_view.dart';

Future<void> initializeAndRun() async {
  Database.initialize();

  return runApp(const App._());
}

class App extends HookWidget {
  const App._();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.data,
      home: HomeView(),
    );
  }
}
