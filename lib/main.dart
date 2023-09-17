import 'package:flutter/material.dart';
import 'package:my_employee/addScreen.dart';
import 'package:my_employee/details.dart';
import 'package:my_employee/editeScreen.dart';
import 'package:my_employee/searchScreen.dart';

import 'homeScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AddScreen.routName,
      routes: {
        HomeScreen.routName: (context) => HomeScreen(),
        AddScreen.routName: (context) => AddScreen(),
        DetailsScreen.routName:(context) => DetailsScreen(),
        EditeScreen.routName:(context) => EditeScreen(),
        SearchScreen.routName:(context) => SearchScreen(),
      },
    );
  }
}
