import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:satasat_app/main.dart';
import 'package:satasat_app/screens/splash_screen/splash_screen.dart';

import '../api/api.dart';
import '../constant/snackbar.dart';
import '../global/session.dart';

class AuthService {
  Future<bool> checkSession() async {
    return await Session.isSessionAvailable();
  }

  Future<bool> loginWithEmailAndPassword(String email, String password) async {
    try {
      Response response = await API().post(
        path: "accounts/login-user/",
        data: {"email": email, "password": password},
      );
      if (response.statusCode == 200) {
        Session.id = response.data['token']['id'];
        Session.accessToken = response.data['token']['access_token'];
        Session.refreshToken = response.data['token']['refresh_token'];
        Session.saveSession();
        return true;
      } else {
        showSnackbar(response.data['message']);
        return false;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return false;
  }

  Future<void> logout() async {
    await Session.clearSession();
    Navigator.pushAndRemoveUntil(snackbarMessanger.currentState!.context,
        MaterialPageRoute(builder: (_) {
      return const SplashScreen();
    }), (route) => false);
  }
}
