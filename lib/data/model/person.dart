class Person {
  String name;
  double weight;
  double height;

  Person({
    required this.name,
    required this.weight,
    required this.height,
  });

  Person.empty()
      : name = '',
        weight = 0,
        height = 0;

  dynamic imc() {
    try {
      if (weight == 0 || height == 0) {
        throw ArgumentError('Peso e Altura não podem ser 0.');
      }
      if (weight < 0.0 || height < 0.0) {
        throw ArgumentError('Peso e Altura não podem ser negativos.');
      }
      return double.parse((weight / (height * height)).toStringAsFixed(2));
    } catch (e) {
      if (e is ArgumentError) {
        return e.toString().split(':')[1];
      }
      rethrow;
    }
  }
}
