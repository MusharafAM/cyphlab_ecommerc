import 'package:flutter/material.dart';

/// Small reusable +/- quantity control used on the Product Details
/// screen and on each cart line item.
class QuantitySelector extends StatelessWidget {
  final int quantity;
  final VoidCallback onIncrease;
  final VoidCallback onDecrease;
  final double iconSize;

  const QuantitySelector({
    super.key,
    required this.quantity,
    required this.onIncrease,
    required this.onDecrease,
    this.iconSize = 18,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: theme.colorScheme.outline.withOpacity(0.4)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            onPressed: onDecrease,
            icon: Icon(Icons.remove, size: iconSize),
            visualDensity: VisualDensity.compact,
          ),
          SizedBox(
            width: 24,
            child: Text(
              '$quantity',
              textAlign: TextAlign.center,
              style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
            ),
          ),
          IconButton(
            onPressed: onIncrease,
            icon: Icon(Icons.add, size: iconSize),
            visualDensity: VisualDensity.compact,
          ),
        ],
      ),
    );
  }
}
