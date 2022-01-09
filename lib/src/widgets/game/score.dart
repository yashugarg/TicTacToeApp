import 'package:flutter/material.dart';

class ScoreStat extends StatelessWidget {
  const ScoreStat(
      {required this.player,
      required this.draws,
      required this.computer,
      Key? key})
      : super(key: key);

  final int player, draws, computer;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Padding(
                padding: EdgeInsets.all(5.0),
                child: Icon(
                  Icons.account_circle_rounded,
                  size: 50,
                  color: Colors.white,
                ),
              ),
              Column(
                children: [
                  Text(
                    player.toString(),
                    style: const TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                    ),
                  ),
                  const Text(
                    "You",
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ],
          ),
          Container(
            height: 50,
            width: 2,
            color: Colors.white,
          ),
          Column(
            children: [
              Text(
                draws.toString(),
                style: const TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                ),
              ),
              const Text(
                "Draws",
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                ),
              )
            ],
          ),
          Container(
            height: 50,
            width: 2,
            color: Colors.white,
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Column(
                children: [
                  Text(
                    computer.toString(),
                    style: const TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                    ),
                  ),
                  const Text(
                    "Computer",
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
              const Padding(
                padding: EdgeInsets.all(5.0),
                child: Icon(
                  Icons.computer_rounded,
                  size: 50,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
