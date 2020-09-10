import 'package:app_flutter_basic_widget_example/aula_06_listView/pessoa.dart';

class PessoaApi {
  static List<Pessoa> getPessos() {
    List<Pessoa> pessoas = List<Pessoa>();
    pessoas.add(Pessoa(
        nome: 'Silvo Santos', telefone: '(33)3333-3333', favorito: true));
    pessoas.add(Pessoa(
        nome: 'Maria Oliveira', telefone: '(33)3444-3333', favorito: true));
    pessoas.add(Pessoa(nome: 'Carlos Santos', telefone: '(44)5553-3333'));
    pessoas.add(Pessoa(
        nome: 'Regina Santos', telefone: '(77)3333-3333', favorito: true));
    pessoas.add(Pessoa(nome: 'José Santos', telefone: '(88)3333-3333'));
    return pessoas;
  }
}
