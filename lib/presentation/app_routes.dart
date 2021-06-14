import 'package:flutter/material.dart';

import 'core/fade_pageroute_builder.dart';
import 'journey/login/login_screen.dart';

class AppRoutes {
  static Map<String, WidgetBuilder> getRoutes(RouteSettings setting) => {
        RouteList.initial: (_) => LoginScreen(),
      };
}

class RouteList {
  RouteList._();

  static const String initial = '/';
  static const String home = '/home';
  static const String movieDetail = '/movie-detail';
  static const String watchTrailer = '/watch-trailer';
  static const String favorite = '/favorite';
}

appRoutes(RouteSettings settings) {
  final routes = AppRoutes.getRoutes(settings);
  final WidgetBuilder? builder = routes[settings.name];
  return FadePageRouteBuilder(
    builder: builder!,
    settings: settings,
  );
}
