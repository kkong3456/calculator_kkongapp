import 'package:calculator_kkongapp/core/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomIcon extends StatelessWidget {
  const CustomIcon(
    this.icon, {
    super.key,
    required this.onPressed,
    this.isSelected = false,
  });

  final String icon;
  final VoidCallback onPressed;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: isSelected ? colorScheme.historyBg.withOpacity(.6) : null,
      ),
      child: IconButton(
        onPressed: onPressed,
        icon: SvgPicture.asset(
          icon,
          color: isSelected ? colorScheme.historyIcon : null,
        ),
        padding: const EdgeInsets.all(5),
      ),
    );
  }
}
