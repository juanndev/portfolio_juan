import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_juan/core/app_translations.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:seo/seo.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  Future<void> _launchContact() async {
    final Uri url = Uri.parse('mailto:contatojuanndev@gmail.com'); 
    if (!await launchUrl(url)) {
      throw Exception('Não foi possível abrir o link de contato');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          color: const Color(0xFF03120A),
          padding: const EdgeInsets.symmetric(vertical: 120, horizontal: 24),
          child: Column(
            children: [
              Seo.text(
                text: AppTranslations.get('footer_cta'),
                style: TextTagStyle.p,
                child: Text(
                  AppTranslations.get('footer_cta'),
                  textAlign: TextAlign.center,
                  style: GoogleFonts.inter(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.w400,
                    letterSpacing: -0.5,
                  ),
                ),
              ),
              const SizedBox(height: 48),
              Seo.link(
                href: 'mailto:contatojuanndev@gmail.com',
                anchor: 'Enviar e-mail para Juan Mota',
                child: _MagneticContactButton(onTap: _launchContact),
              ),
            ],
          ),
        ),
        Container(
          width: double.infinity,
          color: const Color(0xFF2ECC71),
          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 24),
          child: Center(
            child: Text(
              'Copyright © 2026 juanndev.com. Todos os direitos reservados.',
              textAlign: TextAlign.center,
              style: GoogleFonts.inter(
                color: Colors.black, 
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _MagneticContactButton extends StatefulWidget {
  final VoidCallback onTap;

  const _MagneticContactButton({required this.onTap});

  @override
  State<_MagneticContactButton> createState() => _MagneticContactButtonState();
}

class _MagneticContactButtonState extends State<_MagneticContactButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOutCubic,
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 24),
          decoration: BoxDecoration(
            color: _isHovered ? const Color(0xFF2ECC71).withOpacity(0.1) : const Color(0xFF0B1911),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: _isHovered ? const Color(0xFF2ECC71) : Colors.white.withOpacity(0.1),
            ),
            boxShadow: _isHovered
                ? [
                    BoxShadow(
                      color: const Color(0xFF2ECC71).withOpacity(0.2),
                      blurRadius: 20,
                      offset: const Offset(0, 10),
                    )
                  ]
                : [],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                AppTranslations.get('footer_btn'),
                style: GoogleFonts.inter(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(width: 12),
              AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeOutBack,
                transform: _isHovered ? (Matrix4.identity()..translate(4.0, -4.0)) : Matrix4.identity(),
                child: const Icon(
                  Icons.north_east,
                  color: Colors.white,
                  size: 20,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}