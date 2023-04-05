import 'package:calculator_kkongapp/core/app_color.dart';
import 'package:calculator_kkongapp/core/app_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EmptyHistory extends StatelessWidget {
  const EmptyHistory({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          AppIcon.history,
          width: isLandscape ? 30 : 60,
          color: colorScheme.historyBorder,
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          'No History Yet...꽁',
          style: TextStyle(color: colorScheme.historyBorder),
          textAlign: TextAlign.center,
        )
      ],
    );
  }
}
