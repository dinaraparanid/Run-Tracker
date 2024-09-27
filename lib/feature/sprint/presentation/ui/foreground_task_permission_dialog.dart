import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:run_tracker/core/ui/theme/app.dart';
import 'package:universal_platform/universal_platform.dart';

final class ForegroundTaskPermissionDialog {
  static void show({
    required BuildContext context,
    required AppTheme theme,
    required AppLocalizations strings,
    required void Function() onConfirm,
    void Function()? onDismiss,
  }) => UniversalPlatform.isIOS ? _showCupertinoDialog(
    context: context,
    theme: theme,
    strings: strings,
    onConfirm: onConfirm,
    onDismiss: onDismiss,
  ) : _showMaterialDialog(
    context: context,
    theme: theme,
    strings: strings,
    onConfirm: onConfirm,
    onDismiss: onDismiss,
  );

  static Future<void> _showMaterialDialog({
    required BuildContext context,
    required AppTheme theme,
    required AppLocalizations strings,
    required void Function() onConfirm,
    void Function()? onDismiss,
  }) => showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: theme.colors.background.primary,
        title: Text(
          strings.sprint_foreground_task_permission_request_title,
          style: theme.typography.body.copyWith(
            color: theme.colors.indicator.primary,
          ),
        ),
        content: Text(
          strings.sprint_foreground_task_permission_request_description,
          style: theme.typography.regular.copyWith(
            color: theme.colors.text.primary,
          ),
        ),
        actions: [
          _materialActionButton(
              text: strings.confirm,
              style: theme.typography.caption.copyWith(
                color: theme.colors.indicator.primary,
              ),
              onClick: () {
                _dismiss(context);
                onConfirm();
              }
          ),

          _materialActionButton(
              text: strings.dismiss,
              style: theme.typography.caption.copyWith(
                color: theme.colors.indicator.primary,
              ),
              onClick: () {
                _dismiss(context);
                onDismiss?.call();
              }
          ),
        ],
      )
  );

  static Future<void> _showCupertinoDialog({
    required BuildContext context,
    required AppTheme theme,
    required AppLocalizations strings,
    required void Function() onConfirm,
    void Function()? onDismiss,
  }) => showCupertinoDialog(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        title: Text(
          strings.sprint_foreground_task_permission_request_title,
          style: theme.typography.body.copyWith(
            color: theme.colors.indicator.primary,
          ),
        ),
        content: Container(
          color: theme.colors.background.primary,
          child: Text(
            strings.sprint_foreground_task_permission_request_description,
            style: theme.typography.regular.copyWith(
              color: theme.colors.text.primary,
            ),
          ),
        ),
        actions: [
          _cupertinoActionButton(
              text: strings.confirm,
              style: theme.typography.caption.copyWith(
                color: theme.colors.indicator.primary,
              ),
              onClick: () {
                _dismiss(context);
                onConfirm();
              }
          ),

          _cupertinoActionButton(
              text: strings.dismiss,
              style: theme.typography.caption.copyWith(
                color: theme.colors.indicator.primary,
              ),
              onClick: () {
                _dismiss(context);
                onDismiss?.call();
              }
          ),
        ],
      )
  );

  static Widget _materialActionButton({
    required String text,
    required TextStyle style,
    required void Function() onClick,
  }) => TextButton(
    onPressed: onClick,
    child: Text(text, style: style),
  );

  static Widget _cupertinoActionButton({
    required String text,
    required TextStyle style,
    required void Function() onClick,
  }) => CupertinoButton(
    onPressed: onClick,
    color: Colors.transparent,
    child: Text(text, style: style),
  );

  static void _dismiss(BuildContext context) =>
      Navigator.of(context, rootNavigator: true).pop();
}
