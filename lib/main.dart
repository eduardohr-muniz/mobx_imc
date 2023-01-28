import 'package:flutter/material.dart';
import 'package:mobx_imc/example/contador/contador_page.dart';
import 'package:mobx_imc/example/contador_codegen/contador_codegen_page.dart';
import 'package:mobx_imc/example/observables/list/observable_list_page.dart';
import 'package:mobx_imc/example/observables/model_obervable/model_obeservable_page.dart';
import 'package:mobx_imc/imc/imc_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.blue,
      ),
      initialRoute: "/imcPage",
      routes: {
        "/imcPage": (context) => const ImcPage(),
        "/observableList": (context) => const ObservableListPage(),
        "/modelObservable": (context) => const ModelObservablePage(),
        "/contador": (context) => const ContadorPage(),
        "/contadorCodegen": (context) => const ContadorCodegenPage(),
      },
    );
  }
}
