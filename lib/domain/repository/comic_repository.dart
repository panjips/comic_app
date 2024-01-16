import 'package:comic_app/domain/entity/comic_entity.dart';

abstract class ComicRepository {
  Future<List<ComicEntity>> getHotListComic();
  Future<List<ComicEntity>> getUpdateListComic();
  Future<List<ComicEntity>> getWeeklyTrendingListComic();
}
