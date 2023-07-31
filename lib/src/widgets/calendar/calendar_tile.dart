import 'package:flutter/material.dart';

import '../../config/app_colors.dart';
import '../../config/app_styles.dart';

class CalendarTile extends StatelessWidget {
  const CalendarTile({
    super.key,
    required this.day,
    required this.month,
    this.isActive = false,
  });

  final int day;

  final int month;

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(8.0),
        onTap: () {},
        child: Ink(
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            color: AppColors.grey2,
          ),
          child: Center(
            child: Text(
              day.toString(),
              style: AppStyles.s18w400.copyWith(
                color: isActive ? AppColors.black : AppColors.black9,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
