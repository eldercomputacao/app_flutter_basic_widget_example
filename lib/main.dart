import 'package:app_flutter_basic_widget_example/aula_02_textfield_form_validacao/exemplo_textformfield_widget.dart';
import 'package:app_flutter_basic_widget_example/aula_15_snackbar/exemplo_snackbar.dart';
import 'package:app_flutter_basic_widget_example/exercicios_praticos/exercicio_06_crud/produtor_listview_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      //home: ExemploListViewProdutos(),
      //home: ExemploTextFormFieldWidget(),
      //home: ProdutoListViewPage(),
      home: ExemloSnackbar(),
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
