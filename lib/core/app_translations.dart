import 'package:flutter/material.dart';

// O 'controle remoto' do idioma. Começa em português.
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
      'exp_1_desc': 'Trabalhei na InnovaSfera, onde tive a oportunidade de participar de vários projetos para diversos clientes. Nessa trajetória, trabalhei em várias criações de sites, sistemas e interfaces web e mobile com a equipe de tecnologia da empresa. A InnovaSfera é referência em qualidade e inovação em suas soluções tecnológicas, seja em desenvolvimento ou infraestrutura.',
      
      'exp_2_menu': 'Upside Inteligência Web',
      'exp_2_role': 'Desenvolvedor Front-end Pleno',
      'exp_2_date': 'Janeiro 2023 - Outubro 2024',
      'exp_2_company': 'Upside Inteligência Web',
      'exp_2_desc': 'Trabalhei na InnovaSfera, onde tive a oportunidade de participar de vários projetos para diversos clientes. Nessa trajetória, trabalhei em várias criações de sites, sistemas e interfaces web e mobile com a equipe de tecnologia da empresa. A InnovaSfera é referência em qualidade e inovação em suas soluções tecnológicas, seja em desenvolvimento ou infraestrutura.',
      
      'exp_3_menu': 'Marketing Designer',
      'exp_3_role': 'UI/UX & Front-end Developer',
      'exp_3_date': 'Março 2021 - Dezembro 2022',
      'exp_3_company': 'Marketing Designer',
      'exp_3_desc': 'Trabalhei na InnovaSfera, onde tive a oportunidade de participar de vários projetos para diversos clientes. Nessa trajetória, trabalhei em várias criações de sites, sistemas e interfaces web e mobile com a equipe de tecnologia da empresa. A InnovaSfera é referência em qualidade e inovação em suas soluções tecnológicas, seja em desenvolvimento ou infraestrutura.',
      
      'exp_4_menu': 'Brand & Digital Designer',
      'exp_4_role': 'Web Designer',
      'exp_4_date': 'Junho 2019 - Fevereiro 2021',
      'exp_4_company': 'Brand & Digital Designer',
      'exp_4_desc': 'Trabalhei na InnovaSfera, onde tive a oportunidade de participar de vários projetos para diversos clientes. Nessa trajetória, trabalhei em várias criações de sites, sistemas e interfaces web e mobile com a equipe de tecnologia da empresa. A InnovaSfera é referência em qualidade e inovação em suas soluções tecnológicas, seja em desenvolvimento ou infraestrutura.',

      // Seção 6: Projetos
      'proj_title': 'Projetos',
      'proj_subtitle': '*Passe para o lado para ver os projetos*',
      
      'proj_1_title': 'TapDano',
      'proj_1_desc': 'Como parte da equipe da Blueshift, fui designado a codar o site da TapDano a partir de um design já criado.',
      'proj_1_techs': 'React • TypeScript',
      
      'proj_2_title': 'WattWise',
      'proj_2_desc': 'Dashboard de energia, projeto criado para a Global Solution da FIAP, no segundo semestres do primeiro ano.',
      'proj_2_techs': 'NextJs • TypeScript • Tailwind CSS',
      
      'proj_3_title': 'BikeHub',
      'proj_3_desc': 'Ecommerce fictício de uma loja de bicicletas. Sua ideia inicial se baseava na prospecção de um cliente real.',
      'proj_3_techs': 'HTML • CSS • JavaScript',
      
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
      'exp_1_desc': 'I worked at InnovaSfera, where I had the opportunity to participate in several projects for various clients. In this journey, I worked on creating several websites, systems, and web/mobile interfaces with the company\'s tech team. InnovaSfera is a reference in quality and innovation in its technological solutions, whether in development or infrastructure.',
      
      'exp_2_menu': 'Upside Web Intelligence',
      'exp_2_role': 'Mid-level Front-end Developer',
      'exp_2_date': 'January 2023 - October 2024',
      'exp_2_company': 'Upside Web Intelligence',
      'exp_2_desc': 'I worked at InnovaSfera, where I had the opportunity to participate in several projects for various clients. In this journey, I worked on creating several websites, systems, and web/mobile interfaces with the company\'s tech team. InnovaSfera is a reference in quality and innovation in its technological solutions, whether in development or infrastructure.',
      
      'exp_3_menu': 'Marketing Designer',
      'exp_3_role': 'UI/UX & Front-end Developer',
      'exp_3_date': 'March 2021 - December 2022',
      'exp_3_company': 'Marketing Designer',
      'exp_3_desc': 'I worked at InnovaSfera, where I had the opportunity to participate in several projects for various clients. In this journey, I worked on creating several websites, systems, and web/mobile interfaces with the company\'s tech team. InnovaSfera is a reference in quality and innovation in its technological solutions, whether in development or infrastructure.',
      
      'exp_4_menu': 'Brand & Digital Designer',
      'exp_4_role': 'Web Designer',
      'exp_4_date': 'June 2019 - February 2021',
      'exp_4_company': 'Brand & Digital Designer',
      'exp_4_desc': 'I worked at InnovaSfera, where I had the opportunity to participate in several projects for various clients. In this journey, I worked on creating several websites, systems, and web/mobile interfaces with the company\'s tech team. InnovaSfera is a reference in quality and innovation in its technological solutions, whether in development or infrastructure.',

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
      'exp_1_desc': 'Trabajé en InnovaSfera, donde tuve la oportunidad de participar en varios proyectos para diversos clientes. En esta trayectoria, trabajé en la creación de varios sitios web, sistemas e interfaces web y móviles con el equipo de tecnología de la empresa. InnovaSfera es un referente en calidad e innovación en sus soluciones tecnológicas, ya sea en desarrollo o infraestructura.',
      
      'exp_2_menu': 'Upside Inteligencia Web',
      'exp_2_role': 'Desarrollador Front-end Semi-Senior',
      'exp_2_date': 'Enero 2023 - Octubre 2024',
      'exp_2_company': 'Upside Inteligencia Web',
      'exp_2_desc': 'Trabajé en InnovaSfera, donde tuve la oportunidad de participar en varios proyectos para diversos clientes. En esta trayectoria, trabajé en la creación de varios sitios web, sistemas e interfaces web y móviles con el equipo de tecnología de la empresa. InnovaSfera es un referente en calidad e innovación en sus soluciones tecnológicas, ya sea en desarrollo o infraestructura.',
      
      'exp_3_menu': 'Diseñador de Marketing',
      'exp_3_role': 'Desarrollador UI/UX y Front-end',
      'exp_3_date': 'Marzo 2021 - Diciembre 2022',
      'exp_3_company': 'Diseñador de Marketing',
      'exp_3_desc': 'Trabajé en InnovaSfera, donde tuve la oportunidad de participar en varios proyectos para diversos clientes. En esta trayectoria, trabajé en la creación de varios sitios web, sistemas e interfaces web y móviles con el equipo de tecnología de la empresa. InnovaSfera es un referente en calidad e innovación en sus soluciones tecnológicas, ya sea en desarrollo o infraestructura.',
      
      'exp_4_menu': 'Diseñador Digital y de Marca',
      'exp_4_role': 'Diseñador Web',
      'exp_4_date': 'Junio 2019 - Febrero 2021',
      'exp_4_company': 'Diseñador Digital y de Marca',
      'exp_4_desc': 'Trabajé en InnovaSfera, donde tuve la oportunidad de participar en varios proyectos para diversos clientes. En esta trayectoria, trabajé en la creación de varios sitios web, sistemas e interfaces web y móviles con el equipo de tecnología de la empresa. InnovaSfera es un referente en calidad e innovación en sus soluciones tecnológicas, ya sea en desarrollo o infraestructura.',

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
      'proj_3_desc': 'E-commerce ficticio de una tienda de bicicletas. Su idea inicial se basaba en la prospección de un cliente real.',
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