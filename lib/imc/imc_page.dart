import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';
import 'package:mobx_imc/imc/imc_controller.dart';
import 'package:mobx_imc/imc/widgets/imc_gaude.dart';

class ImcPage extends StatefulWidget {
  const ImcPage({Key? key}) : super(key: key);

  @override
  State<ImcPage> createState() => _ImcPageState();
}

class _ImcPageState extends State<ImcPage> {
  final controller = ImcController();
  final pesoEC = TextEditingController();
  final alturaEC = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final reactionDisposers = <ReactionDisposer>[];
  @override
  void initState() {
    super.initState();

    final reactionError = reaction<bool>(
      (_) => controller.hasError,
      (hasError) {
        if (hasError) {
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(controller.error ?? "Erro!!")));
        }
      },
    );
    reactionDisposers.add(reactionError);
  }

  @override
  void dispose() {
    super.dispose();
    for (var reactionDisposers in reactionDisposers) {
      reactionDisposers();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calcular Imc MobX'),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Observer(
                  builder: (_) {
                    return ImcGauge(imc: controller.imc);
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: alturaEC,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(labelText: "Altura"),
                  inputFormatters: [
                    CurrencyTextInputFormatter(
                      locale: "pt_BR",
                      symbol: "",
                      turnOffGrouping: true,
                      decimalDigits: 2,
                    )
                  ],
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Altura obrigat??ria";
                    } else {
                      return null;
                    }
                  },
                ),
                TextFormField(
                  controller: pesoEC,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(labelText: "Peso"),
                  inputFormatters: [
                    CurrencyTextInputFormatter(
                      locale: "pt_BR",
                      symbol: "",
                      turnOffGrouping: true,
                      decimalDigits: 2,
                    )
                  ],
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Peso obrigat??rio";
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                ElevatedButton(
                    onPressed: () {
                      var formValid = formKey.currentState?.validate() ?? false;

                      if (formValid) {
                        var formater = NumberFormat.simpleCurrency(
                            locale: "pt_BR", decimalDigits: 2);
                        double peso = formater.parse(pesoEC.text) as double;
                        double altura = formater.parse(alturaEC.text) as double;
                        controller.calcularImc(peso: peso, altura: altura);
                      }
                    },
                    child: const Text("Calcular Imc")),
                const SizedBox(height: 20),
                const Text("Example test MobX"),
                Wrap(
                  alignment: WrapAlignment.spaceBetween,
                  runSpacing: 15,
                  spacing: 20,
                  children: [
                    ElevatedButton(
                        onPressed: () =>
                            Navigator.of(context).pushNamed("/observableList"),
                        child: const Text("Observable List")),
                    ElevatedButton(
                        onPressed: () =>
                            Navigator.of(context).pushNamed("/modelObservable"),
                        child: const Text("Model Observable")),
                    ElevatedButton(
                        onPressed: () =>
                            Navigator.of(context).pushNamed("/contador"),
                        child: const Text("contador")),
                    ElevatedButton(
                        onPressed: () =>
                            Navigator.of(context).pushNamed("/contadorCodegen"),
                        child: const Text("Contador CodeGen")),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
