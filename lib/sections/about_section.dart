import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio_juan/core/app_translations.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:seo/seo.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF03120A),
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 24),
      child: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 1050),
          decoration: BoxDecoration(
            color: const Color(0xFF131C18),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.white.withOpacity(0.05)),
          ),
          child: LayoutBuilder(
            builder: (context, constraints) {
              bool isDesktop = constraints.maxWidth > 800;

              Widget textContent = Padding(
                padding: const EdgeInsets.all(56.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Seo.text(
                      text: AppTranslations.get('about_title'),
                      style: TextTagStyle.h2,
                      child: Text(
                        AppTranslations.get('about_title'),
                        style: GoogleFonts.archivo(
                          color: const Color(0xFF2ECC71),
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Seo.text(
                      text: 'Juan Mota',
                      style: TextTagStyle.h3,
                      child: Text(
                        'Juan Mota',
                        style: GoogleFonts.archivo(
                          color: Colors.white,
                          fontSize: 36,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      AppTranslations.get('about_subtitle'),
                      style: GoogleFonts.archivo(
                        color: const Color(0xFFE2E8F0),
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(height: 32),
                    Seo.text(
                      text: AppTranslations.get('about_desc'),
                      style: TextTagStyle.p,
                      child: Text(
                        AppTranslations.get('about_desc'),
                        style: GoogleFonts.archivo(
                          color: const Color(0xFFA0AEC0),
                          fontSize: 15,
                          height: 1.6,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                    const SizedBox(height: 48),
                    Wrap(
                      spacing: 16,
                      runSpacing: 16,
                      children: const [
                        _SocialButton(
                          icon: FontAwesomeIcons.instagram,
                          url: 'https://www.instagram.com/juann.dev/',
                          anchor: 'Instagram',
                        ),
                        _SocialButton(
                          icon: FontAwesomeIcons.linkedinIn,
                          url: 'https://www.linkedin.com/in/juanndev/',
                          anchor: 'LinkedIn',
                        ),
                        _SocialButton(
                          icon: FontAwesomeIcons.github,
                          url: 'https://github.com/juanndev',
                          anchor: 'GitHub',
                        ),
                        _SocialButton(
                          icon: FontAwesomeIcons.behance,
                          url: 'https://www.behance.net/juanmota6',
                          anchor: 'Behance',
                        ),
                      ],
                    )
                  ],
                ),
              );

              Widget imageContent = ClipRRect(
                borderRadius: isDesktop
                    ? const BorderRadius.only(topLeft: Radius.circular(8), bottomLeft: Radius.circular(8))
                    : const BorderRadius.vertical(top: Radius.circular(8)),
                child: Seo.image(
                  src: 'assets/images/perfil.jpg',
                  alt: 'Foto de Perfil de Juan Mota',
                  child: Image.asset(
                    'assets/images/perfil.jpg',
                    width: isDesktop ? 511 : double.infinity,
                    height: isDesktop ? 511 : 400,
                    fit: BoxFit.cover,
                  ).animate(onPlay: (controller) => controller.repeat(reverse: true))
                   .scaleXY(begin: 1.0, end: 1.05, duration: 8.seconds, curve: Curves.easeInOut),
                ),
              );

              return isDesktop
                  ? IntrinsicHeight(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          imageContent,
                          Expanded(child: textContent),
                        ],
                      ),
                    )
                  : Column(
                      children: [
                        imageContent,
                        textContent,
                      ],
                    );
            },
          ),
        ),
      ),
    );
  }
}

class _SocialButton extends StatefulWidget {
  final IconData icon;
  final String url;
  final String anchor;

  const _SocialButton({required this.icon, required this.url, required this.anchor});

  @override
  State<_SocialButton> createState() => _SocialButtonState();
}

class _SocialButtonState extends State<_SocialButton> {
  bool _isHovered = false;

  Future<void> _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      throw Exception('Não foi possível abrir o link: $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Seo.link(
      href: widget.url,
      anchor: widget.anchor,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: (_) => setState(() => _isHovered = true),
        onExit: (_) => setState(() => _isHovered = false),
        child: GestureDetector(
          onTap: () => _launchUrl(widget.url),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeOutCubic,
            width: 48,
            height: 48,
            transform: _isHovered ? (Matrix4.identity()..translate(0.0, -4.0)) : Matrix4.identity(),
            decoration: BoxDecoration(
              color: _isHovered ? const Color(0xFF2ECC71).withOpacity(0.1) : Colors.transparent,
              border: Border.all(
                color: _isHovered ? const Color(0xFF2ECC71) : Colors.white.withOpacity(0.1),
              ),
              borderRadius: BorderRadius.circular(8),
              boxShadow: _isHovered
                  ? [
                      BoxShadow(
                        color: const Color(0xFF2ECC71).withOpacity(0.2),
                        blurRadius: 12,
                        offset: const Offset(0, 4),
                      )
                    ]
                  : [],
            ),
            child: Center(
              child: FaIcon(
                widget.icon,
                color: const Color(0xFF2ECC71),
                size: 20,
              ),
            ),
          ),
        ),
      ),
    );
  }
}