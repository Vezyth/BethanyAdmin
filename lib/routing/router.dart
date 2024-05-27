import 'package:flutter/material.dart';
import 'package:bethany_admin/pages/hosted/widgets/hosted_table.dart';
import 'package:bethany_admin/pages/hosting/widgets/hosting_table.dart';
import 'package:bethany_admin/pages/overview/overview.dart';
import 'package:bethany_admin/routing/routes.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case overviewPageRoute:
      return _getPageRoute(const OverviewPage());
    case hostingTableRoute:
      return _getPageRouteStack(const HostingTable());
    case hostedTableRoute:
      return _getPageRouteStack(
        const HostedTable(),
      );
    default:
      return _getPageRoute(const OverviewPage());
  }
}

PageRoute _getPageRoute(Widget child) {
  return MaterialPageRoute(builder: (context) => child);
}

PageRoute _getPageRouteStack(Widget firstChild) {
  return MaterialPageRoute(
    builder: (context) => Navigator(
      onGenerateRoute: (settings) {
        final routes = <String, WidgetBuilder>{
          '/': (context) => firstChild,
          overviewPageRoute: (context) {
            if (Navigator.of(context).canPop()) {
              Navigator.of(context).popUntil(ModalRoute.withName('/'));
            }
            return const OverviewPage();
          },
        };
        WidgetBuilder builder = routes[settings.name]!;
        return MaterialPageRoute(builder: (context) => builder(context));
      },
    ),
  );
}
