import 'package:app_flutter_basic_widget_example/exercicios_praticos/exercicio_07_busca_cep/endereco.dart';

import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class EnderecoApi {
  static Future<List<Endereco>> todos(String e, String c, String l) async {
    List<Endereco> _enderecos = [];
    final url = 'https://viacep.com.br/ws/$e/$c/$l/json/';

    try {
      http.Response response = await http.get(url);
      if (response.statusCode == 200) {
        List<dynamic> maps = convert.jsonDecode(response.body);
        _enderecos = maps.map((e) => Endereco.fromJson(e)).toList();
      } else {
        throw Exception(
            'Erro ao ler os dados -> STATUS CODE: ${response.statusCode}');
      }
    } catch (e) {
      print(e);
    }
    return _enderecos;
  }

  static Future<Endereco> getEndereco(String cep) async {
    final url = 'https://viacep.com.br/ws/$cep/json/';
    try {
      http.Response response = await http.get(url);
      if (response.statusCode == 200) {
        return Endereco.fromJson(convert.jsonDecode(response.body));
      } else {
        throw Exception('ERRO - STATUS CODE: ${response.statusCode}');
      }
    } catch (e) {
      print(e);
    }
    return null;
  }
}
