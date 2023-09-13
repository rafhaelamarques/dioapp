import 'package:dioapp/ui/pages/calculator/calculator_imc_page.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dio App'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(8.0),
        children: [
          const ListTile(
            title: Text(
              'Desafios do Bootcamp Flutter',
              textAlign: TextAlign.center,
            ),
            subtitle: Text(
              'Por: Rafhaela Marques',
              textAlign: TextAlign.center,
            ),
          ),
          ListTile(
            title: const Text('Calculadora IMC'),
            trailing: Icon(MdiIcons.calculatorVariantOutline),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const CalculatorImcPage()));
            },
          ),
        ],
      ),
    );
  }
}
