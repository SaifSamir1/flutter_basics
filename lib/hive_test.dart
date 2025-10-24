import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveTest extends StatefulWidget {
  const HiveTest({super.key});

  @override
  State<HiveTest> createState() => _HiveTestState();
}

class _HiveTestState extends State<HiveTest> {
  final TextEditingController data = TextEditingController();
  final myBox = Hive.box('myBox');

  final String boxKey = 'firstData';
  bool isLoadingSave = false;
  bool isLoadingGet = false;
    bool isLoadingDelet = false;


  String? savedData;

  Future<void> _saveData() async {
    if (data.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please enter some data'),
          backgroundColor: Colors.red,
          duration: Duration(seconds: 1),
        ),
      );
      return;
    }

    setState(() {
      isLoadingSave = true;
    });

    await Future.delayed(Duration(seconds: 2));

    await myBox.put(boxKey, data.text);

    isLoadingSave = false;
    setState(() {});

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Data saved successfully'),
        backgroundColor: Colors.green,
        duration: Duration(seconds: 1),
      ),
    );
    data.clear();
  }

  Future<void> _getData() async {
    isLoadingGet = true;
    setState(() {});

    await Future.delayed(Duration(seconds: 2));

    final data = myBox.get(boxKey);
    savedData = data;
    isLoadingGet = false;
    setState(() {});

    if (data == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('No data found'),
          backgroundColor: Colors.red,
          duration: Duration(seconds: 1),
        ),
      );
      return;
    }
  }

  Future<void> _deleteData() async {
   final confirmDeleting = await showDialog<bool>(
    context: context, builder: (context){
      return AlertDialog(
        title: Text('Confirm Deletion '),
        content: Text('Are you sure you want to delete this data?'),
        actions:[
          TextButton(
            onPressed: (){
              Navigator.pop(context, false);
            },
            child: Text('Cancel')
          ), 
          ElevatedButton(onPressed: (){
            Navigator.pop(context, true);
          }, child: Text('Delete'),),
        ]
      );
    }
    );
  
  if(confirmDeleting == null || confirmDeleting == false){
    return;
  }

    isLoadingDelet = true;
    setState(() {});

    await Future.delayed(Duration(seconds: 2));

    await myBox.delete(boxKey);

    savedData = null;
    isLoadingDelet = false;
    setState(() {});

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Data deleted successfully'),
        backgroundColor: Colors.green,
        duration: Duration(seconds: 1),
      ),
    );
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text('Hive Test'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextFormField(
              controller: data,
              decoration: const InputDecoration(
                hintText: 'Enter something',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 12,
                ),
              ),
              icon: isLoadingSave
                  ? CircularProgressIndicator(color: Colors.white)
                  : Icon(Icons.save, color: Colors.white, size: 28),
              onPressed: isLoadingSave ? null : _saveData,
              label: Text(
                isLoadingSave ? 'Saving...' : 'Save Data',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.lightBlueAccent,
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 12,
                ),
              ),
              icon: isLoadingGet
                  ? CircularProgressIndicator(color: Colors.white)
                  : Icon(Icons.get_app_outlined, color: Colors.white, size: 28),
              onPressed: isLoadingGet ? null : _getData,
              label: Text(
                isLoadingGet ? 'Loading...' : 'Get Data',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Text(
                  'Data: ',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onLongPress: _deleteData,
              child: Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: savedData == null ? const Center(
                  child: Text('No Data', style: TextStyle(fontSize: 18)),
                ) : Center(
                  child: Text(
                    savedData!,
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
