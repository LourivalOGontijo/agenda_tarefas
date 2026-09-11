# TaskFlow — Agenda de Tarefas

Aplicativo desenvolvido em **Flutter e Dart** para gerenciamento de tarefas diárias.

O TaskFlow permite que o usuário selecione uma data através de um calendário e cadastre tarefas para aquele dia. As tarefas podem ser adicionadas, excluídas e marcadas como concluídas.

O projeto foi desenvolvido como atividade acadêmica, aplicando conceitos de desenvolvimento de interfaces, navegação entre telas, gerenciamento de estado, organização de código e armazenamento de dados.

---

## Demonstração online

O aplicativo está publicado através do **GitHub Pages** e pode ser testado diretamente pelo navegador, sem necessidade de instalar o Flutter.

### ▶️ Acessar o aplicativo

**[Abrir o TaskFlow no navegador](https://lourivalogontijo.github.io/agenda_tarefas/)**

### Repositório do projeto

**[Acessar o código-fonte no GitHub](https://github.com/LourivalOGontijo/agenda_tarefas)**

---

# Objetivo do projeto

O objetivo do projeto é desenvolver uma aplicação de gerenciamento de tarefas utilizando Flutter, contemplando as seguintes funcionalidades:

- Cadastro de usuário;
- Login;
- Calendário para seleção de datas;
- Cadastro de tarefas;
- Listagem de tarefas;
- Exclusão de tarefas;
- Marcação de tarefas como concluídas;
- Organização das tarefas por status;
- Ordenação alfabética;
- Armazenamento das tarefas.

O projeto também busca utilizar uma interface visual criativa, com cores vibrantes e elementos diferentes de layouts convencionais.

---

# Funcionalidades

## Cadastro

O usuário pode criar uma conta informando:

- Nome;
- E-mail;
- Senha.

Após o cadastro, o usuário é direcionado para a tela principal da aplicação.

---

## Login

A tela de login permite informar:

- E-mail;
- Senha.

O sistema realiza uma validação básica dos campos antes de permitir o acesso à aplicação.

Também existe um botão para direcionar o usuário à tela de cadastro.

---

## Calendário

O calendário permite selecionar o dia em que as tarefas serão cadastradas.

Cada data pode possuir suas próprias tarefas.

Ao selecionar uma determinada data, o aplicativo apresenta somente as tarefas correspondentes àquele dia.

---

## Adição de tarefas

O usuário pode adicionar uma nova tarefa através de uma caixa de diálogo.

Ao criar uma tarefa, ela é cadastrada automaticamente como:

**Pendente**

A tarefa recebe um identificador próprio e fica associada à data selecionada.

---

## Conclusão de tarefas

O usuário pode marcar uma tarefa pendente como concluída.

Quando isso acontece, a tarefa passa para a seção de tarefas concluídas.

Também é possível desfazer a conclusão, retornando a tarefa para a lista de pendentes.

---

## Exclusão de tarefas

O usuário pode excluir uma tarefa.

Antes da exclusão, o aplicativo apresenta uma caixa de confirmação para evitar que uma tarefa seja removida acidentalmente.

---

## Organização das tarefas

As tarefas são organizadas seguindo duas regras:

### 1. Tarefas pendentes

As tarefas não concluídas aparecem primeiro.

Dentro dessa seção, são organizadas em ordem alfabética.

### 2. Tarefas concluídas

Depois das tarefas pendentes são apresentadas as tarefas concluídas.

Também são organizadas em ordem alfabética.

Exemplo:

```text
PENDENTES

Comprar material
Estudar Flutter
Fazer exercício


CONCLUÍDAS

Ler documentação
Organizar arquivos
```

---

# Interface

O projeto utiliza uma identidade visual baseada em cores vibrantes, principalmente tons de:

- Roxo;
- Lilás;
- Rosa;
- Branco.

A interface utiliza componentes do **Material Design 3**, combinados com elementos personalizados para criar uma aparência mais moderna e criativa.

---

#  Telas desenvolvidas

O projeto possui as seguintes telas principais:

### 1. Tela de Login

Permite ao usuário acessar a aplicação através de e-mail e senha.

### 2. Tela de Cadastro

Permite criar uma nova conta.

### 3. Tela de Calendário

Permite selecionar a data para gerenciamento das tarefas.

### 4. Tela de Lista de Tarefas

Apresenta as tarefas correspondentes à data selecionada.

### 5. Tela/Diálogo de Adição

Permite cadastrar novas tarefas.

---

# Estrutura do projeto

A organização do projeto foi feita de maneira modular, separando responsabilidades entre modelos, telas, serviços e componentes reutilizáveis.

```text
agenda_tarefas/
│
├── .github/
│   └── workflows/
│       └── deploy.yml
│
├── lib/
│   ├── main.dart
│   │
│   ├── models/
│   │   └── tarefa.dart
│   │
│   ├── screens/
│   │   ├── login_screen.dart
│   │   ├── cadastro_screen.dart
│   │   ├── home_screen.dart
│   │   └── tarefas_screen.dart
│   │
│   ├── services/
│   │   └── storage_service.dart
│   │
│   └── widgets/
│       ├── tarefa_card.dart
│       └── tarefa_dialog.dart
│
├── test/
│   └── widget_test.dart
│
├── web/
│
├── pubspec.yaml
├── pubspec.lock
└── README.md
```

---

# Estruturas utilizadas no desenvolvimento

## `main.dart`

É o ponto de entrada da aplicação Flutter.

O arquivo inicializa o aplicativo e configura o `MaterialApp`, incluindo:

- Tema;
- Cores;
- Nome da aplicação;
- Tela inicial.

A aplicação utiliza:

```dart
runApp(const AgendaTarefasApp());
```

para iniciar a interface.

---

## `models`

A pasta `models` contém as classes responsáveis por representar os dados utilizados pela aplicação.

O principal modelo é:

```text
tarefa.dart
```

A classe `Tarefa` representa uma tarefa e possui informações como:

- ID;
- título;
- data;
- status de conclusão.

Essa separação permite que os dados sejam tratados independentemente da interface.

---

## `screens`

A pasta `screens` contém as telas da aplicação.

### `login_screen.dart`

Responsável pela tela de login.

### `cadastro_screen.dart`

Responsável pela tela de cadastro.

### `home_screen.dart`

Responsável pela tela principal e acesso ao calendário.

### `tarefas_screen.dart`

Responsável pela apresentação e gerenciamento das tarefas de uma determinada data.

---

## `services`

A pasta `services` contém funcionalidades relacionadas ao armazenamento e manipulação dos dados.

O arquivo:

```text
storage_service.dart
```

é utilizado para carregar e salvar as tarefas.

Essa separação evita colocar toda a lógica de armazenamento diretamente nas telas.

---

## `widgets`

A pasta `widgets` contém componentes reutilizáveis da interface.

### `tarefa_card.dart`

Representa visualmente uma tarefa na lista.

### `tarefa_dialog.dart`

Responsável pela interface utilizada para adicionar uma nova tarefa.

A utilização de widgets separados facilita a manutenção e reutilização dos componentes.

---

# Gerenciamento de estado

O projeto utiliza widgets com estado, principalmente através de:

```dart
StatefulWidget
```

e:

```dart
setState()
```

Esse mecanismo permite atualizar a interface quando ocorre alguma alteração nos dados.

Por exemplo, quando uma tarefa é marcada como concluída:

```dart
setState(() {
  tarefa.concluida = !tarefa.concluida;
});
```

A interface é reconstruída e a tarefa passa para a seção correspondente.

---

# Organização das tarefas

A tela de tarefas cria uma cópia da lista antes de realizar a ordenação.

A lógica considera primeiro o status da tarefa:

```text
Pendentes
    ↓
Concluídas
```

Depois, cada grupo é organizado alfabeticamente pelo título.

Conceitualmente:

```text
if status diferente:
    pendente vem primeiro

caso contrário:
    ordenar pelo título
```

Isso garante que as tarefas atendam ao requisito solicitado no projeto.

---

# Armazenamento

As tarefas são armazenadas através do serviço:

```text
StorageService
```

A tela de tarefas utiliza esse serviço para:

- carregar tarefas;
- adicionar tarefas;
- salvar alterações;
- excluir tarefas;
- atualizar o status de conclusão.

Dessa forma, a lógica de armazenamento fica separada da construção da interface.

---

# Navegação

A navegação entre as telas é realizada utilizando os recursos de navegação do Flutter, como:

```dart
Navigator.push()
```

e:

```dart
Navigator.pushReplacement()
```

Também é utilizado:

```dart
Navigator.pushAndRemoveUntil()
```

em situações em que é necessário remover as telas anteriores da pilha de navegação.

---

# Tecnologias utilizadas

- **Flutter**
- **Dart**
- **Material Design 3**
- **Intl**
- **Git**
- **GitHub**
- **GitHub Actions**
- **GitHub Pages**

---

# Pré-requisitos

Para executar o projeto localmente é necessário possuir:

- Flutter SDK;
- Dart SDK;
- Google Chrome, caso queira executar a versão Web;
- Git, caso queira clonar o repositório.

---

# Como executar o projeto

Clone o repositório:

```bash
git clone https://github.com/LourivalOGontijo/agenda_tarefas.git
```

Entre na pasta:

```bash
cd agenda_tarefas
```

Instale as dependências:

```bash
flutter pub get
```

Execute o projeto:

```bash
flutter run
```

---

# Executar no Chrome

Para executar a aplicação diretamente no Chrome:

```bash
flutter run -d chrome --release
```

---

# Analisar o projeto

Para verificar possíveis problemas no código:

```bash
flutter analyze
```

O projeto foi analisado durante o desenvolvimento e apresentou:

```text
No issues found!
```

---

# Formatação do código

A formatação dos arquivos Dart pode ser realizada com:

```bash
dart format lib test
```

O comando:

```bash
flutter format
```

não é utilizado nas versões atuais do Flutter.

Por isso, a formatação foi realizada utilizando diretamente o comando do Dart.

---

# Gerar a versão Web

Para gerar a versão Web do aplicativo:

```bash
flutter build web
```

Os arquivos compilados são gerados dentro da pasta:

```text
build/web
```

Durante o desenvolvimento, o projeto foi compilado com sucesso para Web.

---

# Publicação no GitHub Pages

O projeto utiliza **GitHub Actions** para automatizar a publicação da aplicação Web.

O workflow está localizado em:

```text
.github/workflows/deploy.yml
```

O processo funciona da seguinte forma:

```text
Código Flutter
      ↓
Git Push
      ↓
GitHub Actions
      ↓
Instalação do Flutter
      ↓
flutter pub get
      ↓
flutter analyze
      ↓
flutter build web
      ↓
GitHub Pages
      ↓
Aplicação disponível no navegador
```

Dessa forma, sempre que uma nova versão é enviada para a branch `main`, o GitHub Actions pode realizar automaticamente uma nova compilação e publicação.

---

# Links do projeto

### Repositório

https://github.com/LourivalOGontijo/agenda_tarefas

### Aplicação online

https://lourivalogontijo.github.io/agenda_tarefas/



---

# Conclusão

O desenvolvimento do **TaskFlow — Agenda de Tarefas** possibilitou aplicar conceitos fundamentais da linguagem Dart e do framework Flutter na construção de uma aplicação funcional para gerenciamento de tarefas.

Durante o desenvolvimento foram implementadas as principais funcionalidades solicitadas, incluindo cadastro, login, calendário, adição, exclusão e conclusão de tarefas.

A aplicação utiliza uma estrutura modular, separando as responsabilidades entre **models, screens, services e widgets**. Essa organização torna o código mais fácil de compreender, manter e expandir.

O modelo `Tarefa` foi utilizado para representar os dados das tarefas, enquanto o `StorageService` ficou responsável pelas operações relacionadas ao armazenamento. As telas foram organizadas separadamente e componentes reutilizáveis foram criados através de widgets próprios.

Também foi utilizado o gerenciamento de estado através de `StatefulWidget` e `setState()`, permitindo que alterações como adicionar uma tarefa ou marcá-la como concluída fossem refletidas imediatamente na interface.

Um dos requisitos importantes do projeto foi a organização das tarefas. Para isso, as tarefas pendentes são apresentadas primeiro e as concluídas posteriormente. Dentro de cada grupo, as tarefas são organizadas em ordem alfabética.

A interface foi desenvolvida utilizando cores vibrantes e elementos visuais personalizados, buscando fugir de um layout convencional e proporcionando uma identidade visual própria ao aplicativo.

Durante a etapa final, o projeto foi analisado utilizando:

```bash
flutter analyze
```

e apresentou:

```text
No issues found!
```

Também foi realizada a compilação para Flutter Web através de:

```bash
flutter build web
```

O aplicativo foi posteriormente disponibilizado no GitHub e publicado através do GitHub Pages, permitindo que a aplicação seja acessada e testada diretamente pelo navegador.

Dessa forma, o projeto atende aos requisitos propostos e demonstra a utilização prática de conceitos de programação, desenvolvimento de interfaces, organização de código, gerenciamento de estado, armazenamento de dados, controle de versão e publicação de uma aplicação Web.

---

# 👨‍💻 Autor

**Lourival O. Gontijo**

Projeto acadêmico desenvolvido utilizando Flutter e Dart.

---
