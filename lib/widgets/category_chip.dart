import 'package:flutter/material.dart';

/// Selectable pill used in the horizontal category filter row
/// on the Home screen.
class CategoryChip extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const CategoryChip({
    super.key,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: ChoiceChip(
        label: Text(label),
        selected: isSelected,
        onSelected: (_) => onTap(),
        selectedColor: theme.colorScheme.primary,
        backgroundColor: isDark ? const Color(0xFF1E1E22) : const Color(0xFFEDEDF5),
        labelStyle: TextStyle(
          color: isSelected ? Colors.white : theme.colorScheme.onSurface,
          fontWeight: FontWeight.w600,
          fontSize: 13,
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        side: BorderSide.none,
        showCheckmark: false,
      ),
    );
  }
}
