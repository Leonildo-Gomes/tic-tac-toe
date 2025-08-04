import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tic_tac_toe/core/theme/theme.dart';
import 'package:tic_tac_toe/core/utils/context_extensions.dart';
import 'package:tic_tac_toe/core/utils/util.dart';
import 'package:tic_tac_toe/l10n/app_localizations.dart';
import 'package:tic_tac_toe/providers/locale/locale_provider.dart';
import 'package:tic_tac_toe/providers/theme/theme_provider.dart';
import 'package:tic_tac_toe/screens/historic/historic_screen.dart';
import 'package:tic_tac_toe/screens/home/home_screen.dart';
import 'package:tic_tac_toe/screens/menu/menu_screen.dart';
import 'package:tic_tac_toe/screens/settings/settings_screen.dart';
import 'package:tic_tac_toe/screens/splash/splash_screen.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locale = ref.watch(localeProvider);
    final theme = ref.watch(themeProvider);
    TextTheme textTheme = createTextTheme(context, "Roboto", "Luckiest Guy");
    MaterialTheme appTheme = MaterialTheme(textTheme);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      locale: locale,
      themeMode: theme.themeMode,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      onGenerateTitle: (context) => context.l10n.appTitle,
      theme: appTheme.light(),
      darkTheme: appTheme.dark(),
      initialRoute: SplashScreen.routeName,
      routes: {
        SplashScreen.routeName: (context) => const SplashScreen(),
        HomeScreen.routeName: (context) => const HomeScreen(),
        MenuScreen.routeName: (context) => const MenuScreen(),
        HistoricScreen.routeName: (context) => const HistoricScreen(),
        SettingsScreen.routeName: (context) => const SettingsScreen(),
      },
    );
  }
}
