import 'package:json_annotation/json_annotation.dart';

part 'cep.g.dart';

@JsonSerializable()
class Cep {
  String? objectId;
  String? cep;
  String? logradouro;
  String? complemento;
  String? bairro;
  String? localidade;
  String? uf;
  String? createdAt;
  String? updatedAt;

  Cep({
    this.objectId,
    this.cep,
    this.logradouro,
    this.complemento,
    this.bairro,
    this.localidade,
    this.uf,
    this.createdAt,
    this.updatedAt,
  });

  factory Cep.fromJson(Map<String, dynamic> json) => _$CepFromJson(json);

  Map<String, dynamic> toJson() => _$CepToJson(this);

  Cep.empty() : this();
}

@JsonSerializable()
class CepBack4App {
  List<Cep> results;

  CepBack4App({required this.results});

  factory CepBack4App.fromJson(Map<String, dynamic> json) =>
      _$CepBack4AppFromJson(json);

  Map<String, dynamic> toJson() => _$CepBack4AppToJson(this);

  CepBack4App.empty() : this(results: []);
}
