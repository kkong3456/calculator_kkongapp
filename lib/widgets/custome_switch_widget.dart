import 'package:calculator_kkongapp/core/index.dart';
import 'package:calculator_kkongapp/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//맨위,왼쪽 배경색 스위치 위젯
class CustomSwitch extends StatelessWidget {
  const CustomSwitch({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final themeProvider = Provider.of<ThemeProvider>(context);
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return GestureDetector(
      onTap: () {
        themeProvider.toggleTheme(!isDarkMode);
      },
      child: Container(
        margin: const EdgeInsets.all(6),
        height: 23,
        width: 65,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: colorScheme.gradient,
        ),
        child: AnimatedAlign(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          alignment: isDarkMode ? Alignment.centerRight : Alignment.centerLeft,
          child: Container(
            margin: const EdgeInsets.all(3),
            height: 20,
            width: 20,
            decoration:
                BoxDecoration(shape: BoxShape.circle, color: colorScheme.bg),
          ),
        ),
      ),
    );
  }
}
