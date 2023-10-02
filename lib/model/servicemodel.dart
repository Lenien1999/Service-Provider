import 'package:serviceprovder/model/review.dart';

class Services {
  String name;
  String images;
  List<Review>? review;
  double price;
  String description;
  String heading;
  List location;
  int isSelectedLocation;
  int quantity;
  double totalPrice;
  double discount;
  Services(
      {this.isSelectedLocation = -1,
      this.quantity = 1,
      this.totalPrice = 0.0,
      this.discount = 0.0,
      required this.location,
      required this.name,
      this.review = const [],
      required this.heading,
      required this.description,
      required this.price,
      required this.images});
}

List<Services> serviceList = [
  Services(
    name: 'Painting',
    description: 'Uninstallation and Flickering TV Display Screen',
    price: 20.0,
    images: "assets/images/home1.png",
    heading: '',
    location: ['Ibadan', 'Lagos', 'Abuja'],
  ),
  Services(
      name: 'Smart Home',
      description: 'Uninstallation and Flickering TV Display Screen',
      price: 3000.0,
      images: "assets/images/paintin2.png",
      heading: '',
      location: ['Ibadan', 'Lagos', 'Abuja']),
  Services(
      location: ['Ibadan', 'Lagos', 'Abuja'],
      name: 'Hair Dressing',
      description: 'Uninstallation and Flickering TV Display Screen',
      price: 400.0,
      images: "assets/images/home.png",
      heading: ''),
  Services(
      location: ['Ibadan', 'Lagos', 'Abuja'],
      name: 'Car Washing',
      heading: 'Uninstallation and Flickering TV Display Screen',
      description:
          'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. ',
      price: 100.0,
      images: "assets/images/book1.png"),
  Services(
      location: ['Ibadan', 'Lagos', 'Abuja'],
      name: 'Painting',
      description: 'Uninstallation and Flickering TV Display Screen',
      price: 20.0,
      images: "assets/images/home1.png",
      heading: ''),
  Services(
      name: 'Smart Home',
      description: 'Uninstallation and Flickering TV Display Screen',
      price: 3000.0,
      images: "assets/images/paintin2.png",
      heading: '',
      location: ['Ibadan', 'Lagos', 'Abuja']),
  Services(
      location: ['Ibadan', 'Lagos', 'Abuja'],
      name: 'Hair Dressing',
      description: 'Uninstallation and Flickering TV Display Screen',
      price: 400.0,
      images: "assets/images/home.png",
      heading: ''),
  Services(
      location: ['Ibadan', 'Lagos', 'Abuja'],
      name: 'Car Washing',
      heading: 'Uninstallation and Flickering TV Display Screen',
      description:
          'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. ',
      price: 100.0,
      images: "assets/images/book1.png"),
  Services(
      location: ['Ibadan', 'Lagos', 'Abuja'],
      name: 'Painting',
      description: 'Uninstallation and Flickering TV Display Screen',
      price: 20.0,
      images: "assets/images/home1.png",
      heading: ''),
  Services(
      location: ['Ibadan', 'Lagos', 'Abuja'],
      name: 'Smart Home',
      description: 'Uninstallation and Flickering TV Display Screen',
      price: 3000.0,
      images: "assets/images/paintin2.png",
      heading: ''),
  Services(
      location: ['Ibadan', 'Lagos', 'Abuja'],
      name: 'Hair Dressing',
      description: 'Uninstallation and Flickering TV Display Screen',
      price: 400.0,
      images: "assets/images/home.png",
      heading: ''),
  Services(
      location: ['Ibadan', 'Lagos', 'Abuja'],
      name: 'Car Washing',
      heading: 'Uninstallation and Flickering TV Display Screen',
      description:
          'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. ',
      price: 100.0,
      images: "assets/images/book1.png"),
  Services(
      location: ['Ibadan', 'Lagos', 'Abuja'],
      name: 'Painting',
      description: 'Uninstallation and Flickering TV Display Screen',
      price: 20.0,
      images: "assets/images/home1.png",
      heading: ''),
  Services(
      location: ['Ibadan', 'Lagos', 'Abuja'],
      name: 'Smart Home',
      description: 'Uninstallation and Flickering TV Display Screen',
      price: 3000.0,
      images: "assets/images/paintin2.png",
      heading: ''),
  Services(
      name: 'Hair Dressing',
      location: ['Ibadan', 'Lagos', 'Abuja'],
      description: 'Uninstallation and Flickering TV Display Screen',
      price: 400.0,
      images: "assets/images/home.png",
      heading: ''),
  Services(
      location: ['Ibadan', 'Lagos', 'Abuja'],
      name: 'Car Washing',
      heading: 'Uninstallation and Flickering TV Display Screen',
      description:
          'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. ',
      price: 100.0,
      images: "assets/images/book1.png"),
  Services(
      location: ['Ibadan', 'Lagos', 'Abuja'],
      name: 'Painting',
      description: 'Uninstallation and Flickering TV Display Screen',
      price: 20.0,
      images: "assets/images/home1.png",
      heading: ''),
  Services(
      name: 'Smart Home',
      description: 'Uninstallation and Flickering TV Display Screen',
      price: 3000.0,
      location: ['Ibadan', 'Lagos', 'Abuja'],
      images: "assets/images/paintin2.png",
      heading: ''),
  Services(
      name: 'Hair Dressing',
      description: 'Uninstallation and Flickering TV Display Screen',
      price: 400.0,
      images: "assets/images/home.png",
      location: ['Ibadan', 'Lagos', 'Abuja'],
      heading: ''),
  Services(
      name: 'Car Washing',
      heading: 'Uninstallation and Flickering TV Display Screen',
      description:
          'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. ',
      price: 100.0,
      location: ['Ibadan', 'Lagos', 'Abuja'],
      images: "assets/images/book1.png"),
  Services(
      name: 'Painting',
      description: 'Uninstallation and Flickering TV Display Screen',
      price: 20.0,
      images: "assets/images/home1.png",
      location: ['Ibadan', 'Lagos', 'Abuja'],
      heading: ''),
  Services(
      location: ['Ibadan', 'Lagos', 'Abuja'],
      name: 'Smart Home',
      description: 'Uninstallation and Flickering TV Display Screen',
      price: 3000.0,
      images: "assets/images/paintin2.png",
      heading: ''),
  Services(
      location: ['Ibadan', 'Lagos', 'Abuja'],
      name: 'Hair Dressing',
      description: 'Uninstallation and Flickering TV Display Screen',
      price: 400.0,
      images: "assets/images/home.png",
      heading: ''),
  Services(
      location: ['Ibadan', 'Lagos', 'Abuja'],
      name: 'Car Washing',
      heading: 'Uninstallation and Flickering TV Display Screen',
      description:
          'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. ',
      price: 100.0,
      images: "assets/images/book1.png"),
];
