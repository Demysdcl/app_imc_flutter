import 'package:app_imc/module/resultado/resultado.dart';

class ResultadoRepository {
  final List<Resultado> _resultados = [];

  Future<List<Resultado>> getResultados() async {
    Future.delayed(const Duration(seconds: 300));
    return _resultados;
  }

  Future<void> addResultado(Resultado resultado) async {
    Future.delayed(const Duration(seconds: 300));
    _resultados.add(resultado);
  }
}
