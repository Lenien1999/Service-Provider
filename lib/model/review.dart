class Review {
  String name;
  int review;
  String description;
  String? image;
  DateTime time;

  Review(
      {required this.description,
      this.image,
      required this.name,
      required this.time,
      this.review = 0});
}

// List<Review> reviewList = [
//   Review(
//       description: 'Your service is superb',
//       image: 'assets/images/avater1.png',
//       name: 'Aminullah AbdulAzeez'),
// ];
