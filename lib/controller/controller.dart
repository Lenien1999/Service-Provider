import 'package:flutter/material.dart';

class PageNotifier extends ChangeNotifier {
  int _currentPage = 0;

  int get currentPage => _currentPage;
  set currentPage(int page) {
    _currentPage = page;
    notifyListeners();
  }
}
