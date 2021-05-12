import 'package:flutter/material.dart';
import 'aula_07_listview_consumo_json_local/lista_carro.dart';
import 'aula_12_http_consumo_api/listview_posts_widget.dart';
import 'exercicios_praticos/exercicio_05_telefones/categoria_telefones_page.dart';

void main() {
  runApp(
    MaterialApp(
      //home: ListaCarroWidget(),
      //home: CategoriaTelefonesWidget(),
      home: ListViewPostWidget(),
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
