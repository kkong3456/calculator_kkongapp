import 'package:calculator_kkongapp/core/index.dart';
import 'package:calculator_kkongapp/providers/calculation_provider.dart';
import 'package:calculator_kkongapp/providers/history_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Button extends StatelessWidget {
  const Button(this.text, {super.key});
  final String text;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final calc = Provider.of<Calculations>(context, listen: false);
    final history = Provider.of<History>(context, listen: false);

    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(3),
        height: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          gradient: text == '=' ? colorScheme.gradient : null,
        ),
        child: ElevatedButton(
          onPressed: () {
            calc.onButtonPressed(text);
            if (text == '=') {
              history.addHistoryItem(calc.input, calc.result);
            }
          },
          style: ElevatedButton.styleFrom(
            foregroundColor: getTextColor(text, context),
            elevation: 0,
            backgroundColor: getButtonBgColor(text, context),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          child: FittedBox(
            child: getOnButtonWidget(text, context),
          ),
        ),
      ),
    );
  }
}
