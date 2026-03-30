// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get app_title => 'Alles Klara';

  @override
  String get welcome_message => 'The app that makes caregiving easier';

  @override
  String get onboarding_prompt => 'Enter your access code to get started';

  @override
  String get navigation_consultation => 'Consultation';

  @override
  String get navigation_care_topics => 'Care topics';

  @override
  String get navigation_profile => 'Profile';

  @override
  String get navigation_settings => 'Settings';

  @override
  String get status_active => 'Active';

  @override
  String get status_closed => 'Closed';

  @override
  String get consultation_request_sent => 'New consultation requested';

  @override
  String get consultation_room_join => 'Join consultation room';

  @override
  String get error_network => 'Network connection failed';

  @override
  String get chat_placeholder => 'Your message...';

  @override
  String get logout_button => 'Log out';

  @override
  String get legal_disclaimer =>
      'Confidential and secure. Free consultation via chat, phone, and video.';

  @override
  String get back_button => 'Back';

  @override
  String get next_button => 'Next';

  @override
  String get consultation_contract => 'Consultation agreement';

  @override
  String get privacy_info => 'Privacy information';
}
