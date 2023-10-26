import 'package:flutter/material.dart';

class Credits extends StatefulWidget {
  const Credits({super.key});

  @override
  State<Credits> createState() => _Credits();
}

class _Credits extends State<Credits> {
  int currentPageIndex = 0;
  double imageShadowOpacity = 0.1;
  double imageShadowElevation = 5.0;
  double imageSize = 150.0; // Initial image size

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final aspectRatio = screenWidth / screenHeight;

    // Choose placeholders based on screen characteristics
    String placeholderImage;
    String personalImage;
    String flowerImage;
    String decorateImage;
    String optionalImage;
    if (aspectRatio >= 1.0) {
      placeholderImage = 'assets/placeholder1.png'; // Landscape or Square
      personalImage = 'assets/placeholder1.png';
    } else {
      placeholderImage = 'assets/placeholder2.png'; // Portrait
    }

    return Container(
      alignment: Alignment.center,
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: AppBar(
          title: const Text('NullCube'),
        ),
        body: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Text("Home")],
          ),
        ),
      ),
    );
  }
}
