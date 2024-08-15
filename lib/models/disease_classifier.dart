import 'package:flutter_tflite/flutter_tflite.dart';

class DiseaseClassifier {
  static Future<void> loadModel() async {
    await Tflite.loadModel(
      model: "assets/model_unquant.tflite",
      labels: "assets/labels.txt",
    );
  }

  static Future<List<dynamic>> classifyImage(String imagePath) async {
    var recognitions = await Tflite.runModelOnImage(
      path: imagePath,
      numResults: 5,
      threshold: 0.5,
      imageMean: 127.5,
      imageStd: 127.5,
    );
    return recognitions ?? [];
  }

  static void dispose() {
    Tflite.close();
  }
}
