import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:learnblocprovider/bloc/counter_bloc.dart';
import 'package:learnblocprovider/cubit_connection/internet_cubit.dart';
import 'package:learnblocprovider/pages/home_page.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'cubit/local_cubit.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
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
          create: (context) => LocalCubit()..getSaveLanguage(),
        ),
        BlocProvider(create: (context) => CounterBloc()),
        // BlocProvider(create: (context) => InternetBloc())
        BlocProvider(create: (context) => InternetCubit()..checkConnection())
      ],
      child: BlocBuilder<LocalCubit, ChangeLocalState>(
        builder: (context, state) {
            return MaterialApp(
              locale: state.locale,
              title: 'Flutter Local cubit',
              localizationsDelegates: const [
                AppLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
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
                elevatedButtonTheme: ElevatedButtonThemeData(style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white

                )),
                appBarTheme: const AppBarTheme(
                  color: Colors.blue,
                  foregroundColor: Colors.white,
                ),
                floatingActionButtonTheme: const FloatingActionButtonThemeData(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.blue,
                ),
              ),
              home: const HomePage(),
            );
        },
      ),
    );
  }
}
