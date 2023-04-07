import 'package:calculator_kkongapp/core/app_color.dart';
import 'package:calculator_kkongapp/core/app_theme.dart';
import 'package:calculator_kkongapp/providers/calculation_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//결과값화면
class AnswerText extends StatelessWidget {
  const AnswerText({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final calc = Provider.of<Calculations>(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 2),
      alignment: Alignment.topRight,
      child: calc.approxResult.isEmpty
          ? const SizedBox.shrink()
          : AnimatedDefaultTextStyle(
              duration: const Duration(milliseconds: 250),
              style: TextStyle(
                fontFamily: AppTheme.fontFamily,
                fontWeight: FontWeight.w800,
                fontSize: calc.isShowingResult ? 40 : 25,
                color: calc.isShowingResult
                    ? colorScheme.resultText
                    : colorScheme.switchText,
              ),
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  calc.approxResult,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
    );
  }
}
