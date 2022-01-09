import 'package:flutter/material.dart';
import 'package:tic_tac_toe/src/services/play_games.dart';
import 'package:tic_tac_toe/src/widgets/home/drawer_tile.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.grey.shade800,
        child: ListView(
          padding: const EdgeInsets.only(top: 8, left: 8),
          children: [
            const Text(
              "Tic Tac Toe",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey),
            ),
            DrawerTile(
              icon: Icons.share,
              text: "Share with friends",
              onTap: () {},
            ),
            const Divider(color: Colors.grey),
            const Text(
              "Google Play Services",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey),
            ),
            DrawerTile(
              icon: Icons.leaderboard,
              text: "Leaderboard",
              onTap: () async {
                await PlayServices().getLeaderboard();
              },
            ),
            PlayServices.googleSignIn.currentUser == null
                ? DrawerTile(
                    icon: Icons.login_rounded,
                    text: "Sign In",
                    onTap: () async {
                      var user = await PlayServices.login();
                      print(user);
                    },
                  )
                : DrawerTile(
                    icon: Icons.login_rounded,
                    text: "Sign Out",
                    onTap: () {},
                  ),
          ],
        ),
      ),
    );
  }
}
