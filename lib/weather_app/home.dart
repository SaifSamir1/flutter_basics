


import 'package:flutter/material.dart';

class HomeWeatherApp extends StatelessWidget {
  const HomeWeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Weather App'),
      ),
      body: const Center(
        child: Text('Home Weather App'),
      ),
    );
  }
}