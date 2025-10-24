import 'package:flutter/material.dart';

class ExpandedWIdgets extends StatelessWidget {
  const ExpandedWIdgets({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Expanded Widgets")),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            SizedBox(
              height: 100,
              child: Row(
                children: [
                  Container(
                    height: 100,
                    color: Colors.red,
                    child: Center(child: Text('ثابت ')),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      height: 100,

                      color: Colors.green,
                      child: Center(child: Text('ثابت ')),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      height: 100,

                      color: Colors.blue,
                      child: Center(child: Text('ثابت ')),
                    ),
                  ),
                ],
              ),
            ),
          SizedBox(height: 20,),
          Expanded(
            child: Row(
              children: [
                Column(
                  children: [
                    
                       Container(
                        width: 100,
                        color: Colors.red,
                        child: Center(child: Text('ثابت ')),
                      
                    ),
                    Expanded(
                      child: Container(
                        width: 100,
                        color: Colors.green,
                        child: Center(child: Text('ثابت ')),
                      ),
                    ),
                    
                     Container(
                        width: 100,
                        color: Colors.blue,
                        child: Center(child: Text('ثابت ')),
                     
                    ),
                  ],
                )
              ],
            ),
          )
          ],
        ),
      ),
    );
  }
}


