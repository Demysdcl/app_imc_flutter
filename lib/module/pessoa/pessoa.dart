class Pessoa {
  final String _nome;
  final double _peso;
  final double _altura;

  Pessoa(this._nome, this._peso, this._altura);

  String get nome => _nome;
  double get peso => _peso;
  double get altura => _altura;

  double calcularIMC() {
    return _peso / (_altura * _altura);
  }
}
