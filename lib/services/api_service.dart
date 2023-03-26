import 'dart:convert';

import 'package:flutter_webtoon/models/webtoon_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl = "https://webtoon-crawler.nomadcoders.workers.dev";

  final String today = "today";

Future<List<WebtoonModel>> getTodaysToons() async {
    List<WebtoonModel> webtoonInstances = [];
    final url = Uri.parse('$baseUrl/$today');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List<dynamic> result = jsonDecode(response.body);

      for (var webtoon in result) {
        final toon = WebtoonModel.fromJson(webtoon);

        webtoonInstances.add(toon)
      }
      return webtoonInstances;
    }
    throw Error();
  }
}
