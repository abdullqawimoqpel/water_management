# Phase 01: App Layer Documentation

The App layer acts as the initial shell that hooks the entire standard and custom architectures to Flutter lifecycle.

## Responsibilities
- `bootstrap.dart`: Sequential loading scripts before `runApp`.
- `app.dart`: The root `MaterialApp` widget.
- `routes/`: Global static paths mapping and navigation registry.
- `di/`: Global dependency injection using bindings to map core abstract classes to implementations.
