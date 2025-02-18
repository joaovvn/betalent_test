import 'package:betalent_mobile/core/services/api_service.dart';
import 'package:betalent_mobile/shared/models/employee.dart';
import 'package:betalent_mobile/shared/repositories/employees_repository.dart';

class EmployeesRepositoryImpl implements EmployeesRepository {
  final ApiService _apiService;

  EmployeesRepositoryImpl(this._apiService);

  @override
  Future<List<Employee>> getEmployees() async {
    try {
      final data = await _apiService.fetchEmployees();

      return data
          .map<Employee>((employee) => Employee.fromJson(employee))
          .toList();
    } catch (e) {
      throw Exception(e);
    }
  }
}
