import 'package:app_flutter_basic_widget_example/aula_14_sqflite/teste_database_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: TesteDatabasePage(),
  ));
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
// home: BlocProvider(
//   blocs: [
//     Bloc((i) => IncrementBloc()),
//   ],
//   child: IntrementWidget(),
// ),
