// import 'package:flutter/material.dart';
// import 'package:flutter_tflite/flutter_tflite.dart';
// import 'package:image_picker/image_picker.dart';
// import 'dart:io';

// class OnBoarding extends StatefulWidget {
//   const OnBoarding({super.key});

//   @override
//   _OnBoardingState createState() => _OnBoardingState();
// }

// class _OnBoardingState extends State<OnBoarding> {

//   bool _loading = true;
//   File _image;
//   List _output;
//   final picker = ImagePicker();

//   detectImage(File image) async{
//     var output = await Tflite.runModelOnImage(
//       path:  image.path,
//       numResults: 5,
//       threshold: 0.6,
//       imageMean: 127.5,
//       imageStd: 127.5
//       );
//       setState(() {
//         _output = output;
//         _loading = false;
//       });
//   }

//   loadMode()async{
//     await Tflite.loadModel(model: 'assets/')
//   }

// // pick image from cam
//   pickImage()async{
//     var image = await picker.pickImage(source: ImageSource.camera);
//       if(image == null) return null;
//       setState(() {
//         _image = File(image.path);
//       });
//       detectImage(_image);
//   }

// // pick image from gallery
//   pickGalleryImage()async{
//     var image = await picker.pickImage(source: ImageSource.gallery);
//       if(image == null) return null;
//       setState(() {
//         _image = File(image.path);
//       });
//       detectImage(_image);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Disease Detection"),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [],
//         ),
//       ),
//     );
//   }
// }
