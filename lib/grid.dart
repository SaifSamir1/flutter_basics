import 'package:flutter/material.dart';
import 'package:flutter_basics_app/person.dart';

class GridViewWidget extends StatelessWidget {
  const GridViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Grid View')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: 1.5, // العرض / الطول 
            ),
          itemCount:  pepole.length,
          itemBuilder: (context, index) {
            return Card(
              child: Center(
                child: Text('${pepole[index].id}'),
              ),
            );
          },
        ),
      ),
    );
  }
}
