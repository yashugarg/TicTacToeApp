import 'dart:convert';

HighScore highScoreFromMap(String str) => HighScore.fromMap(json.decode(str));

String highScoreToMap(HighScore data) => json.encode(data.toMap());

class HighScore {
  HighScore({
    required this.scoredOn,
    required this.player,
    required this.draws,
    required this.computer,
  });

  final DateTime scoredOn;
  final int player;
  final int draws;
  final int computer;

  int calculateScore() => ((100 * player) - (10 * computer) + (5 * draws));

  factory HighScore.fromMap(Map<String, dynamic> json) => HighScore(
        scoredOn: DateTime.parse(json["scored_on"]),
        player: json["player"],
        draws: json["draws"],
        computer: json["computer"],
      );

  Map<String, dynamic> toMap() => {
        "scored_on": scoredOn.toString(),
        "player": player,
        "draws": draws,
        "computer": computer,
      };
}
