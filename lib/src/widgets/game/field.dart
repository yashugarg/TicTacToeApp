import 'package:flutter/material.dart';
import 'package:tic_tac_toe/src/utils/constants.dart';

class Field extends StatelessWidget {
  final List<PlayerState> board;
  final Function(int idx) onTap;

  const Field({Key? key, required this.board, required this.onTap})
      : super(key: key);

  void _handleTap(idx) {
    if (board[idx] == PlayerState.empty) onTap(idx);
  }

  _getSymbol(idx) {
    switch (board[idx]) {
      case PlayerState.player:
        return "X";
      case PlayerState.computer:
        return "O";
      case PlayerState.empty:
        return "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: GridView.count(
          crossAxisCount: 3,
          // generate the widgets that will display the board
          children: List.generate(9, (idx) {
            return GestureDetector(
              onTap: () => _handleTap(idx),
              child: Container(
                margin: const EdgeInsets.all(0.0),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.amber,
                    width: 5.0,
                    style: BorderStyle.solid,
                  ),
                ),
                child: Center(
                  child: Text(
                    _getSymbol(idx),
                    style: const TextStyle(fontSize: 50, color: Colors.amber),
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
