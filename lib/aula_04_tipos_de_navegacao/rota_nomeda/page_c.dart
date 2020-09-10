import 'package:flutter/material.dart';

class PageC extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page C'),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Page C'),
            RaisedButton(
              child: Text('Ir para Page D'),
              onPressed: () {
                String nome = 'Maria';
                Navigator.pushNamed(context, '/rotas_nomeadas/page_d',
                    arguments: nome);
              },
            )
          ],
        ),
      ),
    );
  }
}
