import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../core/theme/theme_notifier.dart';
import 'about.dart';
import 'skills.dart';
import 'contact.dart';

class HomeScreen extends StatelessWidget {
  final ThemeMode themeMode;
  final Function(bool) onThemeToggle;

  const HomeScreen({super.key, required this.themeMode, required this.onThemeToggle});

  @override
  Widget build(BuildContext context) {
    final isDark = themeMode == ThemeMode.dark;
    final size = MediaQuery.of(context).size;
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Portfolio'),
        actions: [
          IconButton(
            icon: Icon(isDark ? Icons.wb_sunny : Icons.nightlight_round),
            onPressed: () => onThemeToggle(!isDark),
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: size.width > 600 ? size.width * 0.2 : 16,
            vertical: 24,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: size.width > 600 ? 80 : 60,
                backgroundImage: const NetworkImage(
                    'https://avatars.githubusercontent.com/u/placeholder'),
              ),
              const SizedBox(height: 20),
              Text(
                'David (Pheonix0x01)',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: 8),
              Text(
                'Backend Developer • AI Programmer • Web3 Writer',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 40),
              Wrap(
                spacing: 20,
                runSpacing: 10,
                alignment: WrapAlignment.center,
                children: [
                  _navButton(context, 'About', const AboutScreen()),
                  _navButton(context, 'Skills', const SkillsScreen()),
                  _navButton(context, 'Contact', const ContactScreen()),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _navButton(BuildContext context, String text, Widget screen) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      onPressed: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => screen),
      ),
      child: Text(text),
    );
  }
}