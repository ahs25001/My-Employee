import 'package:flutter/material.dart';
import 'package:my_employee/employee.dart';

import 'card.dart';

class SearchScreen extends StatefulWidget {
  static const String routName = 'searchScreen';

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController nameController = TextEditingController();
  List<Employee> searchResult = [];

  @override
  Widget build(BuildContext context) {
    var employees =
        ModalRoute.of(context)!.settings.arguments as List<Employee>;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0XFF0c70a4),
      appBar: AppBar(
        elevation: 0,
        title: TextField(
          controller: nameController,
          cursorColor: Colors.black,
          autofocus: true,
          onChanged: (v) {
            searchResult.clear();
            for (Employee employee in employees) {
              if (employee.name.contains(nameController.text))
                searchResult.add(employee);

            }
            setState(() {});
          },
          decoration: InputDecoration(filled: true, fillColor: Colors.white),
        ),
        automaticallyImplyLeading: false,
        backgroundColor: Color(0XFF0c70a4),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView.separated(
          itemBuilder: (context, index) => CardIcon(searchResult[index]),
          separatorBuilder: (BuildContext context, int index) {
            return Divider(
              height: 8,
            );
          },
          itemCount: searchResult.length,
        ),
      ),
    );
  }
}
