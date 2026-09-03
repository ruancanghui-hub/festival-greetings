import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/theme/app_tokens.dart';
import '../../../l10n/app_localizations.dart';
import '../settings_controller.dart';

class SettingsPage extends GetView<SettingsController> {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final tokens = context.tokens;
    return Scaffold(
      appBar: AppBar(title: Text(l10n.settingsTitle)),
      body: ListView(
        padding: EdgeInsets.all(tokens.spaceMd),
        children: [
          ListTile(
            title: Text(l10n.settingsLogEvent),
            onTap: controller.logDemoEvent,
          ),
          Obx(
            () => ListTile(
              title: Text(l10n.settingsFeatureFlag),
              subtitle: Text('${controller.demoFlag.value}'),
              trailing: IconButton(
                icon: const Icon(Icons.refresh),
                onPressed: controller.refreshFlag,
              ),
            ),
          ),
          if (controller.canTriggerTestCrash)
            ListTile(
              title: Text(l10n.settingsTestCrash),
              onTap: controller.triggerTestCrash,
            ),
          ListTile(
            title: Text(l10n.settingsHeartbeat),
            onTap: controller.sendHeartbeat,
          ),
          Obx(() {
            final event = controller.lastEvent.value;
            if (event == null) return const SizedBox.shrink();
            return Text('${l10n.settingsLastEvent}: $event');
          }),
        ],
      ),
    );
  }
}
