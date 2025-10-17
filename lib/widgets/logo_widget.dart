import 'package:flutter/material.dart';

class LogoWidget extends StatelessWidget {
  final bool isDark;
  final double size;

  const LogoWidget({
    super.key,
    required this.isDark,
    this.size = 24,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(size * 0.4),
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF1A1A1A) : Colors.white,
        borderRadius: BorderRadius.circular(size * 0.5),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Stack(
        children: [
          Icon(
            Icons.terminal,
            size: size,
            color: isDark ? const Color(0xFF00D4FF) : const Color(0xFF2196F3),
          ),
          Positioned(
            right: size * 0.1,
            top: size * 0.1,
            child: Container(
              width: size * 0.2,
              height: size * 0.2,
              decoration: BoxDecoration(
                color: isDark ? const Color(0xFF00D4FF) : const Color(0xFF2196F3),
                shape: BoxShape.circle,
              ),
            ),
          ),
        ],
      ),
    );
  }
}