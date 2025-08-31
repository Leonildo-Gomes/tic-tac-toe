# Projeto: Jogo da Velha (Tic Tac Toe)

Este documento serve como a fonte central de verdade para o desenvolvimento do aplicativo Jogo da Velha.

Você é um engenheiro Flutter/Dart especialista em desenvolvimento mobile para Android e iOS. Sua tarefa é criar uma aplicação moderna, performática e bem estruturada, utilizando as tecnologias e seguindo as convenções aqui definidas.

---

##  Stack de Tecnologias

- **Framework:** Flutter 3.x
- **Linguagem:** Dart 3.x
- **Design System:** Material Design 3 (Material You)
- **Gestão de Estado:** Riverpod
- **Banco de Dados Local:** SQLite
- **Armazenamento de preferências :**  shared_preferences

---

## 🎯 Visão Geral do Produto

Desenvolver uma aplicação de Jogo da Velha com uma UI moderna, armazenamento local eficiente e código limpo e sustentável. A aplicação deve ser multiplataforma (Android & iOS) e estar pronta para futuras melhorias, como multiplayer online.

---

## 🎮 Funcionalidades

### Modos de Jogo
- [x] **Jogador vs. CPU:** Permite que um jogador enfrente a inteligência artificial.
- [ ] **Jogador vs. Jogador:** Permite que dois jogadores se enfrentem no mesmo dispositivo.

### Níveis de Dificuldade (CPU)
- [x] Facil
- [x] Medio
- [x] Dificil

### Gameplay
- [x] Escolher o símbolo para iniciar o jogo (X ou O).
- [x] Indicação visual clara do turno do jogador atual.
- [x] Destaque visual da combinação vencedora (linha, coluna ou diagonal).
- [x] Diálogo de fim de jogo indicando vitória, derrota ou empate.

### Placar e Histórico
- [x] Placar de vitórias, derrotas e empates.
- [x] Botão para reiniciar a partida atual.
- [x] Botão para resetar todo o placar.
- [x] Histórico de partidas salvo localmente via SQLite.
- [x] Tela de histórico exibindo data, resultado e jogadas de cada partida.
- [x] Indicador de atualização (`RefreshIndicator`) na tela de histórico.

### Configurações
- [x] **Idiomas:** Permitir a seleção entre Português, Inglês e Norueguês.
- [x] **Temas:** Permitir a seleção entre tema claro, escuro e do sistema.
- [x] **Som:** Ativar ou desativar os efeitos sonoros do jogo.

---

## 🔧 Requisitos Gerais e Estrutura

- **Estrutura de Pastas:** `screens`, `widgets`, `models`, `services`, `core`, `providers`.
- **Design Responsivo:** Utilizar `LayoutBuilder` ou `MediaQuery` para adaptar a UI a diferentes tamanhos de tela.
- **Temas:** Suporte a tema claro e escuro via `ThemeData(useMaterial3: true)`.
- **Estilização:** As cores e fontes devem ser obtidas do `Theme.of(context)`.

---

## 🧱 Convenções de Código e Boas Práticas

### Dart e Flutter
- Seguir as convenções oficiais do Dart.
- Usar `const` sempre que possível.
- Preferir `StatelessWidget` e usar `StatefulWidget` apenas quando estritamente necessário.
- Manter nomes de variáveis claros e descritivos (ex: `isGameOver`, `currentPlayer`).
- Limitar o comprimento das linhas a 80 caracteres.

### Gestão de Estado com Riverpod
- Preferir `ConsumerWidget` e `ConsumerStatefulWidget` para consumir providers.
- Usar `ref.watch` para reconstruir a UI quando o estado muda.
- Usar `ref.read` para obter o estado uma única vez (ex: em callbacks como `onPressed`).
- Dividir os providers de forma granular para evitar reconstruções desnecessárias.

### UI com Material 3
- Utilizar componentes modernos: `FilledButton`, `Card`, `ListTile`, `Dialog`, `SegmentedButton`, `NavigationBar`, etc.
- Usar a nova escala de tipografia (ex: `Theme.of(context).textTheme.titleLarge`).

### Banco de Dados (SQLite)
- Modelos devem ser serializáveis (ex: com `json_serializable`).
- Tabelas devem incluir timestamps (`createdAt`, `updatedAt`).

### Performance
- Evitar reconstruções desnecessárias de widgets.
- Otimizar listas com `ListView.builder`.
- Não realizar chamadas de função diretamente no método `build()`.