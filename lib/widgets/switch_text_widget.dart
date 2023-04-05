import 'package:calculator_kkongapp/core/app_color.dart';
import 'package:calculator_kkongapp/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SwitchText extends StatelessWidget {
  const SwitchText({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Text(
      themeProvider.switchToText(context),
      style: theme.textTheme.bodyText2!
          .copyWith(color: theme.colorScheme.switchText, fontSize: 14),
    );
  }
}
