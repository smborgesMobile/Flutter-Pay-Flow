# 📚 learning_project

Um projeto de aprendizado em Flutter que implementa uma **lista de boletos**, permitindo **adicionar**, **excluir** e **marcar como pago**. O foco está em aplicar boas práticas como **Clean Architecture** e **Injeção de Dependência**, utilizando a stack Flutter/Dart.

---

## ✨ Funcionalidades

- ✅ Listar boletos
- ➕ Adicionar novos boletos
- ❌ Excluir boletos
- 💰 Marcar boletos como pagos

---

## 🛠️ Tech Stack

- **Flutter** – Framework para desenvolvimento de aplicativos móveis multiplataforma
- **Dart** – Linguagem principal utilizada com Flutter
- **Clean Architecture** – Estrutura de projeto dividida em camadas (Domain, Data, Presentation) para melhor organização, testabilidade e escalabilidade
- **Dependency Injection** – Gerenciamento de dependências desacoplado, promovendo modularidade e testes mais fáceis

---

## 📁 Estrutura de Pastas (Clean Architecture)

```plaintext
lib/
├── core/              # Utilitários e helpers genéricos
├── data/              # Fontes de dados (API, local, etc.)
├── domain/            # Entidades, repositórios e casos de uso
├── presentation/      # UI e lógica de apresentação
└── injection.dart     # Configuração de injeção de dependência

