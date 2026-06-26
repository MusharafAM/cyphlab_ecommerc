import 'package:flutter/material.dart';
import '../models/product.dart';
import '../utils/formatters.dart';
import 'rating_stars.dart';

/// Product tile shown in the Home screen grid.
class ProductCard extends StatelessWidget {
  final Product product;
  final VoidCallback onTap;

  const ProductCard({super.key, required this.product, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 0,
        color: isDark ? const Color(0xFF1E1E22) : Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
        clipBehavior: Clip.antiAlias,
        margin: EdgeInsets.zero,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 1,
              child: Hero(
                tag: 'product-${product.id}',
                child: Image.network(
                  product.imageUrl,
                  fit: BoxFit.cover,
                  loadingBuilder: (context, child, progress) {
                    if (progress == null) return child;
                    return Container(
                      color: theme.colorScheme.primary.withOpacity(0.08),
                      child: const Center(
                        child: SizedBox(
                          width: 22,
                          height: 22,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        ),
                      ),
                    );
                  },
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      color: theme.colorScheme.primary.withOpacity(0.08),
                      child: Icon(
                        Icons.image_not_supported_outlined,
                        color: theme.colorScheme.primary.withOpacity(0.5),
                      ),
                    );
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 8, 10, 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13.5),
                  ),
                  const SizedBox(height: 4),
                  RatingStars(rating: product.rating, size: 13),
                  const SizedBox(height: 6),
                  Text(
                    formatCurrency(product.price),
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 14,
                      color: theme.colorScheme.primary,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
