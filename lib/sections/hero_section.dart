import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio_juan/core/app_translations.dart';
import 'dart:html' as html;
import 'package:flutter_animate/flutter_animate.dart';

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
        final String currentLang = appLanguage.value;

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
        AppTranslations.get('hero_btn'),
        style: GoogleFonts.inter(
          fontSize: 15,
          fontWeight: FontWeight.w500,
        ),
      ),
    )
        .animate(onPlay: (controller) => controller.repeat(reverse: true))
        .scale(begin: const Offset(1, 1), end: const Offset(1.03, 1.03), duration: 1200.ms, curve: Curves.easeInOut)
        .animate(onPlay: (controller) => controller.repeat())
        .shimmer(duration: 1500.ms, delay: 2.seconds, color: const Color(0xFF2ECC71));
  }

  Widget _buildTechStackIcons() {
    final icons = [
      'assets/icons/javascriptIcon.svg',
      'assets/icons/flutterIcon.svg',
      'assets/icons/dartIcon.svg',
      'assets/icons/typescriptIcon.svg',
      'assets/icons/sassIcon.svg',
      'assets/icons/cursorIcon.svg',
      'assets/icons/figmaIcon.svg',
    ];

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(icons.length, (index) {
        return Padding(
          padding: EdgeInsets.only(right: index == icons.length - 1 ? 0 : 24.0),
          child: SvgPicture.asset(icons[index], height: 24)
              .animate(onPlay: (controller) => controller.repeat(reverse: true))
              .moveY(
                begin: -5,
                end: 5,
                duration: 1500.ms,
                curve: Curves.easeInOutSine,
                delay: (index * 200).ms,
              ),
        );
      }),
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
          color: Colors.white.withOpacity(0.9),
          fontSize: 15,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}