import 'providermodel.dart';
import 'servicemodel.dart';

class Booking {
  List<Services> service;
  String time;
  String date;
  List<Providerman> provider;
  Booking(
      {required this.date,
      required this.time,
      required this.provider,
      required this.service});
}

List<Booking> booking = [
  Booking(
      date: "23 oct., 2023",
      time: '12:30',
      provider: provider,
      service: serviceList)
];

class HouseMan {
  String name;
  String dp;
  HouseMan({required this.dp, required this.name});
}
