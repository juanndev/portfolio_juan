import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio_juan/core/app_translations.dart';
import 'dart:html' as html;

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    double titleSize = screenWidth < 400 ? 48 : (screenWidth < 800 ? 64 : 80);
    double subtitleSize = screenWidth < 400 ? 16 : (screenWidth < 800 ? 20 : 24);

    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 140), 
            
            // TÍTULO
            Text(
              'Juan Mota',
              textAlign: TextAlign.center, 
              style: GoogleFonts.inter(
                fontSize: titleSize, 
                fontWeight: FontWeight.w800,
                color: Colors.white,
                letterSpacing: -2,
              ),
            ),
            const SizedBox(height: 16),
            
            // SUBTÍTULO
            Text(
              AppTranslations.get('hero_subtitle'),
              textAlign: TextAlign.center, 
              style: GoogleFonts.inter(
                fontSize: subtitleSize, 
                fontWeight: FontWeight.w400,
                color: const Color(0xFFE2E8F0),
              ),
            ),
            const SizedBox(height: 40),
            
            _buildDownloadButton(), 
            
            const SizedBox(height: 80),
            
            Text(
              AppTranslations.get('hero_exp'),
              style: GoogleFonts.inter(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: const Color(0xFFA0AEC0),
              ),
            ),
            const SizedBox(height: 24),
            
          _buildTechStackIcons(),
            const SizedBox(height: 60),
          ],
        ), 
      ), 
    ); 
  }

  Widget _buildDownloadButton() {
    return OutlinedButton(
      onPressed: () {
        // 1. Pegamos o idioma atual do nosso ValueNotifier
        final String currentLang = appLanguage.value;

        // 2. Definimos qual arquivo e qual nome de download usar
        String filePath;
        String fileName;

        switch (currentLang) {
          case 'en':
            filePath = 'assets/files/resume_en.pdf';
            fileName = 'Juan_Mota_Resume.pdf';
            break;
          case 'es':
            filePath = 'assets/files/curriculum_es.pdf';
            fileName = 'Juan_Mota_Curriculum.pdf';
            break;
          case 'pt':
          default:
            filePath = 'assets/files/curriculo_pt.pdf';
            fileName = 'Juan_Mota_Curriculo.pdf';
            break;
        }

        // 3. Executamos o download disparando o link HTML
        html.AnchorElement(href: filePath)
          ..setAttribute('download', fileName)
          ..click();
      },
      style: OutlinedButton.styleFrom(
        foregroundColor: Colors.white,
        side: const BorderSide(color: Color(0xFF2ECC71)),
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Text(
        AppTranslations.get('hero_btn'), // O texto do botão também já traduz!
        style: GoogleFonts.inter(
          fontSize: 15,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget _buildTechStackIcons() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SvgPicture.asset('assets/icons/javascriptIcon.svg', height: 24),
        const SizedBox(width: 24),
        SvgPicture.asset('assets/icons/reactIcon.svg', height: 24),
        const SizedBox(width: 24),
        SvgPicture.asset('assets/icons/nextjsIcon.svg', height: 24),
        const SizedBox(width: 24),
        SvgPicture.asset('assets/icons/sassIcon.svg', height: 24),
        const SizedBox(width: 24),
        SvgPicture.asset('assets/icons/tailwindIcon.svg', height: 24),
        const SizedBox(width: 24),
        SvgPicture.asset('assets/icons/figmaIcon.svg', height: 24),
      ],
    );
  }
}

// ignore: unused_element
class _NavBarLink extends StatelessWidget {
  final String text;

  const _NavBarLink({required this.text});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      hoverColor: Colors.transparent,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: Text(
        text,
        style: GoogleFonts.inter(
          // ignore: deprecated_member_use
          color: Colors.white.withOpacity(0.9),
          fontSize: 15,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}