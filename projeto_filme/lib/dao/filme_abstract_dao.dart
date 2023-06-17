import 'package:projeto_filme/dao/generic_abstract_dao.dart';
import 'package:projeto_filme/model/filme.dart';

abstract class FilmeAbstractDao extends GenericAbstractDao<Filme> {
  Future<List<Filme>> findByEmail(String email);
}
