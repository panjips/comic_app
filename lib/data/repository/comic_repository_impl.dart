import 'package:comic_app/data/datasource/remote/comic_remote_datasource.dart';
import 'package:comic_app/domain/entity/chapter_comic_entity.dart';
import 'package:comic_app/domain/entity/comic_entity.dart';
import 'package:comic_app/domain/entity/detail_comic_entity.dart';
import 'package:comic_app/domain/repository/comic_repository.dart';

class ComicRepositoryImplementation extends ComicRepository {
  final ComicRemoteDatasource _comicRemoteDatasource;

  ComicRepositoryImplementation(
      {required ComicRemoteDatasource comicRemoteDatasource})
      : _comicRemoteDatasource = comicRemoteDatasource;

  @override
  Future<Map<dynamic, List<ComicEntity>>> getListComic() async {
    final datas = await _comicRemoteDatasource.getListComic();

    final hotList = datas['hotList']
        ?.map(
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
    final updateList = datas['updateList']
        ?.map(
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
    final weeklyList = datas['weeklyList']
        ?.map(
          (e) => ComicEntity(
            title: e.title,
            url: e.url,
            thumbnail: e.thumbnail,
            endpoint: e.endpoint,
            newChapter: e.newChapter,
            rating: e.rating,
          ),
        )
        .toList();

    return {
      'hotList': hotList,
      'updateList': updateList,
      'weeklyList': weeklyList
    }.cast<dynamic, List<ComicEntity>>();
  }

  @override
  Future<List<ComicEntity>> getProjectsComic(String page) async {
    final result = await _comicRemoteDatasource.getProjectsComic(page);

    final datas = result
        .map(
          (e) => ComicEntity(
            title: e.title,
            url: e.url,
            thumbnail: e.thumbnail,
            endpoint: e.endpoint,
            newChapter: e.newChapter,
            rating: e.rating,
          ),
        )
        .toList();

    return datas;
  }

  @override
  Future<List<ComicEntity>> getMirrorComic(String page) async {
    final result = await _comicRemoteDatasource.getMirrorComic(page);

    final datas = result
        .map(
          (e) => ComicEntity(
            title: e.title,
            url: e.url,
            thumbnail: e.thumbnail,
            endpoint: e.endpoint,
            newChapter: e.newChapter,
            rating: e.rating,
          ),
        )
        .toList();

    return datas;
  }

  @override
  Future<DetailComicEntity> getDetailComic(String url) async {
    final result = await _comicRemoteDatasource.getDetailComic(url);

    final data = DetailComicEntity(
      title: result.title,
      synopsis: result.synopsis,
      rating: result.rating,
      author: result.author,
      artist: result.artist,
      rank: result.rank,
      view: result.view,
      genre: result.genre,
      type: result.type,
      tag: result.tag,
      chapterList: (result.chapterList)
          .map(
            (e) => ChapterEntity(
                title: e.title,
                url: e.url,
                thumbnail: e.thumbnail,
                releaseDate: e.releaseDate),
          )
          .toList(),
      relatedComic: result.relatedComic != null
          ? (result.relatedComic)!
              .map(
                (e) => ChapterEntity(
                  title: e.title,
                  url: e.url,
                  thumbnail: e.thumbnail,
                ),
              )
              .toList()
          : null,
    );

    return data;
  }
}
