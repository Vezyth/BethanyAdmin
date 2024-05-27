import 'package:flutter/material.dart';
import 'package:bethany_admin/helpers/reponsiveness.dart';
import 'package:bethany_admin/constants/controllers.dart';
import 'package:bethany_admin/pages/overview/widgets/available_drivers_table.dart';
import 'package:bethany_admin/pages/overview/widgets/overview_cards_large.dart';
import 'package:bethany_admin/pages/overview/widgets/overview_cards_medium.dart';
import 'package:bethany_admin/pages/overview/widgets/overview_cards_small.dart';
import 'package:bethany_admin/pages/overview/widgets/revenue_section_large.dart';
import 'package:bethany_admin/widgets/custom_text.dart';
import 'package:get/get.dart';

import 'widgets/revenue_section_small.dart';

class OverviewPage extends StatelessWidget {
  const OverviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Obx(
          () => Row(
            children: [
              Container(
                  margin: EdgeInsets.only(
                      top: ResponsiveWidget.isSmallScreen(context) ? 56 : 6),
                  child: CustomText(
                    text: menuController.activeItem.value,
                    size: 24,
                    weight: FontWeight.bold,
                  )),
            ],
          ),
        ),
        Expanded(
          child: ListView(
            children: [
              if (ResponsiveWidget.isLargeScreen(context) ||
                  ResponsiveWidget.isMediumScreen(context))
                if (ResponsiveWidget.isCustomSize(context))
                  const OverviewCardsMediumScreen()
                else
                  const OverviewCardsLargeScreen()
              else
                const OverviewCardsSmallScreen(),
              if (!ResponsiveWidget.isSmallScreen(context))
                const RevenueSectionLarge()
              else
                const RevenueSectionSmall(),
              const HostingEventsTable(),
            ],
          ),
        ),
      ],
    );
  }
}
