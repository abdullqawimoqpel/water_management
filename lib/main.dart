import 'package:flutter/material.dart';
import 'package:water_management/app/app.dart';
import 'package:water_management/app/di/injection_container.dart';
import 'package:water_management/core/config/app_config.dart';
import 'package:water_management/core/config/env_config.dart';
import 'package:water_management/core/utils/logger.dart';

/// Application entry point.
///
/// Initializes:
/// 1. Flutter bindings
/// 2. Environment configuration
/// 3. Dependency injection
/// 4. Runs the app
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // ── Environment Setup ──────────────────────────────────────────────
  // TODO: Switch based on build flavor in production
  AppConfig.init(envConfig: EnvConfig.development);

  AppLogger.info('Starting Water Management ERP');
  AppLogger.info('Environment: ${AppConfig.env}');

  // ── Dependency Injection ──────────────────────────────────────────
  await InjectionContainer.init();

  AppLogger.info('Dependencies initialized');

  // ── Run App ────────────────────────────────────────────────────────
  runApp(const WaterManagementApp());
}
