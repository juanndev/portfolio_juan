import 'package:flutter/material.dart';

final ValueNotifier<String> appLanguage = ValueNotifier<String>('pt');

class AppTranslations {
  static const Map<String, Map<String, String>> _texts = {
    'pt': {
      // Menu (NavBar)
      'nav_projects': 'Projetos',
      'nav_about': 'Sobre',
      'nav_contact': 'Contato',
      
      // Seção 1: Hero
      'hero_subtitle': 'Desenvolvedor Mobile e Front-end',
      'hero_btn': 'Download CV',
      'hero_exp': 'Experiência com:',
      
      // Seção 2: About
      'about_title': 'Quem sou',
      'about_subtitle': 'Frontend Developer & Mobile',
      'about_desc': 'Sou desenvolvedor mobile especializado em Flutter e Dart, atualmente atuando na FoxAppy. Além da criação de interfaces de alta qualidade, sou pós-graduando em Cibersegurança pela Wyden, onde aprofundo meus conhecimentos em AppSec e DevSecOps. Meu foco é construir aplicativos que não sejam apenas visualmente modernos e performáticos, mas também blindados e seguros na arquitetura.',
      
      // Seção 3: Serviços
      'services_title': 'Serviços',
      'services_ui_title': 'UI Design',
      'services_ui_desc': 'Desenho interface no Figma de forma que ela seja clara, objetiva e principalmente intuitiva para a experiência do usuário.',
      'services_dev_title': 'Desenvolvimento',
      'services_dev_desc': 'Desenvolvo frontend de sites profissionais, blogs, SaaS, landing pages, ecommerce e entre outros websites.',
      'services_app_title': 'Criação de apps',
      'services_app_desc': 'Crio interações entre elementos que transmitem sensação de modernidade, além de chamarem a atenção do usuário.',
      
      // Seção 4: Footer / CTA
      'footer_cta': 'Deseja discutir uma oportunidade para criar algo incrível? Estou à disposição.',
      'footer_btn': 'Entrar em contato',
      'footer_copy': 'Copyright © 2026 juanndev.com. Todos os direitos reservados.',

      // Seção 5: Experiência
      'exp_title': 'Experiências',
      
      'exp_1_menu': 'FoxAppy',
      'exp_1_role': 'Software Engineer, Mobile (Flutter)',
      'exp_1_date': 'Novembro 2024 - No momento',
      'exp_1_company': 'FoxAppy',
      'exp_1_desc': 'Implementei arquitetura de segurança em escala corporativa integrando ferramentas SAST, processos de Mobile Hardening e Cloud Security para reduzir vulnerabilidades no SDLC completo.\n\nArquitetei e liderei desenvolvimento de solução AR inovadora do zero usando Flutter, permitindo visualização de produtos em tempo real através de fotografia de ambientes.\n\nGerenciei ciclo completo de 100+ aplicações no Google Play e App Store, otimizando pipelines de deployment para garantir consistência e confiabilidade em escala.',
      
      'exp_2_menu': 'Upside Inteligência Web',
      'exp_2_role': 'Desenvolvedor Front-end Pleno',
      'exp_2_date': 'Agosto 2024 - Janeiro 2026',
      'exp_2_company': 'Upside Inteligência Web',
      'exp_2_desc': 'Desenvolvi e renovei interfaces responsivas para websites de clientes usando WordPress, HTML5, CSS3 e JavaScript, melhorando experiência do usuário através de layouts intuitivos e animações modernas.',
      
      'exp_3_menu': 'CHA SOCIAL',
      'exp_3_role': 'Marketing Designer',
      'exp_3_date': 'Março 2024 - Outubro 2024',
      'exp_3_company': 'CHA SOCIAL',
      'exp_3_desc': 'Desenvolvi alto volume de criativos publicitários (estáticos e vídeos) como membro-chave da equipe de performance marketing, gerando leads qualificados para portfólio diversificado de clientes.\n\nProjetei e construí landing pages de alta conversão para lançamentos de produtos e cursos, otimizando jornada do usuário através de CTAs claros para maximizar taxas de conversão.',
      
      'exp_4_menu': 'Agência Kottler',
      'exp_4_role': 'Brand & Digital Designer',
      'exp_4_date': 'Novembro 2023 - Março 2024',
      'exp_4_company': 'Agência Kottler',
      'exp_4_desc': 'Desenvolvi sistemas completos de identidade visual e marca para clientes-chave, criando campanhas de marketing coesas que abrangeram canais digitais e impressos de forma integrada.',

      // Seção 6: Projetos
      'proj_title': 'Projetos',
      'proj_subtitle': '*Passe para o lado para ver os projetos*',
      
      'proj_1_title': 'TapDano',
      'proj_1_desc': 'Como parte da equipe da Blueshift, fui designado a codar o site da TapDano a partir de um design já criado.',
      'proj_1_techs': 'React • TypeScript',
      
      'proj_2_title': 'Sistema de Reserva de Hotéis',
      'proj_2_desc': 'Plataforma multipáginas de reserva de hotéis com Bootstrap 5 e jQuery. Foco em arquitetura CSS modular e responsividade.',
      'proj_2_techs': 'HTML5 • CSS3 • Javascript',
      
      'proj_3_title': 'Food Commerce - Plataforma de Delivery',
      'proj_3_desc': 'Plataforma de pedidos online com React e TS. Foco em gerenciamento de estado, filtros dinâmicos e experiência mobile-first.',
      'proj_3_techs': 'React • Typescript • Styled Components',
      
      'proj_btn_github': 'Github',
      'proj_btn_deploy': 'Deploy',
    },
    
    'en': {
      // Menu (NavBar)
      'nav_projects': 'Projects',
      'nav_about': 'About',
      'nav_contact': 'Contact',
      
      // Seção 1: Hero
      'hero_subtitle': 'Mobile & Front-end Developer',
      'hero_btn': 'Download CV',
      'hero_exp': 'Experience with:',
      
      // Seção 2: About
      'about_title': 'Who I am',
      'about_subtitle': 'Frontend & Mobile Developer',
      'about_desc': 'I am a mobile developer specializing in Flutter and Dart, currently working at FoxAppy. In addition to creating high-quality interfaces, I am pursuing a postgraduate degree in Cybersecurity at Wyden, deepening my knowledge in AppSec and DevSecOps. My focus is building apps that are not only visually modern and fast, but also architecturally bulletproof and secure.',
      
      // Seção 3: Serviços
      'services_title': 'Services',
      'services_ui_title': 'UI Design',
      'services_ui_desc': 'I design clear, objective, and highly intuitive interfaces in Figma focused on user experience.',
      'services_dev_title': 'Development',
      'services_dev_desc': 'I develop the frontend of professional websites, blogs, SaaS, landing pages, e-commerce, and more.',
      'services_app_title': 'App Creation',
      'services_app_desc': 'I create interactions between elements that convey a modern feel and capture the user\'s attention.',
      
      // Seção 4: Footer / CTA
      'footer_cta': 'Want to discuss an opportunity to create something amazing? I am available.',
      'footer_btn': 'Get in touch',
      'footer_copy': 'Copyright © 2026 juanndev.com. All rights reserved.',

      // Seção 5: Experiência
      'exp_title': 'Experiences',
      
      'exp_1_menu': 'FoxAppy',
      'exp_1_role': 'Software Engineer, Mobile (Flutter)',
      'exp_1_date': 'November 2024 - Present',
      'exp_1_company': 'FoxAppy',
      'exp_1_desc': 'Implemented enterprise-scale security architecture by integrating SAST tools, Mobile Hardening processes, and Cloud Security to reduce vulnerabilities across the full SDLC.\n\nArchitected and led the development of an innovative AR solution from scratch using Flutter, enabling real-time product visualization through environment photography.\n\nManaged the full lifecycle of 100+ applications on Google Play and the App Store, optimizing deployment pipelines to ensure consistency and reliability at scale.',
      
      'exp_2_menu': 'Upside Web Intelligence',
      'exp_2_role': 'Mid-level Front-end Developer',
      'exp_2_date': 'August 2024 - January 2026',
      'exp_2_company': 'Upside Web Intelligence',
      'exp_2_desc': 'Developed and revamped responsive interfaces for client websites using WordPress, HTML5, CSS3, and JavaScript, improving the user experience through intuitive layouts and modern animations.',
      
      'exp_3_menu': 'CHA SOCIAL',
      'exp_3_role': 'Marketing Designer',
      'exp_3_date': 'March 2024 - October 2024',
      'exp_3_company': 'CHA SOCIAL',
      'exp_3_desc': 'Developed a high volume of advertising creatives (static and video) as a key member of the performance marketing team, generating qualified leads for a diverse portfolio of clients.\n\nDesigned and built high-converting landing pages for product and course launches, optimizing the user journey through clear CTAs to maximize conversion rates.',
      
      'exp_4_menu': 'Agência Kottler',
      'exp_4_role': 'Brand & Digital Designer',
      'exp_4_date': 'November 2023 - March 2024',
      'exp_4_company': 'Agência Kottler',
      'exp_4_desc': 'Developed complete visual identity and brand systems for key clients, creating cohesive marketing campaigns that seamlessly spanned digital and print channels.',

      // Seção 6: Projetos
      'proj_title': 'Projects',
      'proj_subtitle': '*Swipe sideways to see the projects*',
      
      'proj_1_title': 'TapDano',
      'proj_1_desc': 'As part of the Blueshift team, I was assigned to code the TapDano website based on an already created design.',
      'proj_1_techs': 'React • TypeScript',
      
      'proj_2_title': 'WattWise',
      'proj_2_desc': 'Energy dashboard, a project created for FIAP\'s Global Solution in the second semester of the first year.',
      'proj_2_techs': 'NextJs • TypeScript • Tailwind CSS',
      
      'proj_3_title': 'BikeHub',
      'proj_3_desc': 'Fictional e-commerce for a bicycle shop. Its initial idea was based on prospecting a real client.',
      'proj_3_techs': 'HTML • CSS • JavaScript',
      
      'proj_btn_github': 'Github',
      'proj_btn_deploy': 'Deploy',
    },
    
    'es': {
      // Menu (NavBar)
      'nav_projects': 'Proyectos',
      'nav_about': 'Sobre mí',
      'nav_contact': 'Contacto',
      
      // Seção 1: Hero
      'hero_subtitle': 'Desarrollador Mobile y Front-end',
      'hero_btn': 'Descargar CV',
      'hero_exp': 'Experiencia con:',
      
      // Seção 2: About
      'about_title': 'Quién soy',
      'about_subtitle': 'Desarrollador Frontend y Mobile',
      'about_desc': 'Soy un desarrollador mobile especializado en Flutter y Dart, actualmente trabajando en FoxAppy. Además de crear interfaces de alta calidad, estoy cursando un posgrado en Ciberseguridad en Wyden, profundizando mis conocimientos en AppSec y DevSecOps. Mi enfoque es construir aplicaciones que no solo sean visualmente modernas y rápidas, sino también seguras y con una arquitectura blindada.',
      
      // Seção 3: Serviços
      'services_title': 'Servicios',
      'services_ui_title': 'Diseño UI',
      'services_ui_desc': 'Diseño interfaces en Figma de forma clara, objetiva y principalmente intuitiva para la experiencia del usuario.',
      'services_dev_title': 'Desarrollo',
      'services_dev_desc': 'Desarrollo el frontend de sitios web profesionales, blogs, SaaS, landing pages, ecommerce y más.',
      'services_app_title': 'Creación de apps',
      'services_app_desc': 'Creo interacciones entre elementos que transmiten una sensación de modernidad y captan la atención del usuario.',
      
      // Seção 4: Footer / CTA
      'footer_cta': '¿Deseas discutir una oportunidad para crear algo increíble? Estoy a tu disposición.',
      'footer_btn': 'Ponerse en contacto',
      'footer_copy': 'Copyright © 2026 juanndev.com. Todos los derechos reservados.',

      // Seção 5: Experiência
      'exp_title': 'Experiencias',
      
      'exp_1_menu': 'FoxAppy',
      'exp_1_role': 'Ingeniero de Software, Mobile (Flutter)',
      'exp_1_date': 'Noviembre 2024 - Actualidad',
      'exp_1_company': 'FoxAppy',
      'exp_1_desc': 'Implementé una arquitectura de seguridad a escala empresarial integrando herramientas SAST, procesos de Mobile Hardening y Cloud Security para reducir vulnerabilidades en todo el SDLC.\n\nDiseñé y lideré el desarrollo de una innovadora solución AR desde cero usando Flutter, permitiendo la visualización de productos en tiempo real a través de fotografía de entornos.\n\nGestioné el ciclo de vida completo de más de 100 aplicaciones en Google Play y App Store, optimizando los pipelines de despliegue para garantizar consistencia y confiabilidad a escala.',
      
      'exp_2_menu': 'Upside Inteligencia Web',
      'exp_2_role': 'Desarrollador Front-end Semi-Senior',
      'exp_2_date': 'Agosto 2024 - Enero 2026',
      'exp_2_company': 'Upside Inteligência Web',
      'exp_2_desc': 'Desarrollé y renové interfaces responsivas para sitios web de clientes usando WordPress, HTML5, CSS3 y JavaScript, mejorando la experiencia del usuario a través de diseños intuitivos y animaciones modernas.',
      
      'exp_3_menu': 'CHA SOCIAL',
      'exp_3_role': 'Marketing Designer',
      'exp_3_date': 'Marzo 2024 - Octubre 2024',
      'exp_3_company': 'CHA SOCIAL',
      'exp_3_desc': 'Desarrollé un alto volumen de creatividades publicitarias (estáticas y en video) como miembro clave del equipo de performance marketing, generando leads calificados para un portafolio diverso de clientes.\n\nDiseñé y construí landing pages de alta conversión para lanzamientos de productos y cursos, optimizando el viaje del usuario a través de CTAs claros para maximizar las tasas de conversión.',
      
      'exp_4_menu': 'Agência Kottler',
      'exp_4_role': 'Brand & Digital Designer',
      'exp_4_date': 'Noviembre 2023 - Marzo 2024',
      'exp_4_company': 'Agência Kottler',
      'exp_4_desc': 'Desarrollé sistemas completos de identidad visual y de marca para clientes clave, creando campañas de marketing cohesivas que abarcaron canales digitales e impresos de forma integrada.',

      // Seção 6: Projetos
      'proj_title': 'Proyectos',
      'proj_subtitle': '*Desliza hacia los lados para ver los proyectos*',
      
      'proj_1_title': 'TapDano',
      'proj_1_desc': 'Como parte del equipo de Blueshift, fui asignado para codificar el sitio web de TapDano a partir de un diseño ya creado.',
      'proj_1_techs': 'React • TypeScript',
      
      'proj_2_title': 'WattWise',
      'proj_2_desc': 'Dashboard de energía, proyecto creado para la Global Solution de FIAP, en el segundo semestre del primer año.',
      'proj_2_techs': 'NextJs • TypeScript • Tailwind CSS',
      
      'proj_3_title': 'BikeHub',
      'proj_3_desc': 'E-commerce ficticio de una tienda de bicicletas. Su idea inicial se baseaba en la prospección de un cliente real.',
      'proj_3_techs': 'HTML • CSS • JavaScript',
      
      'proj_btn_github': 'Github',
      'proj_btn_deploy': 'Deploy',
    }
  };

  // Função para buscar o texto certo baseado no idioma atual
  static String get(String key) {
    return _texts[appLanguage.value]?[key] ?? key;
  }
}