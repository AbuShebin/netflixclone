import 'package:netflixclone/core/strings.dart';
import 'package:netflixclone/domain/movie%20details/model/movie_details_response.dart';
import 'package:netflixclone/infrastructure/api_key.dart';

class ApiEndPoints {
  static const downloads = '$kBaseUrl/trending/all/day?api_key=$apikey';
  static const search = '$kBaseUrl/search/movie?api_key=$apikey';
  static const hotAndNewMovie = '$kBaseUrl/discover/movie?api_key=$apikey';
  static const hotAndNewTv = '$kBaseUrl/discover/tv?api_key=$apikey';
  static const movieDetails = '$kBaseUrl/movie/11?api_key=$apikey';
}
