import 'package:flutter/material.dart';

class TableIMC extends StatelessWidget {
  const TableIMC({super.key});

  @override
  Widget build(BuildContext context) {
    return Table(
      border: TableBorder.all(),
      children: const [
        TableRow(children: [
          _TextWithPadding(
              text: Text('IMC', style: TextStyle(fontWeight: FontWeight.bold))),
          _TextWithPadding(
              text: Text('Classificação',
                  style: TextStyle(fontWeight: FontWeight.bold))),
        ]),
        TableRow(
          children: [
            _TextWithPadding(text: Text('Abaixo de 16')),
            _TextWithPadding(text: Text('Magreza grave')),
          ],
        ),
        TableRow(
          children: [
            _TextWithPadding(text: Text('Entre 16 e 17')),
            _TextWithPadding(text: Text('Magreza moderada')),
          ],
        ),
        TableRow(
          children: [
            _TextWithPadding(text: Text('Entre 17 e 18,5')),
            _TextWithPadding(text: Text('Magreza leve')),
          ],
        ),
        TableRow(
          children: [
            _TextWithPadding(text: Text('Entre 18,5 e 25')),
            _TextWithPadding(text: Text('Saudável')),
          ],
        ),
        TableRow(
          children: [
            _TextWithPadding(text: Text('Entre 25,0 e 30')),
            _TextWithPadding(text: Text('Sobrepeso')),
          ],
        ),
        TableRow(
          children: [
            _TextWithPadding(text: Text('Entre 30,0 e 35')),
            _TextWithPadding(text: Text('Obesidade grau I')),
          ],
        ),
        TableRow(
          children: [
            _TextWithPadding(text: Text('Entre 35 e 40')),
            _TextWithPadding(text: Text('Obesidade grau II (severa)')),
          ],
        ),
        TableRow(
          children: [
            _TextWithPadding(text: Text('Acima de 40')),
            _TextWithPadding(text: Text('Obesidade grau III (mórbida)')),
          ],
        ),
      ],
    );
  }
}

class _TextWithPadding extends StatelessWidget {
  final Text text;
  final double padding;
  const _TextWithPadding({
    required this.text,
    // ignore: unused_element
    this.padding = 4.0,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(padding),
      child: text,
    );
  }
}
