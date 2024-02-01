import 'package:comic_app/domain/entity/comic_entity.dart';
import 'package:comic_app/domain/repository/comic_repository.dart';

class GetMirrorComicUsecase {
  final ComicRepository _comicRepository;

  GetMirrorComicUsecase({required ComicRepository comicRepository})
      : _comicRepository = comicRepository;

  Future<List<ComicEntity>> call(String page) async =>
      await _comicRepository.getMirrorComic(page);
}
