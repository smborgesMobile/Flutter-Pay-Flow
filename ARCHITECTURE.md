# Project Architecture (Clean + BLoC)

This document outlines a pragmatic clean architecture layout and recommended migration steps to scale this project using BLoC and Clear separation of concerns.

Goal: keep code testable, maintainable and easy to extend. Use simple patterns (interfaces, folders, small DI helper) initially, migrate to get_it / injectable / mockito for tests when needed.

Suggested folders (already partially present):

- lib/
  - presentation/
    - blocs/ (or presentation/blocs) -> all BLoC/Cubit classes
    - pages/ -> UI pages and widgets specific to pages
    - widgets/ -> reusable UI widgets
  - domain/
    - entities/ -> pure domain models (no JSON or framework dependencies)
    - repositories/ -> abstract interfaces (IUserRepository, IBillRepository)
    - usecases/ -> business use cases (GetBills, AddBill)
  - data/
    - models/ -> DTOs / mappers to/from domain entities
    - datasources/ -> local / remote data source implementations
    - repositories/ -> concrete implementations of domain repositories
  - shared/ -> themes, widgets used across app
  - di/ -> dependency injection wiring (GetIt / simple factories)

Practical migration path

1. Introduce repository interfaces in `domain/repositories` (e.g. `IUserRepository`).
2. Make concrete data repositories in `data/repositories` implement those interfaces.
3. Move business logic to `domain/usecases` (already present in the project).
4. Keep UI logic inside `presentation/blocs` and have blocs depend on usecases (not data impls).
5. Add `di/injection.dart` to centralize wiring. Start with small factory helpers, then migrate to GetIt when ready.
6. Add tests for usecases and repositories (mock the repository interface). Use `mockito` or `mocktail`.

Notes

- Domain entities must not import Flutter or external packages (keep them pure Dart).
- Data models can include JSON serialization and mappers to convert to domain entities.
- Presentation layer uses BLoC and receives dependencies via constructor injection (easier to test).
- Small, incremental refactors are advised. Introduce interfaces and DI progressively.

Example (how files relate):

- `lib/domain/repositories/i_user_repository.dart` (abstract)
- `lib/data/repositories/user_respository.dart` (implements `IUserRepository`)
- `lib/domain/usecases/get_users.dart` (depends on `IUserRepository`)
- `lib/presentation/blocs/user_bloc.dart` (depends on `GetUsers` usecase)

If you want, I can:
- Move existing blocs into `lib/presentation/blocs/` and update imports.
- Create domain entity classes (if current models mix JSON parsing with domain logic).
- Add unit tests for a usecase or the new form cubit.

"Next steps" choice: which part do you want me to reorganize next? (e.g., move Blocs to presentation, create entity models, add tests, or wire GetIt init in main.dart).