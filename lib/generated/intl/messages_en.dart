// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  static String m0(count) =>
      "${Intl.plural(count, zero: 'No notes yet', one: '1 note', other: '${count} notes')}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "cancel": MessageLookupByLibrary.simpleMessage("Cancel"),
        "cannot_share_empty_note_prompt":
            MessageLookupByLibrary.simpleMessage("Cannot share an empty note!"),
        "delete": MessageLookupByLibrary.simpleMessage("Delete"),
        "delete_note_prompt": MessageLookupByLibrary.simpleMessage(
            "Are you sure you want to delete this note?"),
        "email_text_field_placeholder":
            MessageLookupByLibrary.simpleMessage("Enter your email here"),
        "forgot_password":
            MessageLookupByLibrary.simpleMessage("Forgot Password"),
        "forgot_password_view_back_to_login":
            MessageLookupByLibrary.simpleMessage("Back to login page"),
        "forgot_password_view_generic_error": MessageLookupByLibrary.simpleMessage(
            "We could not process your request. Please make sure that you are a registered user, or if not, register a user now by going back one step."),
        "forgot_password_view_prompt": MessageLookupByLibrary.simpleMessage(
            "If you forgot your password, simply enter your email and we will send you a password reset link."),
        "forgot_password_view_send_me_link":
            MessageLookupByLibrary.simpleMessage("Send me password reset link"),
        "generic_error_prompt":
            MessageLookupByLibrary.simpleMessage("An error occurred"),
        "login": MessageLookupByLibrary.simpleMessage("Login"),
        "login_error_auth_error":
            MessageLookupByLibrary.simpleMessage("Authentication error"),
        "login_error_cannot_find_user": MessageLookupByLibrary.simpleMessage(
            "Cannot find a user with the entered credentials!"),
        "login_error_wrong_credentials":
            MessageLookupByLibrary.simpleMessage("Wrong credentials"),
        "login_view_forgot_password":
            MessageLookupByLibrary.simpleMessage("I forgot my password"),
        "login_view_not_registered_yet": MessageLookupByLibrary.simpleMessage(
            "Not registered yet? Register here!"),
        "login_view_prompt": MessageLookupByLibrary.simpleMessage(
            "Please log in to your account in order to interact with and create notes!"),
        "logout_button": MessageLookupByLibrary.simpleMessage("Log out"),
        "logout_dialog_prompt": MessageLookupByLibrary.simpleMessage(
            "Are you sure you want to log out?"),
        "note": MessageLookupByLibrary.simpleMessage("Note"),
        "notes_title": m0,
        "ok": MessageLookupByLibrary.simpleMessage("OK"),
        "password_reset":
            MessageLookupByLibrary.simpleMessage("Password reset"),
        "password_reset_dialog_prompt": MessageLookupByLibrary.simpleMessage(
            "We have now sent you a password reset link. Please check your email for more information."),
        "password_text_field_placeholder":
            MessageLookupByLibrary.simpleMessage("Enter your password here"),
        "register": MessageLookupByLibrary.simpleMessage("Register"),
        "register_error_email_already_in_use": MessageLookupByLibrary.simpleMessage(
            "This email is already registered to another user. Please choose another email!"),
        "register_error_generic": MessageLookupByLibrary.simpleMessage(
            "Failed to register. Please try again later!"),
        "register_error_invalid_email": MessageLookupByLibrary.simpleMessage(
            "The email address you entered appears to be invalid. Please try another email address!"),
        "register_error_weak_password": MessageLookupByLibrary.simpleMessage(
            "This password is not secure enough. Please choose another password!"),
        "register_view_already_registered":
            MessageLookupByLibrary.simpleMessage(
                "Already registered? Login here!"),
        "register_view_prompt": MessageLookupByLibrary.simpleMessage(
            "Enter your email and password to see your notes!"),
        "restart": MessageLookupByLibrary.simpleMessage("Restart"),
        "sharing": MessageLookupByLibrary.simpleMessage("Sharing"),
        "start_typing_your_note":
            MessageLookupByLibrary.simpleMessage("Start typing your note"),
        "verify_email": MessageLookupByLibrary.simpleMessage("Verify email"),
        "verify_email_send_email_verification":
            MessageLookupByLibrary.simpleMessage("Send email verification"),
        "verify_email_view_prompt": MessageLookupByLibrary.simpleMessage(
            "We\'ve sent you an email verification. Please open it to verify your account. If you haven\'t received a verification email yet, press the button below!"),
        "yes": MessageLookupByLibrary.simpleMessage("Yes")
      };
}
