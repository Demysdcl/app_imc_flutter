import 'package:flutter/material.dart';

class ImcResultados extends StatelessWidget {
  final double imc;
  final String resultado;
  final String nome;

  const ImcResultados(this.imc, this.resultado, this.nome, {super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.center,
      children: [
        Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          const SizedBox(
            height: 16,
          ),
          const Text(
            "Resultado",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          DataTable(
            columns: const <DataColumn>[
              DataColumn(label: Text('Descrição')),
              DataColumn(label: Text('Valor')),
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
                const DataCell(Text('Resultado',
                    style: TextStyle(fontWeight: FontWeight.bold))),
                DataCell(Text(resultado)),
              ]),
            ],
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Ok'))
        ])
      ],
    );
  }
}
