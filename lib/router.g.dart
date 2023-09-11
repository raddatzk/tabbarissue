// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'router.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $homeRoute,
    ];

RouteBase get $homeRoute => ShellRouteData.$route(
      factory: $HomeRouteExtension._fromState,
      routes: [
        GoRouteData.$route(
          path: '/tabs/new',
          factory: $NewTabRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: '/tabs/:tabName',
          factory: $TabRouteExtension._fromState,
        ),
      ],
    );

extension $HomeRouteExtension on HomeRoute {
  static HomeRoute _fromState(GoRouterState state) => const HomeRoute();
}

extension $NewTabRouteExtension on NewTabRoute {
  static NewTabRoute _fromState(GoRouterState state) => NewTabRoute();

  String get location => GoRouteData.$location(
        '/tabs/new',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $TabRouteExtension on TabRoute {
  static TabRoute _fromState(GoRouterState state) => TabRoute(
        tabName: state.pathParameters['tabName']!,
      );

  String get location => GoRouteData.$location(
        '/tabs/${Uri.encodeComponent(tabName)}',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}
