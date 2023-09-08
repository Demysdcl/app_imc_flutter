import 'package:app_imc/module/resultado/resultado.dart';
import 'package:flutter/material.dart';

class ListResultados extends StatelessWidget {
  final List<Resultado> resultados;

  const ListResultados(this.resultados, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: resultados
          .map((e) => ListTile(
                title: Text("${e.nome} IMC: ${e.imc.toStringAsFixed(2)}"),
                subtitle: Text(e.resultado),
              ))
          .toList(),
    );
  }
}
