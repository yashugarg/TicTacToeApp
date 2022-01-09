import 'package:shared_preferences/shared_preferences.dart';
import 'package:tic_tac_toe/src/models/highscore_model.dart';

class HighScoreStorage {
  final String _key = "highscores";
  List<HighScore> _scores = [];
  late SharedPreferences _prefs;

  _init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  Future<List<HighScore>> getHighScores() async {
    await _init();
    List<String> stringList = _prefs.getStringList(_key) ?? [];
    if (stringList != []) {
      _scores = stringList.map<HighScore>((e) => highScoreFromMap(e)).toList();
    }
    return _scores;
  }

  Future<void> setNewScore(HighScore score) async {
    List<HighScore> scores = await getHighScores();
    scores.add(score);
    scores.sort((a, b) => b.calculateScore().compareTo(a.calculateScore()));
    if (scores.length > 10) {
      scores = scores.sublist(0, 10);
    }
    _prefs.setStringList(
      _key,
      scores.map<String>((e) => highScoreToMap(e)).toList(),
    );
  }

  Future<void> clearHighScores() async {
    _prefs.setStringList(_key, []);
  }
}
