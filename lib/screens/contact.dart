import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key});

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> with TickerProviderStateMixin {
  late AnimationController _fadeController;
  late Animation<double> _fadeAnimation;

  final contacts = [
    {
      'name': 'GitHub',
      'url': 'https://github.com/Pheonix0x01',
      'icon': Icons.code,
      'description': 'Check out my projects'
    },
    {
      'name': 'LinkedIn',
      'url': 'https://linkedin.com/in/david0x01',
      'icon': Icons.work,
      'description': 'Professional network'
    },
    {
      'name': 'Twitter',
      'url': 'https://x.com/sable_apathy',
      'icon': Icons.alternate_email,
      'description': 'Follow for updates'
    },
    {
      'name': 'Email',
      'url': 'mailto:phoenixreviewz@email.com',
      'icon': Icons.email,
      'description': 'Get in touch directly'
    },
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

  Future<void> _launchUrl(String url) async {
    final uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $url');
    }
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
                    'Contact',
                    style: TextStyle(
                      color: isDark ? Colors.white : const Color(0xFF1A1A1A),
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),

              Expanded(
                child: FadeTransition(
                  opacity: _fadeAnimation,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const SizedBox(height: 40),
                        Text(
                          'Let\'s Connect',
                          style: TextStyle(
                            color: isDark ? Colors.white : const Color(0xFF1A1A1A),
                            fontSize: isDesktop ? 48 : 32,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'Feel free to reach out for collaborations or just a friendly hello',
                          style: TextStyle(
                            color: isDark ? const Color(0xFF808080) : const Color(0xFF6A6A6A),
                            fontSize: 16,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 48),
                        _buildContactGrid(isDesktop, isDark),
                        const SizedBox(height: 48),
                        _buildQuickContact(isDark),
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

  Widget _buildContactGrid(bool isDesktop, bool isDark) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: isDesktop ? 2 : 1,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: isDesktop ? 2.5 : 3,
      ),
      itemCount: contacts.length,
      itemBuilder: (context, index) {
        final contact = contacts[index];
        return _buildContactCard(contact, isDark, index);
      },
    );
  }

  Widget _buildContactCard(Map<String, dynamic> contact, bool isDark, int index) {
    return GestureDetector(
      onTap: () {
        HapticFeedback.lightImpact();
        _launchUrl(contact['url']);
      },
      child: Container(
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
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: isDark ? const Color(0xFF00D4FF).withOpacity(0.1) : const Color(0xFF2196F3).withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                contact['icon'],
                color: isDark ? const Color(0xFF00D4FF) : const Color(0xFF2196F3),
                size: 28,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    contact['name'],
                    style: TextStyle(
                      color: isDark ? Colors.white : const Color(0xFF1A1A1A),
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    contact['description'],
                    style: TextStyle(
                      color: isDark ? const Color(0xFF808080) : const Color(0xFF6A6A6A),
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: isDark ? const Color(0xFF333333) : const Color(0xFFCCCCCC),
              size: 16,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQuickContact(bool isDark) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF1A1A1A) : Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: isDark ? const Color(0xFF333333) : const Color(0xFFE0E0E0),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: isDark ? const Color(0xFF00D4FF).withOpacity(0.1) : const Color(0xFF2196F3).withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.chat_bubble_outline,
              color: isDark ? const Color(0xFF00D4FF) : const Color(0xFF2196F3),
              size: 32,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'Ready to Start a Project?',
            style: TextStyle(
              color: isDark ? Colors.white : const Color(0xFF1A1A1A),
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            'Drop me a message and let\'s discuss how we can work together',
            style: TextStyle(
              color: isDark ? const Color(0xFF808080) : const Color(0xFF6A6A6A),
              fontSize: 14,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}