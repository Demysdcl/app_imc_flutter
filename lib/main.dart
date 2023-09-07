import 'package:app_imc/model/pessoa.dart';
import 'package:app_imc/shared/widgets/imc_resultados.dart';
import 'package:app_imc/utils/interpretador_imc.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const AppIMC());
}

class AppIMC extends StatelessWidget {
  const AppIMC({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculadora de IMC',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var nomeController = TextEditingController();
  var pesoController = TextEditingController();
  var alturaController = TextEditingController();
  var formatter = NumberFormat("#,##0.00", "pt_BR");
  Pessoa pessoa = Pessoa('', 0, 0);

  String resultado = "";
  double imc = 0;

  void calcularResultado() {
    try {
      setState(() {
        pessoa = Pessoa(
          nomeController.text,
          double.parse(pesoController.text),
          double.parse(alturaController.text),
        );
        imc = pessoa.calcularIMC();
        resultado = interpretarIMC(imc);
      });

      nomeController.clear();
      pesoController.clear();
      alturaController.clear();
    } catch (exception) {
      setState(() {
        resultado = "Erro nos dados inseridos";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculadora de IMC'),
      ),
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints:
              BoxConstraints(minHeight: MediaQuery.of(context).size.height),
          child: Padding(
              padding: const EdgeInsets.all(20),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text(
                      'Preencha suas informações',
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    TextField(
                      key: const Key('nome'),
                      controller: nomeController,
                      decoration: const InputDecoration(labelText: 'Nome'),
                    ),
                    TextField(
                      key: const Key('peso'),
                      controller: pesoController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(labelText: 'Peso (kg)'),
                    ),
                    TextField(
                      key: const Key('altura'),
                      controller: alturaController,
                      keyboardType: TextInputType.number,
                      decoration:
                          const InputDecoration(labelText: 'Altura (m)'),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: calcularResultado,
                      child: const Text('Calcular IMC'),
                    ),
                    const SizedBox(height: 20),
                    imc == 0
                        ? const Text('')
                        : ImcResultados(imc, resultado, pessoa.nome),
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
