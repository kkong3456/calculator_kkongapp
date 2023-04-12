import 'package:calculator_kkongapp/providers/calculation_provider.dart';
import 'package:calculator_kkongapp/providers/history_provider.dart';
import 'package:calculator_kkongapp/widgets/banner_ad_widget.dart';
import 'package:calculator_kkongapp/widgets/button_grid_widget.dart';
import 'package:calculator_kkongapp/widgets/custom_icon_widget.dart';
import 'package:calculator_kkongapp/widgets/custome_switch_widget.dart';
import 'package:calculator_kkongapp/widgets/gradient_divider_widget.dart';
import 'package:calculator_kkongapp/widgets/input_feild_widget.dart';
import 'package:calculator_kkongapp/widgets/last_answer_widget.dart';
import 'package:calculator_kkongapp/widgets/responsive_widget.dart';
import 'package:calculator_kkongapp/widgets/switch_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../core/index.dart';

import '../widgets/answer_text.dart';

import '../widgets/custom_animated_switcher.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final calc = Provider.of<Calculations>(context, listen: false);
    final history = Provider.of<History>(context);

    final lGrid = Provider.of<Calculations>(context).lGrid;

    final colorScheme = Theme.of(context).colorScheme;
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    if (isLandscape) {
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.landscapeRight,
        DeviceOrientation.landscapeLeft,
      ]);
    } else {
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitDown,
        DeviceOrientation.portraitUp,
      ]);
    }

    void _onExpand() {
      if (isLandscape) {
        SystemChrome.setPreferredOrientations([
          DeviceOrientation.portraitDown,
          DeviceOrientation.portraitUp,
        ]);
      } else {
        SystemChrome.setPreferredOrientations([
          DeviceOrientation.landscapeRight,
          DeviceOrientation.landscapeLeft,
        ]);
      }
    }

    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (isLandscape)
              Expanded(
                flex: 7,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          CustomSwitch(),
                          SwitchText(), //밝게/어둡게
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          const Expanded(flex: 5, child: InputFeild()), //입력화면
                          Expanded(
                              flex: isLandscape ? 4 : 2,
                              child: const AnswerText()), //결과 화면
                        ],
                      ),
                    ),
                  ],
                ),
              )
            else ...[
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  CustomSwitch(),
                  SwitchText(),
                ],
              ),
              const Expanded(flex: 4, child: InputFeild()),
              const Expanded(flex: 2, child: AnswerText()),
            ],
            if (!isLandscape) const SizedBox(height: 5),
            //divider start
            const GradientDivider(),
            Expanded(
              flex: isLandscape ? 14 : 12,
              child: Container(
                color: colorScheme.gridBg,
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                child: Column(
                  children: [
                    Container(
                      height: 33,
                      margin: EdgeInsets.symmetric(
                          horizontal: 3, vertical: isLandscape ? 0 : 5),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CustomIcon(
                            AppIcon.history,
                            onPressed: history.toggleShowHistory,
                            isSelected: history.isShowHistory,
                          ),
                          const SizedBox(width: 10),
                          CustomIcon(
                            AppIcon.expand,
                            onPressed: _onExpand,
                            isSelected: isLandscape,
                          ),
                          const Spacer(),
                          Consumer<Calculations>(
                            builder: (context, calc, child) {
                              return LastAnswer(calc.result,
                                  onPressed: calc.addAns);
                            },
                          ),
                          const SizedBox(width: 15),
                          CustomIcon(AppIcon.delete, onPressed: calc.delete),
                        ],
                      ),
                    ),

                    // 입력자판 시작
                    if (!isLandscape) const SizedBox(height: 15),
                    Expanded(
                      child: Responsive(
                        portrait: Row(
                          children: [
                            Expanded(
                              flex: 4,
                              child: CustomAnimatedSwitcher(
                                grid: ButtonsGrid(grid: lGrid),
                              ),
                            ),
                            Expanded(
                              flex: 3,
                              child: CustomAnimatedSwitcher(
                                grid: ButtonsGrid(grid: AppConstant.grid),
                              ),
                            ),
                            Expanded(
                              child: ButtonsGrid(grid: AppConstant.opGrid),
                            ),
                          ],
                        ),
                        landscape: Row(
                          children: [
                            Expanded(
                              flex: 38,
                              child: CustomAnimatedSwitcher(
                                grid: ButtonsGrid(grid: lGrid), //sin,asin
                              ),
                            ),
                            const Expanded(
                              flex: 30,
                              child:
                                  ButtonsGrid(grid: AppConstant.grid), //0123..
                            ),
                            const Expanded(
                              flex: 10,
                              child:
                                  ButtonsGrid(grid: AppConstant.opGrid), //+=*/
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: isLandscape ? 2 : 5),
                    Container(
                      alignment: Alignment.bottomCenter,
                      child: BannerAdWidget(),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
