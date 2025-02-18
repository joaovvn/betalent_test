import 'package:betalent_mobile/core/constants/app_colors.dart';
import 'package:betalent_mobile/core/constants/app_icons.dart';
import 'package:flutter/material.dart';

class ListHeader extends StatelessWidget {
  const ListHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Ink(
      color: AppColors.blue10,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(15.5, 14.0, 16.0, 14.0),
        child: Row(
          children: [
            Text("Foto", style: Theme.of(context).textTheme.headlineMedium),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(24.0, 0.0, 24.0, 0.0),
                child: Text("Nome",
                    style: Theme.of(context).textTheme.headlineMedium),
              ),
            ),
            SizedBox(width: 36, child: Image.asset(AppIcons.circle))
          ],
        ),
      ),
    );
  }
}
