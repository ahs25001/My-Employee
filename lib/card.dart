import 'package:flutter/material.dart';
import 'package:my_employee/details.dart';
import 'package:my_employee/employee.dart';

class CardIcon extends StatelessWidget {
  Employee employee;

  CardIcon(this.employee);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          padding: EdgeInsets.all(20),
          elevation: 1,
          backgroundColor: Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(23))),
      onPressed: () {
        Navigator.pushNamed(context,DetailsScreen.routName,arguments: employee);
      },
      child: Text("Name : ${employee.name}\nJop :${employee.jop}",
          style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.normal,
              fontSize: 20)),
    );
  }
}
