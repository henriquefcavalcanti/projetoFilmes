import 'dart:convert';

import 'package:projeto_filme/model/filme.dart';
import 'package:http/http.dart' as http;

class ApiFilmes {
  static String url = "http://10.0.2.2:8080/filmes";
  static final Map<String, String> _headers = {
    "Content-Type": "application/json"
  };

  static Future<List<Filme>?> findAll() async {
    try {
      var response = await http.get(Uri.parse(url), headers: _headers);
      List<Filme>? filmes = [];
      if (response.statusCode == 200) {
        List<dynamic> jDecode = jsonDecode(response.body);
        for (Map<String, dynamic> map in jDecode) {
          filmes.add(Filme.fromJson(map));
        }
      }
      return filmes;
    } catch (e) {
      return null;
    }
  }

  
}
