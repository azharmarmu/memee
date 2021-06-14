import 'package:hive/hive.dart';
import 'package:pedantic/pedantic.dart';

abstract class ThemeLocalDataSource {
  Future<String> getPreferredTheme();
  Future<void> updatePreferredTheme(String themeName);
}

class ThemeLocalDataSourceImpl extends ThemeLocalDataSource {
  @override
  Future<String> getPreferredTheme() async {
    final themeBox = await Hive.openBox('themeBox');
    return themeBox.get('preferred_theme') ?? 'dark';
  }

  @override
  Future<void> updatePreferredTheme(String themeName) async {
    final themeBox = await Hive.openBox('themeBox');
    unawaited(themeBox.put('preferred_theme', themeName));
  }
}
