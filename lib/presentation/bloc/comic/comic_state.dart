part of 'comic_bloc.dart';

@immutable
sealed class ComicState {
  get datas => null;
}

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

final class LoadingProjectsComicState extends ComicState {}

final class SuccessProjectsComicState extends ComicState {
  final List<ComicEntity> datas;

  SuccessProjectsComicState({
    required this.datas,
  });
}

final class ErrorProjectsComicState extends ComicState {
  final String message;

  ErrorProjectsComicState({required this.message});
}

final class LoadingMirrorComicState extends ComicState {}

final class SuccessMirrorComicState extends ComicState {
  final List<ComicEntity> datas;

  SuccessMirrorComicState({
    required this.datas,
  });
}

final class ErrorMirrorComicState extends ComicState {
  final String message;

  ErrorMirrorComicState({required this.message});
}

final class LoadingDetailComicState extends ComicState {}

final class SuccessDetailComicState extends ComicState {
  final DetailComicEntity data;

  SuccessDetailComicState({
    required this.data,
  });
}

final class ErrorDetailComicState extends ComicState {
  final String message;

  ErrorDetailComicState({required this.message});
}
