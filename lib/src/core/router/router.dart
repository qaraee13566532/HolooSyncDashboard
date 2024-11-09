import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:holoo_dashboard/src/features/presentation/Pages/login_page.dart';

import '../../features/presentation/Pages/home_page.dart';
import '../../features/presentation/Pages/report_failed_page.dart';
import '../../features/presentation/Pages/setting_page.dart';
import 'app_route_enum.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: AppRouteEnum.homePage.name,
        builder: (BuildContext context, GoRouterState state) {
          return const HomePage(title: 'نرم افزار مدیریتی توزین تک نسخه 1.01');
        },
      ),
      GoRoute(
        path: AppRouteEnum.settingPage.name,
        builder: (BuildContext context, GoRouterState state) {
          return const SettingPage();
        },
      ),
      GoRoute(
        path: AppRouteEnum.loginPage.name,
        builder: (BuildContext context, GoRouterState state) {
          return  LoginPage();
        },
      ),
      // GoRoute(
      //   path: AppRouteEnum.reportFailedPage.name,
      //   builder: (BuildContext context, GoRouterState state) {
      //     return const ReportFailedPage();
      //   },
      // ),
    ],
  );
}
