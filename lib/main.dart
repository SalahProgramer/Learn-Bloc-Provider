import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:learnblocprovider/bloc/counter_bloc.dart';
import 'package:learnblocprovider/pages/home_page.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterBloc(),
      child: MaterialApp(
        title: 'Flutter Demo',
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate
        ],
        locale: Locale( "ar"),
        supportedLocales: const [Locale("en"), Locale("ar")],
        localeResolutionCallback: (currentLang, supportLang) {
          if (currentLang != null) {
            for (Locale locale in supportLang) {
              if (locale.languageCode == currentLang.languageCode) {
                return currentLang;
              }
            }
          }
          return supportLang.first;
        },
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            useMaterial3: true,
            appBarTheme:
                AppBarTheme(color: Colors.blue, foregroundColor: Colors.white),
            floatingActionButtonTheme: FloatingActionButtonThemeData(
                foregroundColor: Colors.white, backgroundColor: Colors.blue)),
        home: const HomePage(),
      ),
    );
  }
}
