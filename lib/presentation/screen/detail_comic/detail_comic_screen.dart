import 'package:cached_network_image/cached_network_image.dart';
import 'package:comic_app/presentation/bloc/comic/comic_bloc.dart';
import 'package:comic_app/presentation/screen/widget/card/rectangle_card.dart';
import 'package:comic_app/utils/color_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class DetailComic extends StatefulWidget {
  final String url;
  final String thumbnail;
  const DetailComic({super.key, required this.url, required this.thumbnail});

  @override
  State<DetailComic> createState() => _DetailComicState();
}

class _DetailComicState extends State<DetailComic> {
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<ComicBloc>().add(GetDetailComicEvent(url: widget.url));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ComicBloc, ComicState>(
      builder: (context, state) {
        Widget body = const SizedBox();

        if (state is SuccessDetailComicState) {
          return CustomScrollView(
            slivers: [
              SliverAppBar(
                expandedHeight: 200.0,
                pinned: true,
                actionsIconTheme: IconThemeData(opacity: 0.0),
                flexibleSpace: Stack(
                  children: <Widget>[
                    Positioned.fill(
                      child: CachedNetworkImage(
                        imageUrl: widget.thumbnail,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
              ),
              SliverList.list(
                children: [
                  Container(
                    width: 100.w,
                    color: slate[800],
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          style: ButtonStyle(
                            fixedSize: MaterialStatePropertyAll(
                              Size(50.w - 24, 0),
                            ),
                          ),
                          onPressed: () {},
                          child: Text(
                            'About',
                            style: TextStyle(
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.w500,
                              color: slate[300],
                            ),
                          ),
                        ),
                        TextButton(
                          style: ButtonStyle(
                            fixedSize: MaterialStatePropertyAll(
                              Size(50.w - 24, 0),
                            ),
                          ),
                          onPressed: () {},
                          child: Text(
                            'Chapter',
                            style: TextStyle(
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.w500,
                              color: slate[500],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(bottom: 12.sp, top: 16.sp),
                          child: Row(
                            children: [
                              Container(
                                padding: EdgeInsets.only(
                                    top: 8.sp,
                                    left: 12.sp,
                                    right: 12.sp,
                                    bottom: 8.sp),
                                decoration: BoxDecoration(
                                  color: green[700],
                                  borderRadius: BorderRadius.circular(8.sp),
                                ),
                                child: Text(
                                  state.data.type,
                                  style: TextStyle(
                                    fontFamily: "Poppins",
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.w500,
                                    color: slate[300],
                                  ),
                                ),
                              ),
                              Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 8),
                                padding: EdgeInsets.only(
                                    top: 8.sp,
                                    left: 12.sp,
                                    right: 12.sp,
                                    bottom: 8.sp),
                                decoration: BoxDecoration(
                                  color: blue[700],
                                  borderRadius: BorderRadius.circular(8.sp),
                                ),
                                child: Text(
                                  state.data.tag,
                                  style: TextStyle(
                                    fontFamily: "Poppins",
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.w500,
                                    color: slate[300],
                                  ),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(
                                    top: 8.sp,
                                    left: 12.sp,
                                    right: 12.sp,
                                    bottom: 8.sp),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.sp),
                                  color:
                                      const Color(0xFFFDF2C6).withOpacity(0.6),
                                ),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.star,
                                      color: const Color(0xFFBDF164),
                                      size: 3.w,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 4),
                                      child: Text(
                                        state.data.rating,
                                        style: TextStyle(
                                          fontFamily: "Poppins",
                                          fontSize: 13.sp,
                                          fontWeight: FontWeight.w400,
                                          color: slate[900],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Text(
                          state.data.title,
                          style: TextStyle(
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.w600,
                            fontSize: 19.sp,
                            color: slate[300],
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: Text(
                            state.data.synopsis,
                            style: TextStyle(
                              fontFamily: "Poppins",
                              fontSize: 14.sp,
                              fontWeight: FontWeight.normal,
                              color: slate[400],
                            ),
                            textAlign: TextAlign.justify,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 4),
                          width: 100.w,
                          height: 1,
                          color: slate[500],
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 8.sp),
                          child: Text(
                            "Detail",
                            style: TextStyle(
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.w600,
                              fontSize: 18.sp,
                              color: slate[300],
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 16.sp),
                          child: Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Author",
                                    style: TextStyle(
                                      fontFamily: "Poppins",
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14.sp,
                                      color: slate[300],
                                    ),
                                  ),
                                  Text(
                                    "Artist",
                                    style: TextStyle(
                                      fontFamily: "Poppins",
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14.sp,
                                      color: slate[300],
                                    ),
                                  ),
                                  Text(
                                    "Rank",
                                    style: TextStyle(
                                      fontFamily: "Poppins",
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14.sp,
                                      color: slate[300],
                                    ),
                                  ),
                                  Text(
                                    "Views",
                                    style: TextStyle(
                                      fontFamily: "Poppins",
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14.sp,
                                      color: slate[300],
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 16.sp),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      state.data.author,
                                      style: TextStyle(
                                        fontFamily: "Poppins",
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14.sp,
                                        color: slate[300],
                                      ),
                                    ),
                                    Text(
                                      state.data.artist,
                                      style: TextStyle(
                                        fontFamily: "Poppins",
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14.sp,
                                        color: slate[300],
                                      ),
                                    ),
                                    Text(
                                      state.data.rank,
                                      style: TextStyle(
                                        fontFamily: "Poppins",
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14.sp,
                                        color: slate[300],
                                      ),
                                    ),
                                    Text(
                                      state.data.view,
                                      style: TextStyle(
                                        fontFamily: "Poppins",
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14.sp,
                                        color: slate[300],
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 4),
                          width: 100.w,
                          height: 1,
                          color: slate[500],
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 8.sp),
                          child: Text(
                            "Genres",
                            style: TextStyle(
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.w600,
                              fontSize: 18.sp,
                              color: slate[300],
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 12.sp),
                          child: Wrap(
                            spacing: 12.sp,
                            runSpacing: 12.sp,
                            children: List.generate(
                              state.data.genre.length,
                              (index) => Container(
                                padding: EdgeInsets.only(
                                    top: 8.sp,
                                    left: 12.sp,
                                    right: 12.sp,
                                    bottom: 8.sp),
                                decoration: BoxDecoration(
                                  color: slate[950],
                                  border: Border.all(color: slate[600]!),
                                  borderRadius: BorderRadius.circular(12.sp),
                                ),
                                child: Text(
                                  state.data.genre[index],
                                  style: TextStyle(
                                    fontFamily: "Poppins",
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w500,
                                    color: slate[300],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 8.sp),
                          width: 100.w,
                          height: 1,
                          color: slate[500],
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 8.sp),
                          child: Text(
                            "Similar Comics",
                            style: TextStyle(
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.w600,
                              fontSize: 18.sp,
                              color: slate[300],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: List.generate(
                              state.data.relatedComic!.length - 1,
                              (index) => RectangleCard(
                                title: state.data.relatedComic![index].title,
                                thumbnail:
                                    state.data.relatedComic![index].thumbnail,
                                rating: "1.0",
                                newChapter: "Chapter 10",
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ],
          );
        }

        if (state is LoadingDetailComicState) {
          body = Center(
            child: CircularProgressIndicator(),
          );
        }

        return body;
      },
    );
  }
}
