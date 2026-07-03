import 'package:flutter/material.dart';
import 'package:water_management/app/app.dart';
import 'package:water_management/app/bootstrap.dart';

/// Application entry point.
///
/// Initializes:
/// 1. Flutter bindings
/// 2. Environment configuration
/// 3. Dependency injection
/// 4. Runs the app

void main() async {
  await Bootstrap.init();
  runApp(const WaterManagementApp());
}

