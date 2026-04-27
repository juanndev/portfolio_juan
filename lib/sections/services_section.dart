import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio_juan/core/app_translations.dart';

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
              // Título
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(AppTranslations.get('services_title'), style: GoogleFonts.inter(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white)),
                  const Text(' .', style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Color(0xFF2ECC71))),
                ],
              ),
              const SizedBox(height: 60),

              // GRID DE SERVIÇOS
              LayoutBuilder(
                builder: (context, constraints) {
                  if (constraints.maxWidth > 800) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: services.map((s) => Flexible(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: _buildServiceCard(s),
                        ),
                      )).toList(),
                    );
                  } else {
                    // Versão Mobile
                    return Column(
                      children: services.map((s) => Padding(
                        padding: const EdgeInsets.only(bottom: 24),
                        child: _buildServiceCard(s),
                      )).toList(),
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

  Widget _buildServiceCard(Map<String, String> service) {
    return Container(
      padding: const EdgeInsets.all(40),
      decoration: BoxDecoration(
        color: const Color(0xFF03120A),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.white.withOpacity(0.05)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min, // Importante para não dar erro de altura
        children: [
          SvgPicture.asset(
            service["icon"]!,
            height: 48,
            width: 48,
          ),
          const SizedBox(height: 32),
          Text(
            service["title"]!,
            style: GoogleFonts.inter(fontSize: 22, fontWeight: FontWeight.w600, color: Colors.white),
          ),
          const SizedBox(height: 16),
          Text(
            service["description"]!,
            style: GoogleFonts.inter(fontSize: 15, height: 1.6, color: const Color(0xFFA0AEC0)),
          ),
        ],
      ),
    );
  }
}