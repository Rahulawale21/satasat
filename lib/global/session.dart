import 'package:shared_preferences/shared_preferences.dart';

class Session {
  static int id = 0;
  static String accessToken = "";
  static String refreshToken = "";

  static Future<void> saveSession() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(
      'session',
      <String>[
        id.toString(),
        accessToken,
        refreshToken,
      ],
    );
  }

  static Future<bool> isSessionAvailable() async {
    final prefs = await SharedPreferences.getInstance();
    List<String>? sessions = prefs.getStringList('session');
    if (sessions == null) {
      return false;
    } else {
      id = int.parse(sessions[0]);
      accessToken = sessions[1];
      refreshToken = sessions[2];
      return true;
    }
  }

  static clearSession() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.clear();
    Session.id = 0;
    Session.accessToken = "";
    Session.refreshToken = "";
  }
}
