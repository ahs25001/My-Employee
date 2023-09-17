import 'package:flutter/material.dart';
import 'package:my_employee/editeScreen.dart';
import 'package:my_employee/employee.dart';
import 'package:my_employee/homeScreen.dart';

import 'data_base.dart';

class DetailsScreen extends StatelessWidget {
  static const String routName = "details";

  @override
  Widget build(BuildContext context) {
    var temp = ModalRoute.of(context)!.settings.arguments as Employee;
    int index = DataBase.search(temp.name);
    Employee employee = DataBase.employees[index];
    return Scaffold(
      backgroundColor: Color(0XFF0c70a4),
      appBar: AppBar(
        backgroundColor: Color(0XFF023167),
        title: Text('Details'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(30)),
              child: Text(
                "Name: ${employee.name}\nAddress: ${employee.address}\nPhone: ${employee.phone}\nJop: ${employee.jop}\nSalary: ${employee.salary}",
                style: TextStyle(fontSize: 20),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(23))),
                      onPressed: () {
                        Navigator.pushNamed(context, EditeScreen.routName,
                            arguments: employee);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Edite",
                            style: TextStyle(fontSize: 20),
                          ),
                          SizedBox(
                            width: 6,
                          ),
                          Icon(Icons.edit)
                        ],
                      )),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: ElevatedButton(
                      onPressed: () {
                        DataBase.employees.removeAt(index);
                        Navigator.pushNamedAndRemoveUntil(
                            context, HomeScreen.routName, (route) => false,
                            arguments: DataBase.employees);
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(23))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Delete",
                            style: TextStyle(fontSize: 20),
                          ),
                          SizedBox(
                            width: 6,
                          ),
                          Icon(Icons.close)
                        ],
                      )),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
