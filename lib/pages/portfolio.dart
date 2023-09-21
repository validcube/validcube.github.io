import 'package:flutter/material.dart';

class Portfolio extends StatefulWidget {
  const Portfolio({super.key});

  @override
  State<Portfolio> createState() => _Portfolio();
}

class _Portfolio extends State<Portfolio> {
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
        appBar: AppBar(
          title: const Text('NullCube'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildImageWithBorderAndShadow(
                'assets/placeholder2.png',
                imageSize: imageSize,
                shadowColor: Colors.black.withOpacity(imageShadowOpacity),
                elevation: imageShadowElevation,
              ),
              const SizedBox(height: 20),
              _buildImageWithBorderAndShadow(
                placeholderImage, // Use the selected placeholder
                imageSize: imageSize,
                borderRadius: const BorderRadius.all(Radius.circular(24.0)),
                shadowColor: Colors.black.withOpacity(imageShadowOpacity),
                elevation: imageShadowElevation,
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildImageWithBorderAndShadow(
    String imagePath, {
    double? imageSize,
    BorderRadiusGeometry? borderRadius,
    Color? shadowColor,
    double? elevation,
  }) {
    return Container(
      width: imageSize,
      height: imageSize,
      decoration: BoxDecoration(
        borderRadius: borderRadius ?? BorderRadius.zero,
        boxShadow: [
          BoxShadow(
            color: shadowColor ?? Colors.transparent,
            blurRadius: elevation ?? 0,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: borderRadius ?? BorderRadius.zero,
        child: Image.asset(imagePath),
      ),
      //child: Image.asset(imagePath),
    );
  }
}
