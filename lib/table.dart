import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Tabela sem Header')),
        body: DataTable(
          columns: const <DataColumn>[
            DataColumn(label: Text('')),
            DataColumn(label: Text('')),
          ],
          rows: const <DataRow>[
            DataRow(cells: <DataCell>[
              DataCell(Text('Nome')),
              DataCell(Text('Demys')),
            ]),
            DataRow(cells: <DataCell>[
              DataCell(Text('IMC')),
              DataCell(Text('27.65')),
            ]),
            DataRow(cells: <DataCell>[
              DataCell(Text('Resultado')),
              DataCell(Text('Sobrepeso')),
            ]),
          ],
        ),
      ),
    );
  }
}
