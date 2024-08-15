
class Disease {
  final String imageUrl;
  final String name;
  final String solution;

  final String description;

  Disease({

    required this.imageUrl,
    required this.name,
    required this.solution,
    required this.description,
  });
}

// List of diseases
final List<Disease> diseases = [
  Disease(
    imageUrl: 'images/read_black.jpg',
    name: 'Black Pod Rot',
    description: 'Description of Disease 1',
    solution: 'this is solution',
  ),
  Disease(
    imageUrl: 'images/read_cocoa_shoot.jpg',
    name: 'Cocoa Swollen Shoot Virus',
    description: "Description of Disease 2 ",
    solution: 'this is solution',
  ),
  Disease(
    imageUrl: 'images/reader_frosty.jpg',
    name: 'Frosty Pod Rot',
    description: "Description of Disease 2 ",
    solution: 'this is solution',
  ),
  Disease(
    imageUrl: 'images/read_sporadic.jpeg',
    name: 'Sporadic (Anthracnose)',
    description: "Description of Disease 2 ",
    solution: 'this is solution',
  ),
];
