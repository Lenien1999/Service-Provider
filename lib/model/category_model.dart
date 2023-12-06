import 'servicemodel.dart';

class Category {
  String name;
  String image;
  List<Services> service;
  Category({required this.image, required this.name, required this.service});
}

List<Category> categoryList = [
  Category(
      image: "assets/images/Icon1.png",
      name: 'Hair Dressing',
      service: serviceList),
  
  // Category(image: "assets/images/Icon4.png", name: 'Security'),
  Category(
      image: "assets/images/Icon5.png",
      name: 'Smart Home',
      service: serviceList),
  
  Category(
      image: "assets/images/Icon7.png", name: 'Painting', service: serviceList),
  Category(
      image: "assets/images/plumber1.png",
      name: 'Car Washing',
      service: serviceList),
];
