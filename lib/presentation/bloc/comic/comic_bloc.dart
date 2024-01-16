// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:comic_app/domain/usecase/comic/get_hot_list_comic_usecase.dart';
import 'package:meta/meta.dart';

import 'package:comic_app/domain/entity/comic_entity.dart';
import 'package:comic_app/domain/usecase/comic/get_update_list_comic_usecase.dart';
import 'package:comic_app/domain/usecase/comic/get_weekly_trending_comic_usecase.dart';

part 'comic_event.dart';
part 'comic_state.dart';

class ComicBloc extends Bloc<ComicEvent, ComicState> {
  final GetHotListComicUsecase getHotListComicUsecase;
  final GetUpdateListComicUsecase getUpdateListComicUsecase;
  final GetWeeklyTrendingListComicUsecase getWeeklyTrendingListComicUsecase;

  ComicBloc(
    this.getHotListComicUsecase,
    this.getUpdateListComicUsecase,
    this.getWeeklyTrendingListComicUsecase,
  ) : super(ComicInitial()) {
    on<ComicEvent>((event, emit) async {
      if (event is GetListComicEvent) {
        emit(LoadingListComicState());

        try {
          final List<ComicEntity> hotDatas = await getHotListComicUsecase();
          final List<ComicEntity> updateDatas =
              await getUpdateListComicUsecase();
          final List<ComicEntity> trendingDatas =
              await getWeeklyTrendingListComicUsecase();

          emit(
            SuccessListComicState(
              hotDatas: hotDatas,
              updateDatas: updateDatas,
              trendingDatas: trendingDatas,
            ),
          );
        } catch (e) {
          emit(
            ErrorListComicState(
              message: e.toString(),
            ),
          );
        }
      }
    });
  }
}
