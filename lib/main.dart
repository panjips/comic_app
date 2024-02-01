import 'package:comic_app/data/datasource/remote/comic_remote_datasource.dart';
import 'package:comic_app/data/model/comic_model.dart';
import 'package:comic_app/data/model/detail_comic_model.dart';
import 'package:comic_app/data/repository/comic_repository_impl.dart';
import 'package:comic_app/domain/repository/comic_repository.dart';
import 'package:comic_app/domain/usecase/comic/get_detail_comic_usecase.dart';
import 'package:comic_app/domain/usecase/comic/get_list_comic_usecase.dart';
import 'package:comic_app/domain/usecase/comic/get_mirror_comic_usecase.dart';
import 'package:comic_app/domain/usecase/comic/get_projects_comic_usecase.dart';
import 'package:comic_app/presentation/bloc/comic/comic_bloc.dart';
import 'package:comic_app/presentation/routes/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

void main() {
  runApp(const MyApp());
}

// class MyApp extends StatefulWidget {
//   const MyApp({super.key});

//   @override
//   State<MyApp> createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   DetailComicModel? datas;

//   void refresh() async {
//     final datas = await ComicRemoteDatasource()
//         .getDetailComic("https://shinigamitoon.com/series/nano-machine/");
//     print(datas);
//     setState(() {
//       this.datas = datas;
//     });
//   }

//   @override
//   void initState() {
//     refresh();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         body: Center(
//           child: datas == null
//               ? CircularProgressIndicator()
//               : Text(datas!.relatedComic!.first.title),
//         ),
//       ),
//     );
//   }
// }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context, orientation, screenType) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) {
                ComicRepository repository = ComicRepositoryImplementation(
                  comicRemoteDatasource: ComicRemoteDatasource(),
                );
                return ComicBloc(
                  GetListComicUsecase(comicRepository: repository),
                  GetProjectsComicUsecase(comicRepository: repository),
                  GetMirrorComicUsecase(comicRepository: repository),
                  GetDetailComicUsecase(comicRepository: repository),
                );
              },
            ),
          ],
          child: MaterialApp.router(
            debugShowCheckedModeBanner: false,
            routerConfig: AppRouter.router,
          ),
        );
      },
    );
  }
}
