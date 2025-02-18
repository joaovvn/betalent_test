import 'package:betalent_mobile/core/constants/app_colors.dart';
import 'package:betalent_mobile/core/constants/app_icons.dart';
import 'package:flutter/material.dart';

class CustomSearchBar extends SliverPersistentHeaderDelegate {
  @override
  double get maxExtent => 100;

  @override
  double get minExtent => 100;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }

  const CustomSearchBar({required this.onSubmitted, required this.controller});

  final Function() onSubmitted;
  final TextEditingController controller;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      decoration: BoxDecoration(color: AppColors.white),
      child: Column(
        spacing: 15,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Funcionários",
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          TextField(
            onSubmitted: (_) => onSubmitted(),
            controller: controller,
            textAlignVertical: TextAlignVertical.center,
            decoration: InputDecoration(
                hintText: "Pesquisar",
                hintStyle: Theme.of(context).textTheme.headlineSmall,
                isCollapsed: true,
                prefixIcon: Image.asset(
                  AppIcons.search,
                  color: AppColors.black,
                ),
                suffixIcon: controller.text.isNotEmpty
                    ? IconButton(
                        onPressed: () {
                          controller.clear();
                          onSubmitted();
                        },
                        icon: Icon(
                          Icons.close,
                          color: AppColors.black,
                        ))
                    : null,
                fillColor: AppColors.gray05,
                filled: true,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(100),
                    borderSide: BorderSide.none)),
          ),
        ],
      ),
    );
  }
}
