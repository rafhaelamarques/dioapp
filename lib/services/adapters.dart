import 'package:dioapp/data/model/imc.dart';
import 'package:hive/hive.dart';

class HiveAdapterInitializer {
  static void init() {
    Hive.registerAdapter(ImcAdapter());
  }
}
