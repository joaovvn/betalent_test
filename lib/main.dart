import 'package:betalent_mobile/core/constants/app_colors.dart';
import 'package:betalent_mobile/core/constants/app_theme.dart';
import 'package:betalent_mobile/core/services/api_service.dart';
import 'package:betalent_mobile/features/home/view/home_view.dart';
import 'package:betalent_mobile/shared/repositories/employees_repository_impl.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  Get.put(EmployeesRepositoryImpl(ApiService()));
  runApp(const BeTalentTest());
}

class BeTalentTest extends StatelessWidget {
  const BeTalentTest({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          appBarTheme: Theme.of(context).appBarTheme.copyWith(
                color: AppColors.white,
              ),
          scaffoldBackgroundColor: AppColors.white,
          useMaterial3: true,
          textTheme: AppTheme.textTheme,
        ),
        home: HomeView(),
      ),
    );
  }
}
