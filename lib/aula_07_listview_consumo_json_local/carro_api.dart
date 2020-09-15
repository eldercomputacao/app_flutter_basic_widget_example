import 'package:app_flutter_basic_widget_example/aula_07_listview_consumo_json_local/carro.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

class CarroApi {
  static Future<List<Carro>> getCarrosJsonLocal() async {
    List<Carro> carros = List<Carro>();

    String carrosJsonString =
        await rootBundle.loadString("resource/json/carros.json");

    // print(carrosJsonString);

    List carrosJson = json.decode(carrosJsonString);

    // print('tamanho: ${carrosJson.length}');
    // for (Map json in carrosJson) {
    //   carros.add(Carro.fromJson(json));
    // }

    // print('tam: ${carros.length}');

    // await Future.delayed(Duration(seconds: 5));

    carros = carrosJson.map((json) => Carro.fromJson(json)).toList();

    // print('tamanho: ${carros.length}');

    // for (Carro c in carros) {
    //   print(c);
    // }

    // carros.forEach((Carro c) => print(c));

    return carros;
  }
}
