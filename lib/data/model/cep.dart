import 'package:json_annotation/json_annotation.dart';

part 'cep.g.dart';

@JsonSerializable()
class Cep {
  String? cep;
  String? logradouro;
  String? complemento;
  String? bairro;
  String? localidade;
  String? uf;

  Cep({
    this.cep,
    this.logradouro,
    this.complemento,
    this.bairro,
    this.localidade,
    this.uf,
  });

  factory Cep.fromJson(Map<String, dynamic> json) => _$CepFromJson(json);

  Map<String, dynamic> toJson() => _$CepToJson(this);
}
