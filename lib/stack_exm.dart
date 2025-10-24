import 'package:flutter/material.dart';

class StackExm extends StatefulWidget {
  const StackExm({super.key});

  @override
  State<StackExm> createState() => _StackExmState();
}

class _StackExmState extends State<StackExm> {
  bool isOnline = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: TextButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.blue),
        ),
        onPressed: () {
                isOnline = !isOnline;
                setState(() {
                  
                });
              },
              child: Text('OnLine'),),
      appBar: AppBar(title: const Text('Stack Example')),
      body: Center(
        child: Column(
          children: [
            Stack(
              alignment: AlignmentGeometry.center,
              children: [
                CircleAvatar(
                  radius: 60,
                  backgroundColor: Colors.blue[300],
                  child: Icon(Icons.person, size: 50, color: Colors.white),
                ),
                if (isOnline == true)
                  Positioned(
                    top: 10,
                    right: 10,
                    child: CircleAvatar(
                      backgroundColor: Colors.green,
                      radius: 10,
                    ),
                  ),
              ],
            ),
            SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
