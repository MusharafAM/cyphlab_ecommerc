import 'package:flutter/material.dart';

/// Renders a 5-star rating row, supporting half stars (e.g. 4.5).
class RatingStars extends StatelessWidget {
  final double rating;
  final double size;
  final Color? color;

  const RatingStars({
    super.key,
    required this.rating,
    this.size = 16,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final starColor = color ?? Colors.amber;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        final value = rating - index;
        IconData icon;
        if (value >= 1) {
          icon = Icons.star_rounded;
        } else if (value >= 0.5) {
          icon = Icons.star_half_rounded;
        } else {
          icon = Icons.star_outline_rounded;
        }
        return Icon(icon, size: size, color: starColor);
      }),
    );
  }
}
