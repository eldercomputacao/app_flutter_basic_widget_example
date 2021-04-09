import 'package:flutter/material.dart';
import 'aula_15_snackbar/exemplo_snackbar.dart';
import 'aula_16_alert_dialog/exemplo_alert_dialog.dart';
import 'exercicios_praticos/exercicio_06_crud/produtor_listview_page.dart';

void main() {
  runApp(
    MaterialApp(
      //home: ExemloSnackbar(),
      //home: ExemploAlertDialogWidget(),
      home: ProdutoListViewPage(),
    ),
  );
}

// home: BlocProvider(
//   blocs: [
//     Bloc((i) => IncrementBloc()),
//   ],
//   child: IntrementWidget(),
// ),

// MaterialApp(
//       initialRoute: "/rotas_nomeadas/home",
//       routes: {
//         "/rotas_nomeadas/home": (BuildContext context) => Home(),
//         "page_a": (BuildContext context) => PageA(),
//         "/rotas_nomeadas/page_b": (BuildContext context) => PageB(),
//         "/rotas_nomeadas/page_c": (BuildContext context) => PageC(),
//         "/rotas_nomeadas/page_d": (BuildContext context) => PageD(),
//       },
//     ),
