import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ocr/core/lang/supported_languages.dart';
import 'package:ocr/core/themes/app_theme.dart';
import 'package:ocr/features/localization/app_localization.dart';
import 'package:ocr/features/localization/cubit/cubit/locale_cubit.dart';
import 'package:ocr/features/onboarding/presentation/pages/onboarding_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final sharedPreferences = await SharedPreferences.getInstance();
  final isShowHome = sharedPreferences.getBool('show_home') ?? false;
  runApp(MyApp(isShowHome: isShowHome),);
}

class MyApp extends StatelessWidget {
  final bool isShowHome;
  const MyApp({
    super.key,
    required this.isShowHome,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LocaleCubit()..getSavedLanguage(),
        ),
      ],
      child: BlocBuilder<LocaleCubit, ChangeLocaleState>(
          builder: (context, state) {
        return ScreenUtilInit(
          designSize: const Size(392.72727272727275, 781.0909090909091),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (context, child) => MaterialApp(
            locale: state.locale,
            supportedLocales: supportedLocales,
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate
            ],
            localeResolutionCallback: (deviceLocale, supportedLocales) {
              for (var locale in supportedLocales) {
                if (deviceLocale != null &&
                    deviceLocale.languageCode == locale.languageCode) {
                  return deviceLocale;
                }
              }
              return supportedLocales.first;
            },
            debugShowCheckedModeBanner: false,
            theme: appTheme,
            
            home: const OnboardingPage(),
          ),
        );
      }),
    );
  }
}
