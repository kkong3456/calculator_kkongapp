import 'package:calculator_kkongapp/core/app_color.dart';
import 'package:calculator_kkongapp/providers/history_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ClearHistoryButton extends StatelessWidget {
  const ClearHistoryButton({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return ElevatedButton(
      onPressed: Provider.of<History>(context, listen: false).clearHistory,
      style: ElevatedButton.styleFrom(
        foregroundColor: colorScheme.buttonText,
        backgroundColor: colorScheme.buttonBg,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
      ),
      child: const FittedBox(
        child: const Text('Clear History'),
      ),
    );
  }
}
