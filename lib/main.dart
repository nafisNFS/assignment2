import 'package:assignment/reusable_container.dart';
import 'package:flutter/material.dart';

import 'detailed_page.dart';
import 'global_color.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PhotoGallery(),
    );
  }
}

final List<String> imageList = [
  'assets/images/mood.jpg',
  'assets/images/aesthetic.jpg',
  'assets/images/city.jpg',
  'assets/images/road.jpg',
  'assets/images/sky.jpg',
  'assets/images/travel.jpg',
  'assets/images/animals.jpg',
  'assets/images/flower.jpg'
];

final List<String> textList = [
  'Mood',
  'Aesthetic',
  'City',
  'Road',
  'Sky',
  'Travel',
  'Animals',
  'Flower'
];

class PhotoGallery extends StatelessWidget {
  const PhotoGallery({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: GlobalColor.mainColor,
        centerTitle: true,
        title: const Text(
          'Photo Gallery',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
        ),
        actions: [
          PopupMenuButton(
            iconColor: Colors.white,
            itemBuilder: (context) => [],
          ),
        ],
        leading: Container(
          margin: const EdgeInsets.all(5.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white38,
          ),
          child: IconButton(
            alignment: Alignment.centerRight,
            color: Colors.white,
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios),
            //replace with our own icon data.
          ),
        ),
      ),
      body: OrientationBuilder(
        builder: (context, orientation) {
          return GridView.builder(
            itemCount: imageList.length,
            itemBuilder: (BuildContext context, int index) {
              return ImageContainer(
                imagePath: imageList[index],
                text: textList[index],
                onTap: () {
                  // Navigate to new page when image is tapped
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailPage(
                        imageText: textList[index],
                        imagePath: imageList[index],
                      ),
                    ),
                  );
                },
              );
            },
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: orientation == Orientation.portrait ? 180 : 250,
              mainAxisSpacing: 20,
              crossAxisSpacing: 20,
            ),
            padding: const EdgeInsets.all(16),
            physics: const BouncingScrollPhysics(),
          );
        },
      ),
    );
  }
}
