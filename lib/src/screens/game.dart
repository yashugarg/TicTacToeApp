import 'package:flutter/material.dart';
import 'package:tic_tac_toe/src/models/highscore_model.dart';
import 'package:tic_tac_toe/src/services/ai.dart';
import 'package:tic_tac_toe/src/utils/ai_utils.dart';
import 'package:tic_tac_toe/src/utils/constants.dart';
import 'package:tic_tac_toe/src/utils/dialogs.dart';
import 'package:tic_tac_toe/src/widgets/game/field.dart';
import 'package:tic_tac_toe/src/widgets/game/game_over.dart';
import 'package:tic_tac_toe/src/widgets/game/score.dart';

class GamePage extends StatefulWidget {
  const GamePage({Key? key}) : super(key: key);

  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  int player = 0;
  int draws = 0;
  int computer = 0;

  PlayerState _currentPlayer = PlayerState.player;

  List<PlayerState> board = List.filled(9, PlayerState.empty);

  String _calculateScore() =>
      ((100 * player) - (10 * computer) + (5 * draws)).toString();

  @override
  void initState() {
    super.initState();
  }

  init() {
    _currentPlayer = PlayerState.player;
    board = List.filled(9, PlayerState.empty);
  }

  _gameEnded(eval) async {
    var title = "Game over!";
    var content = "You lose :(";

    switch (eval) {
      case WinState.loose:
        title = "Congratulations!";
        content = "You managed to beat an unbeatable AI!";
        player += 1;
        break;
      case WinState.win:
        title = "Game Over!";
        content = "You lose :(";
        computer += 1;
        break;
      case WinState.draw:
        title = "Draw!";
        content = "No winners here.";
        draws += 1;
        break;
      default:
        title = "Draw!";
        content = "No winners here.";
    }
    await Navigator.push(context, GameOver(title: title, content: content));
    setState(() {
      init();
    });
  }

  _playerMoveHelper(board) async {
    WinState _eval = Utils.evaluateBoard(board, PlayerState.computer);
    if (_eval != WinState.incomplete) {
      _gameEnded(_eval);
      return;
    }

    int _aiMove =
        await Future(() => TicTacToeAi().play(board, PlayerState.computer));
    board[_aiMove] = PlayerState.computer;

    _eval = Utils.evaluateBoard(board, PlayerState.computer);
    if (_eval != WinState.incomplete) {
      _gameEnded(_eval);
    } else {
      _onMoveMade(_aiMove);
    }
  }

  _onMoveMade(idx) {
    setState(() {
      board[idx] = _currentPlayer;
      if (_currentPlayer == PlayerState.player) {
        _currentPlayer = PlayerState.computer;
        _playerMoveHelper(board);
      } else {
        _currentPlayer = PlayerState.player;
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final value = await DialogHelper.confirmExit(
          context,
          HighScore(
            scoredOn: DateTime.now(),
            player: player,
            draws: draws,
            computer: computer,
          ),
        );
        return value == true;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("SCORE: " + _calculateScore()),
          actions: [
            IconButton(
              onPressed: () => DialogHelper.rules(context),
              icon: const Icon(Icons.info_outline_rounded),
            ),
          ],
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(),
            Field(
              board: board,
              onTap: (idx) => _onMoveMade(idx),
            ),
            ScoreStat(player: player, draws: draws, computer: computer)
          ],
        ),
      ),
    );
  }
}
