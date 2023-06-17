import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class ConnectionFactory {
  static Future<Database> getConnection() async {
    String dbPath = await getDatabasesPath();

    ///data/data/pacote.do.aplicativo/databases/
    String path = join(dbPath, "filme.db");

    ///data/data/pacote.do.aplicativo/databases/filmes.db
    Database db = await openDatabase(path, onCreate: (db, version) {
      String query = "CREATE TABLE filme ("
          "id INTEGER PRIMARY KEY AUTOINCREMENT,"
          "imageUrl TEXT,"
          "titulo TEXT,"
          "genero TEXT,"
          "faixaEtaria TEXT,"
          "duracao INTEGER,"
          "nota REAL,"
          "descricao TEXT,"
          "ano INTEGER"
          ")";

      db.execute(query);
    }, version: 1);

    return db;
  }
}
