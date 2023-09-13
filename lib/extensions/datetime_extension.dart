import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime {
  String format({String? pattern}) {
    const ptBR = Locale('pt', 'BR');
    initializeDateFormatting(ptBR.toString());
    return DateFormat(pattern, ptBR.toString()).format(this);
  }

  String formatDate() {
    return format(pattern: 'dd/MM/yyyy');
  }

  String formatHour() {
    TimeOfDay timeOfDay = TimeOfDay.fromDateTime(this);
    return '${timeOfDay.hour.toString().padLeft(2, '0')}:${timeOfDay.minute.toString().padLeft(2, '0')}';
  }

  String formatDateTime() {
    return format(pattern: 'dd/MM/yyyy HH:mm');
  }
}
