import 'package:dio/dio.dart';
import 'package:dioapp/data/model/cep.dart';

class ViaCepRepository {
  final Dio _dio = Dio();
  Future<Cep> getAddress(String cep) async {
    var json = await _dio.get('viacep.com.br/ws/$cep/json/');
    return Cep.fromJson(json.data);
  }
}
