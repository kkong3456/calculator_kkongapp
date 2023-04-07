import 'package:calculator_kkongapp/core/app_color.dart';
import 'package:calculator_kkongapp/core/app_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

Color getButtonBgColor(String text, BuildContext context) {
  final colorScheme = Theme.of(context).colorScheme;
  switch (text) {
    case '=':
      // return Colors.transparent;
      return Colors.blue;
    case '%':
    case '( )':
    case 'C':
    case 'Rad':
    case 'Deg':
    case '√':
    case '∛':
    case 'switch':
      return colorScheme.topButtonBg;
    case '+':
    case '-':
    case '×':
    case '÷':
      return colorScheme.primary;
    default:
      return colorScheme.buttonBg;
  }
}

Color getTextColor(String text, BuildContext context) {
  final colorScheme = Theme.of(context).colorScheme;
  switch (text) {
    case '=':
    case '+':
    case '-':
    case '×':
    case '÷':
    case 'switch':
      return colorScheme.grey7;
    case 'C':
      return colorScheme.error;
    default:
      return colorScheme.buttonText;
  }
}

double getTextSize(String text) {
  switch (text) {
    case '.':
      return 35;
    case '-':
    case '+':
    case '*':
    case '÷':
      return 27;
    default:
      return 21;
  }
}

Widget getOnButtonWidget(String text, BuildContext context) {
  final textStyle = TextStyle(
    fontSize: getTextSize(text),
    fontWeight: FontWeight.bold,
  );

  //sin 위쪽, Rad왼쪽 스위치
  switch (text) {
    case 'switch':
      return Padding(
        padding: const EdgeInsets.all(3),
        child: ShaderMask(
          shaderCallback: (bounds) =>
              Theme.of(context).colorScheme.gradient.createShader(bounds),
          child: SvgPicture.asset(
            AppIcon.switchLGrid,
            color: getTextColor(text, context),
          ),
        ),
      );
    case 'log10':
      return Text(text,
          style: textStyle.copyWith(fontSize: 15, letterSpacing: 1.1));

    default:
      return Text(text, style: textStyle);
  }
}
