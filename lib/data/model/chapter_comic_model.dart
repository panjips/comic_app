class ChapterModel {
  final String title;
  final String url;
  final String thumbnail;
  final String? releaseDate;

  ChapterModel(
      {required this.title,
      required this.url,
      required this.thumbnail,
      this.releaseDate});
}
