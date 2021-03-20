import 'package:flutter/material.dart';

import 'aula_04_tipos_de_navegacao/rotas_nomeadas/home.dart';
import 'aula_04_tipos_de_navegacao/rotas_nomeadas/page_a.dart';
import 'aula_04_tipos_de_navegacao/rotas_nomeadas/page_b.dart';
import 'aula_04_tipos_de_navegacao/rotas_nomeadas/page_c.dart';
import 'aula_04_tipos_de_navegacao/rotas_nomeadas/page_d.dart';

void main() {
  runApp(
    MaterialApp(
      initialRoute: "/rotas_nomeadas/home",
      routes: {
        "/rotas_nomeadas/home": (BuildContext context) => Home(),
        "page_a": (BuildContext context) => PageA(),
        "/rotas_nomeadas/page_b": (BuildContext context) => PageB(),
        "/rotas_nomeadas/page_c": (BuildContext context) => PageC(),
        "/rotas_nomeadas/page_d": (BuildContext context) => PageD(),
      },
    ),
  );
}

// home: BlocProvider(
//   blocs: [
//     Bloc((i) => IncrementBloc()),
//   ],
//   child: IntrementWidget(),
// ),
