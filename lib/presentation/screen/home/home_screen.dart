import 'package:carousel_slider/carousel_slider.dart';
import 'package:comic_app/presentation/bloc/comic/comic_bloc.dart';
import 'package:comic_app/presentation/screen/home/home_screen_shimmer.dart';
import 'package:comic_app/presentation/screen/home/widget/banner_card.dart';
import 'package:comic_app/presentation/screen/widget/card/rectangle_card.dart';
import 'package:comic_app/presentation/screen/widget/card/square_card.dart';
import 'package:comic_app/utils/color_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
        if (state is SuccessListComicState) {
          return CustomScrollView(
            slivers: <Widget>[
              SliverToBoxAdapter(
                child: Stack(
                  children: [
                    CarouselSlider(
                      items: state.hotDatas.map(
                        (e) {
                          return BannerCard(
                            title: e.title!,
                            thumbnail: e.thumbnail!,
                          );
                        },
                      ).toList(),
                      options: CarouselOptions(
                        height: 34.h,
                        autoPlay: true,
                        viewportFraction: 1,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 16, top: 28.sp, right: 16),
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
                                onPressed: () {},
                                icon: const Icon(Icons.search)),
                          ),
                        ],
                      ),
                    )
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
                        return GestureDetector(
                          child: RectangleCard(
                            rating: state.trendingDatas[index].rating!,
                            title: state.trendingDatas[index].title!,
                            thumbnail: state.trendingDatas[index].thumbnail!,
                            newChapter: state.trendingDatas[index].newChapter!,
                          ),
                        );
                      },
                      separatorBuilder: (context, index) => SizedBox(
                            width: 14.sp,
                          ),
                      itemCount: state.trendingDatas.length),
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.only(
                    left: 16.0, right: 16.0, top: 16.0, bottom: 12.0),
                sliver: SliverToBoxAdapter(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Update Comics",
                        style: TextStyle(
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w600,
                          fontSize: 16.sp,
                          color: slate[300],
                        ),
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: blue[700],
                          minimumSize: Size.zero,
                          padding: EdgeInsets.symmetric(
                              vertical: 4.sp, horizontal: 14.sp),
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                        onPressed: () {},
                        child: Text(
                          "See all",
                          style: TextStyle(
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.w600,
                            fontSize: 13.sp,
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
                      onTap: () => context.goNamed('detail', queryParameters: {
                        "url": state.updateDatas[index].url,
                        "thumbnail": state.updateDatas[index].thumbnail,
                      }),
                      child: SquareCard(
                        thumbnail: state.updateDatas[index].thumbnail!,
                        title: state.updateDatas[index].title!,
                        newChapter: state.updateDatas[index].newChapter!,
                      ),
                    );
                  }, childCount: state.updateDatas.length),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 1 / 1.5,
                  ),
                ),
              ),
            ],
          );
        }

        if (state is LoadingListComicState) {
          body = const HomeScreenShimmer();
        }

        return body;
      },
    );
  }
}
