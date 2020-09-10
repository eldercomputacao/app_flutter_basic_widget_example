import 'package:app_flutter_basic_widget_example/aula_07_listview_consumo_json_local/carro.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

class CarroApi {
  static Future<List<Carro>> getCarrosJsonLocal() async {
    List<Carro> carros = List<Carro>();

    String carrosJsonString =
        await rootBundle.loadString("resource/json/carros.json");

    // print(carrosString);

    List carrosJson = json.decode(carrosJsonString);

    // for (Map json in carrosJsonString) {
    //   carros.add(Carro.fromJson(json));
    // }

    // await Future.delayed(Duration(seconds: 5));

    carros = carrosJson.map((json) => Carro.fromJson(json)).toList();

    // print('tamanho: ${carros.length}');

    // for (Carro c in carros) {
    //   print(c);
    // }

    return carros;
  }
}
