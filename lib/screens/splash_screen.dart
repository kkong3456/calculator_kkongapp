import 'package:calculator_kkongapp/animations/fade_transition.dart';
import 'package:calculator_kkongapp/core/app_icon.dart';
import 'package:calculator_kkongapp/screens/home_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 5300)).then((value) =>
        Navigator.of(context).pushReplacement(
            CustomRoute(builder: ((context) => const HomeScreen()))));
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final theme = Theme.of(context);

    return Scaffold(
        body: Align(
      alignment: Alignment.center,
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: Column(
          children: [
            Image.asset(
              isDarkMode ? AppIcon.logoDark : AppIcon.logoWhite,
              height: 130,
              width: 130,
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              'kkong\'s Calculator',
              style: theme.textTheme.headline4,
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              'A fully functional calculator app\nmade using Flutter',
              style: theme.textTheme.caption!.copyWith(fontSize: 14),
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    ));
  }
}
