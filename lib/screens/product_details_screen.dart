import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/product.dart';
import '../providers/cart_provider.dart';
import '../utils/formatters.dart';
import '../widgets/quantity_selector.dart';
import '../widgets/rating_stars.dart';

/// Full product detail view, reached by tapping a product card.
class ProductDetailsScreen extends StatefulWidget {
  final Product product;
  final VoidCallback onViewCart;

  const ProductDetailsScreen({super.key, required this.product, required this.onViewCart});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  int _quantity = 1;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final product = widget.product;
    final cart = context.watch<CartProvider>();
    final alreadyInCart = cart.isInCart(product.id);

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            expandedHeight: 320,
            backgroundColor: theme.scaffoldBackgroundColor,
            flexibleSpace: FlexibleSpaceBar(
              background: Hero(
                tag: 'product-${product.id}',
                child: Image.network(
                  product.imageUrl,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Container(
                    color: theme.colorScheme.primary.withOpacity(0.08),
                    child: Icon(
                      Icons.image_not_supported_outlined,
                      size: 48,
                      color: theme.colorScheme.primary.withOpacity(0.5),
                    ),
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.category.toUpperCase(),
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.6,
                      color: theme.colorScheme.primary,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(product.name, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w800)),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      RatingStars(rating: product.rating, size: 18),
                      const SizedBox(width: 8),
                      Text(
                        '${product.rating} (${product.reviewCount} reviews)',
                        style: TextStyle(color: theme.colorScheme.onSurface.withOpacity(0.6)),
                      ),
                    ],
                  ),
                  const SizedBox(height: 14),
                  Text(
                    formatCurrency(product.price),
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w800, color: theme.colorScheme.primary),
                  ),
                  const Divider(height: 32),
                  const Text('Description', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
                  const SizedBox(height: 8),
                  Text(
                    product.description,
                    style: TextStyle(height: 1.5, color: theme.colorScheme.onSurface.withOpacity(0.75)),
                  ),
                  const SizedBox(height: 90),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.fromLTRB(20, 12, 20, 20),
        decoration: BoxDecoration(
          color: theme.scaffoldBackgroundColor,
          boxShadow: [
            BoxShadow(color: Colors.black.withOpacity(0.06), blurRadius: 10, offset: const Offset(0, -2)),
          ],
        ),
        child: SafeArea(
          top: false,
          child: Row(
            children: [
              QuantitySelector(
                quantity: _quantity,
                onIncrease: () => setState(() => _quantity++),
                onDecrease: () {
                  if (_quantity > 1) setState(() => _quantity--);
                },
              ),
              const SizedBox(width: 14),
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: () {
                    context.read<CartProvider>().addToCart(product, quantity: _quantity);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('${product.name} added to cart'),
                        behavior: SnackBarBehavior.floating,
                        action: SnackBarAction(
                          label: 'View Cart',
                          onPressed: () {
                            Navigator.of(context).pop();
                            widget.onViewCart();
                          },
                        ),
                      ),
                    );
                    setState(() => _quantity = 1);
                  },
                  icon: Icon(alreadyInCart ? Icons.check : Icons.shopping_cart_outlined),
                  label: Text(alreadyInCart ? 'Add More' : 'Add to Cart'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
