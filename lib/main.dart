import 'package:flutter/material.dart';
import 'package:travel_app/models/destination.dart';

import 'screens/book_screen.dart';

void main() {
  final sampleDestination = Destination(
    id: '1',
    name: 'Kigali City',
    location: 'Rwanda',
    description:
        'Explore the vibrant capital of Rwanda with beautiful hills and culture.',
    price: 120,
    rating: 4.8,
    reviews: 134,
    imageUrl:
        'https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcQuucYj9Hvqscwtm1bHTwrG8PSHMZ38hwQK_WTU1j_PiePgoz9t', // make sure this image exists in assets
    categories: ['City', 'Culture', 'Tourism'],
    isPopular: true,
    additionalImages: {
      'night':
          'https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcQuucYj9Hvqscwtm1bHTwrG8PSHMZ38hwQK_WTU1j_PiePgoz9t',
      'day':
          'https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcQuucYj9Hvqscwtm1bHTwrG8PSHMZ38hwQK_WTU1j_PiePgoz9t',
    },
  );

  runApp(TravelApp(destination: sampleDestination));
}

class TravelApp extends StatelessWidget {
  final Destination destination;

  const TravelApp({super.key, required this.destination});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Travel App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),
      home: BookScreen(destination: destination),
    );
  }
}
