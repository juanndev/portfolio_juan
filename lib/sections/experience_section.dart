import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_juan/core/app_translations.dart';
import 'package:seo/seo.dart';

class ExperienceSection extends StatefulWidget {
  const ExperienceSection({super.key});

  @override
  State<ExperienceSection> createState() => _ExperienceSectionState();
}

class _ExperienceSectionState extends State<ExperienceSection> {
  int _selectedIndex = 0;

  List<Map<String, String>> get experiences => [
    {
      "menuTitle": AppTranslations.get('exp_1_menu'),
      "role": AppTranslations.get('exp_1_role'),
      "date": AppTranslations.get('exp_1_date'),
      "company": AppTranslations.get('exp_1_company'),
      "description": AppTranslations.get('exp_1_desc')
    },
    {
      "menuTitle": AppTranslations.get('exp_2_menu'),
      "role": AppTranslations.get('exp_2_role'), 
      "date": AppTranslations.get('exp_2_date'), 
      "company": AppTranslations.get('exp_2_company'),
      "description": AppTranslations.get('exp_2_desc')
    },
    {
      "menuTitle":AppTranslations.get('exp_3_menu'),
      "role": AppTranslations.get('exp_3_role'), 
      "date": AppTranslations.get('exp_3_date'), 
      "company": AppTranslations.get('exp_3_company'),
      "description": AppTranslations.get('exp_3_desc')
    },
    {
      "menuTitle": AppTranslations.get('exp_4_menu'),
      "role": AppTranslations.get('exp_4_role'), 
      "date": AppTranslations.get('exp_4_date'), 
      "company": AppTranslations.get('exp_4_company'),
      "description": AppTranslations.get('exp_4_desc')
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: const Color(0xFF0B1610),
      padding: const EdgeInsets.symmetric(vertical: 100, horizontal: 24),
      child: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 1050),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Seo.text(
                    text: AppTranslations.get('exp_title'),
                    style: TextTagStyle.h2,
                    child: Text(
                      AppTranslations.get('exp_title'),
                      style: GoogleFonts.inter(
                        fontSize: 32,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Text(
                    ' .',
                    style: GoogleFonts.inter(
                      fontSize: 32,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xFF2ECC71),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 60),
              LayoutBuilder(
                builder: (context, constraints) {
                  bool isDesktop = constraints.maxWidth > 800;

                  if (isDesktop) {
                    return Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildLeftMenu(),
                        const SizedBox(width: 60),
                        Expanded(child: _buildRightContent()),
                      ],
                    );
                  } else {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildLeftMenu(isMobile: true),
                        const SizedBox(height: 40),
                        _buildRightContent(),
                      ],
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLeftMenu({bool isMobile = false}) {
    return Container(
      width: isMobile ? double.infinity : 280,
      decoration: BoxDecoration(
        color: const Color(0xFF040615),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(experiences.length, (index) {
          bool isSelected = _selectedIndex == index;

          return InkWell(
            onTap: () {
              setState(() {
                _selectedIndex = index;
              });
            },
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 24),
              decoration: BoxDecoration(
                border: Border(
                  left: BorderSide(
                    color: isSelected ? const Color(0xFF2ECC71) : Colors.transparent,
                    width: 3,
                  ),
                ),
                color: isSelected ? Colors.white.withOpacity(0.02) : Colors.transparent,
              ),
              child: Text(
                experiences[index]["menuTitle"]!,
                style: GoogleFonts.inter(
                  color: isSelected ? const Color(0xFF2ECC71) : const Color(0xFFE2E8F0),
                  fontSize: 16,
                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                ),
              ),
            ),
          );
        }),
      ),
    );
  }

  Widget _buildRightContent() {
    final activeData = experiences[_selectedIndex];

    return AnimatedSize(
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeInOut,
      alignment: Alignment.topCenter,
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 600),
        switchInCurve: Curves.easeInOut,
        switchOutCurve: Curves.easeInOut,
        child: Column(
          key: ValueKey<int>(_selectedIndex),
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              alignment: WrapAlignment.spaceBetween,
              children: [
                Seo.text(
                  text: activeData["role"]!,
                  style: TextTagStyle.h3,
                  child: Text(
                    activeData["role"]!,
                    style: GoogleFonts.inter(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Text(
                  activeData["date"]!,
                  style: GoogleFonts.inter(
                    color: const Color(0xFFA0AEC0),
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              activeData["company"]!,
              style: GoogleFonts.inter(
                color: const Color(0xFF2ECC71),
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 24),
            Seo.text(
              text: activeData["description"]!,
              style: TextTagStyle.p,
              child: Text(
                activeData["description"]!,
                style: GoogleFonts.inter(
                  color: const Color(0xFFA0AEC0),
                  fontSize: 16,
                  height: 1.6,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}