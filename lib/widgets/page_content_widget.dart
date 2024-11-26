// page_content_widget.dart
import 'package:catercrews/data/OnBoardData.dart';
import 'package:flutter/material.dart'; // Import your page data model

class PageContentWidget extends StatelessWidget {
  final MediaQueryData queryData;
  final OnBoardData data;

  const PageContentWidget({
    required this.queryData,
    required this.data,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            ClipPath(
              clipper: CustomShapeClipper(), // Your custom clipper
              child: Container(
                width: 250, // Adjust size as needed
                height: 200, // Adjust size as needed
                color: Color.fromRGBO(
                    251, 213, 178, 1), // Background color or other widget
              ),
            ),
            SizedBox(
              width: 270,
              height: 270,
              child: Image.asset(
                data.imagePath, // Dynamically load image
                width: queryData.size.width,
                height: queryData.size.height,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        Text(
          data.title, // Dynamically load title
          style: const TextStyle(
            fontSize: 25,
            color: Color.fromRGBO(96, 44, 0, 1.0),
            fontWeight: FontWeight.w900,
          ),
        ),
        const SizedBox(height: 20),
        SizedBox(
          width: 300,
          child: Text(
            data.content, // Dynamically load description
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: Color.fromRGBO(130, 55, 12, 1),
            ),
          ),
        ),
      ],
    );
  }
}

class CustomShapeClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();

    // Start at the top-left
    path.moveTo(0, size.height * 0.25);

    // Create a flowing curve along the top
    path.cubicTo(size.width * 0.1, size.height * 0.05, size.width * 0.35,
        size.height * 0.1, size.width * 0.6, size.height * 0.2);

    // Continue curving across the right side
    path.cubicTo(size.width * 0.85, size.height * 0.3, size.width * 0.95,
        size.height * 0.5, size.width, size.height * 0.75);

    // Create a rounded bottom edge flowing back left
    path.cubicTo(size.width * 0.8, size.height * 0.95, size.width * 0.4,
        size.height * 0.9, size.width * 0.2, size.height * 0.85);

    // Finish the shape on the left side
    path.cubicTo(size.width * 0.05, size.height * 0.7, size.width * 0.1,
        size.height * 0.5, 0, size.height * 0.25);

    // Close the shape
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
