// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aba/features/challenges/presentation/view/challenge_page.dart'
    as _i4;
import 'package:aba/features/challenges/presentation/view/challenge_provider.dart'
    as _i1;
import 'package:aba/features/challenges/presentation/view/create_new_challenge_page.dart'
    as _i5;
import 'package:aba/features/dashboard/presentation/view/dashboard_page.dart'
    as _i6;
import 'package:aba/features/game/presentation/view/game_provider.dart' as _i2;
import 'package:aba/features/menu/bloc/menu_provider.dart' as _i3;
import 'package:auto_route/auto_route.dart' as _i7;

abstract class $AbcRouter extends _i7.RootStackRouter {
  $AbcRouter({super.navigatorKey});

  @override
  final Map<String, _i7.PageFactory> pagesMap = {
    ChallengeProviderRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i7.WrappedRoute(child: const _i1.ChallengeProvider()),
      );
    },
    GameRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.GameProvider(),
      );
    },
    MenuRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.MenuProvider(),
      );
    },
    ChallengeRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.ChallengePage(),
      );
    },
    CreateNewChallengeRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.CreateNewChallengePage(),
      );
    },
    DashboardRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.DashboardPage(),
      );
    },
  };
}

/// generated route for
/// [_i1.ChallengeProvider]
class ChallengeProviderRoute extends _i7.PageRouteInfo<void> {
  const ChallengeProviderRoute({List<_i7.PageRouteInfo>? children})
      : super(
          ChallengeProviderRoute.name,
          initialChildren: children,
        );

  static const String name = 'ChallengeProviderRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i2.GameProvider]
class GameRoute extends _i7.PageRouteInfo<void> {
  const GameRoute({List<_i7.PageRouteInfo>? children})
      : super(
          GameRoute.name,
          initialChildren: children,
        );

  static const String name = 'GameRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i3.MenuProvider]
class MenuRoute extends _i7.PageRouteInfo<void> {
  const MenuRoute({List<_i7.PageRouteInfo>? children})
      : super(
          MenuRoute.name,
          initialChildren: children,
        );

  static const String name = 'MenuRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i4.ChallengePage]
class ChallengeRoute extends _i7.PageRouteInfo<void> {
  const ChallengeRoute({List<_i7.PageRouteInfo>? children})
      : super(
          ChallengeRoute.name,
          initialChildren: children,
        );

  static const String name = 'ChallengeRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i5.CreateNewChallengePage]
class CreateNewChallengeRoute extends _i7.PageRouteInfo<void> {
  const CreateNewChallengeRoute({List<_i7.PageRouteInfo>? children})
      : super(
          CreateNewChallengeRoute.name,
          initialChildren: children,
        );

  static const String name = 'CreateNewChallengeRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i6.DashboardPage]
class DashboardRoute extends _i7.PageRouteInfo<void> {
  const DashboardRoute({List<_i7.PageRouteInfo>? children})
      : super(
          DashboardRoute.name,
          initialChildren: children,
        );

  static const String name = 'DashboardRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}
