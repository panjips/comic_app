part of 'comic_bloc.dart';

@immutable
sealed class ComicState {}

final class ComicInitial extends ComicState {}

final class LoadingListComicState extends ComicState {}

final class SuccessListComicState extends ComicState {
  final List<ComicEntity> hotDatas;
  final List<ComicEntity> updateDatas;
  final List<ComicEntity> trendingDatas;

  SuccessListComicState({
    required this.hotDatas,
    required this.updateDatas,
    required this.trendingDatas,
  });
}

final class ErrorListComicState extends ComicState {
  final String message;

  ErrorListComicState({required this.message});
}
