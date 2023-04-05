import 'package:calculator_kkongapp/widgets/button_widget.dart';
import 'package:flutter/material.dart';

class ButtonsGrid extends StatelessWidget {
  const ButtonsGrid({super.key, required this.grid});

  final List<List<String>> grid;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: grid
          .map(
            (row) => Expanded(
              child: Row(
                children: row.map((buttonText) => Button(buttonText)).toList(),
              ),
            ),
          )
          .toList(),
    );
  }
}
