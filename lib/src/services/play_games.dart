import 'package:flutter/cupertino.dart';
import 'package:googleapis/games/v1.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:extension_google_sign_in_as_googleapis_auth/extension_google_sign_in_as_googleapis_auth.dart';
import 'package:_discoveryapis_commons/_discoveryapis_commons.dart' as commons;

class PlayServices {
  static final googleSignIn = GoogleSignIn(scopes: [GamesApi.gamesScope]);

  static Future<GoogleSignInAccount?> login() => googleSignIn.signIn();

  getLeaderboard() async {
    var httpClient = (await googleSignIn.authenticatedClient())!;
    final _gamesApi = GamesApi(httpClient);
    var score = ScoresResource(commons.ApiRequester(
      httpClient,
      'https://games.googleapis.com/',
      '',
      {
        'user-agent': 'google-api-dart-client/7.0.0',
        'x-goog-api-client': 'gl-dart/${commons.dartVersion} gdcl/7.0.0',
      },
    ));
    score.submit("Scores", "10");
  }
}
