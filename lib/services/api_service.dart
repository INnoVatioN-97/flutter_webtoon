import 'dart:convert';

import 'package:flutter_webtoon/models/webtoon_episode_model.dart';
import 'package:flutter_webtoon/models/webtoon_model.dart';
import 'package:http/http.dart' as http;

import '../models/webtoon_detail_model.dart';

class ApiService {
  static const String baseUrl =
      "https://webtoon-crawler.nomadcoders.workers.dev";

  static const String today = "today";

  static Future<List<WebtoonModel>> getTodaysToons() async {
    List<WebtoonModel> webtoonInstances = [];
    final url = Uri.parse('$baseUrl/$today');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List<dynamic> result = jsonDecode(response.body);

      for (var webtoon in result) {
        webtoonInstances.add(WebtoonModel.fromJson(webtoon));
      }
      return webtoonInstances;
    }
    throw Error();
  }

  static Future<WebtoonDetailModel> getToonById(String id) async {
    final url = Uri.parse('$baseUrl/$id');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final dynamic result = jsonDecode(response.body);
      return WebtoonDetailModel.fromJson(result);
    }
    throw Error();
  }

  static Future<List<WebtoonEpisodeModel>> getLatestEpisodesById(
      String id) async {
    List<WebtoonEpisodeModel> episodes = [];
    final url = Uri.parse('$baseUrl/$id/episodes');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List<dynamic> result = jsonDecode(response.body);

      for (var episode in result) {
        episodes.add(WebtoonEpisodeModel.fromJson(episode));
      }
      return episodes;
    }
    throw Error();
  }
}
