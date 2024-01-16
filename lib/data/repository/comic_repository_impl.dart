import 'package:comic_app/data/datasource/remote/comic_remote_datasource.dart';
import 'package:comic_app/domain/entity/comic_entity.dart';
import 'package:comic_app/domain/repository/comic_repository.dart';

class ComicRepositoryImplementation extends ComicRepository {
  final ComicRemoteDatasource _comicRemoteDatasource;

  ComicRepositoryImplementation(
      {required ComicRemoteDatasource comicRemoteDatasource})
      : _comicRemoteDatasource = comicRemoteDatasource;

  @override
  Future<List<ComicEntity>> getHotListComic() async {
    final datas = await _comicRemoteDatasource.getHotListComic();

    final result = datas
        .map(
          (e) => ComicEntity(
            title: e.title,
            url: e.url,
            thumbnail: e.thumbnail,
            endpoint: e.endpoint,
            type: e.type,
            newChapter: e.newChapter,
          ),
        )
        .toList();

    return result;
  }

  @override
  Future<List<ComicEntity>> getUpdateListComic() async {
    final datas = await _comicRemoteDatasource.getUpdateListComic();

    final result = datas
        .map(
          (e) => ComicEntity(
            title: e.title,
            url: e.url,
            thumbnail: e.thumbnail,
            endpoint: e.endpoint,
            type: e.type,
            newChapter: e.newChapter,
          ),
        )
        .toList();

    return result;
  }

  @override
  Future<List<ComicEntity>> getWeeklyTrendingListComic() async {
    final datas = await _comicRemoteDatasource.getWeeklyTrendingListComic();
    
    final result = datas
        .map(
          (e) => ComicEntity(
            title: e.title,
            url: e.url,
            thumbnail: e.thumbnail,
            endpoint: e.endpoint,
            rating: e.rating
          ),
        )
        .toList();

    return result;
  }
}
