import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:seo/seo.dart';

import 'sections/hero_section.dart';
import 'sections/about_section.dart';
import 'sections/experience_section.dart';
import 'sections/projects_section.dart';
import 'sections/stack_section.dart';
import 'sections/services_section.dart';
import 'sections/footer_section.dart';

import 'core/app_translations.dart';
import 'core/animated_reveal.dart';
import 'core/theme.dart';

void main() {
  usePathUrlStrategy();
  runApp(const PortfolioApp());
}

void usePathUrlStrategy() {}

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return SeoController(
      enabled: true,
      tree: WidgetTree(context: context),
      child: MaterialApp(
        title: 'Juan Mota | Portfolio',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: AppTheme.bgDark, 
          colorScheme: const ColorScheme.dark(primary: AppTheme.neonCyan),
        ),
        home: const HomePage(),
      ),
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
  final GlobalKey _experienceKey = GlobalKey(); 
  final GlobalKey _projectsKey = GlobalKey();
  final GlobalKey _stackKey = GlobalKey(); 
  final GlobalKey _servicesKey = GlobalKey(); 
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

  Widget _buildBlurOrb(Color color, double size) {
    return ImageFiltered(
      imageFilter: ImageFilter.blur(sigmaX: 100.0, sigmaY: 100.0),
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color.withOpacity(0.4),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    bool isMobile = MediaQuery.of(context).size.width < 800;

    return ValueListenableBuilder<String>(
      valueListenable: appLanguage,
      builder: (context, idiomaAtual, child) {
        return Scaffold(
          key: _scaffoldKey,
          endDrawer: _buildMobileDrawer(context),
          body: Stack(
            children: [
              if (!isMobile) ...[
                Positioned(top: -100, left: -100, child: _buildBlurOrb(AppTheme.neonPurple, 500)),
                Positioned(bottom: -200, right: -100, child: _buildBlurOrb(AppTheme.neonCyan, 600)),
              ],

              SingleChildScrollView(
                controller: _scrollController,
                child: Column(
                  children: [
                    AnimatedReveal(id: 'hero_reveal', child: Container(key: _heroKey, child: HeroSection())),
                    AnimatedReveal(id: 'about_reveal', child: Container(key: _aboutKey, child: AboutSection())),
                    AnimatedReveal(id: 'experience_reveal', child: Container(key: _experienceKey, child: ExperienceSection())),
                    AnimatedReveal(id: 'projects_reveal', child: Container(key: _projectsKey, child: ProjectsSection())),
                    AnimatedReveal(id: 'stack_reveal', child: Container(key: _stackKey, child: StackSection())), 
                    AnimatedReveal(id: 'services_reveal', child: Container(key: _servicesKey, child: ServicesSection())),
                    AnimatedReveal(id: 'contact_reveal', child: Container(key: _contactKey, child: FooterSection())),
                  ],
                ),
              ),
              
              Positioned(top: 0, left: 0, right: 0, child: _buildStickyNavBar(context)),
              
              Positioned(
                top: 0, left: 0, right: 0,
                child: ValueListenableBuilder<double>(
                  valueListenable: _scrollProgress,
                  builder: (context, progress, child) {
                    return Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        height: 3,
                        width: MediaQuery.of(context).size.width * progress.clamp(0.0, 1.0),
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(colors: [AppTheme.neonPurple, AppTheme.neonCyan]),
                        ),
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
      backgroundColor: AppTheme.bgDark.withOpacity(0.95),
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
          _buildDrawerItem(AppTranslations.get('nav_about'), _aboutKey),
          _buildDrawerItem(AppTranslations.get('nav_exp'), _experienceKey),
          _buildDrawerItem(AppTranslations.get('nav_projects'), _projectsKey),
          _buildDrawerItem(AppTranslations.get('nav_stack'), _stackKey),
          _buildDrawerItem(AppTranslations.get('nav_serv'), _servicesKey),
          _buildDrawerItem(AppTranslations.get('nav_contact'), _contactKey),
          const SizedBox(height: 30),
          Divider(color: AppTheme.glassBorder),
          const SizedBox(height: 20),
          
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildLangButton('pt', '🇧🇷'),
              const SizedBox(width: 15),
              _buildLangButton('en', '🇺🇸'),
              const SizedBox(width: 15),
              _buildLangButton('es', '🇪🇸'),
            ],
          ),
          const SizedBox(height: 30),
          
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(onPressed: () => _launchUrl('https://github.com/juanndev'), icon: const FaIcon(FontAwesomeIcons.github, color: AppTheme.textMain)),
              IconButton(onPressed: () => _launchUrl('https://www.linkedin.com/in/juanndev/'), icon: const FaIcon(FontAwesomeIcons.linkedin, color: AppTheme.textMain)),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildLangButton(String lang, String flag) {
    bool isActive = appLanguage.value == lang;
    return InkWell(
      onTap: () {
        appLanguage.value = lang;
        Navigator.pop(context);
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: isActive ? Colors.white.withOpacity(0.1) : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: isActive ? AppTheme.neonCyan : Colors.transparent),
        ),
        child: Text(flag, style: const TextStyle(fontSize: 24)),
      ),
    );
  }

  Widget _buildDrawerItem(String text, GlobalKey key) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Center(
        child: Text(
          text,
          style: GoogleFonts.firaCode(color: AppTheme.textMain, fontSize: 16),
        ),
      ),
      onTap: () {
        Navigator.pop(context); 
        _scrollTo(key); 
      },
    );
  }

  Widget _buildStickyNavBar(BuildContext context) {
    bool isMobile = MediaQuery.of(context).size.width < 950;
    double paddingHorizontal = isMobile ? 20.0 : 32.0;

    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        width: 1200, 
        margin: const EdgeInsets.only(top: 24),
        padding: const EdgeInsets.symmetric(horizontal: 24), 
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 16.0, sigmaY: 16.0), 
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: paddingHorizontal, vertical: 15),
              decoration: BoxDecoration(
                color: AppTheme.glassBg, 
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppTheme.glassBorder),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween, 
                children: [
                  RichText(
                    text: TextSpan(
                      style: GoogleFonts.inter(fontSize: 20, fontWeight: FontWeight.bold, color: AppTheme.textMain),
                      children: const [
                        TextSpan(text: '<Juan '),
                        TextSpan(text: '/', style: TextStyle(color: AppTheme.neonCyan)),
                        TextSpan(text: '>'),
                      ],
                    ),
                  ),

                  if (isMobile)
                    IconButton(
                      icon: const Icon(Icons.menu, color: Colors.white),
                      onPressed: () => _scaffoldKey.currentState?.openEndDrawer(),
                    )
                  else
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        _NavBarLink(text: AppTranslations.get('nav_about'), onTap: () => _scrollTo(_aboutKey)),
                        const SizedBox(width: 20),
                        _NavBarLink(text: AppTranslations.get('nav_exp'), onTap: () => _scrollTo(_experienceKey)),
                        const SizedBox(width: 20),
                        _NavBarLink(text: AppTranslations.get('nav_projects'), onTap: () => _scrollTo(_projectsKey)),
                        const SizedBox(width: 20),
                        _NavBarLink(text: AppTranslations.get('nav_stack'), onTap: () => _scrollTo(_stackKey)),
                        const SizedBox(width: 20),
                        _NavBarLink(text: AppTranslations.get('nav_serv'), onTap: () => _scrollTo(_servicesKey)),
                        const SizedBox(width: 20),
                        _NavBarLink(text: AppTranslations.get('nav_contact'), onTap: () => _scrollTo(_contactKey)),
                        
                        const SizedBox(width: 20),
                        
                        Seo.link(href: 'https://github.com/juanndev', anchor: 'GitHub', child: IconButton(onPressed: () => _launchUrl('https://github.com/juanndev'), icon: const FaIcon(FontAwesomeIcons.github, color: AppTheme.textMain, size: 20))),
                        Seo.link(href: 'https://www.linkedin.com/in/juanndev/', anchor: 'LinkedIn', child: IconButton(onPressed: () => _launchUrl('https://www.linkedin.com/in/juanndev/'), icon: const FaIcon(FontAwesomeIcons.linkedin, color: AppTheme.textMain, size: 20))),
                        
                        const SizedBox(width: 8),
                        Container(width: 4, height: 4, decoration: BoxDecoration(color: Colors.white.withOpacity(0.2), shape: BoxShape.circle)),
                        const SizedBox(width: 16),
                        
                        PopupMenuButton<String>(
                          color: AppTheme.bgDark.withOpacity(0.9), 
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12), side: BorderSide(color: AppTheme.glassBorder)),
                          offset: const Offset(0, 40),
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                            decoration: BoxDecoration(color: Colors.white.withOpacity(0.05), borderRadius: BorderRadius.circular(8), border: Border.all(color: AppTheme.glassBorder)),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(appLanguage.value == 'pt' ? '🇧🇷' : appLanguage.value == 'en' ? '🇺🇸' : '🇪🇸', style: const TextStyle(fontSize: 18)),
                                const SizedBox(width: 4),
                                const Icon(Icons.keyboard_arrow_down, color: Colors.white54, size: 16),
                              ],
                            ),
                          ),
                          onSelected: (String novoIdioma) => appLanguage.value = novoIdioma,
                          itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                            PopupMenuItem<String>(value: 'pt', child: Row(children: [const Text('🇧🇷'), const SizedBox(width: 10), Text('Português', style: GoogleFonts.inter(color: Colors.white))])),
                            PopupMenuItem<String>(value: 'en', child: Row(children: [const Text('🇺🇸'), const SizedBox(width: 10), Text('English', style: GoogleFonts.inter(color: Colors.white))])),
                            PopupMenuItem<String>(value: 'es', child: Row(children: [const Text('🇪🇸'), const SizedBox(width: 10), Text('Español', style: GoogleFonts.inter(color: Colors.white))])),
                          ],
                        ),
                      ],
                    ),
                ],
              ),
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
      child: Text(text, style: GoogleFonts.firaCode(color: AppTheme.textMain, fontSize: 13)),
    );
  }
}