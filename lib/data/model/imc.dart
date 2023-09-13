import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

part 'imc.g.dart';

@HiveType(typeId: 0)
class Imc extends HiveObject {
  @HiveField(0)
  final double total;
  @HiveField(1)
  final DateTime date;

  Imc({
    required this.total,
    required this.date,
  });

  Imc.empty()
      : total = 0.0,
        date = DateTime.now();

  Color getColor(double value) {
    switch (value) {
      case < 16: // Magreza grave
        return Colors.red;
      case >= 16 && < 17: // Magreza moderada
        return Colors.orange;
      case >= 17 && < 18.5: // Magreza leve
        return Colors.yellow;
      case >= 18.5 && < 25: // Saudável
        return Colors.green;
      case >= 25 && < 30: // Sobrepeso
        return Colors.orange;
      case >= 30 && < 35: // Obesidade grau I
        return Colors.red;
      case >= 35 && < 40: // Obesidade grau II (severa)
        return Colors.red;
      case >= 40: // Obesidade grau III (mórbida)
        return Colors.red;
      default:
        return Colors.grey;
    }
  }
}
