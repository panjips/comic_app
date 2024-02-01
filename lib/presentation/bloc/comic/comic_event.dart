part of 'comic_bloc.dart';

@immutable
sealed class ComicEvent {}

class GetListComicEvent extends ComicEvent {}

class GetProjectsComicEvent extends ComicEvent {
  final String page;

  GetProjectsComicEvent({required this.page});
}

class GetMirrorComicEvent extends ComicEvent {
  final String page;

  GetMirrorComicEvent({required this.page});
}

class GetDetailComicEvent extends ComicEvent {
  final String url;

  GetDetailComicEvent({required this.url});
}
