import 'package:flutter/material.dart';
import 'package:tic_tac_toe/src/models/highscore_model.dart';
import 'package:tic_tac_toe/src/storage/highscore_storage.dart';

class DialogHelper {
  static confirmExit(context, HighScore currentScore) {
    return showDialog<bool>(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Colors.grey.shade800,
            title: const Text(
              "Confirm Exit",
              style: TextStyle(color: Colors.white),
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Are you sure you want to end this game?',
                  style: TextStyle(color: Colors.white),
                ),
                const SizedBox(height: 10),
                Text(
                  "Your current score is ${currentScore.calculateScore()}",
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
            actions: <Widget>[
              TextButton(
                child: const Text('End Game'),
                onPressed: () async {
                  await HighScoreStorage().setNewScore(currentScore);
                  Navigator.of(context).pop(true);
                },
              ),
              TextButton(
                child: const Text('Return to Game'),
                onPressed: () => Navigator.of(context).pop(false),
              ),
            ],
          );
        });
  }

  static rules(context) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.grey.shade800,
          title: const Text(
            "HOW TO PLAY",
            style: TextStyle(color: Colors.white),
          ),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Text(
                  '''
You are "X" and the computer is "O". Players take turns putting their marks in empty squares.
The first player to get 3 of thier marks in a row (up, down, across, diagonally) wins the game.
When all 9 sqaures are full, the game is over. If no player has 3 marks in row, the game ends in a tie.
          
Player gets 100 points for each win and 5 for each draw. For every game lost, the player loses 10 points.
                  ''',
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Ok'),
              onPressed: () => Navigator.pop(context),
            ),
          ],
        );
      },
    );
  }
}
