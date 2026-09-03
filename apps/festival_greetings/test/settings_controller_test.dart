import 'package:festival_greetings/core/env/app_environment.dart';
import 'package:festival_greetings/core/identity/app_instance_identity.dart';
import 'package:festival_greetings/core/ops/analytics.dart';
import 'package:festival_greetings/core/ops/crash_reporter.dart';
import 'package:festival_greetings/core/ops/remote_config.dart';
import 'package:festival_greetings/core/ops_console/ops_console_reporter.dart';
import 'package:festival_greetings/features/settings/settings_controller.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late FakeAnalytics analytics;
  late FakeRemoteConfig remoteConfig;
  late FakeCrashReporter crashReporter;
  late FakeOpsConsoleReporter ops;
  late SettingsController controller;

  setUp(() {
    analytics = FakeAnalytics();
    remoteConfig = FakeRemoteConfig({'demo_flag': true});
    crashReporter = FakeCrashReporter();
    ops = FakeOpsConsoleReporter(
      const AppInstanceIdentity(appId: 'a', displayName: 'n'),
    );
    controller = SettingsController(
      analytics: analytics,
      remoteConfig: remoteConfig,
      crashReporter: crashReporter,
      environment: FakeAppEnvironment(BuildVariant.dev),
      opsConsoleReporter: ops,
    )..onInit();
  });

  test('logDemoEvent records analytics', () async {
    await controller.logDemoEvent();
    expect(analytics.events.single.name, 'settings_demo_tap');
  });

  test('demo flag readable', () {
    expect(controller.demoFlag.value, isTrue);
  });

  test('test crash only in dev', () async {
    await controller.triggerTestCrash();
    expect(crashReporter.reports, hasLength(1));

    final prod = SettingsController(
      analytics: analytics,
      remoteConfig: remoteConfig,
      crashReporter: crashReporter,
      environment: FakeAppEnvironment(BuildVariant.prod),
      opsConsoleReporter: ops,
    );
    await prod.triggerTestCrash();
    expect(crashReporter.reports, hasLength(1));
  });

  test('heartbeat', () async {
    await controller.sendHeartbeat();
    expect(ops.heartbeats, hasLength(1));
  });
}
