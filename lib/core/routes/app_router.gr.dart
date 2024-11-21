// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i3;
import 'package:weather_app_ajaya/features/help_page/presentation/help_page.dart'
    as _i1;
import 'package:weather_app_ajaya/features/homepage/presentation/homepage.dart'
    as _i2;

/// generated route for
/// [_i1.HelpPage]
class HelpRoute extends _i3.PageRouteInfo<void> {
  const HelpRoute({List<_i3.PageRouteInfo>? children})
      : super(
          HelpRoute.name,
          initialChildren: children,
        );

  static const String name = 'HelpRoute';

  static _i3.PageInfo page = _i3.PageInfo(
    name,
    builder: (data) {
      return const _i1.HelpPage();
    },
  );
}

/// generated route for
/// [_i2.Homepage]
class Homepage extends _i3.PageRouteInfo<void> {
  const Homepage({List<_i3.PageRouteInfo>? children})
      : super(
          Homepage.name,
          initialChildren: children,
        );

  static const String name = 'Homepage';

  static _i3.PageInfo page = _i3.PageInfo(
    name,
    builder: (data) {
      return const _i2.Homepage();
    },
  );
}
