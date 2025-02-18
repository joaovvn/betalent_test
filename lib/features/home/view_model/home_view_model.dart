import 'package:betalent_mobile/shared/models/employee.dart';
import 'package:betalent_mobile/shared/repositories/employees_repository_impl.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeViewModel extends GetxController {
  final EmployeesRepositoryImpl _cryptoRepository = Get.find();
  RxList<Employee> employeeList = List<Employee>.empty(growable: true).obs;
  RxBool isLoading = false.obs;
  TextEditingController searchController = TextEditingController();

  @override
  onInit() {
    getEmployeeList();
    super.onInit();
  }

  Future<void> getEmployeeList() async {
    try {
      isLoading.value = true;
      var result = await _cryptoRepository.getEmployees();
      employeeList.value = result;
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> filterEmployeeList() async {
    await getEmployeeList();
    if (searchController.text.isEmpty) {
      return;
    }
    employeeList.value = employeeList
        .where((employee) =>
            employee.name
                .toLowerCase()
                .contains(searchController.text.toLowerCase()) ||
            employee.job
                .toLowerCase()
                .contains(searchController.text.toLowerCase()) ||
            employee.phone.contains(searchController.text))
        .toList();
  }

  Future<void> onRefresh() async {
    searchController.clear();
    getEmployeeList();
  }

  void updateWidget(String employeeId) {
    update(["item_$employeeId"]);
  }
}
