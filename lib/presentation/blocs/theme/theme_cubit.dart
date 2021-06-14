import 'package:bloc/bloc.dart';
import 'package:memee/domain/entities/no_params.dart';
import 'package:memee/domain/usecases/get_preferred_theme.dart';
import 'package:memee/domain/usecases/update_preferred_theme.dart';

enum Themes { light, dark }

class ThemeCubit extends Cubit<Themes> {
  final GetPreferredTheme getPreferredTheme;
  final UpdatePreferredTheme updatePreferredTheme;

  ThemeCubit({
    required this.getPreferredTheme,
    required this.updatePreferredTheme,
  }) : super(Themes.dark);

  Future<void> toggleTheme() async {
    await updatePreferredTheme(state == Themes.dark ? 'light' : 'dark');
    loadPreferredTheme();
  }

  void loadPreferredTheme() async {
    final response = await getPreferredTheme(NoParams());
    emit(
      response.fold(
        (l) => Themes.dark,
        (r) => r == 'dark' ? Themes.dark : Themes.light,
      ),
    );
  }
}
