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

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "accessForbidden":
            MessageLookupByLibrary.simpleMessage("Access Forbidden"),
        "appTitle":
            MessageLookupByLibrary.simpleMessage("Zaid Al- Alshereti Hospital"),
        "badCertificate":
            MessageLookupByLibrary.simpleMessage("Bad Certificate"),
        "badRequest": MessageLookupByLibrary.simpleMessage("Bad Request"),
        "badResponse": MessageLookupByLibrary.simpleMessage("Bad Response"),
        "conflictConnection":
            MessageLookupByLibrary.simpleMessage("Conflict Connection"),
        "connectionError":
            MessageLookupByLibrary.simpleMessage("Connection Error"),
        "deadlineExceeded":
            MessageLookupByLibrary.simpleMessage("Deadline Exceeded"),
        "internalServerError":
            MessageLookupByLibrary.simpleMessage("Internal Server Error"),
        "noInternetConnection":
            MessageLookupByLibrary.simpleMessage("No Internet Connection"),
        "notFound": MessageLookupByLibrary.simpleMessage("Not Found"),
        "passwordChecker": MessageLookupByLibrary.simpleMessage(
            "Password must be between 4 and 10 characters"),
        "requestError": MessageLookupByLibrary.simpleMessage("Request Error"),
        "unauthorized": MessageLookupByLibrary.simpleMessage("Unauthorized"),
        "unprocessableEntity":
            MessageLookupByLibrary.simpleMessage("Unprocessable Entity"),
        "welcome": MessageLookupByLibrary.simpleMessage("Welcome")
      };
}
