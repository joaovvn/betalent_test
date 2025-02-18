import 'package:betalent_mobile/shared/models/employee.dart';

abstract class EmployeesRepository {
  Future<List<Employee>> getEmployees();
}
