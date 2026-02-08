import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

extension LiveEventTimeExtension on DateTime {
  String toLiveEventTimeString() {
    final now = DateTime.now();
    final difference = this.difference(now);

    if (difference.inSeconds < 0) {
      final elapsed = now.difference(this);
      if (elapsed.inMinutes < 1) {
        return 'Live (started just now)';
      } else if (elapsed.inHours < 1) {
        return '${elapsed.inMinutes} min';
      } else if (elapsed.inDays < 1) {
        return '${elapsed.inHours} h';
      } else {
        return 'Live (started ${elapsed.inDays} days ago)';
      }
    } else if (difference.inMinutes < 1) {
      return 'Starting soon';
    } else if (difference.inHours < 1) {
      return 'Starting in ${difference.inMinutes} minutes';
    } else if (difference.inDays < 1) {
      return 'Starting in ${difference.inHours} hours';
    } else {
      return 'Starting in ${difference.inDays} days';
    }
  }
}

extension DateTimeX on DateTime {
  String toFormattedString() {
    return DateFormat('dd MMM yyyy, HH:mm').format(this);
  }

  bool isToday() {
    final now = DateTime.now();
    return year == now.year && month == now.month && day == now.day;
  }
}

extension StringX on String {
  String capitalize() {
    if (isEmpty) return this;
    return '${this[0].toUpperCase()}${substring(1)}';
  }
}

extension DoubleX on double {
  String toPrice() {
    return '${toStringAsFixed(2)} €';
  }
}

extension BuildContextX on BuildContext {
  void showSnackBar(String message) {
    ScaffoldMessenger.of(this).showSnackBar(SnackBar(content: Text(message)));
  }

  ThemeData get theme => Theme.of(this);

  ColorScheme get colors => theme.colorScheme;

  TextTheme get textTheme => theme.textTheme;
}
