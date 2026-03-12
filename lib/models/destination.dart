class Destination {
  final String id;
  final String name;
  final String location;
  final String description;
  final double price;
  final double rating;
  final int reviews;
  final String imageUrl;
  final List<String> categories;
  final bool isPopular;
  final Map<String, String>? additionalImages;

  Destination({
    required this.id,
    required this.name,
    required this.location,
    required this.description,
    required this.price,
    required this.rating,
    required this.reviews,
    required this.imageUrl,
    required this.categories,
    this.isPopular = false,
    this.additionalImages,
  });
}
