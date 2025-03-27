import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

/// Shortened to `context.translate.string` for `dart AppLocalizations.of(BuildContext context)`
extension Translate on BuildContext {
  AppLocalizations get translate => AppLocalizations.of(this)!;
}
