import 'package:flutter/material.dart';
import 'package:tic_tac_toe/src/models/highscore_model.dart';
import 'package:tic_tac_toe/src/storage/highscore_storage.dart';
import 'package:timeago/timeago.dart' as timeago;

class HighScoresPage extends StatelessWidget {
  const HighScoresPage({Key? key}) : super(key: key);

  final _contentStyle = const TextStyle(color: Colors.white, fontSize: 15);

  TableCell _tableCell(String text) => TableCell(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: _contentStyle,
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("High Scores")),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: StreamBuilder<List<HighScore>>(
          stream: HighScoreStorage().getHighScores().asStream(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasError) {
              return Center(
                child: Text(
                  "Oops we faced an error ${snapshot.error}",
                  style: _contentStyle,
                ),
              );
            }
            List<HighScore> _scores = snapshot.data ?? [];
            if (_scores.isEmpty) {
              return Center(
                child: Text(
                  "Can't find anything for you :/",
                  style: _contentStyle,
                ),
              );
            }
            return SingleChildScrollView(
              child: Table(
                defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                columnWidths: const {0: FlexColumnWidth(1.5)},
                children: [
                  TableRow(
                      children: ["Time", "Won", "Draw", "Lost", "Score"]
                          .map(
                            (e) => TableCell(
                              child: Text(
                                e,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          )
                          .toList()),
                  ..._scores
                      .map(
                        (e) => TableRow(
                          children: [
                            _tableCell(timeago.format(e.scoredOn)),
                            _tableCell("${e.player}"),
                            _tableCell("${e.draws}"),
                            _tableCell("${e.computer}"),
                            _tableCell("${e.calculateScore()}"),
                          ],
                        ),
                      )
                      .toList(),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
