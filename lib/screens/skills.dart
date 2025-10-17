import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SkillsScreen extends StatefulWidget {
  const SkillsScreen({super.key});

  @override
  State<SkillsScreen> createState() => _SkillsScreenState();
}

class _SkillsScreenState extends State<SkillsScreen> with TickerProviderStateMixin {
  late AnimationController _fadeController;
  late Animation<double> _fadeAnimation;

  final skills = [
    {'name': 'Python', 'detail': 'FastAPI, Flask, Django', 'icon': Icons.code, 'level': 90},
    {'name': 'Rust', 'detail': 'WebAssembly, Systems Programming', 'icon': Icons.memory, 'level': 85},
    {'name': 'Solidity', 'detail': 'Smart Contracts, DeFi', 'icon': Icons.account_balance, 'level': 80},
    {'name': 'Database', 'detail': 'PostgreSQL, Redis, MongoDB', 'icon': Icons.storage, 'level': 88},
    {'name': 'DevOps', 'detail': 'Docker, CI/CD, AWS', 'icon': Icons.cloud, 'level': 75},
    {'name': 'AI/ML', 'detail': 'TensorFlow, PyTorch, OpenAI', 'icon': Icons.psychology, 'level': 82},
  ];

  @override
  void initState() {
    super.initState();
    _fadeController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _fadeController,
      curve: Curves.easeInOut,
    ));

    _fadeController.forward();
  }

  @override
  void dispose() {
    _fadeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final size = MediaQuery.of(context).size;
    final isDesktop = size.width > 800;

    return Scaffold(
      backgroundColor: isDark ? const Color(0xFF0A0A0A) : const Color(0xFFF8F9FA),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: isDesktop ? 80 : 24,
            vertical: 24,
          ),
          child: Column(
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      HapticFeedback.lightImpact();
                      Navigator.pop(context);
                    },
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: isDark ? const Color(0xFF1A1A1A) : Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 10,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Icon(
                        Icons.arrow_back,
                        color: isDark ? Colors.white : const Color(0xFF1A1A1A),
                        size: 24,
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Text(
                    'Skills',
                    style: TextStyle(
                      color: isDark ? Colors.white : const Color(0xFF1A1A1A),
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),

              // Main content
              Expanded(
                child: FadeTransition(
                  opacity: _fadeAnimation,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const SizedBox(height: 40),
                        Text(
                          'My Tech Stack',
                          style: TextStyle(
                            color: isDark ? Colors.white : const Color(0xFF1A1A1A),
                            fontSize: isDesktop ? 48 : 32,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'Technologies I work with to build robust solutions',
                          style: TextStyle(
                            color: isDark ? const Color(0xFF808080) : const Color(0xFF6A6A6A),
                            fontSize: 16,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 48),
                        _buildSkillsGrid(isDesktop, isDark),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSkillsGrid(bool isDesktop, bool isDark) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: isDesktop ? 3 : 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: isDesktop ? 1.2 : 1.1,
      ),
      itemCount: skills.length,
      itemBuilder: (context, index) {
        final skill = skills[index];
        return _buildSkillCard(skill, isDark, index);
      },
    );
  }

  Widget _buildSkillCard(Map<String, dynamic> skill, bool isDark, int index) {
    return TweenAnimationBuilder<double>(
      duration: Duration(milliseconds: 800 + (index * 100)),
      tween: Tween(begin: 0.0, end: skill['level'].toDouble()),
      builder: (context, value, child) {
        return Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: isDark ? const Color(0xFF1A1A1A) : Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: isDark ? const Color(0xFF333333) : const Color(0xFFE0E0E0),
              width: 1,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 15,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: isDark ? const Color(0xFF00D4FF).withOpacity(0.1) : const Color(0xFF2196F3).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(
                  skill['icon'],
                  color: isDark ? const Color(0xFF00D4FF) : const Color(0xFF2196F3),
                  size: 24,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                skill['name'],
                style: TextStyle(
                  color: isDark ? Colors.white : const Color(0xFF1A1A1A),
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                skill['detail'],
                style: TextStyle(
                  color: isDark ? const Color(0xFF808080) : const Color(0xFF6A6A6A),
                  fontSize: 12,
                  height: 1.4,
                ),
              ),
              const Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Proficiency',
                        style: TextStyle(
                          color: isDark ? const Color(0xFF808080) : const Color(0xFF6A6A6A),
                          fontSize: 11,
                        ),
                      ),
                      Text(
                        '${value.toInt()}%',
                        style: TextStyle(
                          color: isDark ? const Color(0xFF00D4FF) : const Color(0xFF2196F3),
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  LinearProgressIndicator(
                    value: value / 100,
                    backgroundColor: isDark ? const Color(0xFF333333) : const Color(0xFFE0E0E0),
                    valueColor: AlwaysStoppedAnimation<Color>(
                      isDark ? const Color(0xFF00D4FF) : const Color(0xFF2196F3),
                    ),
                    minHeight: 4,
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}