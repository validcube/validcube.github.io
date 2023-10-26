import 'package:flutter/material.dart';

class Contribution extends StatefulWidget {
  const Contribution({super.key});

  @override
  State<Contribution> createState() => _Contribution();
}

class _Contribution extends State<Contribution> {
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
    if (aspectRatio >= 51.0) {
      placeholderImage = 'assets/placeholder1.png'; // Landscape or Square
      personalImage = 'assets/placeholder1.png';
    } else {
      placeholderImage = 'assets/placeholder2.png'; // Portrait
    }

    return Container(
      alignment: Alignment.center,
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        body: Center(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //Button
              Card(
                margin: const EdgeInsets.all(8.0),
                elevation: 1,
                child: Column(
                  children: [
                    // Image
                    Image.asset(
                      placeholderImage,
                      width: imageSize * 12,
                      height: imageSize * 3.5,
                    ),
                    // Text
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Contribution',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Card(
                    margin: const EdgeInsets.all(8.0),
                    elevation: imageShadowElevation,
                    shadowColor: Colors.black.withOpacity(imageShadowOpacity),
                    child: Column(
                      children: [
                        // Image
                        Image.asset(
                          placeholderImage,
                          width: imageSize,
                          height: imageSize,
                        ),
                        // Text
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'Contribution',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Card(
                    margin: const EdgeInsets.all(8.0),
                    elevation: imageShadowElevation,
                    shadowColor: Colors.black.withOpacity(imageShadowOpacity),
                    child: Column(
                      children: [
                        // Image
                        Image.asset(
                          placeholderImage,
                          width: imageSize,
                          height: imageSize,
                        ),
                        // Text
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'Contribution',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
