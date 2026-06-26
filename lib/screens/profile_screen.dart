import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../data/mock_orders.dart';
import '../providers/theme_provider.dart';
import '../widgets/order_tile.dart';
import 'login_screen.dart';

/// Combined Profile + Orders screen — static/mock profile info plus
/// a list of mock past orders, and a dark-mode switch + logout.
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final themeProvider = context.watch<ThemeProvider>();

    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.fromLTRB(20, 16, 20, 24),
        children: [
          const Text('Profile', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w800)),
          const SizedBox(height: 18),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: isDark ? const Color(0xFF1E1E22) : Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 28,
                  backgroundColor: theme.colorScheme.primary.withOpacity(0.15),
                  child: Text('AP', style: TextStyle(fontWeight: FontWeight.w800, color: theme.colorScheme.primary)),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Alex Perera', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16)),
                      const SizedBox(height: 2),
                      Text(
                        'alex.perera@example.com',
                        style: TextStyle(color: theme.colorScheme.onSurface.withOpacity(0.6)),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: isDark ? const Color(0xFF1E1E22) : Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: SwitchListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text('Dark Mode', style: TextStyle(fontWeight: FontWeight.w600)),
              secondary: Icon(themeProvider.isDarkMode ? Icons.dark_mode : Icons.light_mode),
              value: themeProvider.isDarkMode,
              onChanged: (_) => themeProvider.toggleTheme(),
            ),
          ),
          const SizedBox(height: 24),
          const Text('My Orders', style: TextStyle(fontSize: 17, fontWeight: FontWeight.w700)),
          const SizedBox(height: 12),
          ...mockOrders.map((order) => OrderTile(order: order)),
          const SizedBox(height: 12),
          SizedBox(
            width: double.infinity,
            child: OutlinedButton.icon(
              onPressed: () {
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (_) => const LoginScreen()),
                  (route) => false,
                );
              },
              icon: const Icon(Icons.logout),
              label: const Text('Logout'),
            ),
          ),
        ],
      ),
    );
  }
}
