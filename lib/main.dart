import 'package:comic_app/data/datasource/remote/comic_remote_datasource.dart';
import 'package:comic_app/data/repository/comic_repository_impl.dart';
import 'package:comic_app/domain/repository/comic_repository.dart';
import 'package:comic_app/domain/usecase/comic/get_hot_list_comic_usecase.dart';
import 'package:comic_app/domain/usecase/comic/get_update_list_comic_usecase.dart';
import 'package:comic_app/domain/usecase/comic/get_weekly_trending_comic_usecase.dart';
import 'package:comic_app/presentation/bloc/comic/comic_bloc.dart';
import 'package:comic_app/presentation/router/routes.dart';
import 'package:comic_app/presentation/screen/auth/splash_screen.dart';
import 'package:comic_app/presentation/screen/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

void main() {
  runApp(const MyApp());
}

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
                  GetHotListComicUsecase(comicRepository: repository),
                  GetUpdateListComicUsecase(comicRepository: repository),
                  GetWeeklyTrendingListComicUsecase(
                      comicRepository: repository),
                );
              },
            ),
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            initialRoute: Routes.homeScreen,
            routes: {
              Routes.spalshScreen: (context) => const SplashScreen(),
              Routes.homeScreen: (context) => const HomeScreen(),
            },
          ),
        );
      },
    );
  }
}


// class MyApp extends StatefulWidget {
//   const MyApp({super.key});

//   @override
//   State<MyApp> createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   List<ComicModel>? hasFetch;

//   void refresh() async {
//     List<ComicModel> datas =
//         await ComicRemoteDatasource().getWeeklyTrendingListComic();
//     setState(() {
//       hasFetch = datas;
//     });
//   }

//   @override
//   void initState() {
//     refresh();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     if (hasFetch == null) {
//       return MaterialApp(
//         home: Scaffold(
//           body: Center(
//             child: CircularProgressIndicator(),
//           ),
//         ),
//       );
//     }

//     return MaterialApp(
//       home: Scaffold(
//         body: Center(
//           child: Text(
//             hasFetch!.first.title.toString(),
//             style: TextStyle(color: Colors.black),
//           ),
//         ),
//       ),
//     );
//   }
// }
