import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_juan/core/app_translations.dart';
import 'package:portfolio_juan/core/theme.dart';
import 'package:seo/seo.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    bool isMobile = screenWidth < 600;

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
                    '01. ',
                    style: GoogleFonts.firaCode(fontSize: isMobile ? 20 : 24, color: AppTheme.neonCyan),
                  ),
                  Flexible(
                    child: Seo.text(
                      text: AppTranslations.get('about_title'),
                      style: TextTagStyle.h2,
                      child: Text(
                        AppTranslations.get('about_title'),
                        style: GoogleFonts.inter(
                          fontSize: isMobile ? 22 : 28,
                          fontWeight: FontWeight.w700,
                          color: AppTheme.textMain,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: Container(height: 1, color: AppTheme.glassBorder),
                  ),
                ],
              ),
              const SizedBox(height: 40),
              _buildGlassCard(
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    bool isDesktop = constraints.maxWidth > 800;
                    return isDesktop
                        ? Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(flex: 3, child: _buildTextContent()),
                              const SizedBox(width: 40),
                              Expanded(flex: 2, child: _buildTerminal()),
                            ],
                          )
                        : Column(
                            children: [
                              _buildTextContent(),
                              const SizedBox(height: 40),
                              _buildTerminal(),
                            ],
                          );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildGlassCard({required Widget child}) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 16.0, sigmaY: 16.0),
        child: Container(
          padding: const EdgeInsets.all(40),
          decoration: BoxDecoration(
            color: AppTheme.glassBg,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: AppTheme.glassBorder),
          ),
          child: child,
        ),
      ),
    );
  }

  Widget _buildTextContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Seo.text(
          text: AppTranslations.get('about_desc'),
          style: TextTagStyle.p,
          child: Text(
            AppTranslations.get('about_desc'),
            style: GoogleFonts.inter(
              color: AppTheme.textMuted,
              fontSize: 16,
              height: 1.6,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTerminal() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.4),
        border: Border.all(color: AppTheme.glassBorder),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.05),
              border: Border(bottom: BorderSide(color: AppTheme.glassBorder)),
            ),
            child: Row(
              children: [
                _buildDot(const Color(0xFFFF5F56)),
                const SizedBox(width: 8),
                _buildDot(const Color(0xFFFFBD2E)),
                const SizedBox(width: 8),
                _buildDot(const Color(0xFF27C93F)),
                const SizedBox(width: 15),
                Text(
                  'juan@macbook-air: ~',
                  style: GoogleFonts.firaCode(color: AppTheme.textMuted, fontSize: 12),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text('\$ ', style: GoogleFonts.firaCode(color: AppTheme.neonCyan, fontSize: 14)),
                    Text('whoami', style: GoogleFonts.firaCode(color: AppTheme.textMain, fontSize: 14)),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  AppTranslations.get('term_role'),
                  style: GoogleFonts.firaCode(color: AppTheme.textMuted, fontSize: 14),
                ),
                const SizedBox(height: 15),
                Row(
                  children: [
                    Text('\$ ', style: GoogleFonts.firaCode(color: AppTheme.neonCyan, fontSize: 14)),
                    Text('ls ./interests', style: GoogleFonts.firaCode(color: AppTheme.textMain, fontSize: 14)),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  'AppSec  UI_UX  Mobile_Dev  Web_Dev',
                  style: GoogleFonts.firaCode(color: AppTheme.textMuted, fontSize: 14),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDot(Color color) {
    return Container(
      width: 10,
      height: 10,
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
    );
  }
}