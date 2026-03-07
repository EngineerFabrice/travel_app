import 'package:flutter/material.dart';

class RatingWidget extends StatelessWidget {
  final double rating;
  final int reviews;
  final bool showReviews;

  const RatingWidget({
    super.key,
    required this.rating,
    required this.reviews,
    this.showReviews = true,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Icon(
          Icons.star,
          color: Colors.amber,
          size: 14, // Reduced size for better fit
        ),
        const SizedBox(width: 2),
        Flexible(
          child: Text(
            rating.toStringAsFixed(1),
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: 12,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
        if (showReviews) ...[
          const SizedBox(width: 2),
          Flexible(
            child: Text(
              '($reviews)',
              style: const TextStyle(color: Colors.white70, fontSize: 10),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ],
    );
  }
}
