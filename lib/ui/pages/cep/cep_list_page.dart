import 'package:dioapp/data/model/cep.dart';
import 'package:dioapp/data/repositories/back4app_cep_repository.dart';
import 'package:dioapp/ui/pages/cep/components/cep_card.dart';
import 'package:flutter/material.dart';

class CepListPage extends StatefulWidget {
  const CepListPage({super.key});

  @override
  State<CepListPage> createState() => _CepListPageState();
}

class _CepListPageState extends State<CepListPage> {
  final Back4AppCepRepository back4AppCepRepository = Back4AppCepRepository();
  CepBack4App ceps = CepBack4App.empty();

  @override
  void initState() {
    super.initState();
    loadCeps();
  }

  Future<CepBack4App> loadCeps() async {
    ceps = await back4AppCepRepository.getAddressList();
    if (mounted) setState(() {});
    return await Future.value(ceps);
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> children = ceps.results
        .take(ceps.results.length)
        .expand((cep) => [
              CepCard(cep: cep),
              const SizedBox(height: 15),
            ])
        .toList();
    return Scaffold(
      appBar: AppBar(
        title: const Text('CEPs Pesquisados'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            FutureBuilder(
              future: loadCeps(),
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
