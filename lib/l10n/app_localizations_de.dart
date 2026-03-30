// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for German (`de`).
class AppLocalizationsDe extends AppLocalizations {
  AppLocalizationsDe([String locale = 'de']) : super(locale);

  @override
  String get app_title => 'Alles Klara';

  @override
  String get welcome_message => 'Die App, die Pflegen leichter macht';

  @override
  String get onboarding_prompt =>
      'Geben Sie Ihren Zugangscode ein, um zu beginnen';

  @override
  String get navigation_consultation => 'Beratung';

  @override
  String get navigation_care_topics => 'Pflegethemen';

  @override
  String get navigation_profile => 'Profil';

  @override
  String get navigation_settings => 'Einstellungen';

  @override
  String get status_active => 'Aktiv';

  @override
  String get status_closed => 'Geschlossen';

  @override
  String get consultation_request_sent => 'Neue Beratung angefragt';

  @override
  String get consultation_room_join => 'Beratungsraum beitreten';

  @override
  String get error_network => 'Netzwerkverbindung fehlgeschlagen';

  @override
  String get chat_placeholder => 'Deine Nachricht...';

  @override
  String get logout_button => 'Abmelden';

  @override
  String get legal_disclaimer =>
      'Vertraulich und datensicher. Kostenlose Beratung via Chat, Telefon und Video.';

  @override
  String get back_button => 'Zurück';

  @override
  String get next_button => 'Weiter';

  @override
  String get consultation_contract => 'Beratungsvertrag';

  @override
  String get privacy_info => 'Datenschutzinfo';
}
