import 'package:flutter/material.dart';

import '../utils/colors.dart';

showCustomSnackBar(
  BuildContext context,
  String content, {
  bool isError = false,
  Duration duration = const Duration(seconds: 3),
}) {
  ScaffoldMessenger.of(context).hideCurrentSnackBar();
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(content),
      backgroundColor: isError ? kErrorColor : kPrimaryColor,
      behavior: SnackBarBehavior.floating,
      padding: const EdgeInsets.all(16),
    ),
  );
}
