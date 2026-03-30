import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// --- Lingo.dev "Flutter Compiler" Bridge ---
// This helper allows you to write German directly in your code.
// The bridge script scans for l10n("...") and syncs it to your ARB files.
String l10n(String text) => text; 

void main() {
  runApp(const AllesKlaraApp());
}

class AllesKlaraApp extends StatefulWidget {
  const AllesKlaraApp({super.key});

  @override
  State<AllesKlaraApp> createState() => _AllesKlaraAppState();
}

class _AllesKlaraAppState extends State<AllesKlaraApp> {
  Locale _locale = const Locale('de');
  Map<String, String> _localizedStrings = {};

  @override
  void initState() {
    super.initState();
    _loadTranslations(_locale);
  }

  // Purely for the demo: Loads the ARB as a simple JSON map
  Future<void> _loadTranslations(Locale locale) async {
    try {
      // The bridge script generates keys based on your German text
      String jsonContent = await rootBundle.loadString('lib/l10n/app_${locale.languageCode}.arb');
      Map<String, dynamic> jsonMap = json.decode(jsonContent);
      setState(() {
        _localizedStrings = jsonMap.map((key, value) {
          if (key.startsWith('@')) return const MapEntry('', '');
          return MapEntry(key, value.toString());
        })..removeWhere((key, value) => key.isEmpty);
        _locale = locale;
      });
    } catch (e) {
      debugPrint('Error loading translations: $e');
    }
  }

  // Lookup the translation using the text-to-key conversion logic
  String translate(String text) {
    String key = text.toLowerCase().replaceAll(RegExp(r'[^a-z0-9]'), '_').replaceAll(RegExp(r'_{2,}'), '_').replaceAll(RegExp(r'^_|_$'), '');
    return _localizedStrings[key] ?? text;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Alles Klara',
      debugShowCheckedModeBanner: false, // Hides the debug banner for the demo
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      home: MainTabScreen(
        locale: _locale,
        translate: translate,
        onLocaleChange: _loadTranslations,
      ),
    );
  }
}

class MainTabScreen extends StatefulWidget {
  final Locale locale;
  final String Function(String) translate;
  final Function(Locale) onLocaleChange;

  const MainTabScreen({
    super.key,
    required this.locale,
    required this.translate,
    required this.onLocaleChange,
  });

  @override
  State<MainTabScreen> createState() => _MainTabScreenState();
}

class _MainTabScreenState extends State<MainTabScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.translate(l10n('Alles Klara'))),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        actions: [
          PopupMenuButton<String>(
            icon: const Icon(Icons.language),
            onSelected: (String code) => widget.onLocaleChange(Locale(code)),
            itemBuilder: (context) => [
              const PopupMenuItem(value: 'de', child: Text('Deutsch')),
              const PopupMenuItem(value: 'en', child: Text('English')),
              const PopupMenuItem(value: 'sk', child: Text('Slovenský')),
            ],
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.favorite, size: 80, color: Colors.teal),
            Text(
              [
                widget.translate(l10n('Beratung')),
                widget.translate(l10n('Pflegethemen')),
                widget.translate(l10n('Profil')),
                widget.translate(l10n('Einstellungen'))
              ][_selectedIndex],
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(widget.translate(l10n('Die App, die Pflegen leichter macht')), textAlign: TextAlign.center),
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text(widget.translate(l10n('Beratungsraum beitreten'))),
            ),
            const SizedBox(height: 10),
            Text(widget.translate(l10n('Testautomatisierung ist super'))),
            const SizedBox(height: 10),
            Text(widget.translate(l10n('Unsere Experten sind jetzt für Sie da'))),
            const SizedBox(height: 20),
            Text('Demo Active Locale: ${widget.locale.languageCode}', style: const TextStyle(color: Colors.grey)),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: const Icon(Icons.chat), label: widget.translate(l10n('Beratung'))),
          BottomNavigationBarItem(icon: const Icon(Icons.book), label: widget.translate(l10n('Pflegethemen'))),
          BottomNavigationBarItem(icon: const Icon(Icons.person), label: widget.translate(l10n('Profil'))),
          BottomNavigationBarItem(icon: const Icon(Icons.settings), label: widget.translate(l10n('Einstellungen'))),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.teal,
        unselectedItemColor: Colors.grey,
        onTap: (index) => setState(() => _selectedIndex = index),
      ),
    );
  }
}
