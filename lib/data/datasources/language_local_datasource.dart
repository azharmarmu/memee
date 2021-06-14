import 'package:hive/hive.dart';
import 'package:pedantic/pedantic.dart';

abstract class LanguageLocalDataSource {
  Future<String> getPreferredLanguage();
  Future<void> updatePreferredLanguage(String languageCode);
}

class LanguageLocalDataSourceImpl extends LanguageLocalDataSource {
  @override
  Future<String> getPreferredLanguage() async {
    final languageBox = await Hive.openBox('languageBox');
    return languageBox.get('preferred_language') ?? 'en';
  }

  @override
  Future<void> updatePreferredLanguage(String languageCode) async {
    final languageBox = await Hive.openBox('languageBox');
    unawaited(languageBox.put('preferred_language', languageCode));
  }
}
