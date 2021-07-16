import 'package:flutter/material.dart';

extension TimeExtension on TimeOfDay {
  String timeToString() {
    return ((this.hour < 10
            ? '0${this.hour.toString()}'
            : this.hour.toString()) +
        ":" +
        (this.minute < 10
            ? '0${this.minute.toString()}'
            : this.minute.toString()));
  }
}
