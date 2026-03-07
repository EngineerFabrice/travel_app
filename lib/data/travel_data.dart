import '../models/destination_model.dart';

class TravelData {
  static List<Destination> destinations = [
    Destination(
      id: '1',
      title: 'Santorini Paradise',
      location: 'Greece',
      description:
          'Experience the stunning sunsets and white-washed buildings of this iconic Greek island. Perfect for couples and photographers.',
      price: 1299,
      rating: 4.8,
      reviews: 1245,
      imageUrl: 'assets/images/santorini.jpg',
      gallery: [
        'assets/images/santorini_1.jpg',
        'assets/images/santorini_2.jpg',
      ],
      isPopular: true,
      amenities: ['Free WiFi', 'Breakfast', 'Pool', 'Air Conditioning'],
    ),
    Destination(
      id: '2',
      title: 'Swiss Alps Adventure',
      location: 'Switzerland',
      description:
          'Majestic mountains, crystal-clear lakes, and world-class skiing await you in the heart of the Alps.',
      price: 1899,
      rating: 4.9,
      reviews: 987,
      imageUrl: 'assets/images/swiss_alps.jpg',
      gallery: ['assets/images/swiss_1.jpg', 'assets/images/swiss_2.jpg'],
      isPopular: true,
      amenities: ['Skiing', 'Spa', 'Restaurant', 'Mountain View'],
    ),
    Destination(
      id: '3',
      title: 'Bali Paradise',
      location: 'Indonesia',
      description:
          'Tropical paradise with stunning beaches, rice terraces, and vibrant culture.',
      price: 899,
      rating: 4.7,
      reviews: 2156,
      imageUrl: 'assets/images/bali.jpg',
      gallery: [],
      isPopular: true,
      amenities: ['Beach Access', 'Yoga', 'Spa', 'Pool'],
    ),
    Destination(
      id: '4',
      title: 'Paris Romance',
      location: 'France',
      description:
          'The city of love awaits with its iconic Eiffel Tower, world-class cuisine, and charming streets.',
      price: 1499,
      rating: 4.6,
      reviews: 3241,
      imageUrl: 'assets/images/paris.jpg',
      gallery: [],
      isPopular: false,
      amenities: ['Museum Tours', 'Fine Dining', 'River Cruise'],
    ),
    Destination(
      id: '5',
      title: 'Tokyo Lights',
      location: 'Japan',
      description:
          'Experience the perfect blend of tradition and future in this vibrant metropolis.',
      price: 1699,
      rating: 4.9,
      reviews: 1876,
      imageUrl: 'assets/images/tokyo.jpg',
      gallery: [],
      isPopular: true,
      amenities: ['Sushi Class', 'Temple Tours', 'Shopping'],
    ),
    Destination(
      id: '6',
      title: 'Maldives Resort',
      location: 'Maldives',
      description: 'Overwater bungalows and crystal clear waters in paradise.',
      price: 2499,
      rating: 5.0,
      reviews: 892,
      imageUrl: 'assets/images/maldives.jpg',
      gallery: [],
      isPopular: true,
      amenities: ['Private Pool', 'Butler Service', 'Snorkeling'],
    ),
  ];
}
