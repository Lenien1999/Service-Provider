import 'package:flutter/material.dart';
import 'package:serviceprovder/model/servicemodel.dart';

import '../model/bookingmodel.dart';
import '../model/review.dart';

class MainScreenController extends ChangeNotifier {
  List<Services> _services = [];
  List<Services> get services => _services;

  List<Review> _reviews = [];
  List<Review> get reviews => _reviews;

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

  // Add a service to the list
  void addService(Services service) {
    _services.add(service);
    notifyListeners();
  }

  void addReviewToService(Review review, Services service) {
    service.review.add(review);
    notifyListeners();
  }
}
