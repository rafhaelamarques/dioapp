import 'package:hive/hive.dart';

class PersonRepository {
  static late Box _box;

  PersonRepository._load();

  static Future<void> init() async {
    if (Hive.isBoxOpen('people')) {
      _box = Hive.box('people');
      return;
    }
    _box = await Hive.openBox('people');
  }

  static Future<PersonRepository> getInstance() async {
    await init();
    return PersonRepository._load();
  }

  void saveImc(double imc) {
    _box.put('imc', imc);
  }

  List<dynamic> getImc() {
    return _box.keys.map((key) => _box.get(key)).toList();
  }
}
