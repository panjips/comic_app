import 'package:comic_app/domain/entity/comic_entity.dart';
import 'package:comic_app/domain/repository/comic_repository.dart';

class GetProjectsComicUsecase {
  final ComicRepository _comicRepository;

  GetProjectsComicUsecase({required ComicRepository comicRepository})
      : _comicRepository = comicRepository;

  Future<List<ComicEntity>> call(String page) async =>
      await _comicRepository.getProjectsComic(page);
}
