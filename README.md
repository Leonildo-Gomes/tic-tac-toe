# Jogo da Velha (Tic Tac Toe)

Um simples jogo da velha desenvolvido em Flutter.

A simple tic-tac-toe game developed in Flutter.

## Descrição / Description

Este é um jogo simples de Jogo da Velha desenvolvido em Flutter, onde 1 jogador pode enfrentar a CPU. O jogo fornece uma interface amigável e fácil de usar, com indicação clara de vitória ou empate.

This is a simple Tic Tac Toe game developed in Flutter, where 1 player can face the CPU. The game provides a friendly and easy-to-use interface, with a clear indication of victory or draw.

## Tecnologias Utilizadas / Technologies Used

- **Flutter:** Framework para desenvolvimento de aplicações multiplataforma. / Framework for cross-platform application development.
- **Dart:** Linguagem de programação utilizada pelo Flutter. / Programming language used by Flutter.
- **sqflite:** Plugin para acesso a bancos de dados SQLite. / Plugin for accessing SQLite databases.

## Estrutura do Projeto / Project Structure

A estrutura do projeto segue as convenções da comunidade Flutter, separando as responsabilidades em diferentes diretórios:

The project structure follows Flutter community conventions, separating responsibilities into different directories:

```
lib/
├── core/
│   ├── constants/
│   └── controllers/
├── models/
│   └── history.dart
├── screens/
│   ├── game/
│   ├── historic/
│   ├── home/
│   └── menu/
├── services/
│   └── database_service.dart
└── widgets/
    ├── card_history.dart
    ├── custom_button.dart
    ├── mark_button.dart
    └── player_choice.dart
```

- **`lib/core`**: Contém a lógica de negócios central, como controladores e constantes. / Contains the central business logic, such as controllers and constants.
- **`lib/models`**: Contém os modelos de dados da aplicação. / Contains the application's data models.
- **`lib/screens`**: Contém as telas da aplicação. / Contains the application screens.
- **`lib/services`**: Contém os serviços da aplicação, como o serviço de banco de dados. / Contains the application's services, such as the database service.
- **`lib/widgets`**: Contém os widgets reutilizáveis da aplicação. / Contains the application's reusable widgets.
