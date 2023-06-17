import 'package:flutter/material.dart';
import 'package:projeto_filme/dao/filme_dao.dart';
import 'package:projeto_filme/model/filme.dart';
import 'package:projeto_filme/utils/app_rotas.dart';
import 'package:projeto_filme/views/cadastrar_filme.dart';
import 'package:projeto_filme/components/card_filme.dart';

class ListarFilmes extends StatefulWidget {
  const ListarFilmes({Key? key}) : super(key: key);

  @override
  State<ListarFilmes> createState() => _ListarFilmesState();
}

class _ListarFilmesState extends State<ListarFilmes> {
  FilmeDao filmeDao = FilmeDao();

  void _carregarFilmes() {
    filmeDao.findAll().then((filmes) {
      setState(() {
        var filmesList = filmes;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Filmes"), actions: [
        IconButton(
          onPressed: () => showDialog(
            context: context,
            builder: (BuildContext contex) => AlertDialog(
              title: const Text("Equipe:"),
              content: const Text(
                  "Bruno Santos\nHenrique César\nHenrique de França\nRenato Barroso"),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(contex);
                  },
                  child: const Text("OK"),
                ),
              ],
            ),
          ),
          icon: const Icon(Icons.info),
        ),
      ]),
      body: FutureBuilder(
        future: Future.delayed(const Duration(seconds: 5), () {
          return filmeDao.findAll();
        }),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final List<Filme> filmes = snapshot.data as List<Filme>;
            if (filmes != null) {
              return ListView.builder(
                itemCount: filmes.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      createBottomModal(context, filmes[index]);
                    },
                    child: Dismissible(
                      background: Container(
                        color: Colors.red,
                        alignment: Alignment.centerRight,
                        child: Container(
                          margin: const EdgeInsets.only(right: 15),
                          child: const Icon(
                            Icons.delete,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      key: const ValueKey(1),
                      child: CardFilme(filmes[index]),
                      onDismissed: (direction) {
                        filmeDao.delete(filmes[index].id);
                      },
                    ),
                  );
                },
              );
            } else {
              return const Text("Erro: Dados Não Encontrador!");
            }
          } else {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text("Carregando..."),
                  CircularProgressIndicator()
                ],
              ),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CadastrarFilme()),
          ).then((result) {
            if (result != null && result == true) {
              _carregarFilmes();
            }
          });
        },
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }

  Widget _buildListItem(index, contatos) {
    return Container(
      child: Card(
        child: Column(
          children: [
            Text("Nome: ${contatos[index].id}"),
            Text("Email: ${contatos[index].descricao}")
          ],
        ),
      ),
    );
  }
}

createAlertDialog(context, mensagem) {
  return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
            content: Text(mensagem),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("Ok"),
              )
            ]);
      });
}

createBottomModal(context, Filme filme) {
  return showModalBottomSheet(
      context: context,
      builder: (context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextButton(
                onPressed: () {
                  navegarParaDetalhes(context, filme);
                },
                child: const Text("Exibir Dados")),
            TextButton(
                onPressed: () {
                  _alterarDadosFilme(filme, context);
                },
                child: const Text("Alterar"))
          ],
        );
      });
}



String formatDuration(int seconds) {
  int hours = seconds ~/ 3600;
  int minutes = (seconds % 3600) ~/ 60;

  String formattedDuration = '';

  if (hours > 0) {
    formattedDuration += '$hours h ';
  }

  if (minutes > 0) {
    formattedDuration += '$minutes min';
  }

  return formattedDuration.trim();
}

navegarParaDetalhes(context, Filme filme) {
  Navigator.of(context).pushNamed(
    AppRoutes.DETALHES_FILME,
    arguments: filme,
  );
}

void _alterarDadosFilme(Filme filme, context) {

  Navigator.of(context).pushNamed(
    AppRoutes.EDITAR_FILME,
    arguments: filme,
  );
}
