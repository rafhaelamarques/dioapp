import 'package:dioapp/data/model/cep.dart';
import 'package:dioapp/data/webapi/dio_back4app_creator.dart';

class Back4AppCepRepository {
  final _dio = DioBack4AppCreator();
  final String _url = '/Cep';

  Future<Cep> getAddressList() async {
    var json = await _dio.dio.get(_url);
    return Cep.fromJson(json.data);
  }

  Future<void> saveAddress(Cep cep) async {
    await _dio.dio.post(_url, data: cep.toJson());
  }
}
