# Jogo da Velha (Tic Tac Toe)

Um simples jogo da velha desenvolvido em Flutter com um design moderno e intuitivo.

A simple tic-tac-toe game developed in Flutter with a modern and intuitive design.

## Descrição / Description

Este é um jogo simples de Jogo da Velha desenvolvido em Flutter, onde 1 jogador pode enfrentar a CPU. O jogo fornece uma interface amigável e fácil de usar, com um design moderno baseado no Material Design 3, e indicação clara de vitória ou empate.

This is a simple Tic Tac Toe game developed in Flutter, where 1 player can face the CPU. The game provides a friendly and easy-to-use interface, with a modern design based on Material Design 3, and a clear indication of victory or draw.

## Tecnologias Utilizadas / Technologies Used

<img 
    align="center" 
    alt="Flutter"
    title="Flutter" 
    src="https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white" 
/>
<img 
    align="center" 
    alt="Dart"
    title="Dart" 
    src="https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white" 
/>
<img 
    align="center" 
    alt="SQLite"
    title="SQLite" 
    src="https://img.shields.io/badge/SQLite-07405E?style=for-the-badge&logo=sqlite&logoColor=white" 
/>

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
│   ├── controllers/
│   └── theme/
├── models/
│   └── history.dart
├── screens/
│   ├── game/
│   ├── historic/
│   ├── home/
│   ├── menu/
│   └── splash/
├── services/
│   └── database_service.dart
└── widgets/
    ├── card_history.dart
    ├── end_game_dialog.dart
    ├── mark_button.dart
    ├── player_choice.dart
    ├── player_score_card.dart
    └── score_indicator.dart
```

- **`lib/core`**: Contém a lógica de negócios central, como controladores, constantes e definições de tema. / Contains the central business logic, such as controllers, constants, and theme definitions.
- **`lib/models`**: Contém os modelos de dados da aplicação. / Contains the application's data models.
- **`lib/screens`**: Contém as telas da aplicação. / Contains the application screens.
- **`lib/services`**: Contém os serviços da aplicação, como o serviço de banco de dados. / Contains the application's services, such as the database service.
- **`lib/widgets`**: Contém os widgets reutilizáveis da aplicação. / Contains the application's reusable widgets.

## Como Clonar e Executar o Projeto / How to Clone and Run the Project

Siga os passos abaixo para clonar e executar este projeto na sua máquina local:

Follow the steps below to clone and run this project on your local machine:

1.  **Pré-requisitos / Prerequisites**
    *   Certifique-se de ter o [Flutter SDK](https://flutter.dev/docs/get-started/install) instalado e configurado.
    *   Ensure you have the [Flutter SDK](https://flutter.dev/docs/get-started/install) installed and configured.

2.  **Clonar o Repositório / Clone the Repository**
    ```bash
    git clone https://github.com/Leonildo-Gomes/tic-tac-toe.git
    ```
    Substitua `<URL_DO_SEU_REPOSITORIO>` pelo URL real do seu repositório Git.
    Replace `<YOUR_REPOSITORY_URL>` with the actual URL of your Git repository.

3.  **Navegar para o Diretório do Projeto / Navigate to the Project Directory**
    ```bash
    cd tic_tac_toe
    ```

4.  **Obter as Dependências / Get Dependencies**
    ```bash
    flutter pub get
    ```

5.  **Executar a Aplicação / Run the Application**
    ```bash
    flutter run
    ```
    Certifique-se de ter um emulador ou dispositivo físico conectado e configurado.
    Ensure you have an emulator or physical device connected and configured.
