import 'package:flutter/material.dart';

class TableIMC extends StatelessWidget {
  const TableIMC({super.key});

  @override
  Widget build(BuildContext context) {
    return Table(
      border: TableBorder.all(),
      children: const [
        TableRow(children: [
          Text('IMC', style: TextStyle(fontWeight: FontWeight.bold)),
          Text('Classificação', style: TextStyle(fontWeight: FontWeight.bold)),
        ]),
        TableRow(children: [
          Text('Abaixo de 16'),
          Text('Magreza grave'),
        ]),
        TableRow(children: [
          Text('Entre 16 e 17'),
          Text('Magreza moderada'),
        ]),
        TableRow(children: [
          Text('Entre 17 e 18,5'),
          Text('Magreza leve'),
        ]),
        TableRow(children: [
          Text('Entre 18,5 e 25'),
          Text('Saudável'),
        ]),
        TableRow(children: [
          Text('Entre 25,0 e 30'),
          Text('Sobrepeso'),
        ]),
        TableRow(children: [
          Text('Entre 30,0 e 35'),
          Text('Obesidade grau I'),
        ]),
        TableRow(children: [
          Text('Entre 35 e 40'),
          Text('Obesidade grau II (severa)'),
        ]),
        TableRow(children: [
          Text('Acima de 40'),
          Text('Obesidade grau III (mórbida)'),
        ]),
      ],
    );
  }
}
