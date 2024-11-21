import 'package:auto_route/auto_route.dart';
import 'package:weather_app_ajaya/core/routes/app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AdaptiveRoute(page: Homepage.page),
        AdaptiveRoute(page: HelpRoute.page, initial: true),
      ];
}
