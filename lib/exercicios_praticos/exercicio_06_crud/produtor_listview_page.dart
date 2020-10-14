import 'package:app_flutter_basic_widget_example/exercicios_praticos/exercicio_06_crud/produto.dart';
import 'package:app_flutter_basic_widget_example/exercicios_praticos/exercicio_06_crud/produto_page.dart';
import 'package:flutter/material.dart';

class ProdutoListViewPage extends StatefulWidget {
  @override
  _ProdutoListViewPageState createState() => _ProdutoListViewPageState();
}

class _ProdutoListViewPageState extends State<ProdutoListViewPage> {
  final _keyScaffold = GlobalKey<ScaffoldState>();
  List<Produto> _produtos = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _keyScaffold,
      appBar: AppBar(
        title: Text('Lista de Produtos'),
        centerTitle: true,
      ),
      body: _listView(),
      floatingActionButton: _floatingActionButton(),
    );
  }

  FloatingActionButton _floatingActionButton() {
    return FloatingActionButton(
      child: Icon(Icons.add),
      onPressed: () {
        _savandoProduto();
      },
    );
  }

  _savandoProduto() async {
    Produto produtoResultado = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) {
        return ProdutoPage();
      }),
    );

    if (produtoResultado != null) {
      setState(() {
        _produtos.add(produtoResultado);
      });
      _showSnackBar(Icons.save, 'Produdo salvo com sucesso!');
    }
  }

  _editandoProduto(int i) async {
    Produto produtoResultado = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) {
        return ProdutoPage(produto: _produtos[i]);
      }),
    );

    if (produtoResultado != null) {
      setState(() {
        _produtos[i] = produtoResultado;
      });
      _showSnackBar(Icons.edit, 'Produdo alterado com sucesso!');
    }
  }

  _deletandoProduto(int i) {
    setState(() {
      _produtos.removeAt(i);
    });

    _showSnackBar(Icons.delete, "Produto deletado!");
  }

  Widget _listView() {
    return _produtos.length <= 0
        ? Container(
            child: Center(
              child: Text('Lista Vazia'),
            ),
          )
        : ListView.builder(
            itemCount: _produtos.length,
            itemBuilder: (BuildContext context, int i) {
              return ListTile(
                title: Text('${_produtos[i].nome}'),
                subtitle: Text('${_produtos[i].marca}'),
                trailing: Text('Preço: ${_produtos[i].preco}'),
                onTap: () => _showDialogConfirmeEdicao(context, i),
                onLongPress: () => _showDialogConfirmeDelete(context, i),
              );
            },
          );
  }

  _showSnackBar(IconData icon, String ms) {
    _keyScaffold.currentState.showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Icon(icon),
            SizedBox(width: 10),
            Text(ms),
          ],
        ),
        backgroundColor: Icons.delete != icon ? Colors.green : Colors.red,
        duration: Duration(seconds: 10),
      ),
    );
  }

  _showDialogConfirmeEdicao(BuildContext context, int i) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Editar'),
          content: Text('Deseja alterar o produto, ${_produtos[i].nome} ?'),
          actions: [
            FlatButton(
              child: Text('Confirmar'),
              onPressed: () {
                Navigator.pop(context);
                _editandoProduto(i);
              },
            ),
            FlatButton(
              child: Text('Cancelar'),
              onPressed: () {
                Navigator.pop(context);
              },
            )
          ],
        );
      },
    );
  }

  _showDialogConfirmeDelete(BuildContext context, int i) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Deletar'),
          content: Text('Deseja deletar o produto, ${_produtos[i].nome} ?'),
          actions: [
            FlatButton(
              child: Text('Confirmar'),
              onPressed: () {
                Navigator.pop(context);
                _deletandoProduto(i);
              },
            ),
            FlatButton(
              child: Text('Cancelar'),
              onPressed: () {
                Navigator.pop(context);
              },
            )
          ],
        );
      },
    );
  }
}
