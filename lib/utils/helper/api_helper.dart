import 'dart:convert';
import 'package:http/http.dart'as http;
import 'package:movie_exam/screen/home/model/home_model.dart';

import '../../screen/home/model/movie_model.dart';

class APIHelper {
  Future<MovieModel?> movieApiCall() async {
    String apiLink = "https://www.omdbapi.com/?t=hero&apikey=7ef88ba4";
    var response = await http.get(Uri.parse(apiLink));
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      MovieModel homeModel = MovieModel.fromJson(json);
      return homeModel;
    }
    return null;
  }

  Future<MultiMovieModel?> multiMovieApiCall(String search) async {
    String apiLink = "https://www.omdbapi.com/?s=$search&apikey=7ef88ba4";
    var response = await http.get(Uri.parse(apiLink));
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      MultiMovieModel h1 = MultiMovieModel.mapToModel(json);
      return h1;
    }
    return null;
  }
}