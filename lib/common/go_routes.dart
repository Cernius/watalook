import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:watalook/presentation/first_page/first_page.dart';

final GoRouter router = GoRouter(routes: [
  GoRoute(
    path: Routes.firstPage,
    builder: (BuildContext context, GoRouterState state) => FirstPage(),
  ),
]);

class Routes {
  static const String firstPage = '/first-page';
}
