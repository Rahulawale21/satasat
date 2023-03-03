import 'package:flutter/material.dart';

import '../main.dart';

void showSnackbar(String message) {
  snackbarMessanger.currentState!
      .showSnackBar(SnackBar(content: Text(message)));
}

void hideSnackbar() {
  snackbarMessanger.currentState!.hideCurrentSnackBar();
}
