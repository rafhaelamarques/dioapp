import 'package:dioapp/data/model/person.dart';
import 'package:dioapp/ui/pages/calculator/components/table_imc.dart';
import 'package:flutter/material.dart';

class CalculatorIMC extends StatefulWidget {
  const CalculatorIMC({super.key});

  @override
  State<CalculatorIMC> createState() => _CalculatorIMCState();
}

class _CalculatorIMCState extends State<CalculatorIMC> {
  final _validationKey = GlobalKey<FormState>();
  final Person _person = Person.empty();
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();
  bool _hasResult = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculadora IMC'),
      ),
      body: Form(
        key: _validationKey,
        child: ListView(
          padding: const EdgeInsets.all(8.0),
          children: [
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Text(
                  'Peso (kg)',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  width: 100,
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    maxLength: 3,
                    style: const TextStyle(fontSize: 14),
                    decoration: const InputDecoration(
                      hintText: '60',
                      counterText: "",
                      errorBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.red, width: 2),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Digite o peso';
                      }
                      return null;
                    },
                    controller: _weightController,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Text(
                  'Altura (m)',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  width: 100,
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    maxLength: 4,
                    style: const TextStyle(fontSize: 14),
                    decoration: const InputDecoration(
                      hintText: '1.65',
                      counterText: "",
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Digite a altura';
                      }
                      return null;
                    },
                    controller: _heightController,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 40),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  if (_validationKey.currentState!.validate()) {
                    setState(() {
                      _person.weight = double.parse(_weightController.text);
                      _person.height = double.parse(_heightController.text);
                      _hasResult = true;
                    });
                    return;
                  }
                  setState(() {
                    _hasResult = false;
                  });
                },
                child: const Text('Calcular'),
              ),
            ),
            const SizedBox(height: 40),
            Visibility(
              visible: _hasResult,
              child: Column(
                children: [
                  Text(
                    'IMC: ${_person.imc()}',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  const TableIMC(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
