import 'package:filmes/models/filme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class DetalhesFilme extends StatelessWidget {
  const DetalhesFilme({super.key});

  @override
  Widget build(BuildContext context) {
    Filme filme = ModalRoute.of(context)!.settings.arguments as Filme;

    return Scaffold(
      appBar: AppBar(
        title: Text("Detalhes - ${filme.titulo}"),
      ),
      body: Container(
        margin: const EdgeInsets.all(8),
        child: Column(
          children: [
            Center(
              child: Image.network(filme.urlImagem, height: 250),
            ),
            Container(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  filme.titulo,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                Text(filme.ano.toString(), style: estiloTextoDetalhes),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(filme.genero, style: estiloTextoDetalhes),
                Text(filme.faixaEtaria, style: estiloTextoDetalhes)
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(filme.duracao, style: estiloTextoDetalhes),
                RatingBar.builder(
                  initialRating: filme.nota,
                  minRating: 1,
                  ignoreGestures: true,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemSize: 20,
                  itemPadding: const EdgeInsets.symmetric(horizontal: 1.0),
                  itemBuilder: (context, _) => const Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (rating) {
                    print(rating);
                  },
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(top: 5),
              alignment: AlignmentDirectional.topStart,
              child: Text(
                filme.descricao,
                textAlign: TextAlign.left,
              ),
            ),
          ],
        ),
      ),
    );
  }

  static const estiloTextoDetalhes = TextStyle(color: Colors.black45);
}
