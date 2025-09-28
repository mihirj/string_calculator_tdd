import 'dart:async';

import 'package:alchemist/alchemist.dart';

Future<void> testExecutable(
  FutureOr<void> Function() testMain, {
  bool forceUpdateGoldenFiles = false,
}) async {
  return AlchemistConfig.runWithConfig(
    config: AlchemistConfig(
      forceUpdateGoldenFiles: forceUpdateGoldenFiles,
      platformGoldensConfig: PlatformGoldensConfig(
        enabled: true,
        platforms: {HostPlatform.current()},
      ),
      ciGoldensConfig: const CiGoldensConfig(
        enabled: false,
      ), // Enable after setting up CI
    ),
    run: testMain,
  );
}

const pixel5DeviceHeight = 896.0;
const pixel5DeviceWidth = 411.0;
