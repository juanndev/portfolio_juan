import 'package:flutter/material.dart';

final ValueNotifier<String> appLanguage = ValueNotifier<String>('pt');

class AppTranslations {
  static const Map<String, Map<String, String>> _texts = {
    'pt': {
      'nav_about': '01. Sobre',
      'nav_exp': '02. Experiência',
      'nav_projects': '03. Projetos',
      'nav_stack': '04. Stack',
      'nav_serv': '05. Serviços',
      'nav_contact': '06. Contato',
      
      'hero_hello': '_hello_world',
      'hero_subtitle': 'Desenvolvedor Mobile e Front-end',
      'hero_desc': 'Especialista em Flutter & Dart focado em escalabilidade.\nCombinando desenvolvimento mobile de alto desempenho com engenharia de segurança (AppSec).',
      'hero_btn': 'Download CV',
      'hero_exp': 'Experiência com:',
      
      'typewriter_1': 'Desenvolvedor Mobile',
      'typewriter_2': 'Engenheiro AppSec',
      'typewriter_3': 'UI/UX Designer',
      
      'about_title': 'Sobre Mim',
      'about_subtitle': 'Frontend Developer & Mobile',
      'about_desc': 'Sou graduado em Análise e Desenvolvimento de Sistemas pela Cruzeiro do Sul e pós-graduando em Cibersegurança pela Wyden. Meu foco é construir arquiteturas robustas no ecossistema mobile, garantindo que a segurança seja tratada desde o design (Security by Design).\n\nTrabalho primariamente em ambiente macOS e sou apaixonado por tecnologia de ponta. Dedico meu tempo livre estudando novas abordagens de desenvolvimento, explorando conceitos de segurança ofensiva e aprimorando minhas habilidades em design e criação de produtos digitais.',
      'term_role': 'mobile_developer && security_enthusiast',
      
      'services_title': 'Serviços que Ofereço',
      'services_ui_title': 'Design Gráfico & UI/UX',
      'services_ui_desc': 'Produção de identidade visual, criação de banners, artes para mídias sociais (Instagram) e prototipação de interfaces completas utilizando Figma.',
      'services_dev_title': 'Desenvolvimento Web',
      'services_dev_desc': 'Construção de sites institucionais, portfólios e Landing Pages focadas em conversão. Utilizando tecnologias modernas como HTML, CSS e JavaScript.',
      'services_app_title': 'Desenvolvimento Mobile',
      'services_app_desc': 'Criação de aplicativos nativos e multiplataforma de alta performance utilizando Flutter e Dart. Foco em interfaces fluidas e seguras.',
      
      'footer_cta': 'Vamos Conversar?',
      'footer_btn': 'Enviar Mensagem',
      'footer_copy': 'console.log("Stay Secure"); // 2026',

      'exp_title': 'Experiência Corporativa',
      
      'exp_1_menu': 'FoxAppy',
      'exp_1_role': 'Desenvolvedor Mobile Flutter',
      'exp_1_date': 'Nov 2024 - Presente',
      'exp_1_company': '@ FoxAppy',
      'exp_1_desc': 'Desenvolvimento do core de aplicativos mobile baseados em assinatura para o ecossistema de e-commerce.\nGarantia de performance, fluidez e escalabilidade da base de código Dart.',
      
      'exp_2_menu': 'Upside',
      'exp_2_role': 'Desenvolvedor Front-end',
      'exp_2_date': 'Ago 2024 - Jan 2026',
      'exp_2_company': '@ Upside Inteligência Web',
      'exp_2_desc': 'Criação de interfaces web interativas e responsivas utilizando tecnologias modernas.\nOtimização de performance web e integração com APIs.',
      
      'exp_3_menu': 'CHA SOCIAL',
      'exp_3_role': 'Marketing Design',
      'exp_3_date': 'Mar 2024 - Out 2024',
      'exp_3_company': '@ CHA SOCIAL',
      'exp_3_desc': 'Produção de peças visuais para campanhas de marketing digital e redes sociais.',
      
      'exp_4_menu': 'Agência Kottler',
      'exp_4_role': 'Brand & Digital Design',
      'exp_4_date': 'Nov 2023 - Mar 2024',
      'exp_4_company': '@ Agência Kottler',
      'exp_4_desc': 'Desenvolvimento de identidade visual e design digital focado na presença online de marcas.',

      'proj_title': 'Iniciativas & Projetos',
      'proj_subtitle': '*Passe para o lado para ver os projetos*',
      
      // NOVOS PROJETOS
      'proj_1_title': 'Portfólio Web',
      'proj_1_desc': 'Meu portfólio pessoal e interativo desenvolvido do zero. Arquitetura componentizada focada em responsividade, performance e design fluído.',
      'proj_1_techs': 'Flutter • Dart • Web',
      
      'proj_2_title': 'Security Audit Case',
      'proj_2_desc': 'Estudo de caso focado em auditoria de segurança em aplicativos Flutter. Mapeamento prático de vulnerabilidades e implementação de engenharia de defesa.',
      'proj_2_techs': 'AppSec • Dart • Security',
      
      'proj_3_title': 'Food Commerce',
      'proj_3_desc': 'Plataforma de pedidos online com React e TS. Foco em gerenciamento de estado, filtros dinâmicos e experiência mobile-first.',
      'proj_3_techs': 'React • Typescript',
      
      'proj_btn_github': 'Github',
      'proj_btn_deploy': 'Deploy',
      
      'stack_title': 'Habilidades & Stack',

      'contact_fname': 'Nome',
      'contact_lname': 'Sobrenome',
      'contact_email': 'E-mail',
      'contact_phone': 'Telefone',
      'contact_service': 'Selecione o serviço...',
      'contact_msg': 'Sua mensagem ou detalhes do projeto...',
    },
    
    'en': {
      'nav_about': '01. About',
      'nav_exp': '02. Experience',
      'nav_projects': '03. Projects',
      'nav_stack': '04. Stack',
      'nav_serv': '05. Services',
      'nav_contact': '06. Contact',
      
      'hero_hello': '_hello_world',
      'hero_subtitle': 'Mobile & Front-end Developer',
      'hero_desc': 'Flutter & Dart specialist focused on scalability.\nCombining high-performance mobile development with security engineering (AppSec).',
      'hero_btn': 'Download CV',
      'hero_exp': 'Experience with:',
      
      'typewriter_1': 'Mobile Developer',
      'typewriter_2': 'AppSec Engineer',
      'typewriter_3': 'UI/UX Designer',
      
      'about_title': 'About Me',
      'about_subtitle': 'Frontend & Mobile Developer',
      'about_desc': 'I hold a degree in Systems Analysis and Development from Cruzeiro do Sul and am pursuing a postgraduate degree in Cybersecurity at Wyden. My focus is building robust architectures in the mobile ecosystem, ensuring security by design.\n\nI work primarily in a macOS environment and am passionate about cutting-edge technology. I dedicate my free time to studying new development approaches, exploring offensive security concepts, and improving my skills in design and digital product creation.',
      'term_role': 'mobile_developer && security_enthusiast',
      
      'services_title': 'Services I Offer',
      'services_ui_title': 'Graphic Design & UI/UX',
      'services_ui_desc': 'Visual identity production, banners, social media art (Instagram), and full interface prototyping using Figma.',
      'services_dev_title': 'Web Development',
      'services_dev_desc': 'Building institutional websites, portfolios, and conversion-focused Landing Pages. Using modern tech like HTML, CSS, and JavaScript.',
      'services_app_title': 'Mobile Development',
      'services_app_desc': 'Creation of high-performance native and cross-platform apps using Flutter and Dart. Focus on fluid and secure interfaces.',
      
      'footer_cta': 'Let\'s Talk?',
      'footer_btn': 'Send Message',
      'footer_copy': 'console.log("Stay Secure"); // 2026',

      'exp_title': 'Corporate Experience',
      
      'exp_1_menu': 'FoxAppy',
      'exp_1_role': 'Mobile Flutter Developer',
      'exp_1_date': 'Nov 2024 - Present',
      'exp_1_company': '@ FoxAppy',
      'exp_1_desc': 'Core development of subscription-based mobile applications for the e-commerce ecosystem.\nEnsuring performance, fluidity, and scalability of the Dart codebase.',
      
      'exp_2_menu': 'Upside',
      'exp_2_role': 'Front-end Developer',
      'exp_2_date': 'Aug 2024 - Jan 2026',
      'exp_2_company': '@ Upside Web Intelligence',
      'exp_2_desc': 'Creation of interactive and responsive web interfaces using modern technologies.\nWeb performance optimization and API integration.',
      
      'exp_3_menu': 'CHA SOCIAL',
      'exp_3_role': 'Marketing Design',
      'exp_3_date': 'Mar 2024 - Oct 2024',
      'exp_3_company': '@ CHA SOCIAL',
      'exp_3_desc': 'Production of visual assets for digital marketing campaigns and social media.',
      
      'exp_4_menu': 'Agência Kottler',
      'exp_4_role': 'Brand & Digital Design',
      'exp_4_date': 'Nov 2023 - Mar 2024',
      'exp_4_company': '@ Agência Kottler',
      'exp_4_desc': 'Development of visual identity and digital design focused on brands\' online presence.',

      'proj_title': 'Initiatives & Projects',
      'proj_subtitle': '*Swipe sideways to see the projects*',
      
      // NOVOS PROJETOS - EN
      'proj_1_title': 'Web Portfolio',
      'proj_1_desc': 'My personal interactive portfolio built from scratch. Componentized responsive design focused on performance and fluid UI using Flutter Web.',
      'proj_1_techs': 'Flutter • Dart • Web',
      
      'proj_2_title': 'Security Audit Case',
      'proj_2_desc': 'Case study on security auditing in Flutter applications. Practical mapping of vulnerabilities and defense engineering implementation.',
      'proj_2_techs': 'AppSec • Dart • Security',
      
      'proj_3_title': 'Food Commerce',
      'proj_3_desc': 'Online ordering platform powered by React and TS. Focus on state management, dynamic filters, and a mobile-first experience.',
      'proj_3_techs': 'React • Typescript',
      
      'proj_btn_github': 'Github',
      'proj_btn_deploy': 'Deploy',
      
      'stack_title': 'Skills & Stack',

      'contact_fname': 'First Name',
      'contact_lname': 'Last Name',
      'contact_email': 'Email',
      'contact_phone': 'Phone',
      'contact_service': 'Select a service...',
      'contact_msg': 'Your message or project details...',
    },
    
    'es': {
      'nav_about': '01. Sobre Mí',
      'nav_exp': '02. Experiencia',
      'nav_projects': '03. Proyectos',
      'nav_stack': '04. Stack',
      'nav_serv': '05. Servicios',
      'nav_contact': '06. Contacto',
      
      'hero_hello': '_hola_mundo',
      'hero_subtitle': 'Desarrollador Mobile y Front-end',
      'hero_desc': 'Especialista en Flutter & Dart enfocado en escalabilidad.\nCombinando desarrollo móvil de alto rendimiento con ingeniería de seguridad (AppSec).',
      'hero_btn': 'Descargar CV',
      'hero_exp': 'Experiencia con:',
      
      'typewriter_1': 'Desarrollador Móvil',
      'typewriter_2': 'Ingeniero AppSec',
      'typewriter_3': 'Diseñador UI/UX',
      
      'about_title': 'Sobre Mí',
      'about_subtitle': 'Desarrollador Frontend y Mobile',
      'about_desc': 'Graduado en Análisis y Desarrollo de Sistemas por Cruzeiro do Sul y cursando un posgrado en Ciberseguridad en Wyden. Mi enfoque es construir arquitecturas robustas en el ecosistema móvil, garantizando la seguridad desde el diseño.\n\nTrabajo principalmente en un entorno macOS y me apasiona la tecnología punta. Dedico mi tiempo libre a estudiar nuevos enfoques de desarrollo, explorar conceptos de seguridad ofensiva y mejorar mis habilidades en diseño y creación de productos digitales.',
      'term_role': 'desarrollador_movil && entusiasta_seguridad',
      
      'services_title': 'Servicios que Ofrezco',
      'services_ui_title': 'Diseño Gráfico & UI/UX',
      'services_ui_desc': 'Producción de identidad visual, banners, arte para redes sociales (Instagram) y prototipado completo de interfaces usando Figma.',
      'services_dev_title': 'Desarrollo Web',
      'services_dev_desc': 'Construcción de sitios institucionales, portafolios y Landing Pages enfocadas en conversión. Usando tecnología moderna como HTML, CSS y JavaScript.',
      'services_app_title': 'Desarrollo Móvil',
      'services_app_desc': 'Creación de aplicaciones nativas y multiplataforma de alto rendimiento con Flutter y Dart. Enfoque en interfaces fluidas y seguras.',
      
      'footer_cta': '¿Hablamos?',
      'footer_btn': 'Enviar Mensaje',
      'footer_copy': 'console.log("Stay Secure"); // 2026',

      'exp_title': 'Experiencia Corporativa',
      
      'exp_1_menu': 'FoxAppy',
      'exp_1_role': 'Desarrollador Móvil Flutter',
      'exp_1_date': 'Nov 2024 - Presente',
      'exp_1_company': '@ FoxAppy',
      'exp_1_desc': 'Desarrollo central de aplicaciones móviles basadas en suscripción para el ecosistema de comercio electrónico.\nGarantizando rendimiento, fluidez y escalabilidad del código base en Dart.',
      
      'exp_2_menu': 'Upside',
      'exp_2_role': 'Desarrollador Front-end',
      'exp_2_date': 'Ago 2024 - Ene 2026',
      'exp_2_company': '@ Upside Inteligencia Web',
      'exp_2_desc': 'Creación de interfaces web interactivas y responsivas utilizando tecnologías modernas.\nOptimización del rendimiento web e integración con APIs.',
      
      'exp_3_menu': 'CHA SOCIAL',
      'exp_3_role': 'Marketing Design',
      'exp_3_date': 'Mar 2024 - Oct 2024',
      'exp_3_company': '@ CHA SOCIAL',
      'exp_3_desc': 'Producción de piezas visuales para campañas de marketing digital y redes sociales.',
      
      'exp_4_menu': 'Agência Kottler',
      'exp_4_role': 'Brand & Digital Design',
      'exp_4_date': 'Nov 2023 - Mar 2024',
      'exp_4_company': '@ Agência Kottler',
      'exp_4_desc': 'Desarrollo de identidad visual y diseño digital centrado en la presencia online de marcas.',

      'proj_title': 'Iniciativas y Proyectos',
      'proj_subtitle': '*Desliza hacia los lados para ver los proyectos*',
      
      // NOVOS PROJETOS - ES
      'proj_1_title': 'Portafolio Web',
      'proj_1_desc': 'Mi portafolio personal interactivo desarrollado desde cero. Diseño responsivo componentizado usando Flutter Web y Dart.',
      'proj_1_techs': 'Flutter • Dart • Web',
      
      'proj_2_title': 'Security Audit Case',
      'proj_2_desc': 'Estudio de caso en auditoría de seguridad en aplicaciones Flutter. Mapeo práctico de vulnerabilidades e implementación de ingeniería de defensa.',
      'proj_2_techs': 'AppSec • Dart • Security',
      
      'proj_3_title': 'Food Commerce',
      'proj_3_desc': 'Plataforma de pedidos en línea desarrollada con React y TS. Se centra en la gestión del estado, filtros dinámicos y experiencia mobile.',
      'proj_3_techs': 'React • Typescript',
      
      'proj_btn_github': 'Github',
      'proj_btn_deploy': 'Deploy',
      
      'stack_title': 'Habilidades & Stack',

      'contact_fname': 'Nombre',
      'contact_lname': 'Apellido',
      'contact_email': 'Correo',
      'contact_phone': 'Teléfono',
      'contact_service': 'Seleccione un servicio...',
      'contact_msg': 'Su mensaje o detalles del proyecto...',
    }
  };

  static String get(String key) {
    return _texts[appLanguage.value]?[key] ?? key;
  }
}