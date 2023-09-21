class Slider {
  String title;
  String description;
  String image;

  Slider({required this.description, required this.title, required this.image});
}

final List<Slider> sliderList = [
  Slider(
      description:
          'Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint.',
      title: 'Welcome To Houseman',
      image: 'assets/images/slide.png'),
  Slider(
      description: 'Find your service as per your preferences',
      title: 'Find Your Service',
      image: 'assets/images/slide1.png'),
  Slider(
      description: 'Book your services on your own time.',
      title: 'Book The Appointment',
      image: 'assets/images/slide2.png'),
  Slider(
      description:
          'Choose the preferable options of payment and get best service',
      title: 'Payment Gateway',
      image: 'assets/images/slide3.png'),
];
