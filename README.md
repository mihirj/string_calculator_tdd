# String calculator TDD

This project converts string input into numbers and performs addition. It supports custom delimiters, handles negative numbers. The main goal of this project is to demonstrates Test-Driven Development (TDD) principles using Flutter. It includes unit tests, golden tests with Alchemist, and integration tests with Patrol.

## Flutter version
```
Flutter 3.35.4 • channel stable • https://github.com/flutter/flutter.git
Framework • revision d693b4b9db (12 days ago) • 2025-09-16 14:27:41 +0000
Engine • hash feee8ee8fb8b975dd9990f86d3bda11e6e75faf3 (revision c298091351) (12 days ago) • 2025-09-15 14:04:24.000Z
Tools • Dart 3.9.2 • DevTools 2.48.0
```

## Unit Tests

Unit tests for calculator business logic. This test covers various scenarios including:
- Adding numbers with different delimiters
- Handling negative numbers
- Empty string
- Single number

To run the unit tests, use the following command:

```bash
flutter test
```

## Golden Testing

The project uses Alchemist for golden testing, a powerful tool for UI regression testing.

### What are Golden Tests?

Golden tests compare the rendered UI to a "golden" reference image. This helps detect unintended
visual changes during development.

### How to Use Golden Tests

1. **Creating a Golden Test**:
   ```dart
   goldenTest(
     'Widget renders correctly',
     builder: () => GoldenTestGroup(
       children: [
         GoldenTestScenario(
           name: 'default state',
           child: YourWidget(),
         ),
       ],
     ),
   );
   ```

2. **Running Tests**:
   ```bash
   flutter test --update-goldens test/golden_test.dart  # Update golden files
   flutter test test/golden_test.dart                   # Run tests against existing golden files
   flutter test                                         # Run all tests at once
   ```

3. **Managing Golden Files**:
    - Golden files are stored in the `/golden/macos` directory

For more information on Alchemist, visit the [Alchemist Documentation](https://pub.dev/packages/alchemist).


## Patrol Tests (Integration Tests)

Patrol is used for end-to-end testing of critical user flows. It simulates real user interactions and verifies app behavior.

### Running Patrol Tests
- Make sure to install Patrol CLI first:
```bash
  dart pub global activate patrol_cli
  ```

- Open up an iOS simulator or Android emulator.
- Run the following command to execute the integration tests:

```bash
 patrol test -t integration_test/presentation/home/home_page_test.dart
```

For more information on Patrol, visit the [Patrol Documentation](https://patrol.leancode.co/documentation).

## Project Structure

- `lib/` - Main source code
- `test/` - Test cases (unit, golden)
- `integration_test/` - Integration tests with Patrol

## Additional Resources

For more information on Flutter development:
- [Flutter Documentation](https://docs.flutter.dev/)
- [Dart Programming Language](https://dart.dev/)
- [Flutter Community Resources](https://flutter.dev/community)

## Contributing

Submit a pull request or open an issue for any bugs or feature requests.