# TaskFlow - Agenda de Tarefas

Aplicativo desenvolvido em Flutter para gerenciamento de tarefas diárias.

O projeto foi desenvolvido como atividade acadêmica com o objetivo de aplicar conceitos de Dart e Flutter na construção de uma aplicação com múltiplas telas, gerenciamento de estado, armazenamento de dados e interface gráfica.

## Funcionalidades

- Cadastro de usuário
- Login
- Calendário
- Seleção de datas
- Adição de tarefas
- Exclusão de tarefas
- Marcação de tarefas como concluídas
- Organização das tarefas por status
- Tarefas pendentes exibidas antes das concluídas
- Ordenação alfabética das tarefas
- Armazenamento das tarefas

## Telas

### Login

Tela de acesso ao aplicativo com campos de e-mail e senha.

### Cadastro

Tela para criação de uma conta com nome, e-mail e senha.

### Calendário

Permite selecionar a data em que as tarefas serão cadastradas.

### Lista de tarefas

Exibe as tarefas da data selecionada.

As tarefas são organizadas da seguinte maneira:

1. Tarefas pendentes em ordem alfabética.
2. Tarefas concluídas em ordem alfabética.

### Adição de tarefas

As novas tarefas podem ser adicionadas por meio de uma caixa de diálogo.

Por padrão, uma nova tarefa é criada como pendente.

## Tecnologias utilizadas

- Flutter
- Dart
- Material Design
- Intl
- Git
- GitHub
- GitHub Pages

## Estrutura do projeto

```text
lib/
├── main.dart
├── models/
│   └── tarefa.dart
├── screens/
│   ├── login_screen.dart
│   ├── cadastro_screen.dart
│   ├── home_screen.dart
│   └── tarefas_screen.dart
├── services/
│   └── storage_service.dart
└── widgets/
    ├── tarefa_card.dart
    └── tarefa_dialog.dart

Como executar localmente
Tenha o Flutter instalado.

Depois execute:

flutter pub get
flutter run

Para executar no Chrome:

flutter run -d chrome --release

Para verificar o projeto:

flutter analyze

Build Web
Para gerar a versão Web:

flutter build web

Os arquivos compilados serão gerados em:

build/web

Demonstração online
A versão Web do projeto está disponível através do GitHub Pages:

TaskFlow Online

Conclusão
O desenvolvimento do TaskFlow permitiu aplicar conceitos fundamentais de Dart e Flutter na construção de uma aplicação de gerenciamento de tarefas.

O projeto utiliza uma estrutura modular, separando telas, modelos, serviços e widgets reutilizáveis. Essa organização facilita a manutenção e permite que cada parte da aplicação tenha uma responsabilidade específica.

Entre as principais funcionalidades implementadas estão o cadastro, login, seleção de datas por meio do calendário, criação, exclusão e conclusão de tarefas.

As tarefas são inicialmente cadastradas como pendentes. Na tela de gerenciamento, as tarefas pendentes são apresentadas antes das concluídas e ambas são organizadas em ordem alfabética.

Durante o desenvolvimento também foram realizados testes de análise e compilação. O projeto apresentou resultado No issues found no flutter analyze e foi compilado com sucesso para Flutter Web.

O projeto foi disponibilizado no GitHub juntamente com sua documentação e também publicado no GitHub Pages para permitir sua execução diretamente no navegador.


