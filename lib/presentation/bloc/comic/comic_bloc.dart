// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:comic_app/domain/entity/detail_comic_entity.dart';
import 'package:comic_app/domain/usecase/comic/get_detail_comic_usecase.dart';
import 'package:comic_app/domain/usecase/comic/get_list_comic_usecase.dart';
import 'package:comic_app/domain/usecase/comic/get_mirror_comic_usecase.dart';
import 'package:comic_app/domain/usecase/comic/get_projects_comic_usecase.dart';
import 'package:meta/meta.dart';

import 'package:comic_app/domain/entity/comic_entity.dart';

part 'comic_event.dart';
part 'comic_state.dart';

class ComicBloc extends Bloc<ComicEvent, ComicState> {
  final GetListComicUsecase getListComicUsecase;
  final GetProjectsComicUsecase getProjectsComicUsecase;
  final GetMirrorComicUsecase getMirrorComicUsecase;
  final GetDetailComicUsecase getDetailComicUsecase;

  ComicBloc(
    this.getListComicUsecase,
    this.getProjectsComicUsecase,
    this.getMirrorComicUsecase,
    this.getDetailComicUsecase,
  ) : super(ComicInitial()) {
    on<ComicEvent>((event, emit) async {
      if (event is GetListComicEvent) {
        emit(LoadingListComicState());

        try {
          final Map<dynamic, List<ComicEntity>> datas =
              await getListComicUsecase();
          emit(
            SuccessListComicState(
              hotDatas: datas['hotList']!,
              updateDatas: datas['updateList']!,
              trendingDatas: datas['weeklyList']!,
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

      if (event is GetProjectsComicEvent) {
        emit(LoadingProjectsComicState());

        try {
          final List<ComicEntity> datas =
              await getProjectsComicUsecase(event.page);
          emit(
            SuccessProjectsComicState(
              datas: datas,
            ),
          );
        } catch (e) {
          emit(
            ErrorProjectsComicState(
              message: e.toString(),
            ),
          );
        }
      }

      if (event is GetMirrorComicEvent) {
        emit(LoadingMirrorComicState());

        try {
          final List<ComicEntity> datas =
              await getMirrorComicUsecase(event.page);
          emit(
            SuccessMirrorComicState(
              datas: datas,
            ),
          );
        } catch (e) {
          emit(
            ErrorMirrorComicState(
              message: e.toString(),
            ),
          );
        }
      }

      if (event is GetDetailComicEvent) {
        emit(LoadingDetailComicState());

        try {
          final DetailComicEntity data = await getDetailComicUsecase(event.url);
          emit(
            SuccessDetailComicState(
              data: data,
            ),
          );
        } catch (e) {
          emit(
            ErrorDetailComicState(
              message: e.toString(),
            ),
          );
        }
      }
    });
  }
}
