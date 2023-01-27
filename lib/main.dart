import 'package:flutter/material.dart';
import 'package:mobx_imc/contador/contador_page.dart';
import 'package:mobx_imc/contador_codegen/contador_codegen_page.dart';
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
      home: const ImcPage(),
    );
  }
}
