import 'package:aba/core/navigation/abc_router.gr.dart';

import 'package:auto_route/auto_route.dart';

@AutoRouterConfig(
  replaceInRouteName: 'Provider|Page,Route',
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
            AutoRoute(page: DashboardRoute.page, path: AbcRoute.dashboard.pathFragment, initial: true),
            AutoRoute(page: ChallengeProviderRoute.page, path: AbcRoute.challenges.pathFragment, children: [
              AutoRoute(page: ChallengeRoute.page, initial: true),
              AutoRoute(page: CreateNewChallengeRoute.page, path: 'new-challenge'),
            ]),
          ],
        ),
        AutoRoute(page: GameRoute.page, path: '/${AbcRoute.game.pathFragment}')
      ];
}

enum AbcRoute {
  menu(''),
  dashboard('dashboard'),
  game('game'),
  challenges('challenges');

  const AbcRoute(this.pathFragment);
  final String pathFragment;
}
