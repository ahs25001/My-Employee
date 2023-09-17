import 'package:flutter/material.dart';
import 'package:my_employee/addScreen.dart';
import 'package:my_employee/card.dart';
import 'package:my_employee/data_base.dart';
import 'package:my_employee/searchScreen.dart';
import 'package:sqflite/sqflite.dart';

import 'employee.dart';

class HomeScreen extends StatefulWidget {
  static const String routName = 'homeScreen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    createDataBase();
  }
  @override
  Widget build(BuildContext context) {
    var employees =
        ModalRoute.of(context)!.settings.arguments as List<Employee>;
    return Scaffold(
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, AddScreen.routName);
          },
          child: Icon(
            Icons.add,
          ),
          style: ElevatedButton.styleFrom(
              shape: CircleBorder(),
              fixedSize: Size.fromRadius(25),
              backgroundColor: Color(0XFF023167)),
        ),
      ),
      backgroundColor: Color(0XFF0c70a4),
      appBar: AppBar(
        centerTitle: true,
        title: Text("My Employee"),
        elevation: 1,
        backgroundColor: Color(0XFF023167),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              Navigator.pushNamed(context, SearchScreen.routName,
                  arguments: employees);
            },
          )
        ],
      ),
      body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListView.separated(
              itemCount: DataBase.employees.length,
              separatorBuilder: (context, index) =>
                  Divider(color: Color(0XFF0c70a4), thickness: 8),
              itemBuilder: (context, index) {
                return CardIcon(employees[index]);
              })),
    );
  }

  // String name;
  // String address;
  // String phone;
  // String jop;
  // double salary;
  createDataBase() async {
    var dataBase = await openDatabase(
      "employee.db",
      version: 1,
      onOpen: (db) {},
      onCreate: (db, version) {
        db
            .execute(
                'CREATE TABLE employees (name TEXT,address TEXT,phone TEXT,jop TEXT,salary REAL)')
            .then((value) {}).catchError((error){print(error.toString());});
      },
    );
  }
}
