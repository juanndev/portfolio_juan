import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio_juan/core/app_translations.dart';
import 'package:flutter_animate/flutter_animate.dart';

class ServicesSection extends StatelessWidget {
  const ServicesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> services = [
      {
        "icon": "assets/icons/ui_icon.svg",
        "title": AppTranslations.get('services_ui_title'),
        "description": AppTranslations.get('services_ui_desc'),
      },
      {
        "icon": "assets/icons/dev_icon.svg",
        "title":  AppTranslations.get('services_dev_title'),
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
      color: const Color(0xFF0B1610),
      padding: const EdgeInsets.symmetric(vertical: 100, horizontal: 24),
      child: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 1050),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    AppTranslations.get('services_title'),
                    style: GoogleFonts.inter(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white)
                  ),
                  const Text(
                    ' .',
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Color(0xFF2ECC71))
                  ),
                ],
              ),
              const SizedBox(height: 60),
              LayoutBuilder(
                builder: (context, constraints) {
                  if (constraints.maxWidth > 800) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: services.asMap().entries.map((entry) {
                        return Flexible(
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
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOutCubic,
        padding: const EdgeInsets.all(40),
        decoration: BoxDecoration(
          color: const Color(0xFF03120A),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: _isHovered ? const Color(0xFF2ECC71).withOpacity(0.5) : Colors.white.withOpacity(0.05),
          ),
          boxShadow: _isHovered
              ? [
                  BoxShadow(
                    color: const Color(0xFF2ECC71).withOpacity(0.1),
                    blurRadius: 20,
                    offset: const Offset(0, 10),
                  )
                ]
              : [],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              widget.service["icon"]!,
              height: 48,
              width: 48,
            ).animate(target: _isHovered ? 1 : 0).moveY(begin: 0, end: -8, duration: 250.ms, curve: Curves.easeOutBack),
            const SizedBox(height: 32),
            Text(
              widget.service["title"]!,
              style: GoogleFonts.inter(fontSize: 22, fontWeight: FontWeight.w600, color: Colors.white),
            ),
            const SizedBox(height: 16),
            Text(
              widget.service["description"]!,
              style: GoogleFonts.inter(fontSize: 15, height: 1.6, color: const Color(0xFFA0AEC0)),
            ),
          ],
        ),
      ),
    );
  }
}