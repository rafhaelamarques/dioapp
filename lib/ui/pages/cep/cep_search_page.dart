import 'package:dioapp/data/model/cep.dart';
import 'package:dioapp/data/repositories/back4app_cep_repository.dart';
import 'package:dioapp/data/repositories/via_cep_repository.dart';
import 'package:dioapp/ui/pages/cep/cep_list_page.dart';
import 'package:dioapp/ui/pages/cep/components/cep_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CepSearchPage extends StatefulWidget {
  const CepSearchPage({super.key});

  @override
  State<CepSearchPage> createState() => _CepSearchPageState();
}

class _CepSearchPageState extends State<CepSearchPage> {
  final ViaCepRepository viaCepRepository = ViaCepRepository();
  final Back4AppCepRepository back4AppCepRepository = Back4AppCepRepository();

  final TextEditingController _cepController = TextEditingController();
  Cep cep = Cep.empty();
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
  }

  void saveCep(Cep cep) async {
    CepBack4App ceps = CepBack4App.empty();
    ceps = await back4AppCepRepository.getAddressList();
    if (ceps.results
            .firstWhere((element) => element.cep == cep.cep,
                orElse: () => Cep.empty())
            .cep ==
        null) {
      await back4AppCepRepository.saveAddress(cep);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pesquisa de CEP'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.7,
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      maxLength: 8,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      decoration: const InputDecoration(
                        labelText: 'Digite o CEP',
                        counterText: "",
                      ),
                      controller: _cepController,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 12),
                    child: IconButton(
                      onPressed: () async {
                        if (_cepController.text != '') {
                          setState(() => _isLoading = true);
                          cep = await viaCepRepository
                              .getAddress(_cepController.text.trim());
                          saveCep(cep);
                          setState(() {});
                          return;
                        }
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('CEP inválido'),
                          ),
                        );
                      },
                      icon: const Icon(
                        Icons.search,
                        size: 28,
                        color: Colors.blue,
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 40),
              cep.cep != null
                  ? CepCard(cep: cep)
                  : _isLoading
                      ? const CircularProgressIndicator()
                      : Container(),
              const SizedBox(height: 40),
              SizedBox(
                width: 150,
                height: 45,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CepListPage(),
                      ),
                    );
                  },
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('CEPs salvos'),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 16,
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
