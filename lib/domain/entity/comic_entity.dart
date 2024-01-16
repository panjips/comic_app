class ComicEntity {
  final String? title;
  final String? type;
  final String? rating;
  final String? newChapter;
  final String? url;
  final String? thumbnail;
  final String? endpoint;

  ComicEntity(
      {required this.title,
      this.type,
      this.rating,
      this.newChapter,
      required this.url,
      required this.thumbnail,
      required this.endpoint});
}
