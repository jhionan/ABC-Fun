// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aba/features/dashboard/presentation/view/dashboard.dart' as _i2;
import 'package:aba/features/game/presentation/view/game_provider.dart' as _i1;
import 'package:auto_route/auto_route.dart' as _i3;

abstract class $AbcRouter extends _i3.RootStackRouter {
  $AbcRouter({super.navigatorKey});

  @override
  final Map<String, _i3.PageFactory> pagesMap = {
    GameProvider.name: (routeData) {
      return _i3.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.GameProvider(),
      );
    },
    Dashboard.name: (routeData) {
      return _i3.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.Dashboard(),
      );
    },
  };
}

/// generated route for
/// [_i1.GameProvider]
class GameProvider extends _i3.PageRouteInfo<void> {
  const GameProvider({List<_i3.PageRouteInfo>? children})
      : super(
          GameProvider.name,
          initialChildren: children,
        );

  static const String name = 'GameProvider';

  static const _i3.PageInfo<void> page = _i3.PageInfo<void>(name);
}

/// generated route for
/// [_i2.Dashboard]
class Dashboard extends _i3.PageRouteInfo<void> {
  const Dashboard({List<_i3.PageRouteInfo>? children})
      : super(
          Dashboard.name,
          initialChildren: children,
        );

  static const String name = 'Dashboard';

  static const _i3.PageInfo<void> page = _i3.PageInfo<void>(name);
}
