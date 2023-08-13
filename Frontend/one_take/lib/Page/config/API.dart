import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/MoviesModel.dart';

class MovieAPI {
  Future<List<Movie>> getData() async {
    final response = await http.get(Uri.parse('https://movieonetake.000webhostapp.com/movie/json'));

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(response.body)["data"];
      return jsonData.map((movieJson) => Movie.fromJson(movieJson)).toList();
    } else {
      throw Exception('Failed to load data');
    }
  }
}