import 'package:app_flutter_basic_widget_example/aula_07_listview_consumo_json_local/carro.dart';
import 'package:app_flutter_basic_widget_example/aula_07_listview_consumo_json_local/carro_api.dart';
import 'package:app_flutter_basic_widget_example/aula_07_listview_consumo_json_local/detalhe_carro.dart';
import 'package:flutter/material.dart';

class ListaCarroWidget extends StatefulWidget {
  @override
  _ListaCarroWidgetState createState() => _ListaCarroWidgetState();
}

class _ListaCarroWidgetState extends State<ListaCarroWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Lista Carro')),
      body: FutureBuilder(
        future: CarroApi.getCarrosJsonLocal(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            List<Carro> carros = snapshot.data.cast<Carro>();

            if (carros.length == 0) {
              return Center(child: Text("Lista Vazia"));
            }

            return _buildListViewCarro(carros);
          } else if (snapshot.hasError) {
            return _buildErroDados();
          }

          return _buildProgressCircular();
        },
      ),
    );
  }

  Container _buildErroDados() {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.error,
            size: 80,
            color: Colors.red,
          ),
          Divider(
            color: Colors.transparent,
            height: 30,
          ),
          Text(
            'Erro ao ler os DADOS',
            style: TextStyle(
              fontSize: 25,
              color: Colors.red,
            ),
          ),
        ],
      ),
    );
  }

  ListView _buildListViewCarro(List<Carro> carros) {
    return ListView.builder(
      itemCount: carros.length,
      itemBuilder: (BuildContext context, int i) {
        return _listTile(carros[i]);
      },
    );
  }

  ListTile _listTile(Carro carro) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(carro.image),
      ),
      title: Text(carro.nome),
      subtitle: Text(carro.descricao),
      trailing: Text(
        'R\$ ${carro.preco}',
        style: TextStyle(
          fontStyle: FontStyle.italic,
        ),
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetalheCarro(carro: carro),
          ),
        );
      },
    );
  }

  Container _buildProgressCircular() {
    return Container(
      //color: Colors.red[200],
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            child: CircularProgressIndicator(),
            width: 80,
            height: 80,
          ),
          Divider(
            color: Colors.transparent,
            height: 40,
          ),
          Text(
            'Carregando',
            style: TextStyle(
              fontSize: 25,
            ),
          ),
        ],
      ),
    );
  }
}
