import 'package:calculator_kkongapp/providers/history_provider.dart';
import 'package:calculator_kkongapp/widgets/history_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomAnimatedSwitcher extends StatelessWidget {
  const CustomAnimatedSwitcher({super.key, required this.grid});

  final Widget grid;

  @override
  Widget build(BuildContext context) {
    final history = Provider.of<History>(context);

    return AnimatedSwitcher(
      switchInCurve: Curves.easeInOut,
      switchOutCurve: Curves.easeInOut,
      duration: const Duration(milliseconds: 150),
      transitionBuilder: (Widget child, Animation<double> animation) =>
          ScaleTransition(
        scale: animation,
        child: child,
      ),
      child: history.isShowHistory ? const HistoryList() : grid,
    );
  }
}
