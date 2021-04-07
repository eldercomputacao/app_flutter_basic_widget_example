import 'package:app_flutter_basic_widget_example/aula_06_listView/exemplos_listview_widget.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: ExemplosListWidget(),
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
