import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart_provider.dart';
import '../utils/formatters.dart';
import '../widgets/empty_state.dart';
import '../widgets/quantity_selector.dart';

/// Cart screen — list of items with quantity controls, swipe-to-remove,
/// running total, and a mock checkout flow.
class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  void _showCheckoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Order placed! 🎉'),
        content: const Text(
          'Thank you for your order. This is a demo checkout — no real payment has been made.',
        ),
        actions: [
          TextButton(
            onPressed: () {
              dialogContext.read<CartProvider>().clearCart();
              Navigator.of(dialogContext).pop();
            },
            child: const Text('Done'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<CartProvider>();
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final items = cart.cartItems;

    return SafeArea(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 16, 20, 8),
            child: Row(
              children: [
                const Text('My Cart', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w800)),
                const Spacer(),
                if (items.isNotEmpty)
                  Text(
                    '${cart.itemCount} item${cart.itemCount > 1 ? 's' : ''}',
                    style: TextStyle(color: theme.colorScheme.onSurface.withOpacity(0.6)),
                  ),
              ],
            ),
          ),
          Expanded(
            child: items.isEmpty
                ? const EmptyState(
                    icon: Icons.shopping_cart_outlined,
                    title: 'Your cart is empty',
                    message: 'Browse products and add your favorites here.',
                  )
                : ListView.builder(
                    padding: const EdgeInsets.fromLTRB(20, 8, 20, 8),
                    itemCount: items.length,
                    itemBuilder: (context, index) {
                      final item = items[index];
                      return Dismissible(
                        key: ValueKey(item.product.id),
                        direction: DismissDirection.endToStart,
                        onDismissed: (_) => context.read<CartProvider>().removeFromCart(item.product.id),
                        background: Container(
                          alignment: Alignment.centerRight,
                          padding: const EdgeInsets.only(right: 20),
                          margin: const EdgeInsets.only(bottom: 12),
                          decoration: BoxDecoration(
                            color: Colors.redAccent,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: const Icon(Icons.delete_outline, color: Colors.white),
                        ),
                        child: Container(
                          margin: const EdgeInsets.only(bottom: 12),
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: isDark ? const Color(0xFF1E1E22) : Colors.white,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Image.network(
                                  item.product.imageUrl,
                                  width: 64,
                                  height: 64,
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) => Container(
                                    width: 64,
                                    height: 64,
                                    color: theme.colorScheme.primary.withOpacity(0.08),
                                    child: Icon(
                                      Icons.image_not_supported_outlined,
                                      color: theme.colorScheme.primary.withOpacity(0.5),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      item.product.name,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(fontWeight: FontWeight.w700),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      formatCurrency(item.product.price),
                                      style: TextStyle(color: theme.colorScheme.primary, fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 8),
                              QuantitySelector(
                                quantity: item.quantity,
                                onIncrease: () => context.read<CartProvider>().increaseQuantity(item.product.id),
                                onDecrease: () => context.read<CartProvider>().decreaseQuantity(item.product.id),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
          ),
          if (items.isNotEmpty)
            Container(
              padding: const EdgeInsets.fromLTRB(20, 16, 20, 20),
              decoration: BoxDecoration(
                color: theme.scaffoldBackgroundColor,
                boxShadow: [
                  BoxShadow(color: Colors.black.withOpacity(0.06), blurRadius: 10, offset: const Offset(0, -2)),
                ],
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Total', style: TextStyle(fontSize: 16, color: theme.colorScheme.onSurface.withOpacity(0.7))),
                      Text(
                        formatCurrency(cart.totalPrice),
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800, color: theme.colorScheme.primary),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () => _showCheckoutDialog(context),
                      child: const Text('Checkout'),
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
