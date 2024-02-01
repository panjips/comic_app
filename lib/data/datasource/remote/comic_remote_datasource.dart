import 'package:comic_app/data/model/comic_model.dart';
import 'package:comic_app/data/model/detail_comic_model.dart';
import 'package:comic_app/presentation/screen/detail_comic/detail_comic_screen.dart';
import 'package:dio/dio.dart';
import 'remote.constant.dart';

class ComicRemoteDatasource {
  final Dio client = Dio();
  static const BASE_URL = RemoteConstant.BASE_URL;
  static const API_KEY = RemoteConstant.API_KEY;
  static const HOST = RemoteConstant.HOST;

  Future<Map<dynamic, List<ComicModel>>> getListComic() async {
    try {
      final result = await client
          .get(
            "${BASE_URL}browse",
            options: Options(
              headers: {
                'lulThings': 'iyainiyainiyainde123',
                'X-RapidAPI-Key': API_KEY,
                'X-RapidAPI-Host': HOST
              },
            ),
          )
          .timeout(const Duration(minutes: 2));

      final hotList = (result.data['hotList'] as List)
          .map((e) => ComicModel.fromMap(e))
          .toList();
      final updateList = (result.data['newsList'] as List)
          .map((e) => ComicModel.fromMap(e))
          .toList();
      final weeklyList = (result.data['trendingList'] as List)
          .map((e) => ComicModel.fromMap(e))
          .toList();

      return {
        'hotList': hotList,
        'updateList': updateList,
        'weeklyList': weeklyList
      }.cast<dynamic, List<ComicModel>>();
    } catch (e) {
      throw e.toString();
    }
  }

  Future<List<ComicModel>> getProjectsComic(String page) async {
    try {
      final result = await client
          .get(
            "${BASE_URL}projects",
            queryParameters: {
              "page": page,
            },
            options: Options(
              headers: {
                'lulThings': 'iyainiyainiyainde123',
                'X-RapidAPI-Key': API_KEY,
                'X-RapidAPI-Host': HOST
              },
            ),
          )
          .timeout(const Duration(minutes: 2));

      final datas =
          (result.data as List).map((e) => ComicModel.fromMap(e)).toList();

      return datas;
    } catch (e) {
      throw e.toString();
    }
  }

  Future<List<ComicModel>> getMirrorComic(String page) async {
    try {
      final result = await client
          .get(
            "${BASE_URL}mirror",
            queryParameters: {
              "page": page,
            },
            options: Options(
              headers: {
                'lulThings': 'iyainiyainiyainde123',
                'X-RapidAPI-Key': API_KEY,
                'X-RapidAPI-Host': HOST
              },
            ),
          )
          .timeout(const Duration(minutes: 2));

      final datas =
          (result.data as List).map((e) => ComicModel.fromMap(e)).toList();

      return datas;
    } catch (e) {
      throw e.toString();
    }
  }

  Future<DetailComicModel> getDetailComic(String url) async {
    try {
      final result = await client
          .get(
            "${BASE_URL}comic",
            queryParameters: {
              "url": url,
            },
            options: Options(
              headers: {
                'lulThings': 'iyainiyainiyainde123',
                'X-RapidAPI-Key': API_KEY,
                'X-RapidAPI-Host': HOST
              },
            ),
          )
          .timeout(const Duration(minutes: 2));

      final datas = DetailComicModel.fromMap(result.data);

      return datas;
    } catch (e) {
      throw e.toString();
    }
  }
}
