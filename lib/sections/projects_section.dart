import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio_juan/core/app_translations.dart';
import 'package:url_launcher/url_launcher.dart';

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
    final List<Map<String, String>> projects = [
      {
        "title": AppTranslations.get('proj_1_title'),
        "description": AppTranslations.get('proj_1_desc'),
        "techs": AppTranslations.get('proj_1_techs'),
        "imagePath": "assets/images/portfolio.jpg", 
        "github": "https://github.com/juanndev/portfolio_juan",
        //"deploy": "",
      },
      {
        "title": AppTranslations.get('proj_2_title'),
        "description": AppTranslations.get('proj_2_desc'),
        "techs": AppTranslations.get('proj_2_techs'),
        "imagePath": "assets/images/Reserva de Hoteis.jpg",
        "github": "https://github.com/juanndev/Reserva-de-Hoteis",
        //"deploy": "",
      },
      {
        "title": AppTranslations.get('proj_3_title'),
        "description": AppTranslations.get('proj_3_desc'),
        "techs": AppTranslations.get('proj_3_techs'),
        "imagePath": "assets/images/Plataforma de Delivery.jpg",
        "github": "https://github.com/juanndev/Plataforma-de-Pedido-Online",
        //"deploy": "",
      },
    ];

    final double screenWidth = MediaQuery.of(context).size.width;
    final bool isDesktop = screenWidth > 1100;
    final double horizontalPadding = isDesktop ? 255.0 : 24.0;

    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: RadialGradient(
          center: Alignment.topCenter,
          radius: 0.8,
          colors: [
            Color(0xFF003A19),
            Color(0xFF03120A),
          ],
          stops: [0.0, 1.0],
        ),
      ),
      padding: const EdgeInsets.symmetric(vertical: 100),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                AppTranslations.get('proj_title'),
                style: GoogleFonts.montserrat(
                  fontSize: 32,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
              Text(
                ' .',
                style: GoogleFonts.montserrat(
                  fontSize: 32,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xFF2ECC71),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            AppTranslations.get('proj_subtitle'),
            style: GoogleFonts.montserrat(
              fontSize: 16,
              fontStyle: FontStyle.italic,
              color: const Color(0xFFE2E8F0),
            ),
          ),
          const SizedBox(height: 60),

          isDesktop
              ? Padding(
                  padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
                  child: Center(
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: projects.asMap().entries.map((entry) {
                          int index = entry.key;
                          var project = entry.value;
                          return Padding(
                            padding: EdgeInsets.only(right: index == projects.length - 1 ? 0 : 32.0),
                            child: _buildProjectCard(project, context),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                )

              : SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
                  child: Row(
                    children: projects.map((project) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 32),
                        child: _buildProjectCard(project, context),
                      );
                    }).toList(),
                  ),
                ),
        ],
      ),
    );
  }

  Widget _buildProjectCard(Map<String, String> project, BuildContext context) {

    double screenWidth = MediaQuery.of(context).size.width;
    double cardWidth = screenWidth < 500 ? screenWidth * 0.85 : 442.66;

    return Container(
      width: cardWidth,
      height: 590.25,
      decoration: BoxDecoration(
        color: const Color(0xFF05100A),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white.withOpacity(0.1)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
            child: Container(
              height: 260,
              width: double.infinity,
              color: const Color(0xFF131C18),
              child: Image.asset(
                project["imagePath"]!,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => const Center(
                  child: Icon(Icons.image, color: Colors.white24, size: 48),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(32.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    project["title"]!,
                    style: GoogleFonts.montserrat(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Expanded(
                    child: Text(
                      project["description"]!,
                      style: GoogleFonts.montserrat(
                        fontSize: 15,
                        height: 1.5,
                        color: const Color(0xFFA0AEC0),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    project["techs"]!,
                    style: GoogleFonts.montserrat(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 24),
                  Row(
                    children: [
                      _buildActionButton(
                        icon: FontAwesomeIcons.github,
                        label: "Github",
                        onTap: () => _launchUrl(project["github"]!),
                      ),
                      // const SizedBox(width: 24),
                      // _buildActionButton(
                      //   icon: Icons.computer_outlined,
                      //   label: "Deploy",
                      //   onTap: () => _launchUrl(project["deploy"]!),
                      // ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton({required IconData icon, required String label, required VoidCallback onTap}) {
    return InkWell(
      onTap: onTap,
      hoverColor: Colors.transparent,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: Colors.white, size: 20),
          const SizedBox(width: 8),
          Text(
            label,
            style: GoogleFonts.montserrat(
              color: Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}