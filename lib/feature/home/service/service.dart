import 'package:dio/dio.dart';

import '../model/movie_model.dart';

abstract class IMovieApiService {
  IMovieApiService(this.dio);
  final Dio dio;

  Future<List<Movie>?> getNowPlayingMovie();
  Future<List<Movie>?> getMovieByGenre(int movieId);
}

class MovieApiService extends IMovieApiService {
  final String baseUrl = 'https://api.themoviedb.org/3';
  final String apiKey = 'api_key=8fb35b51dc13b26c485b59cb815dcee0';
  MovieApiService(Dio dio) : super(dio);

  @override
  Future<List<Movie>> getNowPlayingMovie() async {
    try {
      final url = '$baseUrl/movie/now_playing?$apiKey';
      final response = await dio.get(url);
      var movies = response.data['results'] as List;
      List<Movie> movieList = movies.map((m) => Movie.fromJson(m)).toList();
      return movieList;
    } catch (error, stacktrace) {
      throw Exception('Exception accoured: $error with stacktrace: $stacktrace');
    }
  }

  @override
  Future<List<Movie>?> getMovieByGenre(int movieId) async {
    try {
      final url = '$baseUrl/discover/movie?with_genres=$movieId&$apiKey';
      final response = await dio.get(url);
      var movies = response.data['results'] as List;
      List<Movie> movieList = movies.map((m) => Movie.fromJson(m)).toList();
      return movieList;
    } catch (error, stacktrace) {
      throw Exception('Exception accoured: $error with stacktrace: $stacktrace');
    }
  }
}
