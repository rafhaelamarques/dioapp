import 'package:dioapp/data/model/cep.dart';
import 'package:dioapp/data/webapi/dio_back4app_creator.dart';
import 'package:flutter/material.dart';

class Back4AppCepRepository {
  final _dio = DioBack4AppCreator();
  final String _url = '/Cep';

  Future<CepBack4App> getAddressList() async {
    var json = await _dio.dio.get(_url);
    return CepBack4App.fromJson(json.data);
  }

  Future<void> saveAddress(Cep cep) async {
    try {
      await _dio.dio.post(_url, data: cep.toJson());
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }

  Future<void> deleteAddress(Cep cep) async {
    try {
      await _dio.dio.delete('$_url/${cep.objectId}');
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }

  Future<void> updateAddress(Cep cep) async {
    try {
      await _dio.dio.put('$_url/${cep.objectId}', data: cep.toJson());
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }
}
