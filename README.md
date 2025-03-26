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
mason make feature_brick --project_name your_project_name --name your_feature_name
mason make core_brick
```

## Features

- Complete Clean Architecture structure
- Pre-configured BLOC/Cubit state management
- Repository pattern implementation
- Separation of concerns with proper abstractions
- Ready-to-use code templates

## Requirements

- Flutter project
- Mason CLI installed# fierros_mason_mobile_templates

## Required Packages

Run the following command to install all necessary dependencies:

```bash
flutter pub add injectable get_it freezed_annotation json_annotation bloc flutter_bloc meta dio hive connectivity_plus skeletonizer path_provider
```

These packages provide:
- `injectable` & `get_it`: Dependency injection
- `freezed_annotation` & `json_annotation`: Code generation for data classes
- `bloc` & `flutter_bloc`: State management
- `meta`: Additional annotations
- `dio`: HTTP client
- `hive`: Local storage
- `connectivity_plus`: Network connectivity handling
- `skeletonizer`: Loading state UI components
- `path_provider`: Access to filesystem locations

## Development Dependencies

Run the following command to install the required dev dependencies:

```bash
flutter pub add --dev injectable_generator build_runner freezed json_serializable
```

These dev packages provide:
- `injectable_generator`: Code generation for dependency injection
- `build_runner`: Dart build system for code generation
- `freezed`: Code generation for immutable classes
- `json_serializable`: JSON serialization/deserialization code generation
