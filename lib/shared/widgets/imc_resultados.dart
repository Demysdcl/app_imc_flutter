import 'package:flutter/material.dart';

class ImcResultados extends StatelessWidget {
  double imc;
  String resultado;
  String nome;

  ImcResultados(this.imc, this.resultado, this.nome, {super.key});

  @override
  Widget build(BuildContext context) {
    return DataTable(
      columns: const <DataColumn>[
        DataColumn(label: Text('')),
        DataColumn(label: Text('')),
      ],
      rows: <DataRow>[
        DataRow(cells: <DataCell>[
          const DataCell(Text(
            'Nome',
            style: TextStyle(fontWeight: FontWeight.bold),
          )),
          DataCell(Text(nome)),
        ]),
        DataRow(cells: <DataCell>[
          const DataCell(
              Text('IMC', style: TextStyle(fontWeight: FontWeight.bold))),
          DataCell(Text(imc.toStringAsFixed(2))),
        ]),
        DataRow(cells: <DataCell>[
          const DataCell(
              Text('Resultado', style: TextStyle(fontWeight: FontWeight.bold))),
          DataCell(Text(resultado)),
        ]),
      ],
    );
  }
}
