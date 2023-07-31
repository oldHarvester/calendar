import 'package:flutter/material.dart';

import '../../config/app_colors.dart';
import '../../config/app_styles.dart';
import '../../utils/formatter.dart';

class CalendarHeader extends StatelessWidget {
  const CalendarHeader({
    super.key,
    required this.tileWidth,
  });

  final double tileWidth;

  @override
  Widget build(BuildContext context) {
    final weekDays = TimeFormatter.weekDays;

    return Padding(
      padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(
          weekDays.length,
          (index) => Container(
            width: tileWidth,
            padding: const EdgeInsets.all(8.0),
            child: Align(
              child: Text(
                weekDays[index],
                style: AppStyles.s18w500.copyWith(
                  color: AppColors.black5,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
