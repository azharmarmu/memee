import 'package:get_it/get_it.dart';
import 'package:memee/data/datasources/language_local_datasource.dart';
import 'package:memee/data/datasources/theme_local_datasource.dart';
import 'package:memee/data/repositories/app_repository_impl.dart';
import 'package:memee/domain/repositories/app_repository.dart';
import 'package:memee/domain/usecases/get_preferred_langauge.dart';
import 'package:memee/domain/usecases/get_preferred_theme.dart';
import 'package:memee/domain/usecases/update_preferred_langauge.dart';
import 'package:memee/domain/usecases/update_preferred_theme.dart';
import 'package:memee/presentation/blocs/langauge/language_cubit.dart';
import 'package:memee/presentation/blocs/loading/loading_cubit.dart';
import 'package:memee/presentation/blocs/theme/theme_cubit.dart';

final getItInstance = GetIt.I;

Future init() async {
  _datasources();
  _repositories();
  _useCases();
  _cubit();
}

void _datasources() {
  getItInstance.registerLazySingleton<LanguageLocalDataSource>(
      () => LanguageLocalDataSourceImpl());
  getItInstance.registerLazySingleton<ThemeLocalDataSource>(
      () => ThemeLocalDataSourceImpl());
}

void _repositories() {
  getItInstance.registerLazySingleton<AppRepository>(
    () => AppRepositoryImpl(getItInstance(), getItInstance()),
  );
}

void _useCases() {
  getItInstance.registerLazySingleton<GetPreferredTheme>(
      () => GetPreferredTheme(getItInstance()));

  getItInstance.registerLazySingleton<GetPreferredLanguage>(
      () => GetPreferredLanguage(getItInstance()));

  getItInstance.registerLazySingleton<UpdatePreferredTheme>(
      () => UpdatePreferredTheme(getItInstance()));

  getItInstance.registerLazySingleton<UpdatePreferredLanguage>(
      () => UpdatePreferredLanguage(getItInstance()));
}

void _cubit() {
  getItInstance.registerSingleton<ThemeCubit>(ThemeCubit(
    getPreferredTheme: getItInstance(),
    updatePreferredTheme: getItInstance(),
  ));
  getItInstance.registerSingleton<LanguageCubit>(LanguageCubit(
    updatePreferredLanguage: getItInstance(),
    getPreferredLanguage: getItInstance(),
  ));
  getItInstance.registerSingleton<LoadingCubit>(LoadingCubit());
}
