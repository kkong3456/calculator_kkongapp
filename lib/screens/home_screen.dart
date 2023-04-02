import 'package:calculator_kkongapp/providers/calculation_provider.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final calc = Provider.of<Calculations>(context, listen: false);
    return Container(
      child: Text('xxx'),
    );
  }
}
