import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:list_app/firebase_options.dart';

import 'src/app.dart';
import 'src/features/settings/settings_controller.dart';
import 'src/features/settings/settings_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  final settingsController = SettingsController(SettingsService());
  await settingsController.loadSettings();
  runApp(MyApp(settingsController: settingsController));
}
