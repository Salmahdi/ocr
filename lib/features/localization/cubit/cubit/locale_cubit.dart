import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:ocr/features/localization/helper/language_cached_helper.dart';

part 'locale_state.dart';

class LocaleCubit extends Cubit<ChangeLocaleState> {
  LocaleCubit()
      : super(
          ChangeLocaleState(
            locale: const Locale('en'),
          ),
        );

  // Get Lang
  Future<void> getSavedLanguage() async {
    final String cachedLanguageCode =
        await LanguageCachedHelper().getCachedLanguageCode();

    emit(
      ChangeLocaleState(
        locale: Locale(cachedLanguageCode),
      ),
    );
  }

  // Set Lang
  Future<void> changeLanguage(String languageCode) async {
    await LanguageCachedHelper().cacheLanguageCode(languageCode);

    emit(
      ChangeLocaleState(
        locale: Locale(languageCode),
      ),
    );
  }
}
