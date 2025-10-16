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


## 📸 Screenshots

<p align="left">
  <img src="https://github.com/user-attachments/assets/bee85c78-b194-4148-9af5-b460e7b1a757" height="400" style="margin-right: 20px;" />
  <img src="https://github.com/user-attachments/assets/00c07440-613b-44f8-95df-3db22ad00ab3" height="400" />
</p>

## 📁 Estrutura de Pastas (Clean Architecture)

```plaintext
lib/
├── core/              # Utilitários e helpers genéricos
├── data/              # Fontes de dados (API, local, etc.)
├── domain/            # Entidades, repositórios e casos de uso
├── presentation/      # UI e lógica de apresentação
└── injection.dart     # Configuração de injeção de dependência

