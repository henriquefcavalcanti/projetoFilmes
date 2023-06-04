import 'package:filmes/components/card_filme.dart';
import 'package:filmes/models/filme.dart';
import 'package:filmes/utils/app_rotas.dart';
import 'package:flutter/material.dart';

class ListaFilmes extends StatelessWidget {
  const ListaFilmes({super.key});

  @override
  Widget build(BuildContext context) {
    List<Filme> filmes = [
      Filme(
          "https://br.web.img2.acsta.net/r_1280_720/pictures/17/03/27/09/49/121118.jpg",
          "Velozes e Furiosos 8",
          "Ação, Aventura",
          "14",
          "2h 37min",
          3,
          2015,
          "TESTE",
          id: 1),
      Filme(
          "https://vertentesdocinema.com/wp-content/uploads/2023/04/8ogqcop6bxwvekhzbqczvd77y6l.jpg",
          "Air: A HISTÓRIA POR TRÁS ...",
          "Drama",
          "12",
          "1h 52min",
          4,
          2023,
          "TESTE",
          id: 2),
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text("Filmes"),
        actions: [
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
        ],
      ),
      body: Container(
        child: ListView.builder(
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
                  print("teste");
                },
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed(
            AppRoutes.CADASTRAR_FILME,
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  createBottomModal(context, Filme filme) {
    return showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextButton(
                onPressed: () {
                  navegarParaDetalhes(context, filme);
                },
                child: const Text("Exibir Dados"),
              ),
              TextButton(
                onPressed: () {},
                child: const Text("Alterar"),
              ),
            ],
          ),
        );
      },
    );
  }

  navegarParaDetalhes(context, Filme filme) {
    Navigator.of(context).pushNamed(
      AppRoutes.DETALHES_FILME,
      arguments: filme,
    );
  }
}

// onTap: () {
//         Navigator.of(context).pushNamed(
//           AppRoutes.DETALHES_FILME,
//         );