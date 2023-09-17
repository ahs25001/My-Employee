import 'package:flutter/material.dart';
import 'package:my_employee/data_base.dart';
import 'package:my_employee/employee.dart';
import 'package:my_employee/homeScreen.dart';

class AddScreen extends StatefulWidget {
  static const String routName = 'addScreen';

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  TextEditingController nameController = TextEditingController();

  TextEditingController addressController = TextEditingController();

  TextEditingController phoneController = TextEditingController();

  TextEditingController jopController = TextEditingController();

  TextEditingController salaryController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
              onChanged: (v) {
                setState(() {});
              },
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
              onChanged: (v) {
                setState(() {});
                ;
              },
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
              onChanged: (v) {
                setState(() {});
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
              onChanged: (v) {
                setState(() {});
                ;
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
              onChanged: (v) {
                setState(() {});
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
                onPressed: (nameController.text.isNotEmpty &&
                        addressController.text.isNotEmpty &&
                        phoneController.text.isNotEmpty &&
                        jopController.text.isNotEmpty &&
                        salaryController.text.isNotEmpty)
                    ? () {
                        Employee employee = Employee(
                            name: nameController.text,
                            address: addressController.text,
                            phone: phoneController.text,
                            jop: jopController.text,
                            salary: double.parse(salaryController.text));
                        nameController.clear();
                        addressController.clear();
                        phoneController.clear();
                        jopController.clear();
                        salaryController.clear();
                        DataBase.employees.add(employee);
                        Navigator.pushNamedAndRemoveUntil(
                            context, HomeScreen.routName, (route) => false,arguments:DataBase.employees
                          );
                      }
                    : null,
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
