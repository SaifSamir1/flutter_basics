

import 'package:flutter/material.dart';
import 'package:flutter_basics_app/person.dart';

class ListViewWidget extends StatelessWidget {
  const ListViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List View'),
      ),
      body: ListView.builder(
        itemCount: pepole.length,
        itemBuilder: (context , index){
          return ListTile(
            title: Text(pepole[index].name),
            subtitle: Text('${pepole[index].number}'),
            leading: Text('${pepole[index].id}'),
          );
      })
    );
  }
}


