import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

class ClothesPage extends StatelessWidget {
  ClothesPage({super.key});

  final List<String> images = [
    'assets/clothes/화면 캡처 2024-07-31 180046.png',
    'assets/clothes/화면 캡처 2024-07-31 180134.png',
    'assets/clothes/화면 캡처 2024-07-31 180201.png',
    // Add more image paths here
  ];

  @override
  Widget build(BuildContext context) {
      return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        title: Text('Clothes Collection'),
        backgroundColor: Theme.of(context).colorScheme.surface,
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, // Number of columns in the grid
          crossAxisSpacing: 4.0,
          mainAxisSpacing: 4.0,
        ),
        itemCount: images.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ImageDetailPage(imagePath: images[index]),
                ),
              );
            },
            child: Image.asset(
              images[index],
              fit: BoxFit.cover,
            ),
          );
        },
      ),
    );
  }
}

class ImageDetailPage extends StatelessWidget {
  final String imagePath;

  ImageDetailPage({required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Detail'),
        leading: IconButton(
          icon: Icon(HugeIcons.strokeRoundedArrowTurnBackward),
          onPressed: () {
            Navigator.pop(context); // Go back to the previous page
          },
        ),
      ),
      body: Center(
        child: Image.asset(imagePath),
      ),
    );
  }
}