import 'package:flutter/material.dart';

extension DateTimeExtension on DateTime {
  bool isSameDate(DateTime other) {
    return year == other.year && month == other.month && day == other.day;
  }

  bool isFutureDate(DateTime dateTime) {
    return (dateTime.isSameDate(DateTime.now()) || dateTime.isAfter(DateTime.now()));
  }

  bool isPastDate(DateTime dateTime) {
    return dateTime.isBefore(DateTime.now());
  }

  bool isFutureTime(TimeOfDay dateTime) {
    return hour <= dateTime.hour && minute <= dateTime.minute;
  }
}