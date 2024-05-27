import 'package:flutter/cupertino.dart';
import 'package:bethany_admin/constants/controllers.dart';
import 'package:bethany_admin/routing/router.dart';
import 'package:bethany_admin/routing/routes.dart';

Navigator localNavigator() => Navigator(
      key: navigationController.navigatorKey,
      onGenerateRoute: generateRoute,
      initialRoute: overviewPageRoute,
    );
