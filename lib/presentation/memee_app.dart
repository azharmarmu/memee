import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:memee/_di/get_it.dart';
import 'package:memee/presentation/blocs/theme/theme_cubit.dart';
import 'package:memee/presentation/core/wiredash.dart';

import 'app_routes.dart';
import 'blocs/langauge/language_cubit.dart';
import 'blocs/loading/loading_cubit.dart';
import 'core/fade_pageroute_builder.dart';
import 'journey/loading/loading_screen.dart';
import 'themes/app_theme.dart';

class MemeeApp extends StatelessWidget {
  final _navigatorKey = GlobalKey<NavigatorState>();

  final ThemeCubit _themeCubit = getItInstance<ThemeCubit>();
  final LanguageCubit _languageCubit = getItInstance<LanguageCubit>();
  final LoadingCubit _loadingCubit = getItInstance<LoadingCubit>();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ThemeCubit>.value(value: _themeCubit),
        BlocProvider<LanguageCubit>.value(value: _languageCubit),
        BlocProvider<LoadingCubit>.value(value: _loadingCubit),
      ],
      child: BlocBuilder<ThemeCubit, Themes>(
        builder: (_, theme) {
          return BlocBuilder<LanguageCubit, Locale>(
            builder: (_, locale) {
              return MemeeWiredash(
                navigatorKey: _navigatorKey,
                languageCode: locale.languageCode,
                child: MaterialApp(
                  debugShowCheckedModeBanner: false,
                  navigatorKey: _navigatorKey,
                  theme: apptheme(context, theme),
                  builder: (_, child) => LoadingScreen(screen: child!),
                  initialRoute: RouteList.initial,
                  onGenerateRoute: (settings) => appRoutes(settings),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
