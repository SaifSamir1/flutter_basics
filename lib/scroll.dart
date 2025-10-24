


import 'package:flutter/material.dart';

class Scroll extends StatelessWidget {
  const Scroll({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Scroll'),
      ),
      body: Center(
        child: ListView(
          
          children: [
            Container(
              height: 200,
              width: 200,
              child: Text('Scroll'),
              color: Color(0xff0077CC),
            ),
            Container(
              height: 200,
              child: Text('Scroll'),
              color: Colors.blue,
              width: 200,
            ),
            Container(
              height: 200,
              width: 200,
              child: Text('Scroll'),
              color: Colors.red,
            ),
          ],
        ),
      ),
    );
  }
}