import 'package:flutter/material.dart';
import 'package:serviceprovder/model/servicemodel.dart';

import '../model/bookingmodel.dart';
 

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

  increment(Services quntity) {
    quntity.quantity += 1;
    notifyListeners();
  }

  decrement(Services quntity) {
    quntity.quantity -= 1;
    notifyListeners();
  }

  List<Booking> cartItem = [];

  addToCart(Booking booking) {
    cartItem.add(booking);
    notifyListeners();
  }

  List<Services> reviewList = [];
  addReview(Services addreview) {
    reviewList.add(addreview);
    notifyListeners();
  }
}
