import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:intl/intl.dart';

class Event {
  @required
  final String title;
  @required
  final String description;
  @required
  final int priority;
  @required
  final DateTime date;
  @required
  final TimeOfDay time;

  Event({
    this.date,
    this.description,
    this.priority,
    this.time,
    this.title,
  });
}
