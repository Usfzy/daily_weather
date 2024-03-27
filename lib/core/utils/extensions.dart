import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

extension ThemeExt on BuildContext {
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => Theme.of(this).textTheme;
}

extension DateTimeExtensions on DateTime {
  String get toTime => DateFormat('HH:mm').format(this);
}
