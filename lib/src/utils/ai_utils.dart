import 'package:tic_tac_toe/src/utils/constants.dart';

class Utils {
  static const winConditions = [
    //rows
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    //coulms
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    //diagnols
    [0, 4, 8],
    [2, 4, 6],
  ];

  //check if the board has any mavoes left
  static bool isBoardFull(List<PlayerState> board) {
    for (PlayerState val in board) {
      if (val == PlayerState.empty) return false;
    }

    return true;
  }

  //check if the current move is legal
  static bool isMoveLegal(List<PlayerState> board, int move) {
    if (move < 0 || move >= board.length || board[move] != PlayerState.empty) {
      return false;
    }

    return true;
  }

  /// Returns the current state of the board [winning player, draw or no winners yet]
  static WinState evaluateBoard(
      List<PlayerState> board, PlayerState currentPlayer) {
    for (List<int> list in winConditions) {
      if (board[list[0]] != PlayerState.empty &&
          board[list[0]] == board[list[1]] &&
          board[list[0]] == board[list[2]]) {
        if (board[list[0]] == currentPlayer) {
          return WinState.win;
        } else {
          return WinState.loose;
        }
      }
    }
    if (isBoardFull(board)) {
      return WinState.draw;
    }
    return WinState.incomplete;
  }

  /// Returns the opposite player from the current one.
  static PlayerState flipPlayer(PlayerState currentPlayer) {
    if (currentPlayer == PlayerState.computer) {
      return PlayerState.player;
    } else {
      return PlayerState.computer;
    }
  }
}
