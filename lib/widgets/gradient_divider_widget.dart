import 'package:calculator_kkongapp/core/app_color.dart';
import 'package:flutter/material.dart';

class GradientDivider extends StatelessWidget {
  const GradientDivider({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Container(
      height: 6,
      decoration: BoxDecoration(gradient: colorScheme.gradient),
    );
  }
}
