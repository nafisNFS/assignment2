import 'package:flutter/material.dart';
import 'package:assignment/reusable_container.dart';
import 'package:assignment/global_color.dart';

import 'main.dart';

final List<Map<String, String>> titleSubtitleList = [
  {
    'title': 'Mood',
    'subtitle':
    'Connect with your inner self amidst the serene beauty of nature, finding peace and tranquility in its embrace.'
  },
  {
    'title': 'Aesthetic',
    'subtitle':
    'Embark on a journey to explore the aesthetic wonders of the world, where beauty resides in every corner and every stroke of creativity.'
  },
  {
    'title': 'City',
    'subtitle':
    'Immerse yourself in the hustle and bustle of city life, where skyscrapers tower high and neon lights illuminate the night.'
  },
  {
    'title': 'Road',
    'subtitle':
    'Venture off the beaten path and onto roads less traveled, where adventure awaits at every turn and discovery lies around every bend.'
  },
  {
    'title': 'Sky',
    'subtitle':
    'Lose yourself in the vast expanse of the sky, where clouds dance and stars twinkle, painting a picture of celestial serenity.'
  },
  {
    'title': 'Travel',
    'subtitle':
    'Indulge your wanderlust and embark on a journey of discovery, where every destination tells a story and every adventure leaves a mark.'
  },
  {
    'title': 'Animals',
    'subtitle':
    'Explore the wonders of the animal kingdom, where creatures of all shapes and sizes roam free, each with a story to tell.'
  },
  {
    'title': 'Flower',
    'subtitle':
    'Step into a world of floral fantasies, where blooms of every hue and fragrance paint a picture of natural beauty and eternal spring.'
  },
];

class DetailPage extends StatelessWidget {
  final String imagePath;
  final String imageText;
  const DetailPage({super.key, required this.imageText, required this.imagePath});

  @override
  Widget build(BuildContext context) {




    return Scaffold(
      appBar: AppBar(
        backgroundColor: GlobalColor.mainColor,
        centerTitle: true,
        title: Text(
          imageText,
          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
        ),
        actions: [
          PopupMenuButton(
            icon: const Icon(Icons.more_vert, color: Colors.white),
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
          ),
        ),
      ),
      body: OrientationBuilder(
        builder: (context, orientation) {
          return orientation == Orientation.portrait
              ? _buildPortraitLayout(context)
              : _buildLandscapeLayout(context);
        },
      ),
    );
  }

  Widget _buildPortraitLayout(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildImage(context),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildTitleWidget(),
                const SizedBox(height: 8.0),
                _buildSubtitleWidget(),
                const SizedBox(height: 16.0),
                _buildSeeMoreButton(),
                const SizedBox(height: 8.0),
                _buildSuggestionsWidget(context),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLandscapeLayout(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: _buildImage(context),
        ),
        Expanded(
          flex: 3,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildTitleWidget(),
                  const SizedBox(height: 8.0),
                  _buildSubtitleWidget(),
                  const SizedBox(height: 16.0),
                  _buildSeeMoreButton(),
                  const SizedBox(height: 8.0),
                  _buildSuggestionsWidget(context),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildImage(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 7,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          child: Image.asset(
            imagePath,
            fit: BoxFit.cover,
            width: MediaQuery.of(context).size.width * 0.8,
          ),
        ),
      ),
    );
  }

  Widget _buildTitleWidget() {
    return Text(
       imageText,
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 20.0,
      ),
    );
  }

  Widget _buildSubtitleWidget() {
    return const Text(
       "In the embrace of nature's tranquil beauty, find the strength to bloom against life's challenges. Let the whispers of the wind and the dance of the leaves remind you of your resilience and the infinite possibilities that await you.",
      style: TextStyle(
        fontSize: 16.0,
        color: Colors.black,
      ),
    );
  }

  Widget _buildSeeMoreButton() {
    return Center(
      child: SizedBox(
        width: 387.0,
        height: 51.0,
        child: ElevatedButton(
          onPressed: () {
            // On Pressed Action
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: GlobalColor.mainColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
          ),
          child: const Text(
            "See More",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }

  Widget _buildSuggestionsWidget(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Suggestions",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
              color: GlobalColor.mainColor),
        ),
        const SizedBox(height: 8.0),
        GridView.builder(
          shrinkWrap: true,
          itemCount: titleSubtitleList.length,
          itemBuilder: (BuildContext context, int index) {
            return ImageContainer(
              imagePath: imageList[index],
              text: textList[index],
              onTap: () {
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
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 180,
            mainAxisSpacing: 20,
            crossAxisSpacing: 20,
          ),
          physics: const BouncingScrollPhysics(),
        ),
      ],
    );
  }
}