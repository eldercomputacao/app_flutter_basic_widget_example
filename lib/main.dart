import 'package:app_flutter_basic_widget_example/aula_08_dropdownbutton/exemplo_dropdownButton_widget.dart';
import 'package:app_flutter_basic_widget_example/aula_09_popupmenubutton/exemplo_popupMenuButton_widget.dart';
import 'package:app_flutter_basic_widget_example/aula_16_alert_dialog/exemplo_alert_dialog.dart';
import 'package:flutter/material.dart';

import 'aula_15_snackbar/exemplo_snackbar.dart';

void main() {
  runApp(
    MaterialApp(
      //home: ExemploListViewProdutos(),
      //home: ExemploTextFormFieldWidget(),
      //home: ProdutoListViewPage(),
      //home: ExemloSnackbar(),
      //home: ExemploAlertDialogWidget(),
      home: ExemploPopupMenuButton(),
      //home: ExemploDropdownButtonWidget(),
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
