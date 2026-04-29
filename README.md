# 🚀 Juan Mota | Mobile & Front-end Developer Portfolio

Bem-vindo ao repositório do meu portfólio pessoal! Este projeto foi desenvolvido inteiramente em **Flutter Web** e atua como uma vitrine interativa do meu trabalho, experiência e evolução profissional. 

Como um desenvolvedor Mobile atuando na FoxAppy e com forte foco acadêmico em **Cybersecurity (AppSec / DevSecOps)** pela Wyden, meu objetivo com este projeto foi construir uma aplicação que não fosse apenas visualmente atraente, mas que tivesse uma arquitetura limpa, escalável, responsiva e performática no navegador, aplicando conceitos de UI/UX Premium.

---

## 🛠️ Tecnologias e Ferramentas

O ecossistema do projeto foi escolhido para garantir estabilidade, fluidez e alto impacto visual:

* **Framework:** [Flutter](https://flutter.dev/) (Canal Stable)
* **Linguagem:** [Dart](https://dart.dev/)
* **Design/Prototipagem:** Figma (utilizando princípios de Glassmorphism e UI Moderna).
* **Gerenciamento de Estado Nativo:** `ValueNotifier` e `ValueListenableBuilder`.
* **Principais Pacotes:**
  * `flutter_animate`: Motor de animações declarativas para as micro-interações.
  * `visibility_detector`: Detecção de visibilidade em tela para disparo de animações de scroll.
  * `google_fonts`: Tipografia personalizada (Inter e Montserrat).
  * `flutter_svg`: Renderização de ícones e vetores de alta fidelidade.
  * `url_launcher`: Redirecionamento seguro para links externos e redes sociais.
  * `dart:html`: Manipulação do DOM do navegador para downloads de arquivos.

---

## ✨ Funcionalidades Principais

* **🌍 Internacionalização (i18n) Dinâmica e Reativa:** O portfólio possui suporte completo para três idiomas (Português, Inglês e Espanhol). A troca é feita em tempo real através de um seletor na NavBar, atualizando todos os textos da interface sem a necessidade de recarregar a página, graças ao uso inteligente do `ValueNotifier`.
* **📄 Download Inteligente de Currículo:** O botão de "Download CV" na seção Hero detecta o idioma atual selecionado pelo usuário e faz o download automático da versão correta do PDF (ex: Português, Inglês ou Espanhol).
* **📱 Responsividade "Pixel Perfect":** O layout foi rigorosamente ajustado para cobrir desde monitores Ultrawide até telas compactas como o iPhone SE, utilizando variáveis dinâmicas de largura (`MediaQuery`) para escalar fontes e margens.

---

## 🎭 Animações e Micro-interações Premium

Para elevar a experiência do usuário (UX) a um padrão global de agências de design, o projeto conta com uma física de interface refinada:

* **Scroll Progress Bar & Reveal:** Uma barra magnética no topo rastreia o progresso da página, enquanto os componentes das seções surgem suavemente de baixo para cima (`FadeIn` + `SlideY`) à medida que entram na área visível do navegador.
* **Efeitos Magnéticos e Elevação 3D (Hover):** Botões de contato e cards de projetos reagem ao cursor do mouse. Eles se elevam fisicamente na tela, os ícones são "puxados" em direção ao clique e sombras responsivas ganham destaque verde.
* **Entrada em Cascata (Staggered Animations):** Renderização sequenciada de elementos (como os cards de serviços) baseada no índice da lista, guiando os olhos do usuário de forma fluida.
* **Cross-Fade Dinâmico & State Management:** Transição hiper-suave de informações na aba de experiências usando `AnimatedSwitcher` combinado com `AnimatedSize`, eliminando quebras abruptas de layout.
* **Shimmer & Gravidade Zero:** Feixes de luz contínuos cortam os botões principais de Call-to-Action, enquanto ícones de tecnologia flutuam suavemente no eixo Y, conferindo vida à Hero Section.
* **Efeito Ken Burns:** Uma micro-animação cíclica de escala ("respiração") na foto de perfil.

---

## 🧗‍♂️ Desafios Técnicos Superados

Durante o desenvolvimento deste portfólio, me deparei com desafios específicos do ambiente Web no Flutter, resolvendo-os das seguintes formas:

### 1. Sobrecarga de Renderização na GPU (CanvasKit)
**Problema:** Ao aplicar animações de *hover* nos cards de projetos, a transição contínua do `blurRadius` (Gaussian Blur) da sombra gerava um peso matemático extremo no navegador, causando o *crash* do motor de renderização WebGL ("Red Screen of Death").
**Solução:** Otimização arquitetural na animação. Em vez de animar o raio de desfoque, fixei os valores de propagação e apliquei a animação exclusivamente na **opacidade da cor da sombra** (de `0.0` para `0.15`). Isso mitigou totalmente o custo de renderização, garantindo 60 frames por segundo ao iterar sobre múltiplos cards.

### 2. Otimização do "Initial Load" (Tela Branca)
**Problema:** O Flutter Web precisa baixar o motor de renderização (CanvasKit/WASM) antes de desenhar a tela, causando alguns segundos de tela branca.
**Solução:** Implementação de um **Custom Preloader**. Criei um spinner em CSS puro diretamente no arquivo `web/index.html` e criei um *event listener* em JavaScript (`flutter-first-frame`) para ocultar o spinner com um fade-out elegante exatamente no milissegundo em que o Flutter termina de carregar.

### 3. "Tradução Congelada" no State Management
**Problema:** Ao trocar o idioma, as listas de dados (como as descrições de Experiências) não traduziam, pois estavam instanciadas fora do ciclo de vida de reconstrução do Flutter.
**Solução:** Transformação das estruturas de dados estáticas em **Getters** (`List<Map> get experiences => [...]`). Isso forçou o Flutter a buscar as strings atualizadas do dicionário de traduções em todo e qualquer *rebuild* gerado pela troca da bandeira de idioma.

### 4. SVG Hardening e Erros Matemáticos (Figma x Flutter)
**Problema:** Alguns ícones vetoriais exportados do Figma não renderizavam, quebrando o *parser* da biblioteca `flutter_svg`.
**Solução:** Foi necessário aplicar *debugging* direto no código XML dos SVGs. O erro ocorria devido a gradientes lineares perfeitos exportados com coordenadas `NaN` (Not a Number) pelo Figma. Removi máscaras desnecessárias (`clipPath`) e corrigi as coordenadas dos gradientes manualmente para garantir a compatibilidade com o motor CanvasKit.

---

## 📂 Estrutura do Projeto

O código está estruturado de forma modular para facilitar a manutenção e escalabilidade:

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
 ```

## 🚀 Como clonar e rodar o projeto

Caso queira rodar este projeto na sua máquina para estudo ou avaliação, siga os passos abaixo

### Pré-requisitos
* Ter o Flutter SDK instalado e configurado nas variáveis de ambiente.

* Ter o Google Chrome instalado.

### Passo a Passo

#### 1. Clone o repositório:
```bash
git clone [https://github.com/SEU_USUARIO/portfolio_juan.git](https://github.com/SEU_USUARIO/portfolio_juan.git)
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
flutter build web --release
```
---

Feito com 💻 e ☕ por **Juan Mota**.

Conecte-se comigo no [Linkedin](https://www.linkedin.com/in/juanndev/)