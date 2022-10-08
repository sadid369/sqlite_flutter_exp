import 'package:flutter/material.dart';
import 'package:sqlite_flutter_exp/database_helper.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: const Text("Sqflite Example")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () async {
                int i = await DatabaseHelper.instance.insert({
                  DatabaseHelper.columnName: "Sadid",
                });
                print('Inserted ID is $i');
              },
              child: Text("Insert"),
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.grey)),
            ),
            ElevatedButton(
              onPressed: () async {
                List<Map<String, dynamic>> queryRows =
                    await DatabaseHelper.instance.queryAll();
                print(queryRows);
              },
              child: Text("Query"),
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.green.shade600)),
            ),
            ElevatedButton(
              onPressed: () async {
                int upadatedId = await DatabaseHelper.instance.update({
                  DatabaseHelper.columnId: 1,
                  DatabaseHelper.columnName: "Sadid1"
                });
                print(upadatedId);
              },
              child: Text("Update"),
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.blue.shade500)),
            ),
            ElevatedButton(
              onPressed: () async {
                int rowsAffected = await DatabaseHelper.instance.delete(2);
                print(rowsAffected);
              },
              child: Text("Delete"),
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.red.shade400)),
            ),
          ],
        ),
      ),
    );
  }
}
