import 'dart:developer';

import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:kartal/kartal.dart';

import '../../../core/constants/constants.dart';
import '../../../product/widgets/custom_appbar.dart';
import '../model/movie_model.dart';
import '../viewModel/home_view_model.dart';

class MovieHomeView extends StatefulWidget {
  const MovieHomeView({Key? key}) : super(key: key);
  @override
  State<MovieHomeView> createState() => _MovieHomeViewState();
}

class _MovieHomeViewState extends HomeViewModel {
  @override
  Widget build(BuildContext context) {
    List<Movie> displayList = List.from(movies);
    inspect(movies.isNullOrEmpty);
    inspect(genreMovies.isNullOrEmpty);
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(35),
          child: BottomNavyBar(
            containerHeight: 45,
            backgroundColor: Constants.appBaColor,
            items: [
              BottomNavyBarItem(
                icon: Image.asset('assets/images/png/Home.png'),
                title: const Text('Home'),
              ),
              BottomNavyBarItem(
                icon: Image.asset('assets/images/png/Bookmark.png'),
                title: const Text(''),
              ),
              BottomNavyBarItem(
                icon: Image.asset('assets/images/png/Activity.png'),
                title: const Text('Messages'),
              ),
              BottomNavyBarItem(
                icon: Image.asset('assets/images/png/Time Circle.png'),
                title: const Text('Settings'),
              ),
            ],
            onItemSelected: (value) {},
          ),
        ),
      ),
      backgroundColor: Constants.bgColor,
      appBar: CustomAppBar(
        title: 'video',
        leading: IconButton(
            padding: EdgeInsets.zero,
            splashColor: Colors.transparent,
            hoverColor: Colors.transparent,
            onPressed: () {},
            icon: Image.asset('assets/images/png/Document.png')),
        actions: [
          IconButton(
            splashColor: Colors.transparent,
            hoverColor: Colors.transparent,
            onPressed: () {},
            icon: const CircleAvatar(
              backgroundColor: Colors.red,
            ),
          ),
        ],
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Hello,\nWhat will you Watch?',
                style: Theme.of(context).textTheme.bodyText2?.copyWith(
                      color: Constants.whiteColor,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      fontFamily: Constants.fontFamily,
                    ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: Constants.bgColor,
              ),
              height: 41,
              width: 388,
              child: TextField(
                style: TextStyle(color: Constants.whiteColor),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Search Movie, Series, Documentry',
                  hintStyle: Theme.of(context).textTheme.bodyText2?.copyWith(
                        color: Constants.whiteColor.withOpacity(.5),
                        fontSize: 15,
                        fontFamily: Constants.fontFamily,
                      ),
                  prefixIcon: Image.asset('assets/images/png/Search.png'),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: displayList.length,
              itemBuilder: (context, index) => ListTile(
                title: Text(displayList[index].title ?? ''),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 17.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 15.0,
                ),
                child: Row(
                  children: [
                    Text(
                      'Amazon Orginal',
                      style: Theme.of(context).textTheme.bodyText2!.copyWith(
                          color: Constants.whiteColor,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontFamily: Constants.fontFamily),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Image.asset('assets/images/png/Shield Done.png'),
                  ],
                ),
              ),
              Column(
                children: [
                  SizedBox(
                    height: context.dynamicHeight(.500),
                    child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          const url = "https://flxt.tmsimg.com/assets/p11682476_b_v13_ae.jpg";

                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                child: CachedNetworkImage(
                                  imageUrl: "https://image.tmdb.org/t/p/w300/${movies[index].backdropPath ?? url}",
                                  imageBuilder: (context, imageProvider) => Container(
                                    height: 210,
                                    width: 147,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      image: DecorationImage(
                                        image: imageProvider,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  placeholder: (context, url) => const SizedBox(
                                    height: 210,
                                    width: 147,
                                    child: Center(
                                      child: CircularProgressIndicator(),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 11,
                              ),
                              SizedBox(
                                width: 180,
                                child: Text(
                                  movies[index].title ?? "No Title",
                                  style: Theme.of(context).textTheme.headline6?.copyWith(
                                        fontSize: 14,
                                        color: Constants.whiteColor,
                                        fontFamily: Constants.fontFamily,
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 2,
                                      ),
                                ),
                              ),
                              const Padding(padding: EdgeInsets.symmetric(vertical: 6)),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  RatingBar.builder(
                                    itemSize: 15,
                                    ignoreGestures: true,
                                    initialRating: (double.parse(movies[index].voteAverage.toString()) / 2),
                                    minRating: 1,
                                    maxRating: 5,
                                    direction: Axis.horizontal,
                                    allowHalfRating: true,
                                    itemCount: 5,
                                    itemBuilder: (context, _) => Row(
                                      children: [
                                        Image.asset('assets/images/png/Star.png', color: Constants.starColor),
                                      ],
                                    ),
                                    itemPadding: const EdgeInsets.symmetric(horizontal: 2.0),
                                    onRatingUpdate: (rating) {
                                      print(rating);
                                    },
                                  ),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  Image.asset('assets/images/png/Prime.png'),
                                ],
                              )
                            ],
                          );
                        },
                        separatorBuilder: (context, index) => const VerticalDivider(
                              color: Colors.transparent,
                              width: 5,
                            ),
                        itemCount: movies.length),
                  ),
                  Row(
                    children: [
                      Text(
                        'For You',
                        style: Theme.of(context).textTheme.bodyText2!.copyWith(
                            color: Constants.whiteColor,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            fontFamily: Constants.fontFamily),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Image.asset('assets/images/png/Heart.png'),
                    ],
                  ),
                  const SizedBox(
                    height: 11,
                  ),
                  SizedBox(
                    height: context.dynamicHeight(.4),
                    child: _movieList2(),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  ListView _movieList2() {
    return ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          const url = "https://flxt.tmsimg.com/assets/p11682476_b_v13_ae.jpg";

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                child: CachedNetworkImage(
                  imageUrl: "https://image.tmdb.org/t/p/w300/${genreMovies[index].backdropPath ?? url}",
                  imageBuilder: (context, imageProvider) => Container(
                    height: 210,
                    width: 147,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  placeholder: (context, url) => const SizedBox(
                    height: 210,
                    width: 147,
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 11,
              ),
              SizedBox(
                width: 180,
                child: Text(
                  genreMovies[index].title ?? "No Title",
                  style: Theme.of(context).textTheme.headline6?.copyWith(
                        fontSize: 14,
                        color: Constants.whiteColor,
                        fontFamily: Constants.fontFamily,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2,
                      ),
                ),
              ),
              const Padding(padding: EdgeInsets.symmetric(vertical: 6)),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  RatingBar.builder(
                    itemSize: 15,
                    ignoreGestures: true,
                    initialRating: (double.parse(genreMovies[index].voteAverage.toString()) / 2),
                    minRating: 1,
                    maxRating: 5,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemBuilder: (context, _) => Row(
                      children: [
                        Image.asset('assets/images/png/Star.png', color: Constants.starColor),
                      ],
                    ),
                    itemPadding: const EdgeInsets.symmetric(horizontal: 2.0),
                    onRatingUpdate: (rating) {
                      print(rating);
                    },
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Image.asset('assets/images/png/Univorsal.png'),
                ],
              )
            ],
          );
        },
        separatorBuilder: (context, index) => const VerticalDivider(
              color: Colors.transparent,
              width: 5,
            ),
        itemCount: genreMovies.length);
  }
}
