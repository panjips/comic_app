class ChapterEntity {
  final String title;
  final String url;
  final String thumbnail;
  final String? releaseDate;

  ChapterEntity({
    required this.title,
    required this.url,
    required this.thumbnail,
    this.releaseDate,
  });
}
