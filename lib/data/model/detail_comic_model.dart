import 'package:comic_app/data/model/chapter_comic_model.dart';

class DetailComicModel {
  final String title;
  final String synopsis;
  final String rating;
  final String author;
  final String artist;
  final String rank;
  final String view;
  final List<String> genre;
  final String type;
  final String tag;
  final List<ChapterModel> chapterList;
  final List<ChapterModel>? relatedComic;

  DetailComicModel(
      {required this.title,
      required this.synopsis,
      required this.rating,
      required this.author,
      required this.artist,
      required this.rank,
      required this.view,
      required this.genre,
      required this.type,
      required this.tag,
      required this.chapterList,
      this.relatedComic});

  factory DetailComicModel.fromMap(Map<String, dynamic> data) {
    return DetailComicModel(
      synopsis: data['synopsis'] as String,
      title: (data['detailList'][1]['value'] as String)
          .substring(0, (data['detailList'][1]['value'].indexOf("/") - 5)),
      rating: data['detailList'][0]['value'] as String,
      rank: (data['detailList'][2]['value'] as String).substring(
          0, (data['detailList'][2]['value'] as String).indexOf(",")),
      view: (data['detailList'][2]['value'] as String).substring(
          (data['detailList'][2]['value'].indexOf("s ") + 1),
          data['detailList'][2]['value'].length),
      artist: data['detailList'][5]['value'] as String,
      author: data['detailList'][4]['value'] as String,
      genre: (data['detailList'][6]['value'] as String).split(", "),
      tag: data['detailList'][8]['value'] as String,
      type: data['detailList'][7]['value'] as String,
      chapterList: (data['chapterList'] as List)
          .map(
            (e) => ChapterModel(
              title: e['title'],
              url: e['url'],
              thumbnail: e['cover'],
              releaseDate: e['releaseDate'],
            ),
          )
          .toList(),
      relatedComic: data['related'] != null
          ? (data['related'] as List)
              .map((e) => ChapterModel(
                  title: e['title'], url: e['url'], thumbnail: e['cover']))
              .toList()
          : null,
    );
  }
}
