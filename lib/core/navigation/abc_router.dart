import 'package:abc_fun/core/navigation/abc_router.gr.dart';

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
            AutoRoute(
              page: DashboardRoute.page,
              path: AbcRoute.dashboard.pathFragment,
              initial: true,
            ),
            AutoRoute(
              page: ChallengeProviderRoute.page,
              path: AbcRoute.challenges.pathFragment,
              children: [
                AutoRoute(page: ChallengeRoute.page, initial: true),
                AutoRoute(page: CreateNewChallengeRoute.page, path: 'new-challenge'),
              ],
            ),
            AutoRoute(
              page: AboutRoute.page,
              path: AbcRoute.about.pathFragment,
            ),
            AutoRoute(
              page: AccountSyncRoute.page,
              path: AbcRoute.accountSync.pathFragment,
            ),
            AutoRoute(
              page: SettingsRoute.page,
              path: AbcRoute.settings.pathFragment,
            )
          ],
        ),
        AutoRoute(page: GameRoute.page, path: '/${AbcRoute.game.pathFragment}')
      ];
}

enum AbcRoute {
  menu(''),
  dashboard('dashboard'),
  game('game'),
  challenges('challenges'),
  settings('settings'),
  accountSync('account-sync'),
  about('about');

  const AbcRoute(this.pathFragment);
  final String pathFragment;
}
