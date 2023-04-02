import 'package:calculator_kkongapp/core/app_theme.dart';
import 'package:calculator_kkongapp/providers/theme_provider.dart';
import 'package:calculator_kkongapp/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  final isDarkMode = prefs.getBool('isDarkMode');
  late ThemeMode themeMode;

  if (isDarkMode == null) {
    themeMode = ThemeMode.system;
  } else {
    themeMode = isDarkMode ? ThemeMode.dark : ThemeMode.light;
  }

  runApp(
    MultiProvider(
      providers: [
        // ChangeNotifierProvider(create: (_) => Calculations()),
        // ChangeNotifierProvider(create: (_) => History()),
        ChangeNotifierProvider(create: (_) => ThemeProvider(themeMode)),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, theme, child) => MaterialApp(
        themeMode: theme.themeMode,
        theme: AppTheme.lightThemeData,
        darkTheme: AppTheme.darkThemeData,
        home: const SplashScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
