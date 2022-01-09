enum PlayerState { player, computer, empty }

enum WinState { win, loose, draw, incomplete }

String calculateScore(player, computer, draws) =>
    ((100 * player) - (10 * computer) + (5 * draws)).toString();
