class WebtoonEpisodeModel {
  final String id, title, rating, date;

  WebtoonEpisodeModel(this.id, this.title, this.rating, this.date);

  WebtoonEpisodeModel.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        title = json["title"],
        rating = json["rating"],
        date = json["date"];
}
