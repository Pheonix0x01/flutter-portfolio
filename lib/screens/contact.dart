import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  Future<void> _launchUrl(String url) async {
    final uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    final contacts = {
      'GitHub': 'https://github.com/Pheonix0x01',
      'LinkedIn': 'https://linkedin.com/in/Pheonix0x01',
      'Twitter': 'https://x.com/Pheonix0x01',
      'Email': 'mailto:your@email.com',
    };

    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(title: const Text('Contact')),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: size.width > 600 ? size.width * 0.2 : 20,
            vertical: 24,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Get In Touch',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: 20),
              Wrap(
                spacing: 20,
                runSpacing: 16,
                alignment: WrapAlignment.center,
                children: contacts.entries.map((e) {
                  return ElevatedButton(
                    onPressed: () => _launchUrl(e.value),
                    child: Text(e.key),
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
