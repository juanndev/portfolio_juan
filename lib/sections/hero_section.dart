import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio_juan/core/app_translations.dart';
import 'package:portfolio_juan/core/theme.dart';
// ignore: avoid_web_libraries_in_flutter
import 'package:flutter_animate/flutter_animate.dart';
import 'package:seo/seo.dart';
import 'package:url_launcher/url_launcher.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  Future<void> _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      throw Exception('Não foi possível abrir o link: $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    
    double titleSize = screenWidth < 400 ? 48 : (screenWidth < 800 ? 64 : 96);
    double subtitleSize = screenWidth < 400 ? 18 : (screenWidth < 800 ? 24 : 32);
    double descSize = screenWidth < 800 ? 16 : 18;
    double actionSpacing = screenWidth < 450 ? 12 : 24;
    bool isMobile = screenWidth < 600;

    return Container(
      width: double.infinity,
      constraints: BoxConstraints(minHeight: MediaQuery.of(context).size.height * 0.9),
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 80),
      child: Center(
        child: Container(
          width: double.infinity,
          constraints: const BoxConstraints(maxWidth: 1000),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Seo.text(
                text: AppTranslations.get('hero_hello'),
                style: TextTagStyle.p,
                child: Text(
                  AppTranslations.get('hero_hello'),
                  style: GoogleFonts.firaCode(
                    color: AppTheme.neonCyan,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ).animate().fadeIn(duration: 800.ms).slideY(begin: 0.5, end: 0),
              const SizedBox(height: 16),
              Seo.text(
                text: 'Juan Mota',
                style: TextTagStyle.h1,
                child: Text(
                  'Juan Mota', 
                  style: GoogleFonts.inter(
                    fontSize: titleSize,
                    fontWeight: FontWeight.w800, 
                    letterSpacing: -2.5, 
                    color: AppTheme.textMain,
                    height: 1.1,
                  ),
                ),
              ).animate().fadeIn(duration: 800.ms, delay: 200.ms).slideY(begin: 0.5, end: 0),
              const SizedBox(height: 12),
              
              _TypewriterText(fontSize: subtitleSize),
              
              const SizedBox(height: 32),
              Container(
                constraints: const BoxConstraints(maxWidth: 650), 
                child: Seo.text(
                  text: AppTranslations.get('hero_desc'),
                  style: TextTagStyle.p,
                  child: Text(
                    AppTranslations.get('hero_desc'),
                    style: GoogleFonts.inter(
                      fontSize: descSize,
                      fontWeight: FontWeight.w400,
                      color: AppTheme.textMuted,
                      height: 1.6,
                    ),
                  ),
                ),
              ).animate().fadeIn(duration: 800.ms, delay: 600.ms),
              const SizedBox(height: 48),
              Wrap(
                spacing: actionSpacing,
                runSpacing: 20,
                alignment: WrapAlignment.start,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  _buildPrimaryButton(isMobile),
                  _buildSocialIcon(FontAwesomeIcons.github, 'https://github.com/juanndev'),
                  _buildSocialIcon(FontAwesomeIcons.linkedinIn, 'https://www.linkedin.com/in/juanndev/'),
                  _buildSocialIcon(FontAwesomeIcons.instagram, 'https://www.instagram.com/juann.dev/'),
                  _buildSocialIcon(FontAwesomeIcons.youtube, 'https://www.youtube.com/@JuanAl%C3%A9mdaTela'),
                ],
              ).animate().fadeIn(duration: 800.ms, delay: 800.ms),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPrimaryButton(bool isMobile) {
    return ElevatedButton(
      onPressed: () {
        // Lógica de download
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: AppTheme.textMain,
        foregroundColor: AppTheme.bgDark,
        padding: EdgeInsets.symmetric(horizontal: isMobile ? 20 : 28, vertical: isMobile ? 16 : 20),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6),
        ),
        elevation: 0,
      ),
      child: Text(
        AppTranslations.get('hero_btn'),
        style: GoogleFonts.inter(
          fontSize: 15,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _buildSocialIcon(IconData icon, String url) {
    return InkWell(
      onTap: () => _launchUrl(url),
      hoverColor: Colors.transparent,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: FaIcon(
        icon,
        color: AppTheme.textMuted,
        size: 24,
      ),
    );
  }
}

class _TypewriterText extends StatefulWidget {
  final double fontSize;

  const _TypewriterText({required this.fontSize});

  @override
  State<_TypewriterText> createState() => _TypewriterTextState();
}

class _TypewriterTextState extends State<_TypewriterText> {
  String _displayedText = "";
  int _textIndex = 0;
  int _charIndex = 0;
  bool _isDeleting = false;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _type();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _type() {
    final texts = [
      AppTranslations.get('typewriter_1'),
      AppTranslations.get('typewriter_2'),
      AppTranslations.get('typewriter_3'),
    ];

    if (_textIndex >= texts.length) _textIndex = 0;
    String currentFullText = texts[_textIndex];

    if (!mounted) return;

    setState(() {
      if (_isDeleting) {
        _displayedText = currentFullText.substring(0, _charIndex);
        _charIndex--;
      } else {
        _displayedText = currentFullText.substring(0, _charIndex);
        _charIndex++;
      }
    });

    int speed = _isDeleting ? 40 : 80;

    if (!_isDeleting && _charIndex > currentFullText.length) {
      speed = 2500; 
      _isDeleting = true;
      _charIndex = currentFullText.length;
    } else if (_isDeleting && _charIndex < 0) {
      _isDeleting = false;
      _textIndex++;
      _charIndex = 0;
      speed = 500; 
    }

    _timer = Timer(Duration(milliseconds: speed), _type);
  }

  @override
  Widget build(BuildContext context) {
    return Seo.text(
      text: _displayedText,
      style: TextTagStyle.h2,
      child: Text(
        '> $_displayedText',
        style: GoogleFonts.firaCode(
          fontSize: widget.fontSize,
          fontWeight: FontWeight.w600,
          color: AppTheme.textMuted,
        ),
      ),
    ).animate().fadeIn(duration: 800.ms, delay: 400.ms);
  }
}