import 'package:flutter/material.dart';

class SkillsScreen extends StatelessWidget {
  const SkillsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final skills = [
      'Python (FastAPI, Flask)',
      'Rust (WebAssembly, Systems)',
      'Solidity (Smart Contracts)',
      'PostgreSQL, Redis',
      'Docker & CI/CD',
      'AI/ML integration',
    ];

    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(title: const Text('Skills')),
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
                'My Stack',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: 20),
              Wrap(
                spacing: 16,
                runSpacing: 12,
                alignment: WrapAlignment.center,
                children: skills
                    .map((s) => Chip(
                          label: Text(s),
                          backgroundColor:
                              Theme.of(context).colorScheme.secondaryContainer,
                        ))
                    .toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
