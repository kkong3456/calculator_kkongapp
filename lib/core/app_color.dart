import 'package:flutter/material.dart';

class AppColor {
  const AppColor._();
  static const primaryLight = Color(0xff6f4ced);
  static const secondaryLight = Color(0xff937ce6);

  static const primaryDark = Color(0xff6344d4);
  static const secondaryDark = secondaryLight;
}

extension CustomeColorScheme on ColorScheme {
  Gradient get gradient => const LinearGradient(
        begin: Alignment.bottomLeft,
        end: Alignment.topRight,
        colors: [
          // Color(0xffA430ff),
          // Color(0xfff318ad),
          // Color(0xffff2171),
          Color.fromARGB(221, 153, 18, 243),
          Color.fromARGB(221, 239, 92, 92),
          Color.fromARGB(221, 218, 211, 228),
        ],
      );
  Color get grey1 => const Color(0xff171c22);
  Color get grey2 => const Color(0xff212A35);
  Color get grey3 => const Color(0xff2e3a48);
  Color get grey4 => const Color(0xff5a6876);
  Color get grey5 => const Color(0xff828a93);
  Color get grey6 => const Color(0xffeaebed);
  Color get grey7 => const Color(0xfffefeff);

  Color get gridBg => brightness == Brightness.light
      ? const Color(0xffc9baff)
      : const Color(0xff222b36);

  Color get bg => brightness == Brightness.light
      ? const Color(0xffebe5ff)
      : const Color(0xff171c22);

  Color get cursor => brightness == Brightness.light ? primary : secondary;
  Color get historyBorder => brightness == Brightness.light ? secondary : grey4;
  Color get historyIcon => brightness == Brightness.light ? grey7 : grey1;
  Color get historyBg => brightness == Brightness.light ? primary : grey6;
  Color get resultText => brightness == Brightness.light ? primary : grey7;
  Color get buttonText => brightness == Brightness.light ? grey2 : grey6;
  Color get opText => brightness == Brightness.light ? grey4 : grey5;
  Color get switchText => brightness == Brightness.light ? grey4 : grey5;
  Color get buttonBg => brightness == Brightness.light ? grey7 : grey1;
  Color get topButtonBg => brightness == Brightness.light ? grey6 : grey3;
}
