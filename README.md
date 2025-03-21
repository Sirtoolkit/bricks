# Feature Brick - Clean Architecture Generator

## Overview

This Mason brick generates a complete feature structure following Clean Architecture principles for Flutter applications. It creates all necessary files with proper code templates to implement a feature using the BLOC pattern (with Cubit) and a layered architecture approach.

## Structure

The generated feature follows a three-layered Clean Architecture approach:

- **Presentation Layer**: UI components and state management
- **Domain Layer**: Business logic and use cases
- **Data Layer**: Data sources, repositories, and models

## Generated Files

```
feature_name/
├── data/
│   ├── datasources/
│   │   ├── remote_data_source.dart
│   │   └── local_data_source.dart
│   ├── models/
│   │   └── feature_model.dart
│   └── repositories/
│       └── feature_repository_impl.dart
├── domain/
│   ├── entities/
│   │   └── feature_entity.dart
│   ├── repositories/
│   │   └── feature_repository.dart
│   └── usecases/
│       └── feature_usecase.dart
└── presentation/
    ├── cubit/
    │   ├── feature_cubit.dart
    │   └── feature_state.dart
    ├── pages/
    │   └── feature_page.dart
    └── widgets/
        └── feature_widgets.dart
```

## Usage

```bash
mason make feature_brick --name your_feature_name --project_name your_project_name
```

## Features

- Complete Clean Architecture structure
- Pre-configured BLOC/Cubit state management
- Repository pattern implementation
- Separation of concerns with proper abstractions
- Ready-to-use code templates

## Requirements

- Flutter project
- Mason CLI installed