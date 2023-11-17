import 'package:flutter/material.dart';

class CustomSnackbar extends SnackBar {
  CustomSnackbar({
    required String message,
    super.key,
    String label = 'ok',
    VoidCallback? onPressed,
  }) : super(
          content: Text(message),
          duration: const Duration(seconds: 3),
          action: SnackBarAction(
            label: label,
            onPressed: () {
              if (onPressed != null) {
                onPressed();
              }
            },
          ),
        );
}
