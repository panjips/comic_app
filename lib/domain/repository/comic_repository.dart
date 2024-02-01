import 'package:comic_app/domain/entity/comic_entity.dart';
import 'package:comic_app/domain/entity/detail_comic_entity.dart';

abstract class ComicRepository {
  Future<Map<dynamic, List<ComicEntity>>> getListComic();
  Future<List<ComicEntity>> getProjectsComic(String page);
  Future<List<ComicEntity>> getMirrorComic(String page);
  Future<DetailComicEntity> getDetailComic(String url);
}
