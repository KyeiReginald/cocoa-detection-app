import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:helloworld/models/constants.dart';
import 'package:helloworld/models/disease_classifier.dart';
import 'package:helloworld/pages/home_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _modelLoaded = false;

  @override
  void initState() {
    super.initState();
    _loadModel();
  }

  Future<void> _loadModel() async {
    try {
      await DiseaseClassifier.loadModel();
      setState(() {
        _modelLoaded = true;  // Model has been loaded successfully
      });
    } catch (e) {
      print('Error loading model: $e');
      // Handle error if needed
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      duration: 5000,
      splash: 'images/cocoa_splash.png',
      splashIconSize: 304,
      nextScreen: _modelLoaded ? const HomePage() : const LoadingScreen(),  // Navigate to HomePage only if model is loaded
      splashTransition: SplashTransition.fadeTransition,
      backgroundColor: backgroundColor,
    );
  }
}

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: backgroundColor,
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}