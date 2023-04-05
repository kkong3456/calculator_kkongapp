import 'package:calculator_kkongapp/core/app_color.dart';
import 'package:calculator_kkongapp/providers/history_provider.dart';
import 'package:calculator_kkongapp/widgets/clear_history_btn_widget.dart';
import 'package:calculator_kkongapp/widgets/empty_history_widget.dart';
import 'package:calculator_kkongapp/widgets/history_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HistoryList extends StatelessWidget {
  const HistoryList({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    final scrollController = ScrollController();

    return FutureBuilder(
      future: Provider.of<History>(context, listen: false).fetchAndSetHistory(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return const EmptyHistory();
        } else {
          return Column(
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  margin: EdgeInsets.only(
                    bottom: isLandscape ? 2 : 15,
                    top: isLandscape ? 3 : 0,
                    right: 10,
                  ),
                  decoration: BoxDecoration(
                    color: colorScheme.topButtonBg,
                    borderRadius: BorderRadius.circular(8),
                    border:
                        Border.all(width: 3, color: colorScheme.historyBorder),
                  ),
                  child:
                      Consumer<History>(builder: (context, historyProvider, _) {
                    if (historyProvider.history.isEmpty) {
                      return const EmptyHistory();
                    } else {
                      return Scrollbar(
                        controller: scrollController,
                        child: ListView.builder(
                            controller: scrollController,
                            shrinkWrap: true,
                            itemCount: historyProvider.history.length,
                            itemBuilder: (BuildContext context, int index) {
                              return HistoryCard(
                                operation:
                                    historyProvider.history[index].operation,
                                result: historyProvider.history[index].result,
                              );
                            }),
                      );
                    }
                  }),
                ),
              ),
              const ClearHistoryButton(),
            ],
          );
        }
      },
    );
  }
}
