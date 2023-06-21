import 'dart:convert';

import 'package:http/http.dart' as http;

class KobisApi {
  final String apiKey;
  final String _site = 'http://www.kobis.or.kr/kobisopenapi/webservice/rest';
  KobisApi({required this.apiKey});

  Future<List<dynamic>> getDailyBoxOffice({required String targetDt}) async {
    var uri = '$_site/boxoffice/searchDailyBoxOfficeList.json';
    uri = '$uri?key=$apiKey';
    uri = '$uri&targetDt=$targetDt';

    var response = await http.get(Uri.parse(uri));
    if (response.statusCode == 200) {
      //정상 boxOfficeResult.dailyBoxOfficeList
      try {
        var movies = jsonDecode(response.body)['boxOfficeResult']
            ['dailyBoxOfficeList'] as List<dynamic>; //rank
        return movies;
      } catch (e) {
        return [];
      }
    } else {
      //에러
      return [];
    }
  }

  Future<dynamic> getMovieDetail({required String movieCd}) async {
    var uri = '$_site/movie/searchMovieInfo.json';
    uri = '$uri?key=$apiKey';
    uri = '$uri&movieCd=$movieCd';
    var response = await http.get(Uri.parse(uri));
    if (response.statusCode == 200) {
      var movie =
          jsonDecode(response.body)['movieInfoResult']['movieInfo'] as dynamic;
      return movie;
    } else {
      return [];
    }
  }
}
