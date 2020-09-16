import 'package:app_flutter_basic_widget_example/aula_10_image/exemplo_image_widget.dart';
import 'package:app_flutter_basic_widget_example/exercicios_praticos/exercicio_05_telefones/categoria_telefones_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      //home: ListaCarroWidget(),
      //home: ExemploImageWidget(),
      home: CategoriaTelefonesWidget(),
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
