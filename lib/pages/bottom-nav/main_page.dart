import 'package:bulleted_list/bulleted_list.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:helloworld/models/constants.dart';


class MainPage extends StatelessWidget {
   MainPage({super.key});

  final List<String> imageUrls = [
    'images/slider_1.jpg',
    'images/slider_2.jpg',
    'images/slider_3.jpg'
  ];

  final List<String> captions = [
    'WELCOME TO COCOA DISEASES DETECTION APP!',
    'HELPING YOU PROTECT YOUR COCOA CROPS.',
    'WITH QUICK AND ACCURATE DISEASE DETECTION.',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      child: ListView(
        children: [
      CarouselSlider.builder(
      itemCount: imageUrls.length,
        itemBuilder: (context, index, realIndex) {
          return Stack(
            children: [
              Image.asset(
                imageUrls[index],
                fit: BoxFit.cover,
                width: double.infinity,
              ),
              Center(  // Center widget to place text in the middle
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: Text(
                    captions[index],
                    style: const TextStyle(
                      color: backgroundColor,
                      fontSize: 34,  // Increased font size for emphasis
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,  // Center-align the text
                  ),
                ),
              ),
            ],
          );
        },
        options: CarouselOptions(
          autoPlay: true,
          enlargeCenterPage: false,
          aspectRatio: 16 / 9,
          viewportFraction: 1.0,
        ),
      ),
          const SizedBox(
            height: 16,
          ),
          const Column(
            children: [
              Text(
                'Instructional Guide',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 30,
                    decoration: TextDecoration.underline),
              ),
              BulletedList(
                bullet: Icon(
                  Icons.star,
                  color: primaryColor,
                ),
                listItems: [
                  Text('Tap on the leaf icon to navigate to the detection page',
                      style: textSize),
                  Text(
                      'Tap on  pick image button and select the diseased image you want to use for the detection.',
                      style: textSize),
                  Text(
                      'Wait as it predict the result',
                      style: textSize),
                  Text(
                      'Click on the result to see the recommended solution.',
                      style: textSize),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
