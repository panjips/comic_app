import 'package:comic_app/domain/entity/comic_entity.dart';
import 'package:comic_app/domain/repository/comic_repository.dart';

class GetWeeklyTrendingListComicUsecase {
  final ComicRepository _comicRepository;

  GetWeeklyTrendingListComicUsecase({required ComicRepository comicRepository})
      : _comicRepository = comicRepository;

  Future<List<ComicEntity>> call() async =>
      await _comicRepository.getWeeklyTrendingListComic();
}
