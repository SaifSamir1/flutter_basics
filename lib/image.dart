import 'package:flutter/material.dart';

class ImageIwdget extends StatelessWidget {
  const ImageIwdget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Image')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(child: SizedBox(width: 200, height: 200, child: Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS043TWv0avqWMnS6s9SPC9dF-vwFqmLD8Qxw&s'))),
      ),
    );
  }
}

