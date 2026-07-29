# 🚀 Juan Mota | Mobile & Front-end Developer Portfolio

Bem-vindo ao repositório do meu portfólio pessoal! Este projeto foi desenvolvido inteiramente em **Flutter Web** e atua como uma vitrine interativa do meu trabalho, experiência e evolução profissional.

Como um desenvolvedor Mobile atuando na FoxAppy e com forte foco acadêmico em **Cybersecurity (AppSec / DevSecOps)** pela Wyden, meu objetivo com este projeto foi construir uma aplicação que não fosse apenas visualmente atraente, mas que tivesse uma arquitetura limpa, escalável, responsiva e performática no navegador, aplicando conceitos de UI/UX Premium.

---

## 🛠️ Tecnologias e Ferramentas

O ecossistema do projeto foi escolhido para garantir estabilidade, fluidez e alto impacto visual:

* **Framework:** [Flutter](https://flutter.dev/) (Canal Stable)
* **Linguagem:** [Dart](https://dart.dev/)[cite: 2]
* **Design/Prototipagem:** Figma (utilizando princípios de Glassmorphism e UI Moderna).[cite: 2]
* **Gerenciamento de Estado Nativo:** `ValueNotifier` e `ValueListenableBuilder`.[cite: 2]
* **Principais Pacotes:**[cite: 2]
  * `flutter_animate`: Motor de animações declarativas para as micro-interações.[cite: 2]
  * `visibility_detector`: Detecção de visibilidade em tela para disparo de animações de scroll.[cite: 2]
  * `google_fonts`: Tipografia personalizada (Inter e Montserrat).[cite: 2]
  * `flutter_svg`: Renderização de ícones e vetores de alta fidelidade.[cite: 2]
  * `url_launcher`: Redirecionamento seguro para links externos e redes sociais.[cite: 2]
  * `dart:html`: Manipulação do DOM do navegador para downloads de arquivos.[cite: 2]
  * `seo`: Injeção de tags semânticas (H1, H2, P, Links) invisíveis no DOM para leitura de motores de busca.

---

## ✨ Funcionalidades Principais

* **🌍 Internacionalização (i18n) Dinâmica e Reativa:** O portfólio possui suporte completo para três idiomas (Português, Inglês e Espanhol).[cite: 2] A troca é feita em tempo real através de um seletor na NavBar, atualizando todos os textos da interface sem a necessidade de recarregar a página, graças ao uso inteligente do `ValueNotifier`.[cite: 2]
* **📄 Download Inteligente de Currículo:** O botão de "Download CV" na seção Hero detecta o idioma atual selecionado pelo usuário e faz o download automático da versão correta do PDF (ex: Português, Inglês ou Espanhol).[cite: 2]
* **📱 Responsividade "Pixel Perfect":** O layout foi rigorosamente ajustado para cobrir desde monitores Ultrawide até telas compactas como o iPhone SE, utilizando variáveis dinâmicas de largura (`MediaQuery`) para escalar fontes e margens.[cite: 2] Implementação de `BoxConstraints` e `LayoutBuilder` para evitar erros de renderização (RenderFlex Overflow) e garantir fluidez em qualquer resolução.
* **🔍 Otimização de SEO Nativo:** Aplicação do pacote `seo` envolvendo toda a árvore de widgets, gerando tags HTML estruturadas (`<h1>`, `<h2>`, `<p>`) dinamicamente por trás do CanvasKit, permitindo que o Google indexe o conteúdo de uma SPA (Single Page Application) feita em Flutter.
* **🧠 UX Refinada Mobile:** Menu Hamburger lateral nativo adaptado para `endDrawer`, deslizando intuitivamente pela direita do dispositivo para acompanhar a ergonomia e expectativa visual do usuário.

---

## 🎭 Animações e Micro-interações Premium

Para elevar a experiência do usuário (UX) a um padrão global de agências de design, o projeto conta com uma física de interface refinada:[cite: 2]

* **Scroll Progress Bar & Reveal:** Uma barra magnética no topo rastreia o progresso da página, enquanto os componentes das seções surgem suavemente de baixo para cima (`FadeIn` + `SlideY`) à medida que entram na área visível do navegador.[cite: 2]
* **Efeitos Magnéticos e Elevação 3D (Hover):** Botões de contato e cards de projetos reagem ao cursor do mouse.[cite: 2] Eles se elevam fisicamente na tela, os ícones são "puxados" em direção ao clique e sombras responsivas ganham destaque verde.[cite: 2]
* **Entrada em Cascata (Staggered Animations):** Renderização sequenciada de elementos (como os cards de serviços) baseada no índice da lista, guiando os olhos do usuário de forma fluida.[cite: 2]
* **Cross-Fade Dinâmico & State Management:** Transição hiper-suave de informações na aba de experiências usando `AnimatedSwitcher` combinado com `AnimatedSize`, eliminando quebras abruptas de layout.[cite: 2]
* **Shimmer & Gravidade Zero:** Feixes de luz contínuos cortam os botões principais de Call-to-Action, enquanto ícones de tecnologia flutuam suavemente no eixo Y, conferindo vida à Hero Section.[cite: 2]
* **Efeito Ken Burns:** Uma micro-animação cíclica de escala ("respiração") na foto de perfil.[cite: 2]

---

## 🧗‍♂️ Desafios Técnicos Superados

Durante o desenvolvimento deste portfólio, me deparei com desafios específicos do ambiente Web no Flutter, resolvendo-os das seguintes formas:[cite: 2]

### 1. Sobrecarga de Renderização na GPU (CanvasKit)
**Problema:** Ao aplicar animações de *hover* nos cards de projetos, a transição contínua do `blurRadius` (Gaussian Blur) da sombra gerava um peso matemático extremo no navegador, causando o *crash* do motor de renderização WebGL ("Red Screen of Death").[cite: 2]
**Solução:** Otimização arquitetural na animação.[cite: 2] Em vez de animar o raio de desfoque, fixei os valores de propagação e apliquei a animação exclusivamente na **opacidade da cor da sombra** (de `0.0` para `0.15`).[cite: 2] Isso mitigou totalmente o custo de renderização, garantindo 60 frames por segundo ao iterar sobre múltiplos cards.[cite: 2]

### 2. Otimização do "Initial Load" (Tela Branca)
**Problema:** O Flutter Web precisa baixar o motor de renderização (CanvasKit/WASM) antes de desenhar a tela, causando alguns segundos de tela branca.[cite: 2]
**Solução:** Implementação de um **Custom Preloader**.[cite: 2] Criei um spinner em CSS puro diretamente no arquivo `web/index.html` e criei um *event listener* em JavaScript (`flutter-first-frame`) para ocultar o spinner com um fade-out elegante exatamente no milissegundo em que o Flutter termina de carregar.[cite: 2]

### 3. "Tradução Congelada" no State Management
**Problema:** Ao trocar o idioma, as listas de dados (como as descrições de Experiências) não traduziam, pois estavam instanciadas fora do ciclo de vida de reconstrução do Flutter.[cite: 2] Adicionalmente, construtores `const` na árvore principal do `main.dart` congelavam o estado visual.
**Solução:** Transformação das estruturas de dados estáticas em **Getters** (`List<Map> get experiences => [...]`).[cite: 2] Removi modificadores `const` das seções atreladas ao `ValueListenableBuilder`. Isso forçou o Flutter a buscar as strings atualizadas do dicionário de traduções em todo e qualquer *rebuild* gerado pela troca da bandeira de idioma.

### 4. SVG Hardening e Erros Matemáticos (Figma x Flutter)
**Problema:** Alguns ícones vetoriais exportados do Figma não renderizavam, quebrando o *parser* da biblioteca `flutter_svg`.[cite: 2]
**Solução:** Foi necessário aplicar *debugging* direto no código XML dos SVGs.[cite: 2] O erro ocorria devido a gradientes lineares perfeitos exportados com coordenadas `NaN` (Not a Number) pelo Figma.[cite: 2] Removi máscaras desnecessárias (`clipPath`), corrigi as coordenadas manualmente e isolei os ícones em `SizedBox` com dimensões fixas no `LayoutBuilder` para garantir estabilidade caso a biblioteca falhasse no Web.

### 5. Indexação de Mecanismos de Busca (SEO em Single Page Applications)
**Problema:** Por padrão, o Flutter Web desenha a tela inteira em uma tag `<canvas>`, tornando o site completamente "invisível" (caixa preta) para o Google Bot ler textos, títulos e links orgânicos.
**Solução:** Arquitetura híbrida utilizando a árvore do pacote `seo`. Criei um `SeoController` global e encapsulei títulos, subtítulos e descrições em widgets `Seo.text`. Isso injeta de forma paralela uma árvore HTML espelhada em tempo de execução, permitindo que rastreadores leiam os dados sem impactar a interface CanvasKit/WASM original.

---

## 📂 Estrutura do Projeto

O código está estruturado de forma modular para facilitar a manutenção e escalabilidade:[cite: 2]

```text
lib/
 ├── core/              # Configurações globais, dicionário de traduções e componentes reutilizáveis de animação (hover_card.dart, animated_reveal.dart)
 ├── sections/          # Cada seção do site isolada (Hero, About, Experience, Projects, Services, Footer)
 ├── main.dart          # Arquivo principal, montagem do layout da Home e Scroll Progress Bar
web/
 └── index.html         # Configuração HTML, meta tags, e o script do Preloader customizado
assets/
 ├── icons/             # Vetores SVG otimizados e corrigidos para Web
 ├── files/             # Arquivos PDF dos currículos nas 3 variações de idioma
 └── images/            # Fotografias e thumbnails dos projetos

## 🚀 Como clonar e rodar o projeto

Caso queira rodar este projeto na sua máquina para estudo ou avaliação, siga os passos abaixo

### Pré-requisitos
* Ter o Flutter SDK instalado e configurado nas variáveis de ambiente.

* Ter o Google Chrome instalado.

### Passo a Passo

#### 1. Clone o repositório:
```bash
git clone [https://github.com/juanndev/portfolio_juan.git](https://github.com/juanndev/portfolio_juan.git)
```
#### 2. Acesse a pasta do projeto:
```bash
cd portfolio_juan
```
#### 3. Baixe as dependências do Dart/Flutter:
```bash
flutter pub get
```
#### 4. Rode o projeto em modo de desenvolvimento (Debug):
```bash
flutter run -d chrome
```
#### 5. Para compilar uma versão de produção (Release):
(Este comando minifica o JavaScript, aplica o Tree Shaking e otimiza a performance geral do site)
```bash
flutter build web --wasm
```
---

Feito com 💻 e ☕ por **Juan Mota**.

Conecte-se comigo no [Linkedin](https://www.linkedin.com/in/juanndev/)