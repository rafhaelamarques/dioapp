import 'package:dioapp/data/model/imc.dart';
import 'package:dioapp/data/model/person.dart';
import 'package:dioapp/data/repositories/person_repository.dart';
import 'package:dioapp/ui/pages/calculator/components/table_imc.dart';
import 'package:dioapp/ui/pages/calculator/imc_timeline_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CalculatorImcPage extends StatefulWidget {
  const CalculatorImcPage({super.key});

  @override
  State<CalculatorImcPage> createState() => _CalculatorImcPageState();
}

class _CalculatorImcPageState extends State<CalculatorImcPage> {
  final _validationKey = GlobalKey<FormState>();
  final Person _person = Person.empty();
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();
  double _imcResult = 0.0;

  late PersonRepository _personRepository;
  bool _isLoading = false;

  void loadData() async {
    _personRepository = await PersonRepository.getInstance();
    setState(() {
      _personRepository.getImc().isNotEmpty
          ? _isLoading = true
          : _isLoading = false;
    });
  }

  @override
  void initState() {
    loadData();
    super.initState();
  }

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
                    maxLength: 4,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d*')),
                    ],
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
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d*')),
                    ],
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
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {
                    if (_validationKey.currentState!.validate()) {
                      setState(() {
                        _person.weight =
                            double.parse(_weightController.text.trim());
                        _person.height =
                            double.parse(_heightController.text.trim());
                      });
                      if (_person.imc() is double) {
                        setState(() {
                          _imcResult = _person.imc();
                          _isLoading = true;
                        });
                        _personRepository.saveImc(
                          Imc(
                            total: _imcResult,
                            date: DateTime.now(),
                          ),
                        );
                        return;
                      }
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(_person.imc()),
                          duration: const Duration(seconds: 3),
                          backgroundColor: Colors.red,
                        ),
                      );
                    }
                  },
                  child: const Text('Calcular'),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _weightController.clear();
                      _heightController.clear();
                      _imcResult = 0.0;
                    });
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  child: const Text('Limpar'),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Visibility(
              visible: _imcResult != 0.0,
              child: Column(
                children: [
                  Text(
                    'IMC: $_imcResult',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  const TableIMC(),
                  const SizedBox(height: 20),
                ],
              ),
            ),
            Visibility(
              visible: _isLoading,
              child: SizedBox(
                width: 100,
                height: 50,
                child: TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ImcTimeLinePage(
                          personRepository: _personRepository,
                        ),
                      ),
                    );
                  },
                  child: const Wrap(
                    spacing: 4,
                    children: [
                      Text(
                        'Histórico',
                        style: TextStyle(
                          color: Colors.blue,
                        ),
                      ),
                      Icon(Icons.arrow_forward_ios,
                          size: 16, color: Colors.blue)
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
