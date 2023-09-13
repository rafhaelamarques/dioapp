import 'package:dioapp/data/model/imc.dart';
import 'package:dioapp/data/repositories/person_repository.dart';
import 'package:dioapp/extensions/datetime_extension.dart';
import 'package:dioapp/ui/pages/calculator/calculator_imc_page.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class ImcTimeLinePage extends StatefulWidget {
  final PersonRepository personRepository;
  const ImcTimeLinePage({super.key, required this.personRepository});

  @override
  State<ImcTimeLinePage> createState() => _ImcTimeLinePageState();
}

class _ImcTimeLinePageState extends State<ImcTimeLinePage> {
  List<Imc> imcList = [];

  Future<List<Imc>> loadData() async {
    imcList = widget.personRepository.getImc();
    return await Future.value(imcList);
  }

  @override
  void initState() {
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> children = imcList
        .take(imcList.length)
        .expand((imc) => [
              ListTile(
                contentPadding: const EdgeInsets.all(8),
                leading: Icon(
                  MdiIcons.weightKilogram,
                  color: imc.getColor(imc.total),
                  size: 30,
                ),
                title: Text('IMC: ${imc.total.toString()}'),
                subtitle: Text(imc.date.format()),
              ),
            ])
        .toList();
    return Scaffold(
      appBar: AppBar(
          title: const Text('Histórico IMC'),
          leading: IconButton(
            onPressed: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const CalculatorImcPage()));
            },
            icon: Theme.of(context).platform == TargetPlatform.iOS
                ? const Icon(Icons.arrow_back_ios)
                : const Icon(Icons.arrow_back),
          )),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: SizedBox(
                width: 100,
                height: 30,
                child: TextButton(
                  onPressed: () {
                    widget.personRepository.clearImc();
                    loadData();
                    setState(() {});
                  },
                  child: const Wrap(
                    spacing: 4,
                    children: [
                      Icon(Icons.clear_all, size: 16, color: Colors.blue),
                      Text(
                        'Limpar',
                        style: TextStyle(
                          color: Colors.blue,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            FutureBuilder(
              future: loadData(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Expanded(
                    child: ListView(
                      children: children,
                    ),
                  );
                }
                return const Center(child: CircularProgressIndicator());
              },
            ),
          ],
        ),
      ),
    );
  }
}
