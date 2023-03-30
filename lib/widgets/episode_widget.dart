import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../models/webtoon_episode_model.dart';

class Episode extends StatelessWidget {
  const Episode({super.key, required this.episode, required this.toonId});

  final WebtoonEpisodeModel episode;
  final toonId;

  onButtonTap(toonId, episodeId) async {
    await launchUrlString(
        "https://comic.naver.com/webtoon/detail?titleId=$toonId&no=$episodeId");
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onButtonTap(toonId, episode.id),
      child: Container(
        margin: const EdgeInsets.only(bottom: 20),
        decoration: BoxDecoration(
            color: Colors.green.shade400,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                  blurRadius: 7,
                  offset: const Offset(10, 5),
                  color: Colors.black.withOpacity(0.5))
            ]),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 20,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                episode.title,
                style: const TextStyle(color: Colors.white, fontSize: 16),
              ),
              const Icon(
                Icons.chevron_right_rounded,
                color: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
