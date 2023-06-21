// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aba/features/dashboard/presentation/view/dashboard.dart' as _i2;
import 'package:aba/features/game/presentation/view/game_provider.dart' as _i1;
import 'package:aba/features/menu/bloc/menu_provider.dart' as _i3;
import 'package:auto_route/auto_route.dart' as _i4;

abstract class $AbcRouter extends _i4.RootStackRouter {
  $AbcRouter({super.navigatorKey});

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    GameRoute.name: (routeData) {
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.GameProvider(),
      );
    },
    Dashboard.name: (routeData) {
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.Dashboard(),
      );
    },
    MenuRoute.name: (routeData) {
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.MenuProvider(),
      );
    },
  };
}

/// generated route for
/// [_i1.GameProvider]
class GameRoute extends _i4.PageRouteInfo<void> {
  const GameRoute({List<_i4.PageRouteInfo>? children})
      : super(
          GameRoute.name,
          initialChildren: children,
        );

  static const String name = 'GameRoute';

  static const _i4.PageInfo<void> page = _i4.PageInfo<void>(name);
}

/// generated route for
/// [_i2.Dashboard]
class Dashboard extends _i4.PageRouteInfo<void> {
  const Dashboard({List<_i4.PageRouteInfo>? children})
      : super(
          Dashboard.name,
          initialChildren: children,
        );

  static const String name = 'Dashboard';

  static const _i4.PageInfo<void> page = _i4.PageInfo<void>(name);
}

/// generated route for
/// [_i3.MenuProvider]
class MenuRoute extends _i4.PageRouteInfo<void> {
  const MenuRoute({List<_i4.PageRouteInfo>? children})
      : super(
          MenuRoute.name,
          initialChildren: children,
        );

  static const String name = 'MenuRoute';

  static const _i4.PageInfo<void> page = _i4.PageInfo<void>(name);
}
