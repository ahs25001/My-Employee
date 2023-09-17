import 'package:flutter/material.dart';
import 'package:my_employee/data_base.dart';
import 'package:my_employee/employee.dart';

import 'homeScreen.dart';

class EditeScreen extends StatefulWidget {
  static const String routName = 'editeScreen';

  const EditeScreen({super.key});

  @override
  State<EditeScreen> createState() => _EditeScreenState();
}

class _EditeScreenState extends State<EditeScreen> {
  TextEditingController nameController = TextEditingController();

  TextEditingController addressController = TextEditingController();

  TextEditingController phoneController = TextEditingController();

  TextEditingController jopController = TextEditingController();

  TextEditingController salaryController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var temp = ModalRoute.of(context)!.settings.arguments as Employee;
    int index = DataBase.search(temp.name);
    Employee employee = DataBase.employees[index];
    nameController.text = employee.name;
    phoneController.text = employee.phone;
    addressController.text = employee.address;
    jopController.text = employee.jop;
    salaryController.text = employee.salary.toString();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0XFF0c70a4),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        elevation: 1,
        backgroundColor: Color(0XFF023167),
        title: Text("New Employee"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            TextField(
              onTap: () => nameController.clear(),
              decoration: InputDecoration(
                  hintText: 'Enter Name',
                  hintStyle: TextStyle(
                    fontSize: 17,
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                  )),
              controller: nameController,
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              decoration: InputDecoration(
                  hintText: 'Enter Address',
                  hintStyle: TextStyle(
                    fontSize: 17,
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                  )),
              controller: addressController,
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              onTap: () {
                phoneController.clear();
              },
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                  hintText: 'Enter Phone Number',
                  hintStyle: TextStyle(
                    fontSize: 17,
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                  )),
              controller: phoneController,
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              onTap: () {
                jopController.clear();
              },
              decoration: InputDecoration(
                  hintText: 'Enter Jop',
                  hintStyle: TextStyle(
                    fontSize: 17,
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                  )),
              controller: jopController,
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              onTap: () {
                salaryController.clear();
              },
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  hintText: 'Enter Salary',
                  hintStyle: TextStyle(
                    fontSize: 17,
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                  )),
              controller: salaryController,
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () {
                   employee = Employee(
                      name: nameController.text,
                      address: addressController.text,
                      phone: phoneController.text,
                      jop: jopController.text,
                      salary: double.parse(salaryController.text));
                   DataBase.employees[index]=employee;
                  nameController.clear();
                  addressController.clear();
                  phoneController.clear();
                  jopController.clear();
                  salaryController.clear();
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    HomeScreen.routName,
                    (route) => false,
                    arguments: DataBase.employees
                  );
                },
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: Text("Done"),
                ))
          ],
        ),
      ),
    );
  }
}
