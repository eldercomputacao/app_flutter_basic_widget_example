import 'package:app_flutter_basic_widget_example/aula_14_sqflite/database_helper.dart';
import 'package:app_flutter_basic_widget_example/aula_14_sqflite/produto.dart';
import 'package:app_flutter_basic_widget_example/aula_14_sqflite/produto_dao.dart';
import 'package:flutter/material.dart';

class TesteDatabasePage extends StatelessWidget {
  _testeCriacaoDatabase() async {
    await DatabaseHelper().getDatabase();
  }

  _testeInsertProduto() async {
    Produto produto = Produto(
      nome: 'Produto 1',
      marca: 'Marca 1',
      preco: 1.1,
      quantidade: 1,
    );
    int valorId = await ProdutoDAO().insertProduto(produto);
    print('ValorId: $valorId');
  }

  _testeRawInsertProduto() async {
    Produto produto = Produto(
      nome: 'Produto raw',
      marca: 'Marca raw',
      preco: 100.1,
      quantidade: 100,
    );
    int valorId = await ProdutoDAO().rawInsertProduto(produto);
    print('ValorId: $valorId');
  }

  _testeInsertProdutos() {
    List<Produto> list = [
      Produto(
        nome: 'Produto 1',
        marca: 'Marca 1',
        preco: 1.1,
        quantidade: 1,
      ),
      Produto(
        nome: 'Produto 2',
        marca: 'Marca 2',
        preco: 2.1,
        quantidade: 2,
      ),
      Produto(
        nome: 'Produto 3',
        marca: 'Marca 3',
        preco: 3.1,
        quantidade: 3,
      ),
      Produto(
        nome: 'Produto 4',
        marca: 'Marca 4',
        preco: 4.1,
        quantidade: 4,
      ),
    ];

    list.forEach((e) async {
      await ProdutoDAO().insertProduto(e);
    });
  }

  _testeQueryListProdutos() async {
    List<Produto> list = await ProdutoDAO().queryListaProdutos();
    list.forEach((e) {
      print(e);
    });
  }

  _testeRawQueryListProdutos() async {
    List<Produto> list = await ProdutoDAO().queryListaProdutos();
    list.forEach((e) {
      print(e);
    });
  }

  _testeQueryProdutosId() async {
    Produto p1 = await ProdutoDAO().queryProdutoId(16);
    Produto p2 = await ProdutoDAO().rawQueryProdutoId(18);
    print('Query Id: $p1');
    print('Query Id: $p2');
  }

  _testeProdutoExisteProdutoQuantidade() async {
    int quantidade = await ProdutoDAO().quantidadeProdutos();
    print('Quantidade de Produtos: $quantidade');
    bool existe = await ProdutoDAO().existeProduto(35);
    print(existe ? 'Produto Existe' : 'Produto não existe');
  }

  _testeDeleteProduto() async {
    int valor1 = await ProdutoDAO().deleteProduto(12);
    int valor2 = await ProdutoDAO().rawDeleteProduto(13);
    print(valor1);
    print(valor2);
  }

  _testeDeleteAllProdutos() async {
    int quantidade = await ProdutoDAO().deleteAllProdutos();
    print('Quantidade deletada: $quantidade');
  }

  _testeUpdateProdutos() async {
    Produto produto = Produto(
      id: 30,
      nome: 'Produto update',
      marca: 'Marca update',
      preco: 122.1,
      quantidade: 122,
    );
    int valor1 = await ProdutoDAO().updateProduto(produto);
    print('ValorId: $valor1');

    Produto produto2 = Produto(
      id: 31,
      nome: 'Produto update 31',
      marca: 'Marca update 31',
      preco: 133.1,
      quantidade: 133,
    );
    int valor2 = await ProdutoDAO().rawUpdateProduto(produto2);
    print('ValorId: $valor2');
  }

  @override
  Widget build(BuildContext context) {
    //_testeCriacaoDatabase();

    //_testeInsertProduto();

    //_testeInsertProdutos();

    //_testeRawInsertProduto();

    //_testeQueryListProdutos();

    //_testeRawQueryListProdutos();

    //_testeQueryProdutosId();

    //_testeProdutoExisteProdutoQuantidade();

    //_testeDeleteProduto();

    //_testeUpdateProdutos();

    _testeQueryListProdutos();

    //_testeDeleteAllProdutos();

    return Scaffold(
      appBar: AppBar(title: Text('Teste Database')),
      body: Container(),
    );
  }
}
