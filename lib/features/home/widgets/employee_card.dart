import 'package:betalent_mobile/core/constants/app_colors.dart';
import 'package:betalent_mobile/core/constants/app_icons.dart';
import 'package:betalent_mobile/core/utils/formatter.dart';
import 'package:betalent_mobile/features/home/widgets/info_row.dart';
import 'package:betalent_mobile/shared/models/employee.dart';
import 'package:flutter/material.dart';

class EmployeeCard extends StatelessWidget {
  const EmployeeCard(
      {super.key,
      required this.employee,
      required this.onTap,
      required this.isCollapsed});

  final Employee employee;
  final Function() onTap;
  final bool isCollapsed;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            SizedBox(
              width: 34,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(360),
                child: Image.network(employee.image),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(24.0, 0.0, 24.0, 0.0),
                child: Text(
                  employee.name,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ),
            ),
            GestureDetector(
              onTap: () => onTap(),
              child: isCollapsed
                  ? Image.asset(
                      AppIcons.arrowDropUp,
                      color: AppColors.blue,
                    )
                  : Image.asset(
                      AppIcons.arrowDropDown,
                      color: AppColors.blue,
                    ),
            ),
          ],
        ),
        isCollapsed
            ? Padding(
                padding: const EdgeInsets.fromLTRB(0.0, 31.5, 0.0, 15.0),
                child: Column(
                  children: [
                    InfoRow(title: "Cargo", info: employee.job),
                    Divider(
                      color: AppColors.gray10,
                    ),
                    InfoRow(
                        title: "Data de admissão",
                        info: Formatter.formatDate(employee.admissionDate)),
                    Divider(
                      color: AppColors.gray10,
                    ),
                    InfoRow(
                        title: "Telefone",
                        info: Formatter.formatPhone(employee.phone))
                  ],
                ),
              )
            : SizedBox()
      ],
    );
  }
}
