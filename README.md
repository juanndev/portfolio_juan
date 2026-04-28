# 🚀 Juan Mota | Mobile & Front-end Developer Portfolio

Bem-vindo ao repositório do meu portfólio pessoal! Este projeto foi desenvolvido inteiramente em **Flutter Web** e atua como uma vitrine interativa do meu trabalho, experiência e evolução profissional. 

Como um desenvolvedor Mobile atuando na FoxAppy e com forte foco acadêmico em **Cybersecurity (AppSec / DevSecOps)** pela Wyden, meu objetivo com este projeto foi construir uma aplicação que não fosse apenas visualmente atraente, mas que tivesse uma arquitetura limpa, escalável, responsiva e performática no navegador.

---

## 🛠️ Tecnologias e Ferramentas

O ecossistema do projeto foi escolhido para garantir estabilidade e fluidez:

* **Framework:** [Flutter](https://flutter.dev/) (Canal Stable)
* **Linguagem:** [Dart](https://dart.dev/)
* **Design/Prototipagem:** Figma (utilizando princípios de Glassmorphism e UI Moderna).
* **Gerenciamento de Estado Nativo:** `ValueNotifier` e `ValueListenableBuilder`.
* **Principais Pacotes:**
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

## 🧗‍♂️ Desafios Técnicos Superados

Durante o desenvolvimento deste portfólio, me deparei com desafios específicos do ambiente Web no Flutter, resolvendo-os das seguintes formas:

### 1. Otimização do "Initial Load" (Tela Branca)
**Problema:** O Flutter Web precisa baixar o motor de renderização (CanvasKit/WASM) antes de desenhar a tela, causando alguns segundos de tela branca.
**Solução:** Implementação de um **Custom Preloader**. Criei um spinner em CSS puro diretamente no arquivo `web/index.html` e criei um *event listener* em JavaScript (`flutter-first-frame`) para ocultar o spinner com um fade-out elegante exatamente no milissegundo em que o Flutter termina de carregar.

### 2. "Tradução Congelada" no State Management
**Problema:** Ao trocar o idioma, as listas de dados (como as descrições de Experiências) não traduziam, pois estavam instanciadas fora do ciclo de vida de reconstrução do Flutter.
**Solução:** Transformação das estruturas de dados estáticas em **Getters** (`List<Map> get experiences => [...]`). Isso forçou o Flutter a buscar as strings atualizadas do dicionário de traduções em todo e qualquer *rebuild* gerado pela troca da bandeira de idioma.

### 3. SVG Hardening e Erros Matemáticos (Figma x Flutter)
**Problema:** Alguns ícones vetoriais exportados do Figma não renderizavam, quebrando o *parser* da biblioteca `flutter_svg`.
**Solução:** Foi necessário aplicar *debugging* direto no código XML dos SVGs. O erro ocorria devido a gradientes lineares perfeitos exportados com coordenadas `NaN` (Not a Number) pelo Figma. Removi máscaras desnecessárias (`clipPath`) e corrigi as coordenadas dos gradientes manualmente para garantir a compatibilidade com o motor CanvasKit.

---

## 📂 Estrutura do Projeto

O código está estruturado de forma modular para facilitar a manutenção:

```text
lib/
 ├── core/              # Configurações globais, temas e dicionário de traduções (app_translations.dart)
 ├── sections/          # Cada seção do site isolada (Hero, About, Experience, Projects, Services, Footer)
 ├── main.dart          # Arquivo principal, contendo o MaterialApp e montagem do layout da Home
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