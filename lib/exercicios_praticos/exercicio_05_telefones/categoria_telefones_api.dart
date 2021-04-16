import 'package:app_flutter_basic_widget_example/exercicios_praticos/exercicio_05_telefones/categoria_telefones.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

class CategoriaTelefonesApi {
  static Future<List<Categoria>> getCategoriaTelefonesJsonLocal() async {
    List<Categoria> categoriaTelefones = [];

    String categoriaTelefonesJsonString =
        await rootBundle.loadString("resource/json/telefones.json");

    // print(carrosJsonString);

    List categoriaTelefonesJson = json.decode(categoriaTelefonesJsonString);

    // print('tamanho: ${carrosJson.length}');
    // for (Map json in carrosJson) {
    //   carros.add(Carro.fromJson(json));
    // }

    // print('tam: ${carros.length}');

    // await Future.delayed(Duration(seconds: 5));

    categoriaTelefones =
        categoriaTelefonesJson.map((json) => Categoria.fromJson(json)).toList();

    // print('tamanho: ${carros.length}');

    // for (Carro c in carros) {
    //   print(c);
    // }

    // carros.forEach((Carro c) => print(c));

    return categoriaTelefones;
  }
}
