import 'package:comic_app/presentation/bloc/comic/comic_bloc.dart';
import 'package:comic_app/presentation/screen/widget/card/rectangle_card.dart';
import 'package:comic_app/presentation/screen/widget/card/square_card.dart';
import 'package:comic_app/presentation/screen/widget/shimmer/rectangle_shimmer.dart';
import 'package:comic_app/utils/color_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  String page = "1";
  bool isDisable = true;
  bool isClick = true;
  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<ComicBloc>().add(GetProjectsComicEvent(page: page));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ComicBloc, ComicState>(
      builder: (context, state) {
        Widget body = const SizedBox();
        if (state is SuccessProjectsComicState ||
            state is SuccessMirrorComicState) {
          return CustomScrollView(
            slivers: [
              SliverPadding(
                padding: EdgeInsets.only(top: 28.sp),
                sliver: SliverToBoxAdapter(
                  child: Text(
                    "Explore",
                    style: TextStyle(
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w600,
                      fontSize: 18.sp,
                      color: slate[300],
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              SliverPadding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12.sp),
                sliver: SliverToBoxAdapter(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll(
                                isClick ? indigo[600] : slate[950]),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12.sp),
                                side: BorderSide(color: indigo[600]!),
                              ),
                            ),
                            fixedSize:
                                MaterialStatePropertyAll(Size(50.w - 24, 0))),
                        onPressed: () {
                          if (isClick) {
                            return;
                          }
                          setState(() {
                            isClick = !isClick;
                            page = "1";
                            SchedulerBinding.instance
                                .addPostFrameCallback((timeStamp) {
                              context
                                  .read<ComicBloc>()
                                  .add(GetProjectsComicEvent(page: page));
                            });
                          });
                        },
                        child: Text(
                          "Project",
                          style: TextStyle(
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.w600,
                            color: slate[300],
                          ),
                        ),
                      ),
                      ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll(
                                isClick ? slate[950] : indigo[600]),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12.sp),
                                side: BorderSide(color: indigo[600]!),
                              ),
                            ),
                            fixedSize:
                                MaterialStatePropertyAll(Size(50.w - 24, 0))),
                        onPressed: () {
                          if (!isClick) {
                            return;
                          }
                          setState(() {
                            isClick = !isClick;
                            page = "1";
                            SchedulerBinding.instance
                                .addPostFrameCallback((timeStamp) {
                              context
                                  .read<ComicBloc>()
                                  .add(GetMirrorComicEvent(page: page));
                            });
                          });
                        },
                        child: Text(
                          "Mirror",
                          style: TextStyle(
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.w600,
                            color: slate[300],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.only(left: 16.0),
                sliver: SliverGrid(
                  delegate: SliverChildBuilderDelegate((context, index) {
                    return GestureDetector(
                      child: RectangleCard(
                        thumbnail: state.datas[index].thumbnail!,
                        title: state.datas[index].title!,
                        newChapter: state.datas[index].newChapter!,
                        rating: state.datas[index].rating!,
                      ),
                    );
                  },
                      childCount: isClick
                          ? state.datas.length - 2
                          : state.datas.length - 1),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 1 / 1.8,
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      iconSize: 30.sp,
                      onPressed: () {
                        if (int.parse(page) == 1) return;
                        int value = int.parse(page) - 1;
                        setState(() {
                          if (value == 1) isDisable = true;
                          page = value.toString();
                          isClick
                              ? SchedulerBinding.instance
                                  .addPostFrameCallback((timeStamp) {
                                  context
                                      .read<ComicBloc>()
                                      .add(GetProjectsComicEvent(page: page));
                                })
                              : SchedulerBinding.instance
                                  .addPostFrameCallback((timeStamp) {
                                  context
                                      .read<ComicBloc>()
                                      .add(GetMirrorComicEvent(page: page));
                                });
                        });
                      },
                      icon: Icon(
                        Icons.arrow_left,
                        color: isDisable ? slate[700] : slate[400],
                      ),
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 2, horizontal: 16.sp),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: slate[900],
                        border: Border.all(color: slate[500]!),
                      ),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          page,
                          style: TextStyle(
                            fontFamily: "Poppins",
                            fontSize: 16,
                            color: slate[300],
                          ),
                        ),
                      ),
                    ),
                    IconButton(
                      iconSize: 30.sp,
                      onPressed: () {
                        int value = int.parse(page) + 1;
                        setState(() {
                          isDisable = false;
                          page = value.toString();
                          isClick
                              ? SchedulerBinding.instance
                                  .addPostFrameCallback((timeStamp) {
                                  context
                                      .read<ComicBloc>()
                                      .add(GetProjectsComicEvent(page: page));
                                })
                              : SchedulerBinding.instance
                                  .addPostFrameCallback((timeStamp) {
                                  context
                                      .read<ComicBloc>()
                                      .add(GetMirrorComicEvent(page: page));
                                });
                        });
                      },
                      icon: Icon(
                        Icons.arrow_right,
                        color: slate[400],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        }

        if (state is LoadingProjectsComicState ||
            state is LoadingMirrorComicState) {
          body = CustomScrollView(
            slivers: [
              SliverPadding(
                padding: EdgeInsets.only(top: 28.sp),
                sliver: SliverToBoxAdapter(
                  child: Text(
                    "Explore",
                    style: TextStyle(
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w600,
                      fontSize: 18.sp,
                      color: slate[300],
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              SliverPadding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12.sp),
                sliver: SliverToBoxAdapter(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll(
                                isClick ? indigo[600] : slate[950]),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12.sp),
                                side: BorderSide(color: indigo[600]!),
                              ),
                            ),
                            fixedSize:
                                MaterialStatePropertyAll(Size(50.w - 24, 0))),
                        onPressed: () {},
                        child: Text(
                          "Project",
                          style: TextStyle(
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.w600,
                            color: slate[300],
                          ),
                        ),
                      ),
                      ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll(
                                isClick ? slate[950] : indigo[600]),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12.sp),
                                side: BorderSide(color: indigo[600]!),
                              ),
                            ),
                            fixedSize:
                                MaterialStatePropertyAll(Size(50.w - 24, 0))),
                        onPressed: () {},
                        child: Text(
                          "Mirror",
                          style: TextStyle(
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.w600,
                            color: slate[300],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.only(left: 16.0),
                sliver: SliverGrid(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      return const RectangleShimmer();
                    },
                    childCount: 9,
                  ),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 1 / 1.8,
                  ),
                ),
              ),
            ],
          );
        }

        return body;
      },
    );
  }
}
