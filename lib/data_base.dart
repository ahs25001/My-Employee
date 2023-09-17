import 'employee.dart';

class DataBase {
  static List<Employee> employees = [];

  static int search(String employeeName) {
    for (int i = 0; i < employees.length; i++) {
      if (employees[i].name == employeeName) return i;
    }
    return 0;
  }
}
