import 'providermodel.dart';
import 'servicemodel.dart';

class Booking {
  List<Services> service;
  DateTime? time;
  DateTime? date;
// String status;
  List<Providerman> provider;
  Booking(
      {this.date, this.time, required this.provider, required this.service});
}

List<Booking> booking = [
  Booking(
      date: DateTime.now(),
      time: DateTime.now(),
      provider: provider,
      service: serviceList)
];
