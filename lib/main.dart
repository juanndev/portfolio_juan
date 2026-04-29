import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import 'sections/hero_section.dart';
import 'sections/about_section.dart';
import 'sections/experience_section.dart';
import 'sections/projects_section.dart';
import 'sections/services_section.dart';
import 'sections/footer_section.dart';

import 'core/app_translations.dart';
import 'core/animated_reveal.dart';

void main() {
  runApp(const PortfolioApp());
}

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Juan Mota | Portfolio',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFF03120A),
        colorScheme: const ColorScheme.dark(primary: Color(0xFF2ECC71)),
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>(); 
  
  final GlobalKey _heroKey = GlobalKey();
  final GlobalKey _aboutKey = GlobalKey();
  final GlobalKey _projectsKey = GlobalKey();
  final GlobalKey _contactKey = GlobalKey();

  final ScrollController _scrollController = ScrollController();
  final ValueNotifier<double> _scrollProgress = ValueNotifier<double>(0.0);

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.maxScrollExtent > 0) {
        _scrollProgress.value = _scrollController.offset / _scrollController.position.maxScrollExtent;
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _scrollProgress.dispose();
    super.dispose();
  }

  Future<void> _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      debugPrint('Não foi possível abrir o link $url');
    }
  }

  void _scrollTo(GlobalKey key) {
    if (key.currentContext != null) {
      Scrollable.ensureVisible(
        key.currentContext!,
        duration: const Duration(milliseconds: 800),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<String>(
      valueListenable: appLanguage,
      builder: (context, idiomaAtual, child) {
        return Scaffold(
          key: _scaffoldKey,
          drawer: _buildMobileDrawer(context),
          body: Stack(
            children: [
              SingleChildScrollView(
                controller: _scrollController,
                child: Column(
                  children: [
                    AnimatedReveal(
                      id: 'hero_reveal',
                      child: Container(key: _heroKey, child: HeroSection()),
                    ),
                    AnimatedReveal(
                      id: 'about_reveal',
                      child: Container(key: _aboutKey, child: AboutSection()),
                    ),
                    AnimatedReveal(
                      id: 'experience_reveal',
                      child: ExperienceSection(),
                    ),
                    AnimatedReveal(
                      id: 'projects_reveal',
                      child: Container(key: _projectsKey, child: ProjectsSection()),
                    ),
                    AnimatedReveal(
                      id: 'services_reveal',
                      child: ServicesSection(),
                    ),
                    AnimatedReveal(
                      id: 'contact_reveal',
                      child: Container(key: _contactKey, child: FooterSection()),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: _buildStickyNavBar(context),
              ),
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: ValueListenableBuilder<double>(
                  valueListenable: _scrollProgress,
                  builder: (context, progress, child) {
                    return Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        height: 3,
                        width: MediaQuery.of(context).size.width * progress.clamp(0.0, 1.0),
                        color: const Color(0xFF2ECC71),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildMobileDrawer(BuildContext context) {
    return Drawer(
      backgroundColor: const Color(0xFF03120A),
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: IconButton(
              icon: const Icon(Icons.close, color: Colors.white, size: 28),
              onPressed: () => Navigator.pop(context),
            ),
          ),
          const SizedBox(height: 40),
          _buildDrawerItem(AppTranslations.get('nav_projects'), _projectsKey),
          _buildDrawerItem(AppTranslations.get('nav_about'), _aboutKey),
          _buildDrawerItem(AppTranslations.get('nav_contact'), _contactKey),
        ],
      ),
    );
  }

  Widget _buildDrawerItem(String text, GlobalKey key) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(
        text,
        style: GoogleFonts.inter(
          color: Colors.white.withOpacity(0.9),
          fontSize: 20,
          fontWeight: FontWeight.w500,
        ),
      ),
      onTap: () {
        Navigator.pop(context); 
        _scrollTo(key); 
      },
    );
  }

  Widget _buildStickyNavBar(BuildContext context) {
    bool isMobile = MediaQuery.of(context).size.width < 800;

    return Container(
      margin: const EdgeInsets.only(top: 24),
      alignment: Alignment.center,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
            decoration: BoxDecoration(
              color: const Color(0xFF0B1911).withOpacity(0.7),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Colors.white.withOpacity(0.05)),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (!isMobile) ...[
                  _NavBarLink(text: AppTranslations.get('nav_projects'), onTap: () => _scrollTo(_projectsKey)),
                  const SizedBox(width: 32),
                  _NavBarLink(text: AppTranslations.get('nav_about'), onTap: () => _scrollTo(_aboutKey)),
                  const SizedBox(width: 32),
                  _NavBarLink(text: AppTranslations.get('nav_contact'), onTap: () => _scrollTo(_contactKey)),
                  const SizedBox(width: 48),
                ] else ...[
                  IconButton(
                    icon: const Icon(Icons.menu, color: Colors.white),
                    onPressed: () => _scaffoldKey.currentState?.openDrawer(),
                  ),
                  const SizedBox(width: 16),
                ],
                
                IconButton(
                  onPressed: () => _launchUrl('https://github.com/juanndev'), 
                  icon: const FaIcon(FontAwesomeIcons.github, color: Colors.white, size: 20),
                ),
                IconButton(
                  onPressed: () => _launchUrl('https://www.linkedin.com/in/juanndev/'), 
                  icon: const FaIcon(FontAwesomeIcons.linkedin, color: Colors.white, size: 20),
                ),
                const SizedBox(width: 8),
                
                Container(width: 4, height: 4, decoration: BoxDecoration(color: Colors.white.withOpacity(0.2), shape: BoxShape.circle)),
                const SizedBox(width: 16),
                
                PopupMenuButton<String>(
                  color: const Color(0xFF131C18),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  offset: const Offset(0, 40),
                  
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.05),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          appLanguage.value == 'pt' ? '🇧🇷' : appLanguage.value == 'en' ? '🇺🇸' : '🇪🇸',
                          style: const TextStyle(fontSize: 18),
                        ),
                        const SizedBox(width: 4),
                        const Icon(Icons.keyboard_arrow_down, color: Colors.white54, size: 16),
                      ],
                    ),
                  ),
                  
                  onSelected: (String novoIdioma) {
                    appLanguage.value = novoIdioma;
                  },
                  
                  itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                    PopupMenuItem<String>(
                      value: 'pt',
                      child: Row(children: [const Text('🇧🇷'), const SizedBox(width: 10), Text('Português', style: GoogleFonts.inter(color: Colors.white))]),
                    ),
                    PopupMenuItem<String>(
                      value: 'en',
                      child: Row(children: [const Text('🇺🇸'), const SizedBox(width: 10), Text('English', style: GoogleFonts.inter(color: Colors.white))]),
                    ),
                    PopupMenuItem<String>(
                      value: 'es',
                      child: Row(children: [const Text('🇪🇸'), const SizedBox(width: 10), Text('Español', style: GoogleFonts.inter(color: Colors.white))]),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _NavBarLink extends StatelessWidget {
  final String text;
  final VoidCallback onTap;

  const _NavBarLink({required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Text(text, style: GoogleFonts.inter(color: Colors.white.withOpacity(0.9), fontSize: 15)),
    );
  }
}