import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tfg_maria_app/core/exceptions/errors.dart';
import 'package:tfg_maria_app/adapters/ui/shared/helpers/utils.dart';

extension ContextAccess on BuildContext {
  ThemeData get theme => Theme.of(this);

  TextTheme get textTheme => theme.textTheme;

  ColorScheme get colorScheme => theme.colorScheme;

  MediaQueryData get media => MediaQuery.of(this);

  MediaQueryData? get maybeMedia => MediaQuery.maybeOf(this);

  double get sizeH => media.size.height;

  double get sizeW => media.size.width;

  ScaffoldState get scaffold => Scaffold.of(this);

  void pop() => Navigator.pop(this);
}

extension PageControllerExtension on PageController {
  Future<void> next() => nextPage(duration: const Duration(microseconds: 400), curve: Curves.linear);
  Future<void> previous() => previousPage(duration: const Duration(microseconds: 400), curve: Curves.linear);
}

extension AsyncValueUI on AsyncValue {
  bool get isError => this is AsyncError;

  bool get isDone => this is AsyncData<bool> && value;

  void handleError(BuildContext context) {
    return whenOrNull(
      error: (err, _) {
        if (err is ErrorException) {
          errorDialogBuilder(context, err.message);
          return;
        }
        if (err is WarningException) {
          warningDialogBuilder(context, err.message);
          return;
        }
        errorDialogBuilder(context);
      },
    );
  }

  void handleDialogError(BuildContext context) {
    return whenOrNull(
      error: (err, _) {
        if (Navigator.canPop(context)) {
          Navigator.pop(context);
        }
        if (err is ErrorException) {
          errorDialogBuilder(context, err.message);
          return;
        }
        if (err is WarningException) {
          warningDialogBuilder(context, err.message);
          return;
        }
        errorDialogBuilder(context);
      },
    );
  }
}
