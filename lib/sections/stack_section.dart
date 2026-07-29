import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_juan/core/app_translations.dart';
import 'package:portfolio_juan/core/theme.dart';
import 'package:seo/seo.dart';

class StackSection extends StatelessWidget {
  const StackSection({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    bool isMobile = screenWidth < 600;

    final List<String> devSkills = [
      'JavaScript', 'TypeScript', 'HTML5', 'CSS3', 'Sass / SCSS',
      'Bootstrap', 'Node.js', 'Dart', 'Flutter', 'Firebase',
      'Android Studio', 'Xcode', 'Cursor (AI IDE)', 'Figma'
    ];

    final List<String> secSkills = [
      'Pentest Mobile', 'Pentest Web', 'Hardening Mobile', 'Cloud Security'
    ];

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 100, horizontal: 24),
      child: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 1000),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text('04. ', style: GoogleFonts.firaCode(fontSize: isMobile ? 20 : 24, color: AppTheme.neonCyan)),
                  Flexible(
                    child: Seo.text(
                      text: 'Habilidades & Stack',
                      style: TextTagStyle.h2,
                      child: Text(
                        AppTranslations.get('stack_title') != 'stack_title' 
                            ? AppTranslations.get('stack_title') 
                            : 'Habilidades & Stack',
                        style: GoogleFonts.inter(fontSize: isMobile ? 22 : 28, fontWeight: FontWeight.w700, color: AppTheme.textMain),
                      ),
                    ),
                  ),
                  const SizedBox(width: 15),
                  Expanded(child: Container(height: 1, color: AppTheme.glassBorder)),
                ],
              ),
              const SizedBox(height: 40),
              Wrap(
                spacing: 15,
                runSpacing: 15,
                children: [
                  ...devSkills.map((skill) => _StackBadge(text: skill, isSecurity: false)).toList(),
                  ...secSkills.map((skill) => _StackBadge(text: skill, isSecurity: true)).toList(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _StackBadge extends StatefulWidget {
  final String text;
  final bool isSecurity;

  const _StackBadge({required this.text, required this.isSecurity});

  @override
  State<_StackBadge> createState() => _StackBadgeState();
}

class _StackBadgeState extends State<_StackBadge> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final Color activeColor = widget.isSecurity ? AppTheme.neonRed : AppTheme.neonCyan;
    final Color defaultBorderColor = widget.isSecurity ? AppTheme.neonRed.withOpacity(0.3) : AppTheme.glassBorder;

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOutCubic,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        transform: _isHovered ? (Matrix4.identity()..translate(0.0, -3.0)) : Matrix4.identity(),
        decoration: BoxDecoration(
          color: _isHovered ? activeColor.withOpacity(0.05) : Colors.white.withOpacity(0.03),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: _isHovered ? activeColor : defaultBorderColor),
        ),
        child: Text(
          widget.text,
          style: GoogleFonts.firaCode(fontSize: 14, color: _isHovered ? activeColor : AppTheme.textMain),
        ),
      ),
    );
  }
}