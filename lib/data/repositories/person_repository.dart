import 'package:dioapp/data/model/imc.dart';
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

  void saveImc(Imc imc) {
    List<Imc> imcList = getImc();
    imcList.add(imc);
    _box.put('imc', imcList);
  }

  List<Imc> getImc() {
    return _box.get('imc', defaultValue: <Imc>[]).cast<Imc>();
  }

  void clearImc() {
    _box.delete('imc');
  }
}
