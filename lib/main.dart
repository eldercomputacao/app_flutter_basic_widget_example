import 'package:app_flutter_basic_widget_example/aula_08_dropdownbutton/exemplo_dropdownButton_widget.dart';
import 'package:app_flutter_basic_widget_example/aula_13_shared_preference/exemplo_shared_preferences.dart';
import 'package:app_flutter_basic_widget_example/exercicios_praticos/exercicio_06_crud/produtor_listview_page.dart';
import 'package:app_flutter_basic_widget_example/exercicios_praticos/exercicio_07_busca_cep/busca_enderecos_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      //home: ExemploListViewProdutos(),
      //home: ExemploTextFormFieldWidget(),
      //home: ProdutoListViewPage(),
      //home: BuscaEnderecosPage(),
      //home: ExemploSharedPreferences(),
      home: ExemploDropdownButtonWidget(),
    ),
  );
}

// initialRoute: "/rotas_nomeadas/home",
// routes: {
//   "/rotas_nomeadas/home": (BuildContext context) {
//     return Home();
//   },
//   "page_a": (BuildContext context) => PageA(),
//   "/rotas_nomeadas/page_b": (BuildContext context) => PageB(),
//   "/rotas_nomeadas/page_c": (BuildContext context) => PageC(),
//   "/rotas_nomeadas/page_d": (BuildContext context) => PageD(),
// },
