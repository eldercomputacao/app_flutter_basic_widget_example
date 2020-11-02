import 'package:app_flutter_basic_widget_example/aula_14_sqflite/database_helper.dart';
import 'package:app_flutter_basic_widget_example/aula_14_sqflite/produto.dart';
import 'package:sqflite/sqflite.dart';

class ProdutoDAO {
  Future<int> insertProduto(Produto produto) async {
    Database database = await DatabaseHelper().getDatabase();
    return database.insert("produtos", produto.toJson());
  }

  Future<int> rawInsertProduto(Produto produto) async {
    Database database = await DatabaseHelper().getDatabase();
    String sql = '''
      INSERT INTO produtos (marca, nome, preco, quantidade) 
      VALUES (?, ?, ?, ?)
    ''';
    return database.rawInsert(sql, [
      produto.marca,
      produto.nome,
      produto.preco,
      produto.quantidade,
    ]);
  }

  Future<List<Produto>> queryListaProdutos() async {
    Database database = await DatabaseHelper().getDatabase();
    List<Map<String, dynamic>> list = await database.query("produtos");
    return list.map((e) => Produto.fromJson(e)).toList();
  }

  Future<List<Produto>> rawQueryListaProdutos() async {
    Database database = await DatabaseHelper().getDatabase();
    String sql = 'SELECT * FROM produtos';
    List<Map<String, dynamic>> list = await database.rawQuery(sql);
    return list.map((e) => Produto.fromJson(e)).toList();
  }

  Future<Produto> queryProdutoId(int id) async {
    final database = await DatabaseHelper().getDatabase();
    final list =
        await database.query('produtos', where: 'id = ?', whereArgs: [id]);

    if (list.length > 0) {
      return Produto.fromJson(list.elementAt(0));
    }

    return null;
  }

  Future<Produto> rawQueryProdutoId(int id) async {
    final database = await DatabaseHelper().getDatabase();
    final sql = 'SELECT * FROM produtos WHERE id = ?';
    final list = await database.rawQuery(sql, [id]);

    if (list.length > 0) {
      return Produto.fromJson(list.elementAt(0));
    }

    return null;
  }

  Future<bool> existeProduto(int id) async {
    Produto produto = await queryProdutoId(id);
    return (produto != null);
  }

  Future<int> quantidadeProdutos() async {
    final database = await DatabaseHelper().getDatabase();
    final resultSet = await database.rawQuery('SELECT COUNT(*) FROM produtos');
    print('runtimeType: ${resultSet.runtimeType}');
    return Sqflite.firstIntValue(resultSet);
  }

  Future<int> deleteProduto(int id) async {
    final database = await DatabaseHelper().getDatabase();
    return await database.delete('produtos', where: 'id = ?', whereArgs: [id]);
  }

  Future<int> rawDeleteProduto(int id) async {
    final database = await DatabaseHelper().getDatabase();
    String sql = 'DELETE FROM produtos WHERE id = ?';
    return await database.rawDelete(sql, [id]);
  }

  Future<int> deleteAllProdutos() async {
    final database = await DatabaseHelper().getDatabase();
    return await database.delete('produtos');
  }

  Future<int> rawDeleteAllProdutos() async {
    final database = await DatabaseHelper().getDatabase();
    return await database.rawDelete('DELETE FROM produtos');
  }

  Future<int> updateProduto(Produto produto) async {
    final database = await DatabaseHelper().getDatabase();
    return await database.update(
      'produtos',
      produto.toJson(),
      where: 'id = ?',
      whereArgs: [produto.id],
    );
  }

  Future<int> rawUpdateProduto(Produto produto) async {
    final database = await DatabaseHelper().getDatabase();
    String sql = '''UPDATE produtos 
           SET 
           marca = ?, 
           nome = ?, 
           preco = ?, 
           quantidade = ? WHERE id = ?''';
    return await database.rawUpdate(sql, [
      produto.marca,
      produto.nome,
      produto.preco,
      produto.quantidade,
      produto.id,
    ]);
  }
}
