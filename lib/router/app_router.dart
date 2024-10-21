import 'package:auto_route/auto_route.dart';
import 'package:insurance_plan/router/app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => const RouteType.adaptive();

  @override
  List<AutoRoute> get routes => [
        AutoRoute(
            initial: true,
            children: [
              AutoRoute(initial: true, page: HomeRoute.page),
              AutoRoute(page: DetailRoute.page),
            ],
            page: BottomNavigationBarRoute.page)
      ];
}
