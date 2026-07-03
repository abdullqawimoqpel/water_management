import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:water_management/app/routes/app_pages.dart';

/// Root application widget.
///
/// Configures:
/// - GetX navigation
/// - RTL / Arabic localization
/// - Theme (placeholder for Phase 02)
/// - Route registration
class WaterManagementApp extends StatelessWidget {
  const WaterManagementApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Water Management',
      debugShowCheckedModeBanner: false,

      // ── Localization ────────────────────────────────────────────────
      locale: const Locale('ar'),
      fallbackLocale: const Locale('en'),
      supportedLocales: AppLocalizations.supportedLocales,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],

      // ── Theme (placeholder — expanded in Phase 02) ────────────────
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF1565C0), // Water blue
        ),
        fontFamily: 'Roboto',
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF1565C0),
          brightness: Brightness.dark,
        ),
        fontFamily: 'Roboto',
      ),

      // ── Routing ────────────────────────────────────────────────────
      initialRoute: AppPages.initialRoute,
      getPages: AppPages.pages,

      // ── Default landing (until splash/auth is implemented) ─────────
      home: const _PlaceholderHomePage(),
    );
  }
}

/// Temporary placeholder home page.
///
/// This is replaced once the Splash/Auth feature is implemented in Phase 03.
class _PlaceholderHomePage extends StatelessWidget {
  const _PlaceholderHomePage();

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.water_drop_outlined,
              size: 80,
              color: Theme.of(context).colorScheme.primary,
            ),
            const SizedBox(height: 24),
            Text(
              localizations?.appTitle ?? 'Water Management',
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.primary,
                  ),
            ),
            const SizedBox(height: 8),
            Text(
              'v0.1.0 — Phase 00 Foundation',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
