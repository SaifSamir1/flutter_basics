import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
 import 'package:flutter_basics_app/cubit/counter_cubit.dart';
import 'package:flutter_basics_app/firebase_options.dart';
import 'package:flutter_basics_app/features/goals_app/goal_model.dart';
import 'package:flutter_basics_app/features/goals_app/hive_servisces.dart';
import 'package:flutter_basics_app/news_app.dart';
import 'package:flutter_basics_app/features/news_cubit/news_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
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
      home: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => CounterCubit()),
          BlocProvider(create: (context) => NewsCubit()..getNews()),
        ],
        child: NewsApp(),
      ),
    );
  }
}
