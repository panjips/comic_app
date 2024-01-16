import 'package:comic_app/data/model/comic_model.dart';
import 'package:dio/dio.dart';
import 'remote_constant.dart';

class ComicRemoteDatasource {
  final Dio client = Dio();
  static const BASE_URL = RemoteConstant.BASE_URL;

  Future<List<ComicModel>> getHotListComic() async {
    try {
      print(BASE_URL);
      final result = await client
          .get(
            "${BASE_URL}hots",
            options: Options(
              headers: {
                "Connection": "Keep-Alive",
                "Keep-Alive": "timeout=120, max=1"
              },
            ),
          )
          .timeout(Duration(minutes: 2));

      final datas = (result.data['data']['hot'] as List)
          .map((e) => ComicModel.fromMap(e))
          .toList();

      return datas;
    } catch (e) {
      throw e.toString();
    }
  }

  Future<List<ComicModel>> getUpdateListComic() async {
    try {
      print(BASE_URL);
      final result = await client
          .get(
            "${BASE_URL}updates",
            options: Options(
              headers: {
                "Connection": "Keep-Alive",
                "Keep-Alive": "timeout=120, max=1"
              },
            ),
          )
          .timeout(Duration(minutes: 2));

      final datas = (result.data['data']['update'] as List)
          .map((e) => ComicModel.fromMap(e))
          .toList();

      return datas;
    } catch (e) {
      throw e.toString();
    }
  }

  Future<List<ComicModel>> getWeeklyTrendingListComic() async {
    try {
      print(BASE_URL);
      final result = await client
          .get(
            "${BASE_URL}trendings",
            options: Options(
              headers: {
                "Connection": "Keep-Alive",
                "Keep-Alive": "timeout=120, max=1"
              },
            ),
          )
          .timeout(Duration(minutes: 2));

      final datas = (result.data['data']['weekly'] as List)
          .map((e) => ComicModel.fromMap(e))
          .toList();

      return datas;
    } catch (e) {
      throw e.toString();
    }
  }
}
