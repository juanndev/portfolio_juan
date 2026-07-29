import 'dart:ui';
import 'dart:convert';
// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_juan/core/app_translations.dart';
import 'package:portfolio_juan/core/theme.dart';

class FooterSection extends StatefulWidget {
  const FooterSection({super.key});

  @override
  State<FooterSection> createState() => _FooterSectionState();
}

class _FooterSectionState extends State<FooterSection> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _msgController = TextEditingController();
  String? _selectedService;
  bool _isSending = false;

  void _submitForm() {
    if (_nameController.text.isEmpty || _emailController.text.isEmpty || _msgController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Preencha os campos obrigatórios.')));
      return;
    }

    setState(() => _isSending = true);

    final req = html.HttpRequest();
    req.open('POST', 'https://formsubmit.co/contatojuanndev@gmail.com');
    req.setRequestHeader('Accept', 'application/json');
    req.setRequestHeader('Content-Type', 'application/json');

    req.onLoadEnd.listen((e) {
      setState(() => _isSending = false);
      if (req.status == 200) {
        _nameController.clear();
        _lastNameController.clear();
        _emailController.clear();
        _phoneController.clear();
        _msgController.clear();
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Mensagem enviada com sucesso!')));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Erro ao enviar mensagem.')));
      }
    });

    req.send(jsonEncode({
      "_captcha": "false",
      "_template": "basic",
      "Nome": _nameController.text,
      "Sobrenome": _lastNameController.text,
      "Email": _emailController.text,
      "Telefone": _phoneController.text,
      "Servico_Desejado": _selectedService ?? "Não especificado",
      "Mensagem": _msgController.text,
    }));
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    bool isMobile = screenWidth < 600;

    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 100, horizontal: 24),
          child: Center(
            child: Container(
              constraints: const BoxConstraints(maxWidth: 1000),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text('06. ', style: GoogleFonts.firaCode(fontSize: isMobile ? 20 : 24, color: AppTheme.neonCyan)),
                      Flexible(
                        child: Text(
                          AppTranslations.get('footer_cta') != 'footer_cta' 
                              ? AppTranslations.get('footer_cta') 
                              : 'Vamos Conversar?',
                          style: GoogleFonts.inter(fontSize: isMobile ? 22 : 28, fontWeight: FontWeight.w700, color: AppTheme.textMain),
                        ),
                      ),
                      const SizedBox(width: 15),
                      Expanded(child: Container(height: 1, color: AppTheme.glassBorder)),
                    ],
                  ),
                  const SizedBox(height: 40),
                  ClipRRect(
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
                        child: LayoutBuilder(
                          builder: (context, constraints) {
                            bool formIsMobile = constraints.maxWidth < 600;
                            return Column(
                              children: [
                                if (formIsMobile) ...[
                                  _buildTextField(_nameController, AppTranslations.get('contact_fname')),
                                  const SizedBox(height: 20),
                                  _buildTextField(_lastNameController, AppTranslations.get('contact_lname')),
                                  const SizedBox(height: 20),
                                  _buildTextField(_emailController, AppTranslations.get('contact_email')),
                                  const SizedBox(height: 20),
                                  _buildTextField(_phoneController, AppTranslations.get('contact_phone')),
                                ] else ...[
                                  Row(
                                    children: [
                                      Expanded(child: _buildTextField(_nameController, AppTranslations.get('contact_fname'))),
                                      const SizedBox(width: 20),
                                      Expanded(child: _buildTextField(_lastNameController, AppTranslations.get('contact_lname'))),
                                    ],
                                  ),
                                  const SizedBox(height: 20),
                                  Row(
                                    children: [
                                      Expanded(child: _buildTextField(_emailController, AppTranslations.get('contact_email'))),
                                      const SizedBox(width: 20),
                                      Expanded(child: _buildTextField(_phoneController, AppTranslations.get('contact_phone'))),
                                    ],
                                  ),
                                ],
                                const SizedBox(height: 20),
                                _buildDropdown(),
                                const SizedBox(height: 20),
                                _buildTextField(_msgController, AppTranslations.get('contact_msg'), maxLines: 5),
                                const SizedBox(height: 30),
                                SizedBox(
                                  width: double.infinity,
                                  height: 50,
                                  child: ElevatedButton(
                                    onPressed: _isSending ? null : _submitForm,
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: AppTheme.textMain,
                                      foregroundColor: AppTheme.bgDark,
                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
                                    ),
                                    child: Text(
                                      _isSending ? 'Enviando...' : AppTranslations.get('footer_btn'),
                                      style: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 40),
          child: Text(
            'Designed & Built by Juan\n${AppTranslations.get('footer_copy')}',
            textAlign: TextAlign.center,
            style: GoogleFonts.firaCode(color: AppTheme.textMuted, fontSize: 13, height: 1.5),
          ),
        ),
      ],
    );
  }

  Widget _buildTextField(TextEditingController controller, String hint, {int maxLines = 1}) {
    return TextFormField(
      controller: controller,
      maxLines: maxLines,
      style: GoogleFonts.inter(color: AppTheme.textMain),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: GoogleFonts.inter(color: AppTheme.textMuted),
        filled: true,
        fillColor: Colors.white.withOpacity(0.03),
        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: BorderSide(color: AppTheme.glassBorder)),
        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: const BorderSide(color: AppTheme.neonCyan)),
      ),
    );
  }

  Widget _buildDropdown() {
    return DropdownButtonFormField<String>(
      value: _selectedService,
      dropdownColor: AppTheme.bgDark,
      style: GoogleFonts.inter(color: AppTheme.textMain),
      decoration: InputDecoration(
        hintText: AppTranslations.get('contact_service'),
        hintStyle: GoogleFonts.inter(color: AppTheme.textMuted),
        filled: true,
        fillColor: Colors.white.withOpacity(0.03),
        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: BorderSide(color: AppTheme.glassBorder)),
        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: const BorderSide(color: AppTheme.neonCyan)),
      ),
      items: [
        DropdownMenuItem(value: 'Desenvolvimento Mobile', child: Text(AppTranslations.get('services_app_title') != 'services_app_title' ? AppTranslations.get('services_app_title') : 'Desenvolvimento Mobile')),
        DropdownMenuItem(value: 'Desenvolvimento Web', child: Text(AppTranslations.get('services_dev_title') != 'services_dev_title' ? AppTranslations.get('services_dev_title') : 'Desenvolvimento Web')),
        DropdownMenuItem(value: 'Design Gráfico', child: Text(AppTranslations.get('services_ui_title') != 'services_ui_title' ? AppTranslations.get('services_ui_title') : 'Design Gráfico')),
      ],
      onChanged: (value) => setState(() => _selectedService = value),
    );
  }
}