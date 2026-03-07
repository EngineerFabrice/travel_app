class Destination {
  final String id;
  final String title;
  final String location;
  final String description;
  final double price;
  final double rating;
  final int reviews;
  final String imageUrl;
  final List<String> gallery;
  final bool isPopular;
  final List<String> amenities;

  Destination({
    required this.id,
    required this.title,
    required this.location,
    required this.description,
    required this.price,
    required this.rating,
    required this.reviews,
    required this.imageUrl,
    required this.gallery,
    required this.isPopular,
    required this.amenities,
  });
}
