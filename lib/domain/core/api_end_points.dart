import 'package:netflixclone/core/strings.dart';
import 'package:netflixclone/infrastructure/api_key.dart';

class ApiEndPoints {
  static const downloads = '$kBaseUrl/trending/all/day?api_key=$apikey';
  static const search = '$kBaseUrl/search/movie?api_key=$apikey';
}
