import 'package:aba/core/navigation/abc_router.gr.dart';
import 'package:auto_route/auto_route.dart';



@AutoRouterConfig()
class AbcRouter extends $AbcRouter {

@override      
RouteType get defaultRouteType => const RouteType.material();

  @override
  List<AutoRoute> get routes => [

        AutoRoute(initial: true, page: Dashboard.page, path: '/',),
        AutoRoute(page: GameProvider.page, path: '/game')
      ];
}
