import 'package:mobx/mobx.dart';
import 'package:mobx_imc/model/full_name.dart';

part 'contador_codegen_controller.g.dart';

class ContadorCodegenController = _ContadorCodegenControllerBase
    with _$ContadorCodegenController;

abstract class _ContadorCodegenControllerBase with Store {
  @observable
  int counter = 0;

  @observable
  var fullName = FullName(first: "first", last: "last");

  String get saudacao => "Olá ${fullName.first}";

  @action
  void increment() {
    counter++;
    fullName = FullName(first: "Eduardo", last: "Muniz");
  }

  @action
  void changeName() {
    fullName = FullName(first: "Rodrigo", last: "Rahman");
  }

  @action
  void rollBackName() {
    fullName = FullName(first: "first", last: "last");
  }
}
