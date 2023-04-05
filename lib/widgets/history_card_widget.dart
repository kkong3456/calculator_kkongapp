import 'package:calculator_kkongapp/core/app_color.dart';
import 'package:calculator_kkongapp/providers/calculation_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HistoryCard extends StatelessWidget {
  const HistoryCard({
    super.key,
    required this.operation,
    required this.result,
  });

  final String operation;
  final String result;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Column(
      children: [
        CustomTextButton(
          text: operation,
          textColor: colorScheme.opText,
        ),
        CustomTextButton(
          text: result,
          textColor: colorScheme.resultText,
          fontSize: 25,
          isResult: true,
        ),
      ],
    );
  }
}

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    super.key,
    required this.text,
    this.isResult = false,
    this.fontSize,
    this.textColor,
  });

  final String text;
  final Color? textColor;
  final double? fontSize;
  final bool isResult;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Material(
      color: colorScheme.topButtonBg,
      child: InkWell(
        onTap: () =>
            Provider.of<Calculations>(context, listen: false).add(text),
        child: Ink(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          child: Text(
            isResult ? '=$text' : text,
            textAlign: TextAlign.end,
            style: TextStyle(color: textColor, fontSize: fontSize),
          ),
        ),
      ),
    );
  }
}
