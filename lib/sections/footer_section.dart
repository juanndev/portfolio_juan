import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_juan/core/app_translations.dart';
import 'package:url_launcher/url_launcher.dart';

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
              Text(
                AppTranslations.get('footer_cta'),
                textAlign: TextAlign.center,
                style: GoogleFonts.inter(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.w400,
                  letterSpacing: -0.5,
                ),
              ),
              const SizedBox(height: 48),
              
              // Botão de Contato Estilizado
              OutlinedButton(
                onPressed: _launchContact,
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 24),
                  side: BorderSide(color: Colors.white.withOpacity(0.1)),
                  backgroundColor: const Color(0xFF0B1911), // Fundo sutil
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
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
                    const Icon(
                      Icons.north_east,
                      color: Colors.white,
                      size: 20,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),

        // --- BARRA VERDE DE COPYRIGHT ---
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