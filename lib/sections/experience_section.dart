import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_juan/core/app_translations.dart';
import 'package:portfolio_juan/core/theme.dart';
import 'package:seo/seo.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

  List<Map<String, String>> get experiences => [
    {
      "role": AppTranslations.get('exp_1_role'),
      "date": AppTranslations.get('exp_1_date'),
      "company": AppTranslations.get('exp_1_company'),
      "description": AppTranslations.get('exp_1_desc')
    },
    {
      "role": AppTranslations.get('exp_2_role'), 
      "date": AppTranslations.get('exp_2_date'), 
      "company": AppTranslations.get('exp_2_company'),
      "description": AppTranslations.get('exp_2_desc')
    },
    {
      "role": AppTranslations.get('exp_3_role'), 
      "date": AppTranslations.get('exp_3_date'), 
      "company": AppTranslations.get('exp_3_company'),
      "description": AppTranslations.get('exp_3_desc')
    },
    {
      "role": AppTranslations.get('exp_4_role'), 
      "date": AppTranslations.get('exp_4_date'), 
      "company": AppTranslations.get('exp_4_company'),
      "description": AppTranslations.get('exp_4_desc')
    },
  ];

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
                    '02. ',
                    style: GoogleFonts.firaCode(fontSize: isMobile ? 20 : 24, color: AppTheme.neonCyan),
                  ),
                  Flexible(
                    child: Seo.text(
                      text: AppTranslations.get('exp_title'),
                      style: TextTagStyle.h2,
                      child: Text(
                        AppTranslations.get('exp_title'),
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
              ...experiences.map((exp) => Padding(
                padding: const EdgeInsets.only(bottom: 25),
                child: _buildGlassCard(exp, isMobile),
              )).toList(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildGlassCard(Map<String, String> data, bool isMobile) {
    final descriptions = data["description"]!.split('\n').where((s) => s.trim().isNotEmpty).toList();

    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 16.0, sigmaY: 16.0),
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(isMobile ? 25 : 35),
          decoration: BoxDecoration(
            color: AppTheme.glassBg,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: AppTheme.glassBorder),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Seo.text(
                      text: data["role"]!,
                      style: TextTagStyle.h3,
                      child: Text(
                        data["role"]!,
                        style: GoogleFonts.inter(fontSize: isMobile ? 20 : 22, fontWeight: FontWeight.w600, color: AppTheme.textMain),
                      ),
                    ),
                  ),
                  const SizedBox(width: 15),
                  Text(
                    data["company"]!,
                    style: GoogleFonts.firaCode(fontSize: isMobile ? 12 : 14, color: AppTheme.neonCyan),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                data["date"]!,
                style: GoogleFonts.firaCode(fontSize: isMobile ? 12 : 13, color: AppTheme.textMuted),
              ),
              const SizedBox(height: 20),
              ...descriptions.map((desc) => Padding(
                padding: const EdgeInsets.only(bottom: 12.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('▹ ', style: GoogleFonts.inter(color: AppTheme.neonCyan, fontSize: 16)),
                    Expanded(
                      child: Seo.text(
                        text: desc,
                        style: TextTagStyle.p,
                        child: Text(
                          desc,
                          style: GoogleFonts.inter(color: AppTheme.textMuted, fontSize: isMobile ? 14 : 15, height: 1.5),
                        ),
                      ),
                    ),
                  ],
                ),
              )).toList(),
            ],
          ),
        ),
      ),
    );
  }
}