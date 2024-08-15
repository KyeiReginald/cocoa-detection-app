import 'package:flutter/material.dart';
import 'package:helloworld/models/constants.dart';
import 'package:helloworld/models/disease_classifier.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import 'package:ionicons/ionicons.dart';

class DetectScreen extends StatefulWidget {
  const DetectScreen({super.key});

  @override
  _DetectScreenState createState() => _DetectScreenState();
}

class _DetectScreenState extends State<DetectScreen> {
  File? _image;
  List<dynamic> _results = [];
  final picker = ImagePicker();

  Future getImage(ImageSource source) async {
    final pickedFile = await picker.pickImage(source: source);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
        classifyImage();
      }
    });
  }

  void classifyImage() async {
    if (_image == null) return;
    var results = await DiseaseClassifier.classifyImage(_image!.path);
    setState(() {
      _results = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(4.0),
            child: Text('Disease Classifier',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 27)),
          ),
          _image == null
              ? const Image(image: AssetImage('images/detect_part.jpeg'), height: 240,)
              : Image.file(_image!, height: 250),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: SizedBox(
                  width: 198, // Fixed width
                  height: 60, // Fixed height
                  child: ElevatedButton.icon(
                    onPressed: () => getImage(ImageSource.camera),
                    icon: const Icon(Ionicons.camera, color: Colors.black),
                    label: const Text(
                      'Capture Image',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
              ),

              SizedBox(
                width: 198, // Fixed width
                height: 60, // Fixed height
                child: ElevatedButton.icon(
                  onPressed: () => getImage(ImageSource.gallery),
                  icon: const Icon(Ionicons.image, color: Colors.black),
                  label: const Text(
                    'Select Image',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          const Text('Result: ',style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20)),
          Expanded(
            child: ListView.builder(
              itemCount: _results.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    _results[index]['label'],
                    style: const TextStyle(
                        fontWeight: FontWeight.w500, fontSize: 20),
                  ),
                  subtitle: Text(
                    'Confidence: ${(_results[index]['confidence'] * 100).toStringAsFixed(2)}%',
                  ),
                  onTap: () {
                    // Show prevention solutions
                    showPreventionSolutions(context, _results[index]['label']);
                  },
                );
              },
            ),
          ),
        ],
    );
  }

  void showPreventionSolutions(BuildContext context, String disease) {
    String solutions = getPreventionSolutions(disease);

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,  // Allows the bottom sheet to be fully expanded
      builder: (context) {
        return DraggableScrollableSheet(
          expand: false,  // Ensures the bottom sheet can be dragged
          builder: (context, scrollController) {
            return SingleChildScrollView(
              controller: scrollController,
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Prevention Solutions for $disease',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 16.0),
                  Text(solutions),
                  const SizedBox(height: 16.0),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('Close'),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  String getPreventionSolutions(String disease) {
    // Add your prevention solutions for each disease here
    switch (disease) {
      case 'Disease 1':
        return 'Prevention steps for Disease 1...';
      case 'Disease 2':
        return 'Prevention steps for Disease 2...';
      case 'Disease 3':
        return 'Prevention steps for Disease 3...';
      case 'Disease 4':
        return 'Prevention steps for Disease 4...';
      default:
        return 'No specific prevention steps available.';
    }
  }
}
