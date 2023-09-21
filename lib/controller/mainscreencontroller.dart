import 'package:flutter/material.dart';

class MainScreenController extends ChangeNotifier {
  int _pageIndex = 0;
  int get pageIndex => _pageIndex;

  set pageIndex(int index) {
    _pageIndex = index;
    notifyListeners();
  }

  int _booking = 0;
  int get bookingPage => _booking;

  set bookingPage(int index) {
    _booking = index;
    notifyListeners();
  }
}
