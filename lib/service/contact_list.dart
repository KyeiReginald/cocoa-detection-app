class Contact {
  final String name;
  final String phoneNumber;
  final String email;
  final String imageUrl;

  Contact(
      {required this.name,
      required this.phoneNumber,
      required this.email,
      required this.imageUrl});
}

class ContactList {
  static List<Contact> contacts = [
    Contact(
      name: "Amankwah K. Poku",
      phoneNumber: "+233256338441",
      email: "Amankwah@example.com",
      imageUrl: "images/mainScreen.jpg",
    ),
    Contact(
      name: "Anning Kyei",
      phoneNumber: "233256338441",
      email: "Anning@example.com",
      imageUrl: "images/detect_part.jpeg",
    ),
    // Add more contacts as needed
  ];
}
