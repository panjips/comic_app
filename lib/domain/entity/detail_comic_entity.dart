import 'package:comic_app/domain/entity/chapter_comic_entity.dart';

class DetailComicEntity {
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
  final List<ChapterEntity> chapterList;
  final List<ChapterEntity>? relatedComic;

  DetailComicEntity({
    required this.title,
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
    this.relatedComic,
  });
}
