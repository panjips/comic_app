import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:comic_app/presentation/bloc/comic/comic_bloc.dart';
import 'package:comic_app/utils/color_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
    //   context.read<ComicBloc>().add(GetListComicEvent());
    // });
    super.initState();
  }

  List testCarousel = [
    "https://shinigami.moe/wp-content/uploads/2022/09/The-Return-Of-the-Crazy-Demon-1.jpg",
    "https://shinigami.moe/wp-content/uploads/2022/04/nano-S2-1.jpg",
    "https://shinigami.moe/wp-content/uploads/2022/07/Reaper_Drifting_New-350x476.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ComicBloc, ComicState>(
      builder: (context, state) {
        Widget body = const SizedBox();
        if (state is LoadingListComicState) {
          body = const Center(child: CircularProgressIndicator());
        }
        if (state is SuccessListComicState) {
          return Scaffold(
            backgroundColor: slate[950],
            extendBodyBehindAppBar: true,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0.0,
              automaticallyImplyLeading: false,
              actions: [
                Container(
                  width: 100.w,
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: EdgeInsetsDirectional.symmetric(
                          horizontal: 2.w,
                          vertical: 1.w,
                        ),
                        decoration: BoxDecoration(
                          color: green[600],
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: const Text(
                          "Hot Comic",
                          style: TextStyle(
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.w600,
                            color: Color(0xFFe2e8f0),
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      CircleAvatar(
                        backgroundColor: Colors.black.withOpacity(0.3),
                        child: IconButton(
                            onPressed: () {}, icon: const Icon(Icons.search)),
                      ),
                    ],
                  ),
                )
              ],
            ),
            body: CustomScrollView(
              slivers: <Widget>[
                // SliverAppBar(
                //   floating: true,
                //   backgroundColor: Colors.transparent,
                //   elevation: 0.0,
                //   automaticallyImplyLeading: false,
                //   actions: [
                //     Container(
                //       width: 100.w,
                //       padding: const EdgeInsets.symmetric(horizontal: 16.0),
                //       child: Row(
                //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //         children: [
                //           Container(
                //             padding: EdgeInsetsDirectional.symmetric(
                //               horizontal: 2.w,
                //               vertical: 1.w,
                //             ),
                //             decoration: BoxDecoration(
                //               color: green[600],
                //               borderRadius: BorderRadius.circular(4),
                //             ),
                //             child: const Text(
                //               "Hot Comic",
                //               style: TextStyle(
                //                 fontFamily: "Poppins",
                //                 fontWeight: FontWeight.w600,
                //                 color: Color(0xFFe2e8f0),
                //               ),
                //               textAlign: TextAlign.center,
                //             ),
                //           ),
                //           CircleAvatar(
                //             backgroundColor: Colors.black.withOpacity(0.3),
                //             child: IconButton(
                //                 onPressed: () {},
                //                 icon: const Icon(Icons.search)),
                //           ),
                //         ],
                //       ),
                //     )
                //   ],
                // ),
                SliverToBoxAdapter(
                  child: Stack(
                    children: [
                      CarouselSlider(
                        items: state.hotDatas.map((e) {
                          return Stack(
                            children: [
                              CachedNetworkImage(
                                width: 100.w,
                                fit: BoxFit.cover,
                                imageUrl: e.thumbnail.toString(),
                              ),
                              Container(
                                width: 100.w,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.bottomCenter,
                                    end: Alignment.topCenter,
                                    colors: [
                                      slate[950]!,
                                      slate[950]!.withOpacity(0.2),
                                    ],
                                  ),
                                ),
                                child: Align(
                                  alignment: Alignment.bottomLeft,
                                  child: Container(
                                    padding: const EdgeInsets.only(
                                        left: 16.0, bottom: 16.0),
                                    width: 70.w,
                                    child: Text(
                                      e.title.toString(),
                                      style: TextStyle(
                                        fontFamily: "Poppins",
                                        fontWeight: FontWeight.w600,
                                        fontSize: 20.sp,
                                        color: slate[300],
                                      ),
                                      maxLines: 2,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          );
                        }).toList(),
                        options: CarouselOptions(
                          height: 34.h,
                          autoPlay: true,
                          viewportFraction: 1,
                        ),
                      ),
                      Container(
                        padding: EdgeInsetsDirectional.symmetric(
                          horizontal: 2.w,
                          vertical: 1.w,
                        ),
                        decoration: BoxDecoration(
                          color: green[600],
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: const Text(
                          "Hot Comic",
                          style: TextStyle(
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.w600,
                            color: Color(0xFFe2e8f0),
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      CircleAvatar(
                        backgroundColor: Colors.black.withOpacity(0.3),
                        child: IconButton(
                            onPressed: () {}, icon: const Icon(Icons.search)),
                      ),
                    ],
                  ),
                ),
                SliverPadding(
                  padding: const EdgeInsets.only(left: 16.0, top: 16.0),
                  sliver: SliverToBoxAdapter(
                    child: Text(
                      "Trending Comics",
                      style: TextStyle(
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w600,
                        fontSize: 16.sp,
                        color: slate[300],
                      ),
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: SizedBox(
                    width: 100.w,
                    height: 28.h,
                    child: ListView.separated(
                        shrinkWrap: true,
                        padding: const EdgeInsets.only(left: 16, top: 8),
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: CachedNetworkImage(
                                  imageUrl: state.trendingDatas[index].thumbnail
                                      .toString(),
                                  width: 28.w,
                                  height: 18.h,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Container(
                                alignment: Alignment.centerLeft,
                                margin: EdgeInsets.only(top: 8.sp),
                                width: 28.w,
                                height: 6.h,
                                child: Text(
                                  state.trendingDatas[index].title.toString(),
                                  style: TextStyle(
                                    fontFamily: "Poppins",
                                    fontWeight: FontWeight.w600,
                                    color: slate[300],
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                ),
                              ),
                              SizedBox(
                                width: 28.w,
                                child: Row(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(8),
                                      child: Container(
                                        padding: const EdgeInsets.only(
                                            top: 2,
                                            left: 4,
                                            right: 4,
                                            bottom: 2),
                                        color:
                                            Color(0xFFFDF2C6).withOpacity(0.6),
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.star,
                                              color: Color(0xFFBDF164),
                                              size: 3.w,
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 4),
                                              child: Text(
                                                state
                                                    .trendingDatas[index].rating
                                                    .toString(),
                                                style: TextStyle(
                                                  fontFamily: "Poppins",
                                                  fontSize: 12.sp,
                                                  fontWeight: FontWeight.w400,
                                                  color: slate[900],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          );
                        },
                        separatorBuilder: (context, index) => SizedBox(
                              width: 14.sp,
                            ),
                        itemCount: state.trendingDatas.length),
                  ),
                ),
                SliverPadding(
                  padding:
                      const EdgeInsets.only(left: 16.0, top: 16.0, bottom: 8.0),
                  sliver: SliverToBoxAdapter(
                    child: Text(
                      "Update Comics",
                      style: TextStyle(
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w600,
                        fontSize: 16.sp,
                        color: slate[300],
                      ),
                    ),
                  ),
                ),
                SliverPadding(
                  padding: const EdgeInsets.only(left: 16.0),
                  sliver: SliverGrid(
                    delegate: SliverChildBuilderDelegate((context, index) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: CachedNetworkImage(
                              imageUrl:
                                  state.updateDatas[index].thumbnail.toString(),
                              width: 28.w,
                              height: 28.w,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            margin: EdgeInsets.only(top: 8.sp),
                            width: 28.w,
                            height: 6.h,
                            child: Text(
                              state.updateDatas[index].title.toString(),
                              style: TextStyle(
                                fontFamily: "Poppins",
                                fontWeight: FontWeight.w600,
                                color: slate[300],
                              ),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                            ),
                          ),
                          Text(
                            state.updateDatas[index].newChapter.toString(),
                            style: TextStyle(
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.normal,
                              color: slate[600],
                              fontSize: 12.sp,
                            ),
                          )
                        ],
                      );
                    }, childCount: state.updateDatas.length),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3, childAspectRatio: 1 / 1.45),
                  ),
                )
              ],
            ),
          );
        }

        return Scaffold(
          backgroundColor: slate[950],
          body: Center(
            child: body,
          ),
        );
      },
    );
  }
}
