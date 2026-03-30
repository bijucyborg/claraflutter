import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_de.dart';
import 'app_localizations_en.dart';
import 'app_localizations_sk.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('de'),
    Locale('en'),
    Locale('sk')
  ];

  /// The title of the application
  ///
  /// In de, this message translates to:
  /// **'Alles Klara'**
  String get app_title;

  /// Welcome slogan
  ///
  /// In de, this message translates to:
  /// **'Die App, die Pflegen leichter macht'**
  String get welcome_message;

  /// Message during onboarding
  ///
  /// In de, this message translates to:
  /// **'Geben Sie Ihren Zugangscode ein, um zu beginnen'**
  String get onboarding_prompt;

  /// No description provided for @navigation_consultation.
  ///
  /// In de, this message translates to:
  /// **'Beratung'**
  String get navigation_consultation;

  /// No description provided for @navigation_care_topics.
  ///
  /// In de, this message translates to:
  /// **'Pflegethemen'**
  String get navigation_care_topics;

  /// No description provided for @navigation_profile.
  ///
  /// In de, this message translates to:
  /// **'Profil'**
  String get navigation_profile;

  /// No description provided for @navigation_settings.
  ///
  /// In de, this message translates to:
  /// **'Einstellungen'**
  String get navigation_settings;

  /// No description provided for @status_active.
  ///
  /// In de, this message translates to:
  /// **'Aktiv'**
  String get status_active;

  /// No description provided for @status_closed.
  ///
  /// In de, this message translates to:
  /// **'Geschlossen'**
  String get status_closed;

  /// No description provided for @consultation_request_sent.
  ///
  /// In de, this message translates to:
  /// **'Neue Beratung angefragt'**
  String get consultation_request_sent;

  /// No description provided for @consultation_room_join.
  ///
  /// In de, this message translates to:
  /// **'Beratungsraum beitreten'**
  String get consultation_room_join;

  /// No description provided for @error_network.
  ///
  /// In de, this message translates to:
  /// **'Netzwerkverbindung fehlgeschlagen'**
  String get error_network;

  /// No description provided for @chat_placeholder.
  ///
  /// In de, this message translates to:
  /// **'Deine Nachricht...'**
  String get chat_placeholder;

  /// No description provided for @logout_button.
  ///
  /// In de, this message translates to:
  /// **'Abmelden'**
  String get logout_button;

  /// No description provided for @legal_disclaimer.
  ///
  /// In de, this message translates to:
  /// **'Vertraulich und datensicher. Kostenlose Beratung via Chat, Telefon und Video.'**
  String get legal_disclaimer;

  /// No description provided for @back_button.
  ///
  /// In de, this message translates to:
  /// **'Zurück'**
  String get back_button;

  /// No description provided for @next_button.
  ///
  /// In de, this message translates to:
  /// **'Weiter'**
  String get next_button;

  /// No description provided for @consultation_contract.
  ///
  /// In de, this message translates to:
  /// **'Beratungsvertrag'**
  String get consultation_contract;

  /// No description provided for @privacy_info.
  ///
  /// In de, this message translates to:
  /// **'Datenschutzinfo'**
  String get privacy_info;

  /// No description provided for @alles_klara.
  ///
  /// In de, this message translates to:
  /// **'Alles Klara'**
  String get alles_klara;

  /// No description provided for @beratung.
  ///
  /// In de, this message translates to:
  /// **'Beratung'**
  String get beratung;

  /// No description provided for @pflegethemen.
  ///
  /// In de, this message translates to:
  /// **'Pflegethemen'**
  String get pflegethemen;

  /// No description provided for @profil.
  ///
  /// In de, this message translates to:
  /// **'Profil'**
  String get profil;

  /// No description provided for @einstellungen.
  ///
  /// In de, this message translates to:
  /// **'Einstellungen'**
  String get einstellungen;

  /// No description provided for @die_app_die_pflegen_leichter_macht.
  ///
  /// In de, this message translates to:
  /// **'Die App, die Pflegen leichter macht'**
  String get die_app_die_pflegen_leichter_macht;

  /// No description provided for @beratungsraum_beitreten.
  ///
  /// In de, this message translates to:
  /// **'Beratungsraum beitreten'**
  String get beratungsraum_beitreten;

  /// No description provided for @testautomatisierung_ist_super.
  ///
  /// In de, this message translates to:
  /// **'Testautomatisierung ist super'**
  String get testautomatisierung_ist_super;

  /// No description provided for @unsere_experten_sind_jetzt_f_r_sie_da.
  ///
  /// In de, this message translates to:
  /// **'Unsere Experten sind jetzt für Sie da'**
  String get unsere_experten_sind_jetzt_f_r_sie_da;

  /// No description provided for @wir_sind_alles_clara.
  ///
  /// In de, this message translates to:
  /// **'Wir sind Alles Clara'**
  String get wir_sind_alles_clara;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['de', 'en', 'sk'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'de':
      return AppLocalizationsDe();
    case 'en':
      return AppLocalizationsEn();
    case 'sk':
      return AppLocalizationsSk();
  }

  throw FlutterError(
      'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
