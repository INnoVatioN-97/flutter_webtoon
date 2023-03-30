import 'package:flutter/material.dart';
import 'package:flutter_webtoon/models/webtoon_model.dart';
import 'package:flutter_webtoon/services/api_service.dart';
import 'package:flutter_webtoon/widgets/webtoon_widget.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final Future<List<WebtoonModel>> webtoons = ApiService.getTodaysToons();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "TODAY'S WEBTOONS",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.green,
      ),
      body: FutureBuilder(
        future: webtoons,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            // return makeList(snapshot.data!);
            return Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                Expanded(
                  child: makeList(snapshot.data!),
                )
              ],
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  ListView makeList(List<WebtoonModel> data) {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      scrollDirection: Axis.horizontal,
      itemCount: data.length,
      itemBuilder: (context, index) {
        var webtoon = data[index];
        return Webtoon(
          webtoon: webtoon,
        );
      },
      separatorBuilder: (context, index) {
        return const SizedBox(
          width: 40,
        );
      },
    );
  }
}
