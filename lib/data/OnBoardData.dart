class OnBoardData {
  final String imagePath;
  final String title;
  final String content;
  final String buttonText;

  OnBoardData({
    required this.imagePath,
    required this.title,
    required this.content,
    required this.buttonText,
  });
}

List<OnBoardData> pages = [
  OnBoardData(
      imagePath: 'assets/images/1.png',
      title: 'Welcome to CaterCrew',
      content:
          'We offer convenient customization and scheduling of your favourite dishes, delivered to your doorstep.',
      buttonText: 'Next'),
  OnBoardData(
      imagePath: 'assets/images/2.png',
      title: 'Effortless Meal Planning',
      content:
          "Experience stress-free meal planning with CaterCrew's innovation feature.  Just share your preferences and schedule deliveries.",
      buttonText: "Next"),
  OnBoardData(
      imagePath: 'assets/images/3.png',
      title: 'Memorable Events',
      content:
          "For your special events, turn to CaterCrew's catering services for an unforgettable culinary experience.",
      buttonText: "Next"),
  OnBoardData(
      imagePath: 'assets/images/4.png',
      title: "Get Cooking with Us!",
      content:
          "Unleash your culinary potential with our courses led by top-rated chefs.  Perfect for beginners or professional.",
      buttonText: "Let's Start!")
];
