import 'package:flutter/material.dart';

class NewsSlideIconProvider extends ChangeNotifier {
  bool isClicked = false;

  void toogleClick() {
    isClicked = !isClicked;
    notifyListeners();
  }
}
