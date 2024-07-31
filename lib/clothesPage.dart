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
        title: const Text('Clothes Collection'),
        backgroundColor: Theme.of(context).colorScheme.surface,
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
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
                  builder: (context) => ImageDetailPage(
                    images: images,
                    initialIndex: index,
                  ),
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

class ImageDetailPage extends StatefulWidget {
  final List<String> images;
  final int initialIndex;

  const ImageDetailPage({super.key, required this.images, required this.initialIndex});

  @override
  _ImageDetailPageState createState() => _ImageDetailPageState();
}

class _ImageDetailPageState extends State<ImageDetailPage> {
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: widget.initialIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image Detail'),
        leading: IconButton(
          icon: const Icon(HugeIcons.strokeRoundedArrowTurnBackward),
          onPressed: () {
            Navigator.pop(context); // Go back to the previous page
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(HugeIcons.strokeRoundedFavourite),
            onPressed: () {
              // Handle the favorite action
            },
          ),
          IconButton(
            icon: const Icon(HugeIcons.strokeRoundedShoppingCartAdd01),
            onPressed: () {
              // Handle the add to cart action
            },
          ),
        ],
      ),
      body: PageView.builder(
        controller: _pageController,
        itemCount: widget.images.length,
        itemBuilder: (context, index) {
          return Center(
            child: Image.asset(widget.images[index]),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
