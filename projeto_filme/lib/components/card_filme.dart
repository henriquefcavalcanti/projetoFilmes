import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:projeto_filme/model/filme.dart';

class CardFilme extends StatelessWidget {
  const CardFilme(this.filme, {super.key});
  final Filme filme;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      child: Container(
        margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(filme.urlImagem, height: 150),
            Container(
              margin: const EdgeInsets.only(left: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    filme.titulo,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  Text(filme.genero),
                  Text(formatDuration(filme.duracao * 60)),
                  RatingBar.builder(
                    initialRating: filme.nota,
                    minRating: 1,
                    ignoreGestures: true,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemSize: 30,
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
            )
          ],
        ),
      ),
    );
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
}
