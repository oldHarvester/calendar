import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../utils/functions.dart';
import '../../utils/sizer.dart';
import 'calendar_header.dart';
import 'calendar_tile.dart';

class CalendarGrid extends HookWidget {
  const CalendarGrid({
    super.key,
    required this.monthLength,
    required this.onPageChanged,
    required this.calendarController,
  });

  final int monthLength;

  final PageController calendarController;

  final void Function({bool? forward, bool? backward, int? pageIndex})
      onPageChanged;

  @override
  Widget build(BuildContext context) {
    final screenWidth = Sizer(context).width();

    final gridSettings = gridData(
      screenWidth: screenWidth,
      crossSpace: 10.5,
      mainSpace: 8.0,
      maxColumns: 7,
      maxRows: 6,
      paddings: 32,
    );

    return Column(
      children: [
        CalendarHeader(
          tileWidth: gridSettings.tileSize,
        ),
        SizedBox(
          height: gridSettings.height,
          child: PageView.builder(
            onPageChanged: (value) {
              onPageChanged(pageIndex: value);
            },
            controller: calendarController,
            itemCount: monthLength,
            itemBuilder: (context, month) {
              final realYear = DateTime.now().year;
              final realMonth = month + 1;
              final lastMonthDays = DateUtils.getDaysInMonth(
                realMonth > 1 ? realYear : realYear - 1,
                realMonth > 1 ? realMonth : 12,
              );
              final daysInMonth = DateUtils.getDaysInMonth(
                realYear,
                realMonth,
              );
              final firstDayOffset = DateUtils.firstDayOffset(
                    realYear,
                    realMonth,
                    MaterialLocalizations.of(context),
                  ) -
                  1;
              var counterDays = lastMonthDays - firstDayOffset;
              return Container(
                color: Colors.white,
                child: GridView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: daysInMonth + firstDayOffset,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 7,
                    mainAxisSpacing: 8.0,
                    crossAxisSpacing: 10.5,
                  ),
                  itemBuilder: (context, day) {
                    final realDay = day - firstDayOffset + 1;
                    counterDays += 1;
                    if (day < firstDayOffset) {
                      return CalendarTile(
                        day: counterDays,
                        month: realMonth,
                      );
                    } else {
                      return CalendarTile(
                        day: realDay,
                        month: realMonth,
                        isActive: true,
                      );
                    }
                  },
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
