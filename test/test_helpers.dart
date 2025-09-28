import 'package:alchemist/alchemist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'flutter_test_config.dart';

GoldenTestScenario createTestScenario({
  required String name,
  required Widget child,
  List<BlocProvider> providers = const [],
  bool addScaffold = false,
}) {
  final childWithDeviceSize = SizedBox(
    width: pixel5DeviceWidth,
    height: pixel5DeviceHeight,
    child: addScaffold
        ? Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Center(child: child),
            ),
          )
        : child,
  );

  return GoldenTestScenario(
    name: name,
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      home: providers.isNotEmpty
          ? MultiBlocProvider(providers: providers, child: childWithDeviceSize)
          : childWithDeviceSize,
    ),
  );
}
