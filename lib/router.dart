import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'main.dart';

part 'router.g.dart';

@TypedShellRoute<HomeRoute>(
  routes: [
    TypedGoRoute<NewTabRoute>(
      path: '/tabs/new',
    ),
    TypedGoRoute<TabRoute>(
      path: '/tabs/:tabName',
    ),
  ],
)
class HomeRoute extends ShellRouteData {
  const HomeRoute();

  @override
  Widget builder(BuildContext context, GoRouterState state, Widget navigator) => HomeScreen(child: navigator);
}

class TabRoute extends GoRouteData {
  final String tabName;

  const TabRoute({
    required this.tabName,
  });
  @override
  Widget build(BuildContext context, GoRouterState state) => TabView(title: tabName);
}

class NewTabRoute extends GoRouteData {
  const NewTabRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const NewTabView();
}

final router = GoRouter(
  initialLocation: '/tabs/new',
  routes: $appRoutes,
);