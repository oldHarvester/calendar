import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../config/app_icons.dart';
import '../../config/app_styles.dart';
import '../../utils/formatter.dart';
import '../../utils/sizer.dart';
import '../../widgets/calendar/calendar_grid.dart';
import '../../widgets/svg_button.dart';

class TimeTableView extends HookWidget {
  const TimeTableView({super.key});

  @override
  Widget build(BuildContext context) {
    final currentMonth = useState(DateTime.now().month - 1);

    final carouselController = useState(CarouselController());

    final calendarController = usePageController(
      initialPage: currentMonth.value,
    );

    final months = TimeFormatter.months;

    void animateToPage({bool? forward, bool? backward, int? pageIndex}) {
      if (pageIndex != null) {
        carouselController.value.animateToPage(
          pageIndex,
          duration: const Duration(milliseconds: 300),
          curve: Curves.ease,
        );
        calendarController.animateToPage(
          pageIndex,
          duration: const Duration(milliseconds: 300),
          curve: Curves.ease,
        );
      } else if (forward != null && backward == null && forward) {
        carouselController.value.nextPage(
          duration: const Duration(milliseconds: 300),
          curve: Curves.ease,
        );
        calendarController.nextPage(
          duration: const Duration(milliseconds: 300),
          curve: Curves.ease,
        );
      } else if (backward != null && forward == null && backward) {
        carouselController.value.previousPage(
          duration: const Duration(milliseconds: 300),
          curve: Curves.ease,
        );
        calendarController.previousPage(
          duration: const Duration(milliseconds: 300),
          curve: Curves.ease,
        );
      }
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 8,
              right: 16.0,
              left: 16.0,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SvgButton(
                  assetPath: AppIcons.arrowLeft,
                  onTap: () {
                    animateToPage(backward: true);
                  },
                  size: 24,
                ),
                Expanded(
                  child: SizedBox(
                    height: 24,
                    child: CarouselSlider.builder(
                      carouselController: carouselController.value,
                      itemCount: 12,
                      itemBuilder: (context, index, realIndex) {
                        return GestureDetector(
                          onTap: () {
                            animateToPage(pageIndex: index);
                          },
                          child: Text(
                            months[index],
                            textAlign: TextAlign.center,
                            style: index == currentMonth.value
                                ? AppStyles.s18w500
                                : AppStyles.s16w400,
                          ),
                        );
                      },
                      options: CarouselOptions(
                        enableInfiniteScroll: false,
                        onPageChanged: (index, reason) {
                          currentMonth.value = index;
                          animateToPage(pageIndex: index);
                        },
                        initialPage: currentMonth.value,
                        viewportFraction: 0.35 / Sizer(context).vw(1),
                      ),
                    ),
                  ),
                ),
                SvgButton(
                  assetPath: AppIcons.arrowRight,
                  onTap: () {
                    animateToPage(forward: true);
                  },
                  size: 24,
                ),
              ],
            ),
          ),
          CalendarGrid(
            monthLength: months.length,
            onPageChanged: animateToPage,
            calendarController: calendarController,
          ),
        ],
      ),
    );
  }
}
