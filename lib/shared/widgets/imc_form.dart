import 'package:app_imc/module/pessoa/pessoa.dart';
import 'package:app_imc/module/resultado/resultado.dart';
import 'package:app_imc/module/resultado/resultado_repository.dart';
import 'package:app_imc/shared/widgets/imc_resultado.dart';
import 'package:app_imc/shared/widgets/lista_resultados.dart';
import 'package:app_imc/utils/interpretador_imc.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ImcForm extends StatefulWidget {
  const ImcForm({super.key});

  @override
  State<ImcForm> createState() => _ImcFormState();
}

class _ImcFormState extends State<ImcForm> {
  var nomeController = TextEditingController();
  var pesoController = TextEditingController();
  var alturaController = TextEditingController();
  var formatter = NumberFormat("#,##0.00", "pt_BR");
  var pessoa = Pessoa('', 0, 0);
  var repository = ResultadoRepository();
  List<Resultado> resultados = [];

  String resultado = "";
  double imc = 0;

  _ImcFormState();

  void calcularResultado() async {
    try {
      var novaPessoa = Pessoa(
        nomeController.text,
        double.parse(pesoController.text),
        double.parse(alturaController.text),
      );
      var novoImc = pessoa.calcularIMC();
      var novoResultado = interpretarIMC(imc);

      repository.addResultado(Resultado(pessoa.nome, imc, resultado));

      var novosResultados = await repository.getResultados();

      setState(() {
        pessoa = novaPessoa;
        imc = novoImc;
        resultado = novoResultado;
        resultados = novosResultados;
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
    return SafeArea(
      child: SingleChildScrollView(
        child: ConstrainedBox(
            constraints:
                BoxConstraints(minHeight: MediaQuery.of(context).size.height),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
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
                    decoration: const InputDecoration(labelText: 'Altura (m)'),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      calcularResultado();
                      showModalBottomSheet(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          context: context,
                          builder: (BuildContext bc) =>
                              ImcResultados(imc, resultado, pessoa.nome));
                    },
                    child: const Text('Calcular IMC'),
                  ),
                  ListResultados(resultados)
                ],
              ),
            )),
      ),
    );
  }
}
