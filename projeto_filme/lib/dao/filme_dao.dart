
import 'package:projeto_filme/dao/filme_abstract_dao.dart';
import 'package:projeto_filme/database/connection_factory.dart';
import 'package:projeto_filme/model/filme.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sql.dart';

class FilmeDao extends FilmeAbstractDao {
  @override
  Future<int?> delete(int id) async {
    Database db = await ConnectionFactory.getConnection();
    return await db.delete('filme', where: "id = ?", whereArgs: [id]);
  }

  @override
  Future<List<Filme>?> findAll() async {
    Database db = await ConnectionFactory.getConnection();

    try {
      var maps = await db.query('filme');
      List<Filme> filmes = [];
      for (Map<String, dynamic> map in maps) {
        Filme f = Filme( map['imageUrl'],
        map['titulo'],
        map['genero'],
        map['faixaEtaria'],
        map['duracao'],
        map['nota'],
        map['ano'],
        map['descricao'],
        id: map['id']);
        filmes.add(f);
      }

      return filmes;
    } catch (e) {
      print(
          "Erro ao tentar buscar filmes de um filme no banco de dados: ${e}");
    } finally {
      db.close();
    }

    return null;
  }

  @override
  Future<List<Filme>> findByEmail(String email) {
    // TODO: implement findByEmail
    throw UnimplementedError();
  }

  @override
  Future<int?> save(Filme filme) async {
    Database db = await ConnectionFactory.getConnection();

    try {
      return await db.insert("filme", filme.toMap());
    } catch (e) {
      print("Erro ao tentar inserir um filme no banco de dados: ${e}");
    } finally {
      db.close();
    }

    return null;
  }

  @override
  Future<int?> update(Filme object) async {

    Database db = await ConnectionFactory.getConnection();
    Map<String, dynamic> values = object.toMap();

    //UPDATE contatos SET nome = ?, email = ? WHERE id = ?
    return await db.update('filme', values, where: "id = ?", whereArgs: [object.id]);
  }


}
