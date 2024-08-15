import 'package:flutter/material.dart';
import 'package:helloworld/pages/disease_detail.dart';
import 'package:helloworld/service/read_list.dart';

class DiseaseCard extends StatelessWidget {
  const DiseaseCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: diseases.length,
        itemBuilder: (context, index) {
          final disease = diseases[index];
          return Card(
            margin: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () => _navigateToDetailPage(context, disease),
              child: Stack(
                children: [
                  // Image
                  Container(
                    width: double.infinity,
                    height: 200, // Adjust height as needed
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(disease.imageUrl),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  // Text overlay
                  Positioned(
                    bottom: 0,
                    left: 0,
                    child: Container(
                      color: Colors.black54, // Semi-transparent background
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        disease.name,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
    );
  }

  void _navigateToDetailPage(BuildContext context, Disease disease) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DiseaseDetailPage(disease: disease),
      ),
    );
  }
}



