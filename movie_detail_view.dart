import 'package:flutter/material.dart';

class MovieDetailView extends StatelessWidget {
  Map<String, dynamic> movie;
  MovieDetailView({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    print(movie);
    return Column(
      //범죄도시(2023)
      children: [Text('${movie['movieNm']}(${movie['prdtYear']})')],
    );
  }
}
