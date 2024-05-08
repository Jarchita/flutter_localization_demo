import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'blocs/localization/localization_bloc.dart';
import 'exports/app_localizations.dart';
import 'home_screen.dart';
import 'service_locator.dart';

void main() {
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => locator<LocalizationBloc>(),
        ),
      ],
      child: BlocBuilder<LocalizationBloc, LocalizationBlocState>(
        builder: (context, state) => MaterialApp(
          onGenerateTitle: (context) {
            return AppLocalizations.of(context)?.appTitle ?? "";
          },
          debugShowCheckedModeBanner: false,
          locale: (state as LatestLocalizationState).currentLocale,
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            // 'en' is the language code. We could optionally provide a
            // a country code as the second param, e.g.
            // Locale('en', 'US'). If we do that, we may want to
            // provide an additional app_en_US.arb file for
            // region-specific translations.
            Locale('en', ''),
            Locale('de', ''), //update the locale here
          ],
          theme: ThemeData(
            primaryColor: Colors.cyan,
            appBarTheme: const AppBarTheme(
              color: Colors.transparent,
              elevation: 0,
              centerTitle: true,
              titleTextStyle: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.w400,
              ),
            ),
            dividerColor: Colors.grey,
          ),
          home: const HomePage(),
        ),
      ),
    );
  }
}
