import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'about.dart';
import 'skills.dart';
import 'contact.dart';

class HomeScreen extends StatefulWidget {
  final ThemeMode themeMode;
  final Function(bool) onThemeToggle;

  const HomeScreen({super.key, required this.themeMode, required this.onThemeToggle});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late AnimationController _fadeController;
  late AnimationController _slideController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _fadeController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );
    _slideController = AnimationController(
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

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.3),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _slideController,
      curve: Curves.easeOutCubic,
    ));

    _fadeController.forward();
    _slideController.forward();
  }

  @override
  void dispose() {
    _fadeController.dispose();
    _slideController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = widget.themeMode == ThemeMode.dark;
    final size = MediaQuery.of(context).size;
    final isDesktop = size.width > 800;
    
    return Scaffold(
      backgroundColor: isDark ? const Color(0xFF0A0A0A) : const Color(0xFFF8F9FA),
      body: Stack(
        children: [
          if (isDark)
            Positioned(
              top: -100,
              right: -100,
              child: Container(
                width: 300,
                height: 300,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: RadialGradient(
                    colors: [
                      const Color(0xFF00D4FF).withOpacity(0.1),
                      Colors.transparent,
                    ],
                  ),
                ),
              ),
            ),
          
          SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: isDesktop ? 80 : 24,
                vertical: 24,
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      FadeTransition(
                        opacity: _fadeAnimation,
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
                          child: Text(
                            'Portfolio',
                            style: TextStyle(
                              color: isDark ? Colors.white : const Color(0xFF1A1A1A),
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      FadeTransition(
                        opacity: _fadeAnimation,
                        child: GestureDetector(
                          onTap: () {
                            HapticFeedback.lightImpact();
                            widget.onThemeToggle(!isDark);
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
                              isDark ? Icons.wb_sunny : Icons.nightlight_round,
                              color: isDark ? const Color(0xFF00D4FF) : const Color(0xFF2196F3),
                              size: 24,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  
                  Expanded(
                    child: isDesktop ? _buildDesktopLayout() : _buildMobileLayout(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDesktopLayout() {
    final isDark = widget.themeMode == ThemeMode.dark;
    
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: SlideTransition(
            position: _slideAnimation,
            child: FadeTransition(
              opacity: _fadeAnimation,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'David',
                    style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                      fontSize: 64,
                      height: 0.9,
                    ),
                  ),
                  Text(
                    '(Pheonix0x01)',
                    style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                      fontSize: 64,
                      height: 0.9,
                      color: isDark ? const Color(0xFF00D4FF) : const Color(0xFF2196F3),
                    ),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    'Backend Developer • AI Programmer • Web3 Writer',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  const SizedBox(height: 48),
                  _buildNavigationButtons(),
                ],
              ),
            ),
          ),
        ),
        
        Expanded(
          flex: 1,
          child: SlideTransition(
            position: _slideAnimation,
            child: FadeTransition(
              opacity: _fadeAnimation,
              child: Center(
                child: Container(
                  width: 300,
                  height: 400,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 30,
                        offset: const Offset(0, 10),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      'assets/images/slack.png',
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          color: isDark ? const Color(0xFF1A1A1A) : const Color(0xFFE0E0E0),
                          child: const Icon(
                            Icons.person,
                            size: 120,
                            color: Colors.grey,
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildMobileLayout() {
    final isDark = widget.themeMode == ThemeMode.dark;
    
    return SlideTransition(
      position: _slideAnimation,
      child: FadeTransition(
        opacity: _fadeAnimation,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 200,
              height: 250,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 20,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  color: isDark ? const Color(0xFF1A1A1A) : const Color(0xFFE0E0E0),
                  child: const Icon(
                    Icons.person,
                    size: 80,
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 40),
            
            Text(
              'David',
              style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                fontSize: 42,
              ),
              textAlign: TextAlign.center,
            ),
            Text(
              '(Pheonix0x01)',
              style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                fontSize: 42,
                color: isDark ? const Color(0xFF00D4FF) : const Color(0xFF2196F3),
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            Text(
              'Backend Developer • AI Programmer • Web3 Writer',
              style: Theme.of(context).textTheme.bodyLarge,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 48),
            _buildNavigationButtons(),
          ],
        ),
      ),
    );
  }

  Widget _buildNavigationButtons() {
    final isDark = widget.themeMode == ThemeMode.dark;
    
    return Wrap(
      spacing: 16,
      runSpacing: 16,
      children: [
        _buildNavButton('About', const AboutScreen(), isDark),
        _buildNavButton('Skills', const SkillsScreen(), isDark),
        _buildNavButton('Contact', const ContactScreen(), isDark),
      ],
    );
  }

  Widget _buildNavButton(String text, Widget screen, bool isDark) {
    return GestureDetector(
      onTap: () {
        HapticFeedback.lightImpact();
        Navigator.push(
          context,
          PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) => screen,
            transitionsBuilder: (context, animation, secondaryAnimation, child) {
              return SlideTransition(
                position: animation.drive(
                  Tween(begin: const Offset(1.0, 0.0), end: Offset.zero)
                    .chain(CurveTween(curve: Curves.easeInOut)),
                ),
                child: child,
              );
            },
          ),
        );
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
        decoration: BoxDecoration(
          color: isDark ? const Color(0xFF1A1A1A) : Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isDark ? const Color(0xFF333333) : const Color(0xFFE0E0E0),
            width: 1,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Text(
          text,
          style: TextStyle(
            color: isDark ? Colors.white : const Color(0xFF1A1A1A),
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}