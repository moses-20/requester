import 'package:flutter/widgets.dart';

/// N10N => Navigation
///
/// Inject route names to [BuildContext] at any tree level
extension N10N on BuildContext {
  /// home `/`
  static String get home => 'home';

  /// error `/error`
  static String get error => 'error';
}
