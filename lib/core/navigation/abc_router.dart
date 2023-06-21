import 'package:aba/core/navigation/abc_router.gr.dart';

import 'package:auto_route/auto_route.dart';

@AutoRouterConfig(
  replaceInRouteName: 'Provider,Route',
)
class AbcRouter extends $AbcRouter {
  @override
  RouteType get defaultRouteType => const RouteType.adaptive();

  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: MenuRoute.page,
          initial: true,
          path: '/${AbcRoute.menu.pathFragment}',
          title: (context, data) => 'Menu',
          children: [
            AutoRoute(page: Dashboard.page, path: AbcRoute.dashboard.pathFragment, initial: true),
          ],
        ),
        AutoRoute(page: GameRoute.page, path: '/${AbcRoute.game.pathFragment}')
      ];
}

enum AbcRoute {
  menu('menu'),
  dashboard('dashboard'),
  game('game');

  const AbcRoute(this.pathFragment);
  final String pathFragment;
}
