# 🛠️ Projeto de Otimização e Refatoração em Flutter

Este repositório documenta a refatoração completa de um aplicativo Flutter que sofria de graves problemas de performance e arquitetura. O objetivo principal desta intervenção foi resolver gargalos de memória (travamentos na interface), aplicar princípios de Clean Code e melhorar a escalabilidade e manutenção do projeto.

# 🚨 Problemas Identificados na Versão Original

Durante a análise do código fonte inicial (BrokenListPage, BrokenGridPage e main.dart), identificamos os seguintes anti-patterns e erros críticos:

Colapso de Memória (Ausência de Lazy Loading): O uso de SingleChildScrollView com Column e GridView.count mapeando uma lista inteira de 200 itens forçava a engine do Flutter a renderizar tudo de uma única vez. Isso consumia uma quantidade massiva de memória RAM e causava lentidão extrema (Drop de Frames) logo na abertura da tela.

Uso Abusivo de Rede e Decodificação de Imagens: O widget Image.network estava baixando e decodificando imagens na sua resolução total, independentemente do tamanho exibido na tela, agravando o risco de Out of Memory (OOM).

Navegação Destrutiva: Os botões utilizavam runApp(Page()) para trocar de tela. Isso destruía a árvore principal do aplicativo e recriava tudo do zero, perdendo o estado global de navegação e o contexto original.

Acoplamento Extremo (Falta de Clean Code): Lógicas de renderização dos itens da lista e componentes de UI genéricos estavam todos misturados nos arquivos de rotas, quebrando o princípio de responsabilidade única.

# ✅ Soluções e Melhorias Aplicadas
Para transformar o projeto em uma aplicação de alta performance e pronta para produção, aplicamos as seguintes soluções:

1. Alta Performance Visual (Lazy Loading)

Substituição por .builder: Alteramos as listas estáticas para ListView.builder e GridView.builder. Agora, o Flutter renderiza apenas os itens que estão estritamente visíveis na tela do usuário, criando e destruindo componentes dinamicamente durante o scroll.

2. Otimização do Consumo de Memória (Imagens)

Parâmetro cacheWidth: Implementamos limites no tamanho da decodificação de imagens (cacheWidth: 800 para a lista e 400 para o grid). O Flutter agora redimensiona a imagem nativamente na memória C++ da engine, economizando centenas de megabytes em listas longas.

3. Nova Arquitetura de Navegação (Rotas Nomeadas)

Arquivo app_routes.dart: Centralizamos todas as rotas da aplicação num único arquivo gerenciador.

Uso do Navigator: Substituímos o fatídico runApp() pelo método correto Navigator.pushNamed(), mantendo o histórico de navegação limpo e o estado do Material App intacto.

4. Componentização e Clean Code

Extração de Widgets: Criamos a pasta lib/widgets/ e separamos o código das células visuais. Criamos o Header (AppBar) e o Footer (BottomAppBar), permitindo o reuso em todas as telas sem duplicação de código.

Adição de const: Adicionamos o modificador const em todas as instâncias imutáveis. Isso indica ao Flutter que esses widgets não precisam ser reconstruídos a cada frame, cravando a performance da animação em 60/120 FPS.

# 📂 Nova Estrutura de Pastas
Após a refatoração, a árvore do projeto ficou muito mais semântica e organizada:

lib/
├── main.dart
├── pages/
│   ├── grid_page.dart
│   ├── home_page.dart
│   └── list_page.dart
├── routes/
│   └── app_routes.dart
└── shared/
   └── widgets/
        ├── footer.dart
        ├── grid_item.dart
        ├── header.dart
        └── list_item.dart

# 🚀 Como Testar as Otimizações

Clone o projeto e instale as dependências com 
```
flutter pub get
```

Execute o aplicativo (recomenda-se testar em um dispositivo físico com o seguinte comando para ver a performance real).
```
flutter run --release
```