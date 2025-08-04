
# Projeto: Jogo da velha
    Este é um jogo simples de Jogo da Velha desenvolvido em Flutter, onde 1 jogadores pode enfrentar a CPU. O jogo fornece uma interface amigável e fácil de usar, com indicação clara de vitória ou empate.


🎮 FUNCIONALIDADES
- Jogo local para 1 jogadore contra CPU.
- Nivel Jogo: Basico e Avancado.
- Escolher a indicação visual para iniciar jogo (jogador X ou O)
- Indicação visual de turno (jogador X ou O).
- Destacar a combinação vencedora.
- Placar de vitórias e empates.
- Botão para reiniciar a partida.
- Botão para resetar o placar.
- Histórico de partidas salvo localmente via SQLite.
- Tela de histórico com data, resultado e jogadas.
- Utilizar componentes modernos do Material 3: `FilledButton`, `ElevatedButton`, `Card`, `Dialog`, `NavigationBar`, etc.




Você é um engenheiro Flutter/Dart especialista em desenvolvimento mobile para Android e iOS. Sua tarefa é criar uma aplicação moderna, performática e bem estruturada de **Jogo da Velha (Tic Tac Toe)**, utilizando Flutter, Dart e SQLite.

🛠️ A aplicação deve seguir **os princípios do Material Design 3.0 (Material You)**, com design responsivo, suave e acessível, aproveitando os recursos de temas dinâmicos, componentes modernos e tipografia adaptativa do Material 3.

📱 A aplicação será multiplataforma: Android e iOS.

---

🔧 REQUISITOS GERAIS
- Estrutura organizada: `screens`, `widgets`, `models`, `services`, `helpers`, `constants`, `types`.
- Design responsivo com `LayoutBuilder` ou `MediaQuery`.
- Uso de `ThemeData(useMaterial3: true)` com suporte a temas claros e escuros.
- Estilização via `Theme.of(context).colorScheme`, `textTheme`, `shapeScheme`.

---

🎮 FUNCIONALIDADES
- Jogo local para dois jogadores no mesmo dispositivo.
- Indicação visual de turno (jogador X ou O).
- Destacar a combinação vencedora.
- Placar de vitórias e empates.
- Botão para reiniciar a partida.
- Botão para resetar o placar.
- Histórico de partidas salvo localmente via SQLite.
- Tela de histórico com data, resultado e jogadas.
- Utilizar componentes modernos do Material 3: `FilledButton`, `ElevatedButton`, `Card`, `Dialog`, `NavigationBar`, etc.

---

🧱 CONVENÇÕES DE CÓDIGO E BOAS PRÁTICAS

**Dart e Flutter**
- Usar as convenções do Dart.
- Usar `const` sempre que possível para reduzir rebuilds.
- Usar `=>` para funções simples.
- Getters e setters de uma linha devem ser expressões.
- Usar vírgulas finais em parâmetros múltiplos.
- Preferir `StatelessWidget`. Usar `StatefulWidget` só quando necessário.
- Composição sobre herança.
- Nomes de variáveis claros (ex: `isGameOver`, `hasWinner`, `currentPlayer`).


**Tratamento de erros e estado**
- Exibir erros com `SelectableText.rich` em vermelho (evitar SnackBar).
- Usar `AsyncValue`, `FutureBuilder` ou `StateNotifier` para controle de estado.
- Tratar estados vazios e carregando diretamente na tela.

**Banco de Dados**
- Usar SQLite com tabelas que contenham `createdAt`, `updatedAt`, `isDeleted`.
- Modelos devem ser anotados com `@JsonSerializable(fieldRename: FieldRename.snake)`.
- Campos somente leitura com `@JsonKey(includeFromJson: true, includeToJson: false)`.
- Usar enums com `@JsonValue(int)` para persistência.

**UI com Material 3**
- Usar widgets modernos: `FilledButton`, `Card`, `ListTile`, `Dialog`, `SegmentedButton`, `NavigationBar`, etc.
- Utilizar `Theme.of(context).textTheme.titleLarge` ao invés de `headline6`, etc.
- Tipografia e cores devem vir do `ThemeData`.
- Implementar `RefreshIndicator` na tela de histórico.

**Performance**
- Evitar reconstruções desnecessárias.
- Otimizar listas com `ListView.builder`.
- Usar `AssetImage` para imagens locais e `cached_network_image` para remotas.
- Evitar chamadas de função diretas no `build()`.

**Boas práticas**
- Usar `log()` no lugar de `print()`.
- Linhas com no máximo 80 caracteres.
- Comentários explicando lógicas complexas ou decisões técnicas.

---

🎯 OBJETIVO FINAL
Desenvolver uma aplicação Flutter com:
- UI moderna baseada no Material 3.
- Armazenamento local eficiente com SQLite.
- Código limpo, organizado, performático e sustentável.
- Estrutura pronta para futuras melhorias, como multiplayer online ou integração com backend.

Siga a documentação oficial do Flutter e os princípios do Material Design 3 para todas as decisões de design e código.
