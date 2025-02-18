import 'package:betalent_mobile/core/constants/app_colors.dart';
import 'package:betalent_mobile/core/constants/app_images.dart';
import 'package:betalent_mobile/features/home/view_model/home_view_model.dart';
import 'package:betalent_mobile/features/home/widgets/custom_search_bar.dart';
import 'package:betalent_mobile/features/home/widgets/employee_card.dart';
import 'package:betalent_mobile/features/home/widgets/list_header.dart';
import 'package:betalent_mobile/shared/models/employee.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});

  final HomeViewModel _homeViewModel = Get.put(HomeViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        title: Image.asset(
          AppImages.logo,
          color: AppColors.black,
          scale: 3,
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () => _homeViewModel.onRefresh(),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
          child: CustomScrollView(
            slivers: [
              SliverPersistentHeader(
                pinned: false,
                floating: true,
                delegate: CustomSearchBar(
                    controller: _homeViewModel.searchController,
                    onSubmitted: () => _homeViewModel.filterEmployeeList()),
              ),
              SliverPadding(
                padding: const EdgeInsets.fromLTRB(0.0, 12.0, 0.0, 24.0),
                sliver: SliverToBoxAdapter(
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.vertical(
                            top: Radius.circular(8),
                            bottom: Radius.circular(5)),
                        border: Border.all(color: AppColors.gray10, width: 1)),
                    child: Column(
                      children: [
                        ListHeader(),
                        Obx(() {
                          return _homeViewModel.employeeList.isEmpty
                              ? Text(
                                  "Nenhum funcionário encontrado",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineMedium,
                                )
                              : ListView.separated(
                                  shrinkWrap: true,
                                  padding: EdgeInsets.zero,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemCount: _homeViewModel.employeeList.length,
                                  separatorBuilder: (context, index) => Divider(
                                        color: AppColors.gray10,
                                        thickness: 1.0,
                                      ),
                                  itemBuilder: (context, index) {
                                    Employee employee =
                                        _homeViewModel.employeeList[index];
                                    bool isCollapsed = false;
                                    return Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          16.0, 13.5, 16.0, 12.5),
                                      child: GetBuilder<HomeViewModel>(
                                          id: "item_${employee.id}",
                                          builder: (_) {
                                            return EmployeeCard(
                                                employee: employee,
                                                onTap: () {
                                                  isCollapsed = !isCollapsed;
                                                  _homeViewModel.updateWidget(
                                                      employee.id);
                                                },
                                                isCollapsed: isCollapsed);
                                          }),
                                    );
                                  });
                        })
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
