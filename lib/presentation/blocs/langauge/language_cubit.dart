import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:memee/_common/languages.dart';
import 'package:memee/domain/entities/langauge_entity.dart';
import 'package:memee/domain/entities/no_params.dart';
import 'package:memee/domain/usecases/get_preferred_langauge.dart';
import 'package:memee/domain/usecases/update_preferred_langauge.dart';

part 'language_state.dart';

class LanguageCubit extends Cubit<Locale> {
  final GetPreferredLanguage getPreferredLanguage;
  final UpdatePreferredLanguage updatePreferredLanguage;

  LanguageCubit({
    required this.getPreferredLanguage,
    required this.updatePreferredLanguage,
  }) : super(
          Locale(Languages.languages[0].code),
        );

  Future<void> toggleLanguage(LanguageEntity language) async {
    await updatePreferredLanguage(language.code);
    loadPreferredLanguage();
  }

  void loadPreferredLanguage() async {
    final response = await getPreferredLanguage(NoParams());
    emit(response.fold(
      (l) => Locale(Languages.languages[0].code),
      (r) => Locale(r),
    ));
  }
}
