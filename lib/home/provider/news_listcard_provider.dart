import 'package:flutter/material.dart';

class NewsListCardProvider extends ChangeNotifier {
  bool isBookmarked = false;

  void toogleBookmark() {
    isBookmarked = !isBookmarked;
    notifyListeners();
  }
}
