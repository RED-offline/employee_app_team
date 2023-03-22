import 'package:employee_app_team/features/candidates/candidate_detail/presentation/candidate_detail_page.dart';
import 'package:employee_app_team/features/candidates/candidates_list/presentation/candidate_list_page.dart';
import 'package:employee_app_team/features/candidates/candidates_list/presentation/error_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      name: MyAppRouteConstants.homeRouteName,
      path: '/',
      builder: (context, state) {
        return const CandidateListPage();
      },
      routes: [
        GoRoute(
          name: MyAppRouteConstants.detailRouteName,
          path: 'details',
          builder: (BuildContext context, GoRouterState state) {
            return const CandidateDetailPage();
          },
        ),
      ],
    ),
  ],
  errorPageBuilder: (context, state) {
    return const MaterialPage(child: ErrorPage());
  },
);

class MyAppRouteConstants {
  static const String homeRouteName = 'home';
  static const String detailRouteName = 'detail';
}
