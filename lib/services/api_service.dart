import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:toonbox/models/webtoon_detail_model.dart';
import 'package:toonbox/models/webtoon_episode_model.dart';
import 'package:toonbox/models/webtoon_models.dart';

class ApiService {
  static const String baseUrl =
      "https://webtoon-crawler.nomadcoders.workers.dev";
  static const String today = "today";

  static Future<List<WebtoonModels>> getTodaysToons() async {
    List<WebtoonModels> webtoonIstances = [];
    final url = Uri.parse('$baseUrl/$today');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final List<dynamic> webtoons = jsonDecode(response.body);
      for (var webtoon in webtoons) {
        webtoonIstances.add(WebtoonModels.fromJson(webtoon));
      }
      return webtoonIstances;
    }
    throw Error();
  }

  static Future<WebtoonDetailModel> getToonById(String id) async {
    final url = Uri.parse("$baseUrl/$id");
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final webtoon = jsonDecode(response.body);
      return WebtoonDetailModel.fromJson(webtoon);
    }
    throw Error();
  }

  static Future<List<WebtoonEpisodeModel>> getLatestEpisodeById(
      String id) async {
    List<WebtoonEpisodeModel> episodeinstances = [];
    final url = Uri.parse("$baseUrl/$id/episodes");
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final episodes = jsonDecode(response.body);
      for (var episode in episodes) {
        episodeinstances.add(WebtoonEpisodeModel.fromJson(episode));
      }
      return episodeinstances;
    }
    throw Error();
  }
}
