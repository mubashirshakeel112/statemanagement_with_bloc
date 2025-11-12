import 'package:flutter/material.dart';

class ShowSnackBar {
  static void showSuccessSnackBar(BuildContext context, String title, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      _CustomSnackBar.build(
        title: title,
        message: message,
        icon: Icons.check,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        iconColor: Colors.green,
      ),
    );
  }

  static void showErrorSnackBar(BuildContext context, String title, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      _CustomSnackBar.build(
        title: title,
        message: message,
        icon: Icons.close,
        backgroundColor: Colors.redAccent,
        textColor: Colors.white,
        iconColor: Colors.redAccent,
      ),
    );
  }

  static void showMissingSnackBar(BuildContext context, String title, String message){
    ScaffoldMessenger.of(context).showSnackBar(
      _CustomSnackBar.build(
        title: title,
        message: message,
        icon: Icons.info_outline,
        backgroundColor: Color(0xFFf0ad4e),
        textColor: Colors.white,
        iconColor: Color(0xFFf0ad4e),
      ),
    );
  }
}

class _CustomSnackBar {
  static SnackBar build({
    required String message,
    required String title,
    IconData? icon,
    Color? backgroundColor,
    Color? textColor,
    Color? iconColor,
  }) {
    return SnackBar(
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      elevation: 0,
      content: Builder(
        builder: (context) {
          final theme = Theme.of(context);
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: backgroundColor ?? theme.colorScheme.secondaryContainer,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                if (icon != null) ...[
                  Container(
                    width: 25,
                    height: 25,
                    decoration: BoxDecoration(color: Colors.white, shape: BoxShape.circle),
                    child: Icon(icon, color: iconColor, size: 18),
                  ),
                  const SizedBox(width: 15),
                ],
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: theme.textTheme.titleMedium?.copyWith(
                        color: textColor ?? theme.colorScheme.onSecondaryContainer,
                      ),
                    ),
                    Text(
                      message,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: textColor ?? theme.colorScheme.onSecondaryContainer,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
