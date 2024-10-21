// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i4;
import 'package:flutter/material.dart' as _i6;
import 'package:insurance_plan/data/model/insurance_plan_model.dart' as _i5;
import 'package:insurance_plan/widgets/detail_screen.dart' as _i2;
import 'package:insurance_plan/widgets/home_screen.dart' as _i3;
import 'package:insurance_plan/widgets/navigation_bar/bottom_navigation_bar.dart'
    as _i1;

/// generated route for
/// [_i1.BottomNavigationBarScreen]
class BottomNavigationBarRoute extends _i4.PageRouteInfo<void> {
  const BottomNavigationBarRoute({List<_i4.PageRouteInfo>? children})
      : super(
          BottomNavigationBarRoute.name,
          initialChildren: children,
        );

  static const String name = 'BottomNavigationBarRoute';

  static _i4.PageInfo page = _i4.PageInfo(
    name,
    builder: (data) {
      return const _i1.BottomNavigationBarScreen();
    },
  );
}

/// generated route for
/// [_i2.DetailScreen]
class DetailRoute extends _i4.PageRouteInfo<DetailRouteArgs> {
  DetailRoute({
    _i5.InsurancePlanModel? insurancePlan,
    _i6.Key? key,
    List<_i4.PageRouteInfo>? children,
  }) : super(
          DetailRoute.name,
          args: DetailRouteArgs(
            insurancePlan: insurancePlan,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'DetailRoute';

  static _i4.PageInfo page = _i4.PageInfo(
    name,
    builder: (data) {
      final args =
          data.argsAs<DetailRouteArgs>(orElse: () => const DetailRouteArgs());
      return _i2.DetailScreen(
        insurancePlan: args.insurancePlan,
        key: args.key,
      );
    },
  );
}

class DetailRouteArgs {
  const DetailRouteArgs({
    this.insurancePlan,
    this.key,
  });

  final _i5.InsurancePlanModel? insurancePlan;

  final _i6.Key? key;

  @override
  String toString() {
    return 'DetailRouteArgs{insurancePlan: $insurancePlan, key: $key}';
  }
}

/// generated route for
/// [_i3.HomeScreen]
class HomeRoute extends _i4.PageRouteInfo<void> {
  const HomeRoute({List<_i4.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static _i4.PageInfo page = _i4.PageInfo(
    name,
    builder: (data) {
      return const _i3.HomeScreen();
    },
  );
}
