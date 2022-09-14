// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Log out`
  String get logout_button {
    return Intl.message(
      'Log out',
      name: 'logout_button',
      desc: '',
      args: [],
    );
  }

  /// `Note`
  String get note {
    return Intl.message(
      'Note',
      name: 'note',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `Yes`
  String get yes {
    return Intl.message(
      'Yes',
      name: 'yes',
      desc: '',
      args: [],
    );
  }

  /// `Delete`
  String get delete {
    return Intl.message(
      'Delete',
      name: 'delete',
      desc: '',
      args: [],
    );
  }

  /// `Sharing`
  String get sharing {
    return Intl.message(
      'Sharing',
      name: 'sharing',
      desc: '',
      args: [],
    );
  }

  /// `OK`
  String get ok {
    return Intl.message(
      'OK',
      name: 'ok',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message(
      'Login',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Verify email`
  String get verify_email {
    return Intl.message(
      'Verify email',
      name: 'verify_email',
      desc: '',
      args: [],
    );
  }

  /// `Register`
  String get register {
    return Intl.message(
      'Register',
      name: 'register',
      desc: '',
      args: [],
    );
  }

  /// `Restart`
  String get restart {
    return Intl.message(
      'Restart',
      name: 'restart',
      desc: '',
      args: [],
    );
  }

  /// `Start typing your note`
  String get start_typing_your_note {
    return Intl.message(
      'Start typing your note',
      name: 'start_typing_your_note',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to delete this note?`
  String get delete_note_prompt {
    return Intl.message(
      'Are you sure you want to delete this note?',
      name: 'delete_note_prompt',
      desc: '',
      args: [],
    );
  }

  /// `Cannot share an empty note!`
  String get cannot_share_empty_note_prompt {
    return Intl.message(
      'Cannot share an empty note!',
      name: 'cannot_share_empty_note_prompt',
      desc: '',
      args: [],
    );
  }

  /// `An error occurred`
  String get generic_error_prompt {
    return Intl.message(
      'An error occurred',
      name: 'generic_error_prompt',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to log out?`
  String get logout_dialog_prompt {
    return Intl.message(
      'Are you sure you want to log out?',
      name: 'logout_dialog_prompt',
      desc: '',
      args: [],
    );
  }

  /// `Password reset`
  String get password_reset {
    return Intl.message(
      'Password reset',
      name: 'password_reset',
      desc: '',
      args: [],
    );
  }

  /// `We have now sent you a password reset link. Please check your email for more information.`
  String get password_reset_dialog_prompt {
    return Intl.message(
      'We have now sent you a password reset link. Please check your email for more information.',
      name: 'password_reset_dialog_prompt',
      desc: '',
      args: [],
    );
  }

  /// `Cannot find a user with the entered credentials!`
  String get login_error_cannot_find_user {
    return Intl.message(
      'Cannot find a user with the entered credentials!',
      name: 'login_error_cannot_find_user',
      desc: '',
      args: [],
    );
  }

  /// `Wrong credentials`
  String get login_error_wrong_credentials {
    return Intl.message(
      'Wrong credentials',
      name: 'login_error_wrong_credentials',
      desc: '',
      args: [],
    );
  }

  /// `Authentication error`
  String get login_error_auth_error {
    return Intl.message(
      'Authentication error',
      name: 'login_error_auth_error',
      desc: '',
      args: [],
    );
  }

  /// `Please log in to your account in order to interact with and create notes!`
  String get login_view_prompt {
    return Intl.message(
      'Please log in to your account in order to interact with and create notes!',
      name: 'login_view_prompt',
      desc: '',
      args: [],
    );
  }

  /// `I forgot my password`
  String get login_view_forgot_password {
    return Intl.message(
      'I forgot my password',
      name: 'login_view_forgot_password',
      desc: '',
      args: [],
    );
  }

  /// `Not registered yet? Register here!`
  String get login_view_not_registered_yet {
    return Intl.message(
      'Not registered yet? Register here!',
      name: 'login_view_not_registered_yet',
      desc: '',
      args: [],
    );
  }

  /// `Enter your email here`
  String get email_text_field_placeholder {
    return Intl.message(
      'Enter your email here',
      name: 'email_text_field_placeholder',
      desc: '',
      args: [],
    );
  }

  /// `Enter your password here`
  String get password_text_field_placeholder {
    return Intl.message(
      'Enter your password here',
      name: 'password_text_field_placeholder',
      desc: '',
      args: [],
    );
  }

  /// `Forgot Password`
  String get forgot_password {
    return Intl.message(
      'Forgot Password',
      name: 'forgot_password',
      desc: '',
      args: [],
    );
  }

  /// `We could not process your request. Please make sure that you are a registered user, or if not, register a user now by going back one step.`
  String get forgot_password_view_generic_error {
    return Intl.message(
      'We could not process your request. Please make sure that you are a registered user, or if not, register a user now by going back one step.',
      name: 'forgot_password_view_generic_error',
      desc: '',
      args: [],
    );
  }

  /// `If you forgot your password, simply enter your email and we will send you a password reset link.`
  String get forgot_password_view_prompt {
    return Intl.message(
      'If you forgot your password, simply enter your email and we will send you a password reset link.',
      name: 'forgot_password_view_prompt',
      desc: '',
      args: [],
    );
  }

  /// `Send me password reset link`
  String get forgot_password_view_send_me_link {
    return Intl.message(
      'Send me password reset link',
      name: 'forgot_password_view_send_me_link',
      desc: '',
      args: [],
    );
  }

  /// `Back to login page`
  String get forgot_password_view_back_to_login {
    return Intl.message(
      'Back to login page',
      name: 'forgot_password_view_back_to_login',
      desc: '',
      args: [],
    );
  }

  /// `This password is not secure enough. Please choose another password!`
  String get register_error_weak_password {
    return Intl.message(
      'This password is not secure enough. Please choose another password!',
      name: 'register_error_weak_password',
      desc: '',
      args: [],
    );
  }

  /// `This email is already registered to another user. Please choose another email!`
  String get register_error_email_already_in_use {
    return Intl.message(
      'This email is already registered to another user. Please choose another email!',
      name: 'register_error_email_already_in_use',
      desc: '',
      args: [],
    );
  }

  /// `Failed to register. Please try again later!`
  String get register_error_generic {
    return Intl.message(
      'Failed to register. Please try again later!',
      name: 'register_error_generic',
      desc: '',
      args: [],
    );
  }

  /// `The email address you entered appears to be invalid. Please try another email address!`
  String get register_error_invalid_email {
    return Intl.message(
      'The email address you entered appears to be invalid. Please try another email address!',
      name: 'register_error_invalid_email',
      desc: '',
      args: [],
    );
  }

  /// `Enter your email and password to see your notes!`
  String get register_view_prompt {
    return Intl.message(
      'Enter your email and password to see your notes!',
      name: 'register_view_prompt',
      desc: '',
      args: [],
    );
  }

  /// `Already registered? Login here!`
  String get register_view_already_registered {
    return Intl.message(
      'Already registered? Login here!',
      name: 'register_view_already_registered',
      desc: '',
      args: [],
    );
  }

  /// `We've sent you an email verification. Please open it to verify your account. If you haven't received a verification email yet, press the button below!`
  String get verify_email_view_prompt {
    return Intl.message(
      'We\'ve sent you an email verification. Please open it to verify your account. If you haven\'t received a verification email yet, press the button below!',
      name: 'verify_email_view_prompt',
      desc: '',
      args: [],
    );
  }

  /// `Send email verification`
  String get verify_email_send_email_verification {
    return Intl.message(
      'Send email verification',
      name: 'verify_email_send_email_verification',
      desc: '',
      args: [],
    );
  }

  /// `{count, plural, =0{No notes yet} =1{1 note} other{{count} notes}}`
  String notes_title(int count) {
    return Intl.plural(
      count,
      zero: 'No notes yet',
      one: '1 note',
      other: '$count notes',
      name: 'notes_title',
      desc: '',
      args: [count],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'es'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
