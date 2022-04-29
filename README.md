# Random password generator

[![Test](https://github.com/gustavomurad/random_password_generator/actions/workflows/run-tests.yml/badge.svg?branch=main)](https://github.com/gustavomurad/random_password_generator/actions/workflows/run-tests.yml) [![codecov](https://codecov.io/gh/gustavomurad/random_password_generator/branch/main/graph/badge.svg?token=6VZOOZTYYT)](https://codecov.io/gh/gustavomurad/random_password_generator)

## Setup

- Flutter (Channel stable, 2.10.5)
- Android Studio (Android Studio Bumblebee)
- Emulator Android minimum API 21

## Comandos úteis:

Run build_runner in order to generate Mockito test mocks:

```sh
flutter pub run build_runner build --delete-conflicting-outputs
```

Run testes with coverage in HTML output:

```sh
flutter test --coverage && genhtml coverage/lcov.info --output=coverage
```

![](assets/screenshots/screenshot.png)

