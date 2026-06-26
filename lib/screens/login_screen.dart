import 'package:flutter/material.dart';
import 'main_navigation.dart';

/// Mock login screen — no real authentication. Any non-empty
/// email/password is accepted, and there's also a guest shortcut.
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController(text: 'guest@cyphmart.com');
  final _passwordController = TextEditingController(text: '123456');
  bool _obscure = true;

  void _goToApp() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => const MainNavigation()),
    );
  }

  void _login() {
    if (_formKey.currentState!.validate()) {
      _goToApp();
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 32),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 24),
                CircleAvatar(
                  radius: 28,
                  backgroundColor: theme.colorScheme.primary.withOpacity(0.12),
                  child: Icon(Icons.storefront_rounded, color: theme.colorScheme.primary, size: 28),
                ),
                const SizedBox(height: 20),
                const Text('Welcome back', style: TextStyle(fontSize: 26, fontWeight: FontWeight.w800)),
                const SizedBox(height: 6),
                Text(
                  'Login to continue shopping on CyphMart (demo login — any details work)',
                  style: TextStyle(color: theme.colorScheme.onSurface.withOpacity(0.6)),
                ),
                const SizedBox(height: 32),
                TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    prefixIcon: Icon(Icons.mail_outline),
                  ),
                  validator: (value) => (value == null || value.isEmpty) ? 'Enter your email' : null,
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _passwordController,
                  obscureText: _obscure,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    prefixIcon: const Icon(Icons.lock_outline),
                    suffixIcon: IconButton(
                      icon: Icon(_obscure ? Icons.visibility_off : Icons.visibility),
                      onPressed: () => setState(() => _obscure = !_obscure),
                    ),
                  ),
                  validator: (value) => (value == null || value.isEmpty) ? 'Enter your password' : null,
                ),
                const SizedBox(height: 28),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(onPressed: _login, child: const Text('Login')),
                ),
                const SizedBox(height: 12),
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton(onPressed: _goToApp, child: const Text('Continue as Guest')),
                ),
                const SizedBox(height: 16),
                Center(
                  child: Text(
                    'This is a mock login for demo purposes only.',
                    style: TextStyle(fontSize: 12, color: theme.colorScheme.onSurface.withOpacity(0.5)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
