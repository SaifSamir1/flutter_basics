import 'package:flutter/material.dart';
import 'package:flutter_basics_app/goals_app/goal_model.dart';
import 'package:flutter_basics_app/goals_app/hive_servisces.dart';
import 'package:flutter_basics_app/hive_test.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  Hive.registerAdapter(GoaLModelAdapter());

  await Hive.openBox('myBox');
  await Hive.openBox<GoaLModel>(HiveServices.boxName);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HiveTest(),
    );
  }
}

