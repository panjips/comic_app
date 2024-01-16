// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ComicModel {
  final String? title;
  final String? type;
  final String? rating;
  final String? newChapter;
  final String? url;
  final String? thumbnail;
  final String? endpoint;

  ComicModel(
      {required this.title,
      this.type,
      this.rating,
      this.newChapter,
      required this.url,
      required this.thumbnail,
      required this.endpoint});

  factory ComicModel.fromMap(Map<String, dynamic> data) {
    return ComicModel(
        title: data['title'] != null ? data['title'] as String : null,
        type: data['type'] != null ? data['type'] as String : null,
        rating: data['rating'] != null ? data['rating'] as String : null,
        newChapter:
            data['newChapter'] != null ? data['newChapter'] as String : null,
        url: data['url'] != null ? data['url'] as String : null,
        thumbnail:
            data['thumbnail'] != null ? data['thumbnail'] as String : null,
        endpoint: data['endpoint'] != null ? data['endpoint'] as String : null);
  }
  factory ComicModel.fromJson(String source) =>
      ComicModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
