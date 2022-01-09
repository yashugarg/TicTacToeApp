import 'package:tic_tac_toe/src/utils/ai_utils.dart';
import 'package:tic_tac_toe/src/utils/constants.dart';

class TicTacToeAi {
  static const _winScore = 10;
  static const _looseScore = -10;
  static const _drawScore = 0;

  /// Returns the optimal move based on the state of the board.
  int play(List<PlayerState> board, PlayerState currentPlayer) {
    return _getBestMove(board, currentPlayer).move;
  }

  int _getBestScore(List<PlayerState> board, PlayerState currentPlayer) {
    WinState evaluation = Utils.evaluateBoard(board, currentPlayer);

    if (evaluation == WinState.win) return _winScore;

    if (evaluation == WinState.draw) return _drawScore;

    if (evaluation == WinState.loose) return _looseScore;

    return _getBestMove(board, currentPlayer).score;
  }

  /// This is where the actual Minimax algorithm is implemented
  Move _getBestMove(List<PlayerState> board, PlayerState currentPlayer) {
    // try all possible moves
    List<PlayerState> newBoard;
    // will contain our next best score
    Move bestMove = Move(score: -10000, move: -1);

    for (int currentMove = 0; currentMove < board.length; currentMove++) {
      if (!Utils.isMoveLegal(board, currentMove)) continue;

      // we need a copy of the initial board so we don't pollute our real board
      newBoard = List.from(board);

      // make the move
      newBoard[currentMove] = currentPlayer;

      // solve for the next player
      // what is a good score for the opposite player is opposite of good score for us
      int nextScore = -_getBestScore(newBoard, Utils.flipPlayer(currentPlayer));

      // check if the current move is better than our best found move
      if (nextScore > bestMove.score) {
        bestMove.score = nextScore;
        bestMove.move = currentMove;
      }
    }

    return bestMove;
  }
}

class Move {
  int score;
  int move;

  Move({required this.score, required this.move});
}
