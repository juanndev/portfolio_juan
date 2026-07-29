import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio_juan/core/app_translations.dart';
import 'package:portfolio_juan/core/theme.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:seo/seo.dart';

class ServicesSection extends StatelessWidget {
  const ServicesSection({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    bool isMobile = screenWidth < 600;

    final List<Map<String, String>> services = [
      {
        "icon": "assets/icons/ui_icon.svg",
        "title": AppTranslations.get('services_ui_title'),
        "description": AppTranslations.get('services_ui_desc'),
      },
      {
        "icon": "assets/icons/dev_icon.svg",
        "title": AppTranslations.get('services_dev_title'),
        "description": AppTranslations.get('services_dev_desc'),
      },
      {
        "icon": "assets/icons/app_icon.svg",
        "title": AppTranslations.get('services_app_title'),
        "description": AppTranslations.get('services_app_desc'),
      },
    ];

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 100, horizontal: 24),
      child: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 1000),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text('05. ', style: GoogleFonts.firaCode(fontSize: isMobile ? 20 : 24, color: AppTheme.neonCyan)),
                  Flexible(
                    child: Seo.text(
                      text: AppTranslations.get('services_title'),
                      style: TextTagStyle.h2,
                      child: Text(
                        AppTranslations.get('services_title'),
                        style: GoogleFonts.inter(fontSize: isMobile ? 22 : 28, fontWeight: FontWeight.w700, color: AppTheme.textMain),
                      ),
                    ),
                  ),
                  const SizedBox(width: 15),
                  Expanded(child: Container(height: 1, color: AppTheme.glassBorder)),
                ],
              ),
              const SizedBox(height: 40),
              
              // RESTAURADO: O seu LayoutBuilder original idêntico ao que funcionava!
              LayoutBuilder(
                builder: (context, constraints) {
                  if (constraints.maxWidth > 800) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: services.asMap().entries.map((entry) {
                        return Flexible( // Usando o seu Flexible ao invés do Expanded
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            child: _ServiceCard(service: entry.value)
                                .animate()
                                .fade(duration: 600.ms, delay: (entry.key * 200).ms)
                                .slideY(begin: 0.1, end: 0, duration: 600.ms, delay: (entry.key * 200).ms),
                          ),
                        );
                      }).toList(),
                    );
                  } else {
                    return Column(
                      children: services.asMap().entries.map((entry) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 24),
                          child: _ServiceCard(service: entry.value)
                              .animate()
                              .fade(duration: 600.ms, delay: (entry.key * 200).ms)
                              .slideY(begin: 0.1, end: 0, duration: 600.ms, delay: (entry.key * 200).ms),
                        );
                      }).toList(),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// RESTAURADO: O seu StatefulWidget original com efeito de Hover (Mouse)
class _ServiceCard extends StatefulWidget {
  final Map<String, String> service;

  const _ServiceCard({required this.service});

  @override
  State<_ServiceCard> createState() => _ServiceCardState();
}

class _ServiceCardState extends State<_ServiceCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 16.0, sigmaY: 16.0),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeOutCubic,
            padding: const EdgeInsets.all(40),
            decoration: BoxDecoration(
              color: AppTheme.glassBg, // Fundo de vidro
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                // Borda acende em Neon ao passar o mouse
                color: _isHovered ? AppTheme.neonCyan.withOpacity(0.5) : AppTheme.glassBorder,
              ),
              boxShadow: _isHovered
                  ? [
                      BoxShadow(
                        color: AppTheme.neonCyan.withOpacity(0.1),
                        blurRadius: 20,
                        offset: const Offset(0, 10),
                      )
                    ]
                  : [],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min, // Impede que o card cresça infinitamente
              children: [
                // SVG carregado com as suas cores originais, com a sua animação de pulo
                SvgPicture.asset(
                  widget.service["icon"]!,
                  height: 48,
                  width: 48,
                ).animate(target: _isHovered ? 1 : 0).moveY(begin: 0, end: -8, duration: 250.ms, curve: Curves.easeOutBack),
                
                const SizedBox(height: 32),
                Seo.text(
                  text: widget.service["title"]!,
                  style: TextTagStyle.h3,
                  child: Text(
                    widget.service["title"]!,
                    style: GoogleFonts.inter(fontSize: 22, fontWeight: FontWeight.w600, color: AppTheme.textMain),
                  ),
                ),
                const SizedBox(height: 16),
                Seo.text(
                  text: widget.service["description"]!,
                  style: TextTagStyle.p,
                  child: Text(
                    widget.service["description"]!,
                    style: GoogleFonts.inter(fontSize: 15, height: 1.6, color: AppTheme.textMuted),
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