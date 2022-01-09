import 'package:flutter/material.dart';
import 'package:tic_tac_toe/src/screens/game.dart';
import 'package:tic_tac_toe/src/screens/highscores.dart';
import 'package:tic_tac_toe/src/widgets/home/custom_text_button.dart';
import 'package:tic_tac_toe/src/widgets/home/drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Tic Tac Toe")),
      // drawer: const AppDrawer(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomTextButton(
              text: "PLAY",
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const GamePage()),
              ),
            ),
            CustomTextButton(
              text: "High Score",
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const HighScoresPage()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
