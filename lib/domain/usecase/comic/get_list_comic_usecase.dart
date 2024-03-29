import 'package:comic_app/domain/entity/comic_entity.dart';
import 'package:comic_app/domain/repository/comic_repository.dart';

class GetListComicUsecase {
  final ComicRepository _comicRepository;

  GetListComicUsecase({required ComicRepository comicRepository})
      : _comicRepository = comicRepository;

  Future<Map<dynamic, List<ComicEntity>>> call() async =>
      await _comicRepository.getListComic();
}
