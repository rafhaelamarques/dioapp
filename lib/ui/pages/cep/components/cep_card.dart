import 'package:dioapp/data/model/cep.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class CepCard extends StatelessWidget {
  final Cep cep;
  const CepCard({
    super.key,
    required this.cep,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 18),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'CEP: ${cep.cep!}',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Icon(
                  MdiIcons.mapMarkerRadiusOutline,
                  color: Colors.green,
                  size: 22,
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Icon(
                  MdiIcons.homeOutline,
                  color: Colors.lightGreen,
                  size: 18,
                ),
                const SizedBox(width: 6),
                cep.complemento != ''
                    ? Expanded(
                        child: Text(
                            'Logradouro: ${cep.logradouro!} - ${cep.complemento}'),
                      )
                    : Expanded(child: Text('Logradouro: ${cep.logradouro!}')),
              ],
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                Icon(
                  MdiIcons.homeCityOutline,
                  color: Colors.lightGreen,
                  size: 18,
                ),
                const SizedBox(width: 6),
                Expanded(child: Text('Bairro: ${cep.bairro!}')),
              ],
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                Icon(
                  MdiIcons.cityVariantOutline,
                  color: Colors.lightGreen,
                  size: 18,
                ),
                const SizedBox(width: 6),
                Expanded(
                    child: Text('Localidade: ${cep.localidade!} - ${cep.uf!}')),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
