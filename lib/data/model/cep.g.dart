// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cep.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Cep _$CepFromJson(Map<String, dynamic> json) => Cep(
      objectId: json['objectId'] as String?,
      cep: json['cep'] as String?,
      logradouro: json['logradouro'] as String?,
      complemento: json['complemento'] as String?,
      bairro: json['bairro'] as String?,
      localidade: json['localidade'] as String?,
      uf: json['uf'] as String?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
    );

Map<String, dynamic> _$CepToJson(Cep instance) => <String, dynamic>{
      'objectId': instance.objectId,
      'cep': instance.cep,
      'logradouro': instance.logradouro,
      'complemento': instance.complemento,
      'bairro': instance.bairro,
      'localidade': instance.localidade,
      'uf': instance.uf,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };

CepBack4App _$CepBack4AppFromJson(Map<String, dynamic> json) => CepBack4App(
      results: (json['results'] as List<dynamic>)
          .map((e) => Cep.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CepBack4AppToJson(CepBack4App instance) =>
    <String, dynamic>{
      'results': instance.results,
    };
