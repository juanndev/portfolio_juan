import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio_juan/core/app_translations.dart';
import 'package:portfolio_juan/core/theme.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:portfolio_juan/core/hover_card.dart';
import 'package:seo/seo.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  Future<void> _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      throw Exception('Não foi possível abrir o link: $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    bool isMobile = screenWidth < 600;

    final List<Map<String, String>> projects = [
      {
        "title": AppTranslations.get('proj_1_title'),
        "description": AppTranslations.get('proj_1_desc'),
        "techs": AppTranslations.get('proj_1_techs'),
        "github": "https://github.com/juanndev/portfolio_juan",
      },
      {
        "title": AppTranslations.get('proj_2_title'),
        "description": AppTranslations.get('proj_2_desc'),
        "techs": AppTranslations.get('proj_2_techs'),
        // NOVO LINK INSERIDO AQUI
        "github": "https://github.com/juanndev/flutter-security-audit-case-study", 
      },
      {
        "title": AppTranslations.get('proj_3_title'),
        "description": AppTranslations.get('proj_3_desc'),
        "techs": AppTranslations.get('proj_3_techs'),
        "github": "https://github.com/juanndev/Plataforma-de-Pedido-Online", 
      },
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
                  Text(
                    '03. ',
                    style: GoogleFonts.firaCode(fontSize: isMobile ? 20 : 24, color: AppTheme.neonCyan),
                  ),
                  Flexible(
                    child: Seo.text(
                      text: AppTranslations.get('proj_title'),
                      style: TextTagStyle.h2,
                      child: Text(
                        AppTranslations.get('proj_title'),
                        style: GoogleFonts.inter(
                          fontSize: isMobile ? 22 : 28,
                          fontWeight: FontWeight.w700,
                          color: AppTheme.textMain,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 15),
                  Expanded(child: Container(height: 1, color: AppTheme.glassBorder)),
                ],
              ),
              const SizedBox(height: 40),
              Wrap(
                spacing: 25,
                runSpacing: 25,
                children: projects.map((project) => _buildProjectCard(project, context)).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProjectCard(Map<String, String> project, BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double cardWidth = screenWidth < 700 ? screenWidth - 48 : 475;

    return HoverCard(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 16.0, sigmaY: 16.0),
          child: Container(
            width: cardWidth,
            padding: const EdgeInsets.all(30),
            decoration: BoxDecoration(
              color: AppTheme.glassBg,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: AppTheme.glassBorder),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const FaIcon(FontAwesomeIcons.folder, color: AppTheme.neonCyan, size: 40),
                    // Validação de segurança: Ícone do Github só aparece se houver URL válida
                    if (project["github"] != null && project["github"]!.isNotEmpty)
                      InkWell(
                        onTap: () => _launchUrl(project["github"]!),
                        child: const FaIcon(FontAwesomeIcons.github, color: AppTheme.textMuted, size: 24),
                      ),
                  ],
                ),
                const SizedBox(height: 25),
                Text(
                  project["title"]!,
                  style: GoogleFonts.inter(fontSize: 20, fontWeight: FontWeight.w600, color: AppTheme.textMain),
                ),
                const SizedBox(height: 10),
                Text(
                  project["description"]!,
                  style: GoogleFonts.inter(fontSize: 14, color: AppTheme.textMuted, height: 1.5),
                ),
                const SizedBox(height: 25),
                Text(
                  project["techs"]!.replaceAll(' • ', '   '),
                  style: GoogleFonts.firaCode(fontSize: 12, color: AppTheme.textMuted),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}