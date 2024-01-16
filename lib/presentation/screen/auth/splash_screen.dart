import 'package:comic_app/presentation/bloc/comic/comic_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<ComicBloc>().add(GetListComicEvent());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ComicBloc, ComicState>(
      builder: (context, state) {
        Widget body = const SizedBox();
        if (state is LoadingListComicState) {
          body = const Center(child: CircularProgressIndicator());
        }
        if (state is SuccessListComicState) {
          body = Text(state.trendingDatas.first.title.toString());
        }
        if (state is ErrorListComicState) {
          body = Text(state.message);
        }

        return Scaffold(
          backgroundColor: Colors.amber,
          body: Center(
            child: body,
          ),
        );
      },
    );
  }
}
