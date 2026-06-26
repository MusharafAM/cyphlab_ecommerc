import 'package:flutter/material.dart';
import '../data/mock_orders.dart';
import '../utils/formatters.dart';

/// A single row in the "My Orders" list on the Profile screen.
class OrderTile extends StatelessWidget {
  final MockOrder order;

  const OrderTile({super.key, required this.order});

  Color _statusColor(String status) {
    switch (status) {
      case 'Delivered':
        return const Color(0xFF00B894);
      case 'Processing':
        return const Color(0xFFFFA502);
      case 'Cancelled':
        return const Color(0xFFE74C3C);
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final color = _statusColor(order.status);

    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF1E1E22) : Colors.white,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: color.withOpacity(0.12),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(Icons.shopping_bag_outlined, color: color),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(order.id, style: const TextStyle(fontWeight: FontWeight.w700)),
                const SizedBox(height: 2),
                Text(
                  '${order.date} • ${order.itemCount} item${order.itemCount > 1 ? 's' : ''}',
                  style: TextStyle(
                    fontSize: 12.5,
                    color: theme.colorScheme.onSurface.withOpacity(0.6),
                  ),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(formatCurrency(order.total), style: const TextStyle(fontWeight: FontWeight.w700)),
              const SizedBox(height: 4),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.12),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  order.status,
                  style: TextStyle(fontSize: 11, fontWeight: FontWeight.w600, color: color),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
