class Food {
  final String id; // Add this line
  final String name;
  final String description;
  final String imageUrl;
  final double price;

  Food({
    required this.id, // Add this line
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.price, required String category,
  });
}
