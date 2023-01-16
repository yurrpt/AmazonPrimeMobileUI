import 'package:flutter/cupertino.dart';

import '../../../product/service/dio_mngr.dart';
import '../model/movie_model.dart';
import '../service/service.dart';
import '../view/home_view.dart';

abstract class HomeViewModel extends LoadingStatefull<MovieHomeView> with DioManagerMixin {
  late final IMovieApiService _movieApiService;

  late List<Movie> movies = [];
  late List<Movie> genreMovies = [];
  @override
  void initState() {
    _movieApiService = MovieApiService(service);
    super.initState();
    _fetch();
  }

  Future<void> _fetch() async {
    changeLoading();
    movies = await _movieApiService.getNowPlayingMovie() ?? [];
    genreMovies = await _movieApiService.getMovieByGenre(35) ?? [];
    changeLoading();
  }
}

abstract class LoadingStatefull<T extends StatefulWidget> extends State<T> {
  bool isLoading = false;

  void changeLoading() {
    setState(() {
      isLoading = !isLoading;
    });
  }
}
