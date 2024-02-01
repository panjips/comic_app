import 'package:comic_app/domain/entity/detail_comic_entity.dart';
import 'package:comic_app/domain/repository/comic_repository.dart';

class GetDetailComicUsecase {
  final ComicRepository _comicRepository;

  GetDetailComicUsecase({required ComicRepository comicRepository})
      : _comicRepository = comicRepository;

  Future<DetailComicEntity> call(String url) async =>
      await _comicRepository.getDetailComic(url);
}
