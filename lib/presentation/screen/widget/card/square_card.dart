import 'package:cached_network_image/cached_network_image.dart';
import 'package:comic_app/utils/color_constant.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SquareCard extends StatelessWidget {
  final String thumbnail;
  final String title;
  final String newChapter;
  const SquareCard(
      {super.key,
      required this.thumbnail,
      required this.title,
      required this.newChapter});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: CachedNetworkImage(
            imageUrl: thumbnail,
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
            title,
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
          newChapter,
          style: TextStyle(
            fontFamily: "Poppins",
            fontWeight: FontWeight.normal,
            color: slate[600],
            fontSize: 12.sp,
          ),
        )
      ],
    );
  }
}
