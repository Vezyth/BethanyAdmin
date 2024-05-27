import 'package:flutter/material.dart';
import 'package:bethany_admin/constants/controllers.dart';
//import 'package:bethany_admin/helpers/reponsiveness.dart';
//import 'package:bethany_admin/helpers/reponsiveness.dart';
import 'package:bethany_admin/pages/hosted/widgets/hosted_table.dart';
//import 'package:bethany_admin/helpers/reponsiveness.dart';
//import 'package:bethany_admin/pages/hosted/widgets/hosted_table.dart';
import 'package:bethany_admin/widgets/custom_text.dart';
import 'package:get/get.dart';

class HostedPage extends StatelessWidget {
  const HostedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Obx(
          () => Row(
            children: [
              Container(
                margin: EdgeInsets.only(
                  top: ResponsiveWidget.isSmallScreen(context) ? 56 : 6,
                ),
                child: CustomText(
                  text: menuController.activeItem.value,
                  size: 24,
                  weight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView(
            children: const [
              HostedTable(),
            ],
          ),
        ),
      ],
    );
  }
}
